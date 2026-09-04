//! Bit expand: the inverse of `filter`. Given a densely packed bit stream and a mask bitmap,
//! deposit the next `popcount(mask[i])` stream bits into the set positions of `mask[i]`.
//! Per word this is PDEP; the stream read is a variable-width bit reader.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

/// Variable-width reader over a word stream with a `u128` window; reads past the end as zero.
struct BitReader<'a> {
    src: &'a [u64],
    idx: usize,
    acc: u128,
    have: u32,
}

impl<'a> BitReader<'a> {
    #[inline(always)]
    fn new(src: &'a [u64]) -> Self {
        BitReader { src, idx: 0, acc: 0, have: 0 }
    }

    /// Next `n` bits (`n <= 64`), LSB first.
    #[inline(always)]
    fn take(&mut self, n: u32) -> u64 {
        if self.have < n {
            let w = self.src.get(self.idx).copied().unwrap_or(0);
            self.idx += 1;
            self.acc |= (w as u128) << self.have;
            self.have += 64;
        }
        let r = (self.acc & ((1u128 << n) - 1)) as u64;
        self.acc >>= n;
        self.have -= n;
        r
    }
}

/// Reference PDEP: walk the set bits of the mask.
#[inline]
pub fn pdep_naive(x: u64, mut m: u64) -> u64 {
    let mut r = 0u64;
    let mut j = 0;
    while m != 0 {
        let lowest = m & m.wrapping_neg();
        if (x >> j) & 1 == 1 {
            r |= lowest;
        }
        j += 1;
        m &= m - 1;
    }
    r
}

/// Hacker's Delight 7-5 `expand`: the compress moves, replayed in reverse.
#[inline(always)]
pub fn pdep_hd(mut x: u64, mut m: u64) -> u64 {
    let m0 = m;
    let mut mk = !m << 1;
    let mut moves = [0u64; 6];
    let mut i = 0;
    while i < 6 {
        let mut mp = mk ^ (mk << 1);
        mp ^= mp << 2;
        mp ^= mp << 4;
        mp ^= mp << 8;
        mp ^= mp << 16;
        mp ^= mp << 32;
        let mv = mp & m;
        moves[i] = mv;
        m = (m ^ mv) | (mv >> (1 << i));
        mk &= !mp;
        i += 1;
    }
    let mut i = 6;
    while i > 0 {
        i -= 1;
        let mv = moves[i];
        let t = x << (1 << i);
        x = (x & !mv) | (t & mv);
    }
    x & m0
}

/// The same on `N` lanes.
#[inline]
pub fn pdep_hd_simd<const N: usize>(mut x: Simd<u64, N>, mut m: Simd<u64, N>) -> Simd<u64, N> {
    let m0 = m;
    let mut mk = !m << 1;
    let mut moves = [Simd::splat(0u64); 6];
    let mut i = 0;
    while i < 6 {
        let mut mp = mk ^ (mk << 1);
        mp ^= mp << 2;
        mp ^= mp << 4;
        mp ^= mp << 8;
        mp ^= mp << 16;
        mp ^= mp << 32;
        let mv = mp & m;
        moves[i] = mv;
        m = (m ^ mv) | (mv >> (1u64 << i));
        mk &= !mp;
        i += 1;
    }
    let mut i = 6;
    while i > 0 {
        i -= 1;
        let mv = moves[i];
        let t = x << (1u64 << i);
        x = (x & !mv) | (t & mv);
    }
    x & m0
}

#[cfg(target_feature = "bmi2")]
#[inline]
pub fn pdep_bmi2(x: u64, m: u64) -> u64 {
    // SAFETY: bmi2 compile-time feature.
    unsafe { core::arch::x86_64::_pdep_u64(x, m) }
}

#[inline(always)]
fn expand_with(packed: &[u64], mask: &[u64], out: &mut [u64], pdep: impl Fn(u64, u64) -> u64) {
    assert!(out.len() >= mask.len());
    let mut r = BitReader::new(packed);
    for (&m, o) in mask.iter().zip(out.iter_mut()) {
        *o = pdep(r.take(m.count_ones()), m);
    }
}

/// `out[i] = pdep(next popcount(mask[i]) bits of packed, mask[i])`.
pub fn expand_naive(packed: &[u64], mask: &[u64], out: &mut [u64]) {
    expand_with(packed, mask, out, pdep_naive)
}

pub fn expand_scalar(packed: &[u64], mask: &[u64], out: &mut [u64]) {
    expand_with(packed, mask, out, pdep_hd)
}

#[cfg(target_feature = "bmi2")]
pub fn expand_bmi2(packed: &[u64], mask: &[u64], out: &mut [u64]) {
    expand_with(packed, mask, out, pdep_bmi2)
}

/// Portable SIMD: read 8 chunks, expand 8 lanes at once.
pub fn expand_portable(packed: &[u64], mask: &[u64], out: &mut [u64]) {
    assert!(out.len() >= mask.len());
    let (mc, mr) = mask.as_chunks::<8>();
    let (oc, orem) = out[..mask.len()].as_chunks_mut::<8>();
    let mut r = BitReader::new(packed);
    for (m, o) in mc.iter().zip(oc) {
        let mv = Simd::<u64, 8>::from_array(*m);
        let counts = mv.count_ones().to_array();
        let mut x = [0u64; 8];
        for j in 0..8 {
            x[j] = r.take(counts[j] as u32);
        }
        *o = pdep_hd_simd(Simd::from_array(x), mv).to_array();
    }
    for (&m, o) in mr.iter().zip(orem) {
        *o = pdep_hd(r.take(m.count_ones()), m);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn check_pdep(f: fn(u64, u64) -> u64) {
        let mut rng = Rng::new(51);
        for _ in 0..5000 {
            let x = rng.next_u64();
            let d = (rng.next_u64() % 9) as u32;
            let m = rng.word_with_density(d);
            assert_eq!(pdep_naive(x, m), f(x, m), "x={x:#x} m={m:#x}");
            // pext(pdep(x, m), m) == x & low popcount bits
            let back = crate::filter::pext_naive(f(x, m), m);
            let low = if m.count_ones() == 64 { x } else { x & ((1u64 << m.count_ones()) - 1) };
            assert_eq!(back, low);
        }
        assert_eq!(f(0xdead_beef, !0), 0xdead_beef);
        assert_eq!(f(0xdead_beef, 0), 0);
    }

    /// expand(filter(v, m), m) == v & m
    fn check(f: fn(&[u64], &[u64], &mut [u64])) {
        let mut rng = Rng::new(52);
        for &len in &[0usize, 1, 3, 8, 9, 17, 100] {
            for density in [0, 1, 4, 7, 8] {
                let values = rng.words(len, 4);
                let mask = rng.words(len, density);
                let mut packed = vec![0u64; len + 1];
                crate::filter::filter_naive(&values, &mask, &mut packed);
                let mut got = vec![0xdead_beefu64; len];
                f(&packed, &mask, &mut got);
                let expect: Vec<u64> = values.iter().zip(&mask).map(|(v, m)| v & m).collect();
                assert_eq!(expect, got, "len={len} density={density}");
            }
        }
    }

    #[test]
    fn pdep_hd_matches() {
        check_pdep(pdep_hd);
    }
    #[test]
    fn pdep_hd_simd_matches() {
        check_pdep(|x, m| pdep_hd_simd(Simd::<u64, 8>::splat(x), Simd::splat(m))[5]);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn pdep_bmi2_matches() {
        check_pdep(pdep_bmi2);
    }
    #[test]
    fn naive() {
        check(expand_naive);
    }
    #[test]
    fn scalar() {
        check(expand_scalar);
    }
    #[test]
    fn portable() {
        check(expand_portable);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn bmi2() {
        check(expand_bmi2);
    }
}
