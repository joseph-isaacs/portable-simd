//! `select(bits, n)` = position of the n-th set bit (0-based), or `None`.
//!
//! Two parts: scanning words (a running popcount, same tools as `rank`) and the in-word
//! `select64(word, k)`, which is where PDEP shines and where portable code has to work harder.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

/// `SELECT_IN_BYTE[k << 8 | byte]` = position of the k-th set bit of `byte` (8 if absent).
static SELECT_IN_BYTE: [u8; 2048] = {
    let mut t = [8u8; 2048];
    let mut k = 0;
    while k < 8 {
        let mut b = 0;
        while b < 256 {
            let mut seen = 0;
            let mut i = 0;
            while i < 8 {
                if (b >> i) & 1 == 1 {
                    if seen == k {
                        t[(k << 8) | b] = i as u8;
                        break;
                    }
                    seen += 1;
                }
                i += 1;
            }
            b += 1;
        }
        k += 1;
    }
    t
};

/// Clear the k lowest set bits, then take the lowest remaining one. O(k).
#[inline]
pub fn select64_naive(mut w: u64, k: u32) -> u32 {
    for _ in 0..k {
        w &= w - 1;
    }
    w.trailing_zeros()
}

/// Vigna's broadword select: per-byte popcounts via SWAR, per-byte prefix via multiply,
/// locate the byte with a SWAR compare, finish with the byte table.
#[inline]
pub fn select64_broadword(x: u64, k: u32) -> u32 {
    const ONES_STEP_4: u64 = 0x1111_1111_1111_1111;
    const ONES_STEP_8: u64 = 0x0101_0101_0101_0101;
    const MSBS_STEP_8: u64 = 0x80 * ONES_STEP_8;
    let k = k as u64;
    let mut s = x;
    s -= (s & (0xA * ONES_STEP_4)) >> 1;
    s = (s & (0x3 * ONES_STEP_4)) + ((s >> 2) & (0x3 * ONES_STEP_4));
    s = (s + (s >> 4)) & (0xF * ONES_STEP_8);
    // Inclusive prefix popcount in each byte.
    let byte_sums = s.wrapping_mul(ONES_STEP_8);
    // Bytes whose inclusive prefix is <= k keep their MSB; counting them gives the byte index.
    let geq_k = ((k * ONES_STEP_8 | MSBS_STEP_8) - byte_sums) & MSBS_STEP_8;
    let place = geq_k.count_ones() * 8;
    let byte_rank = k - ((byte_sums << 8) >> place & 0xFF);
    // `& 7` is a no-op for valid inputs (byte_rank < 8) but lets LLVM drop the bounds check.
    place + SELECT_IN_BYTE[((byte_rank & 7) as usize) << 8 | ((x >> place) & 0xFF) as usize] as u32
}

/// Portable SIMD: popcount the 8 bytes as lanes, prefix-sum with element shifts, locate the
/// byte with a lane compare + bitmask, finish with the byte table.
#[inline]
pub fn select64_portable(x: u64, k: u32) -> u32 {
    let cnt = Simd::<u8, 8>::from_array(x.to_le_bytes()).count_ones();
    let mut prefix = cnt;
    prefix += prefix.shift_elements_right::<1>(0);
    prefix += prefix.shift_elements_right::<2>(0);
    prefix += prefix.shift_elements_right::<4>(0);
    // `& 7`: for valid inputs (k < popcount(x)) the index is already < 8; the mask only
    // removes the bounds check LLVM cannot prove away.
    let byte = (prefix.simd_le(Simd::splat(k as u8)).to_bitmask().count_ones() & 7) as usize;
    let excl = prefix.shift_elements_right::<1>(0)[byte];
    // `& 7` is a no-op for valid inputs (byte_rank < 8) but lets LLVM drop the bounds check.
    let byte_rank = ((k as u8 - excl) & 7) as usize;
    (byte as u32) * 8 + SELECT_IN_BYTE[byte_rank << 8 | ((x >> (byte * 8)) & 0xFF) as usize] as u32
}

/// BMI2: deposit a single bit at the k-th set position, then `tzcnt`.
#[cfg(target_feature = "bmi2")]
#[inline]
pub fn select64_pdep(x: u64, k: u32) -> u32 {
    use core::arch::x86_64::_pdep_u64;
    // SAFETY: bmi2 is a compile-time feature here.
    unsafe { _pdep_u64(1u64 << k, x).trailing_zeros() }
}

/// NEON in-word select: `cnt` on the 8 bytes, prefix sum via 64-bit shifts + `add`,
/// `cmhs` + `addv` to count bytes whose prefix <= k, then the byte table.
#[cfg(target_arch = "aarch64")]
#[inline]
pub fn select64_neon(x: u64, k: u32) -> u32 {
    use core::arch::aarch64::*;
    // SAFETY: NEON is baseline on aarch64.
    unsafe {
        let cnt = vcnt_u8(vcreate_u8(x));
        let sh = |v: uint8x8_t, n: i32| -> uint8x8_t {
            match n {
                8 => vreinterpret_u8_u64(vshl_n_u64::<8>(vreinterpret_u64_u8(v))),
                16 => vreinterpret_u8_u64(vshl_n_u64::<16>(vreinterpret_u64_u8(v))),
                _ => vreinterpret_u8_u64(vshl_n_u64::<32>(vreinterpret_u64_u8(v))),
            }
        };
        let mut p = cnt;
        p = vadd_u8(p, sh(p, 8));
        p = vadd_u8(p, sh(p, 16));
        p = vadd_u8(p, sh(p, 32));
        let le = vcle_u8(p, vdup_n_u8(k as u8));
        let byte = (vaddv_u8(vshr_n_u8::<7>(le)) & 7) as usize;
        let mut excl = [0u8; 8];
        vst1_u8(excl.as_mut_ptr(), sh(p, 8));
        let byte_rank = ((k as u8 - excl[byte]) & 7) as usize;
        (byte as u32) * 8 + SELECT_IN_BYTE[byte_rank << 8 | ((x >> (byte * 8)) & 0xFF) as usize] as u32
    }
}

/// SVE2 BitPerm: `bdep` of a single bit, then `rbit` + `clz` (what `trailing_zeros` is).
#[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
#[inline]
pub fn select64_sve2(x: u64, k: u32) -> u32 {
    crate::expand::pdep_sve2(1u64 << k, x).trailing_zeros()
}

/// Scalar word scan with `count_ones`, generic in the in-word select.
#[inline(always)]
fn scan_scalar(bits: &[u64], mut n: usize, in_word: impl Fn(u64, u32) -> u32) -> Option<usize> {
    for (i, &w) in bits.iter().enumerate() {
        let c = w.count_ones() as usize;
        if n < c {
            return Some(i * 64 + in_word(w, n as u32) as usize);
        }
        n -= c;
    }
    None
}

/// Scalar word scan unrolled by 8: sums eight independent `popcnt`s before testing, so the
/// per-word compare/branch of `scan_scalar` is amortised and popcnt throughput is the limit.
#[inline(always)]
fn scan_scalar8(bits: &[u64], mut n: usize, in_word: impl Fn(u64, u32) -> u32) -> Option<usize> {
    let (chunks, rem) = bits.as_chunks::<8>();
    for (ci, c) in chunks.iter().enumerate() {
        let mut total = 0usize;
        for &w in c {
            total += w.count_ones() as usize;
        }
        if n < total {
            return scan_scalar(c, n, in_word).map(|p| ci * 512 + p);
        }
        n -= total;
    }
    scan_scalar(rem, n, in_word).map(|p| chunks.len() * 512 + p)
}

/// Portable SIMD word scan: popcount 8 words at a time, skip whole chunks by their total,
/// locate the word inside a chunk with a lane prefix-sum + compare.
#[inline(always)]
fn scan_portable(bits: &[u64], mut n: usize, in_word: impl Fn(u64, u32) -> u32) -> Option<usize> {
    let (chunks, rem) = bits.as_chunks::<8>();
    for (ci, c) in chunks.iter().enumerate() {
        let cnt = Simd::<u64, 8>::from_array(*c).count_ones();
        let total = cnt.reduce_sum() as usize;
        if n < total {
            let mut prefix = cnt;
            prefix += prefix.shift_elements_right::<1>(0);
            prefix += prefix.shift_elements_right::<2>(0);
            prefix += prefix.shift_elements_right::<4>(0);
            // `& 7`: `n < total` guarantees j < 8; the mask just removes the bounds checks.
            let j = (prefix.simd_le(Simd::splat(n as u64)).to_bitmask().count_ones() & 7) as usize;
            let excl = prefix.shift_elements_right::<1>(0)[j] as usize;
            return Some(ci * 512 + j * 64 + in_word(c[j], (n - excl) as u32) as usize);
        }
        n -= total;
    }
    scan_scalar(rem, n, in_word).map(|p| chunks.len() * 512 + p)
}

pub fn select_naive(bits: &[u64], n: usize) -> Option<usize> {
    scan_scalar(bits, n, select64_naive)
}

pub fn select_broadword(bits: &[u64], n: usize) -> Option<usize> {
    scan_scalar(bits, n, select64_broadword)
}

pub fn select_portable(bits: &[u64], n: usize) -> Option<usize> {
    scan_portable(bits, n, select64_portable)
}

#[cfg(target_feature = "bmi2")]
pub fn select_pdep(bits: &[u64], n: usize) -> Option<usize> {
    scan_scalar(bits, n, select64_pdep)
}

/// Unrolled scalar scan, broadword in-word (available on every arch).
pub fn select_scan8_broadword(bits: &[u64], n: usize) -> Option<usize> {
    scan_scalar8(bits, n, select64_broadword)
}

/// Vector scan, NEON in-word.
#[cfg(target_arch = "aarch64")]
pub fn select_neon(bits: &[u64], n: usize) -> Option<usize> {
    scan_portable(bits, n, select64_neon)
}

/// Vector scan, SVE2 `bdep` in-word.
#[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
pub fn select_sve2(bits: &[u64], n: usize) -> Option<usize> {
    scan_portable(bits, n, select64_sve2)
}

/// Unrolled scalar scan, PDEP in-word.
#[cfg(target_feature = "bmi2")]
pub fn select_scan8_pdep(bits: &[u64], n: usize) -> Option<usize> {
    scan_scalar8(bits, n, select64_pdep)
}

/// Mixed: vector scan, PDEP in-word.
#[cfg(target_feature = "bmi2")]
pub fn select_portable_scan_pdep(bits: &[u64], n: usize) -> Option<usize> {
    scan_portable(bits, n, select64_pdep)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn reference(bits: &[u64], n: usize) -> Option<usize> {
        (0..bits.len() * 64).filter(|&j| bits[j / 64] >> (j % 64) & 1 == 1).nth(n)
    }

    fn check64(f: fn(u64, u32) -> u32) {
        let mut rng = Rng::new(3);
        for _ in 0..2000 {
            let d = (rng.next_u64() % 8) as u32 + 1;
            let w = rng.word_with_density(d);
            let c = w.count_ones();
            for k in 0..c {
                assert_eq!(select64_naive(w, k), f(w, k), "w={w:#x} k={k}");
            }
        }
        assert_eq!(f(!0, 63), 63);
        assert_eq!(f(1, 0), 0);
        assert_eq!(f(1 << 63, 0), 63);
    }

    fn check(f: fn(&[u64], usize) -> Option<usize>) {
        let mut rng = Rng::new(11);
        for &len in &[0usize, 1, 7, 8, 9, 17, 64, 100] {
            for density in [0, 1, 4, 7, 8] {
                let bits = rng.words(len, density);
                let total = crate::rank::rank_scalar(&bits, len * 64);
                let mut ns = vec![0, total.saturating_sub(1), total, total + 1];
                for _ in 0..8 {
                    ns.push(rng.next_u64() as usize % (total + 2));
                }
                for n in ns {
                    assert_eq!(reference(&bits, n), f(&bits, n), "len={len} density={density} n={n}");
                }
            }
        }
    }

    #[test]
    fn in_word_broadword() {
        check64(select64_broadword);
    }
    #[test]
    fn in_word_portable() {
        check64(select64_portable);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn in_word_pdep() {
        check64(select64_pdep);
    }
    #[test]
    fn naive() {
        check(select_naive);
    }
    #[test]
    fn broadword() {
        check(select_broadword);
        check(select_scan8_broadword);
    }
    #[cfg(target_arch = "aarch64")]
    #[test]
    fn neon() {
        check64(select64_neon);
        check(select_neon);
    }
    #[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
    #[test]
    fn sve2() {
        check64(select64_sve2);
        check(select_sve2);
    }
    #[test]
    fn portable() {
        check(select_portable);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn pdep() {
        check(select_pdep);
        check(select_scan8_pdep);
        check(select_portable_scan_pdep);
    }
}
