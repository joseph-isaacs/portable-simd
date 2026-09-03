//! Bit filter: given `values` and `mask`, both bitmaps of the same length, produce the bits of
//! `values` at positions where `mask` is set, packed densely. Output length is `popcount(mask)`.
//!
//! Per word this is PEXT (`values[i]`, `mask[i]`); the results (of variable width
//! `popcount(mask[i])`) are then concatenated into the output bit stream.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

/// Appends variable-width bit runs to a word buffer. `u128` accumulator keeps the append
/// branch-free apart from the flush.
struct BitWriter<'a> {
    out: &'a mut [u64],
    idx: usize,
    acc: u128,
    fill: u32,
}

impl<'a> BitWriter<'a> {
    #[inline(always)]
    fn new(out: &'a mut [u64]) -> Self {
        BitWriter { out, idx: 0, acc: 0, fill: 0 }
    }

    /// `bits` must be zero above bit `n`; `n <= 64`.
    #[inline(always)]
    fn push(&mut self, bits: u64, n: u32) {
        self.acc |= (bits as u128) << self.fill;
        self.fill += n;
        if self.fill >= 64 {
            self.out[self.idx] = self.acc as u64;
            self.idx += 1;
            self.acc >>= 64;
            self.fill -= 64;
        }
    }

    /// Same as `push` but without the data-dependent flush branch: the low word is stored
    /// unconditionally (so `out` needs one spare word of capacity) and the bookkeeping is
    /// done with arithmetic that LLVM turns into `cmov`/`shrd`.
    #[inline(always)]
    fn push_branchless(&mut self, bits: u64, n: u32) {
        self.acc |= (bits as u128) << self.fill;
        self.fill += n;
        self.out[self.idx] = self.acc as u64;
        let full = self.fill >> 6; // 0 or 1, since fill <= 127
        self.idx += full as usize;
        self.acc >>= full * 64;
        self.fill &= 63;
    }

    /// Flushes the partial word and returns the total number of bits written.
    #[inline(always)]
    fn finish(self) -> usize {
        if self.fill > 0 {
            self.out[self.idx] = self.acc as u64;
        }
        self.idx * 64 + self.fill as usize
    }
}

/// Reference PEXT: walk the set bits of the mask. O(popcount(mask)).
#[inline]
pub fn pext_naive(x: u64, mut m: u64) -> u64 {
    let mut r = 0u64;
    let mut j = 0;
    while m != 0 {
        let lowest = m & m.wrapping_neg();
        if x & lowest != 0 {
            r |= 1 << j;
        }
        j += 1;
        m &= m - 1;
    }
    r
}

/// Hacker's Delight 7-4 `compress`: 6 rounds of parallel-suffix + move, all lane-local ops.
///
/// `inline(always)`: at ~150 instructions LLVM otherwise leaves it as a call inside
/// `filter_scalar`'s loop, which would make the scalar baseline pay for a call it needn't.
#[inline(always)]
pub fn pext_hd(mut x: u64, mut m: u64) -> u64 {
    x &= m;
    let mut mk = !m << 1;
    let mut i = 0;
    while i < 6 {
        let mut mp = mk ^ (mk << 1);
        mp ^= mp << 2;
        mp ^= mp << 4;
        mp ^= mp << 8;
        mp ^= mp << 16;
        mp ^= mp << 32;
        let mv = mp & m;
        m = (m ^ mv) | (mv >> (1 << i));
        let t = x & mv;
        x = (x ^ t) | (t >> (1 << i));
        mk &= !mp;
        i += 1;
    }
    x
}

/// The same algorithm on `N` words at once: every operation is a lane-wise shift/xor/and/or,
/// so it vectorises 1:1.
#[inline]
pub fn pext_hd_simd<const N: usize>(x: Simd<u64, N>, mut m: Simd<u64, N>) -> Simd<u64, N> {
    let mut x = x & m;
    let mut mk = !m << 1;
    let mut i = 0;
    while i < 6 {
        let mut mp = mk ^ (mk << 1);
        mp ^= mp << 2;
        mp ^= mp << 4;
        mp ^= mp << 8;
        mp ^= mp << 16;
        mp ^= mp << 32;
        let mv = mp & m;
        m = (m ^ mv) | (mv >> (1u64 << i));
        let t = x & mv;
        x = (x ^ t) | (t >> (1u64 << i));
        mk &= !mp;
        i += 1;
    }
    x
}

#[cfg(target_feature = "bmi2")]
#[inline]
pub fn pext_bmi2(x: u64, m: u64) -> u64 {
    // SAFETY: bmi2 is a compile-time feature here.
    unsafe { core::arch::x86_64::_pext_u64(x, m) }
}

#[inline(always)]
fn filter_with<const BRANCHLESS: bool>(
    values: &[u64],
    mask: &[u64],
    out: &mut [u64],
    pext: impl Fn(u64, u64) -> u64,
) -> usize {
    assert_eq!(values.len(), mask.len());
    let mut w = BitWriter::new(out);
    for (&v, &m) in values.iter().zip(mask) {
        if BRANCHLESS {
            w.push_branchless(pext(v, m), m.count_ones());
        } else {
            w.push(pext(v, m), m.count_ones());
        }
    }
    w.finish()
}

/// Returns the number of output bits; `out` needs `values.len()` words of capacity.
pub fn filter_naive(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_with::<false>(values, mask, out, pext_naive)
}

pub fn filter_scalar(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_with::<false>(values, mask, out, pext_hd)
}

#[cfg(target_feature = "bmi2")]
pub fn filter_bmi2(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_with::<false>(values, mask, out, pext_bmi2)
}

/// `pext` + branchless writer. `out` needs `values.len() + 1` words of capacity.
#[cfg(target_feature = "bmi2")]
pub fn filter_bmi2_branchless(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_with::<true>(values, mask, out, pext_bmi2)
}

#[inline(always)]
fn filter_portable_impl<const BRANCHLESS: bool>(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    assert_eq!(values.len(), mask.len());
    let (vc, vr) = values.as_chunks::<8>();
    let (mc, mr) = mask.as_chunks::<8>();
    let mut w = BitWriter::new(out);
    for (v, m) in vc.iter().zip(mc) {
        let m = Simd::<u64, 8>::from_array(*m);
        let packed = pext_hd_simd(Simd::from_array(*v), m).to_array();
        let counts = m.count_ones().to_array();
        for j in 0..8 {
            if BRANCHLESS {
                w.push_branchless(packed[j], counts[j] as u32);
            } else {
                w.push(packed[j], counts[j] as u32);
            }
        }
    }
    for (&v, &m) in vr.iter().zip(mr) {
        w.push(pext_hd(v, m), m.count_ones());
    }
    w.finish()
}

/// Portable SIMD: compress and popcount 8 words per step, then append the 8 results.
pub fn filter_portable(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_portable_impl::<false>(values, mask, out)
}

/// Portable SIMD + branchless writer. `out` needs `values.len() + 1` words of capacity.
pub fn filter_portable_branchless(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    filter_portable_impl::<true>(values, mask, out)
}

/// Portable SIMD with 4 lanes (one AVX2 register) for comparison.
pub fn filter_portable4(values: &[u64], mask: &[u64], out: &mut [u64]) -> usize {
    assert_eq!(values.len(), mask.len());
    let (vc, vr) = values.as_chunks::<4>();
    let (mc, mr) = mask.as_chunks::<4>();
    let mut w = BitWriter::new(out);
    for (v, m) in vc.iter().zip(mc) {
        let m = Simd::<u64, 4>::from_array(*m);
        let packed = pext_hd_simd(Simd::from_array(*v), m).to_array();
        let counts = m.count_ones().to_array();
        for j in 0..4 {
            w.push(packed[j], counts[j] as u32);
        }
    }
    for (&v, &m) in vr.iter().zip(mr) {
        w.push(pext_hd(v, m), m.count_ones());
    }
    w.finish()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn reference(values: &[u64], mask: &[u64]) -> (Vec<u64>, usize) {
        let mut out = vec![0u64; values.len()];
        let mut n = 0;
        for i in 0..values.len() * 64 {
            if mask[i / 64] >> (i % 64) & 1 == 1 {
                out[n / 64] |= (values[i / 64] >> (i % 64) & 1) << (n % 64);
                n += 1;
            }
        }
        (out, n)
    }

    fn check_pext(f: fn(u64, u64) -> u64) {
        let mut rng = Rng::new(5);
        for _ in 0..5000 {
            let x = rng.next_u64();
            let d = (rng.next_u64() % 9) as u32;
            let m = rng.word_with_density(d);
            assert_eq!(pext_naive(x, m), f(x, m), "x={x:#x} m={m:#x}");
        }
        assert_eq!(f(0xdead_beef, !0), 0xdead_beef);
        assert_eq!(f(0xdead_beef, 0), 0);
    }

    fn check(f: fn(&[u64], &[u64], &mut [u64]) -> usize) {
        let mut rng = Rng::new(9);
        for &len in &[0usize, 1, 3, 4, 5, 8, 9, 16, 17, 100] {
            for density in [0, 1, 4, 7, 8] {
                let values = rng.words(len, 4);
                let mask = rng.words(len, density);
                let (expect, n) = reference(&values, &mask);
                let mut got = vec![0u64; len + 1];
                let got_n = f(&values, &mask, &mut got);
                assert_eq!(n, got_n, "len={len} density={density}");
                assert_eq!(expect[..n.div_ceil(64)], got[..n.div_ceil(64)], "len={len} density={density}");
            }
        }
    }

    #[test]
    fn pext_hd_matches() {
        check_pext(pext_hd);
    }
    #[test]
    fn pext_hd_simd_matches() {
        check_pext(|x, m| pext_hd_simd(Simd::<u64, 8>::splat(x), Simd::splat(m))[3]);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn pext_bmi2_matches() {
        check_pext(pext_bmi2);
    }
    #[test]
    fn naive() {
        check(filter_naive);
    }
    #[test]
    fn scalar() {
        check(filter_scalar);
    }
    #[test]
    fn portable() {
        check(filter_portable);
        check(filter_portable4);
        check(filter_portable_branchless);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn bmi2() {
        check(filter_bmi2);
        check(filter_bmi2_branchless);
    }
}
