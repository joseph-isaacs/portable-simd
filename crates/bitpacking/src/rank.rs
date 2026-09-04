//! `rank(bits, i)` = number of set bits at positions `< i`.
//!
//! This is a popcount over a prefix of the bitmap plus a masked popcount of one word, so
//! the variants below are really "how fast can we popcount a slice of words".

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

/// Splits `i` into the full-word prefix and the masked partial word.
#[inline(always)]
fn split(bits: &[u64], i: usize) -> (&[u64], u64) {
    assert!(i <= bits.len() * 64, "rank position out of range");
    let w = i / 64;
    let b = i % 64;
    let partial = if b == 0 { 0 } else { bits[w] & ((1u64 << b) - 1) };
    (&bits[..w], partial)
}

/// Scalar `count_ones` loop (`popcnt` with the right target-cpu).
pub fn popcount_scalar(words: &[u64]) -> usize {
    let mut c = 0usize;
    for &x in words {
        c += x.count_ones() as usize;
    }
    c
}

/// Portable SIMD: `Simd<u64, 8>::count_ones()` accumulated per lane.
pub fn popcount_portable(words: &[u64]) -> usize {
    let (chunks, rem) = words.as_chunks::<8>();
    let mut acc = Simd::<u64, 8>::splat(0);
    for c in chunks {
        acc += Simd::from_array(*c).count_ones();
    }
    acc.reduce_sum() as usize + popcount_scalar(rem)
}

/// Portable SIMD, byte lanes: `Simd<u8, 64>::count_ones()` is a single nibble-LUT
/// `pshufb` pair, and the per-byte counts can be accumulated for 31 iterations
/// (31 * 8 = 248 < 256) before widening. Same idea as Muła's AVX2 popcount.
pub fn popcount_portable_u8(words: &[u64]) -> usize {
    let (chunks, rem) = words.as_chunks::<8>();
    let mut total = 0usize;
    for block in chunks.chunks(31) {
        let mut acc = Simd::<u8, 64>::splat(0);
        for c in block {
            acc += Simd::<u64, 8>::from_array(*c).to_ne_bytes().count_ones();
        }
        total += acc.cast::<u16>().reduce_sum() as usize;
    }
    total + popcount_scalar(rem)
}

/// Per-u64-lane popcount of one ymm via the nibble LUT + `vpsadbw` (shared with rank_index).
#[cfg(target_feature = "avx2")]
#[inline(always)]
pub(crate) unsafe fn popcount_epi64_avx2(v: core::arch::x86_64::__m256i) -> core::arch::x86_64::__m256i {
    use core::arch::x86_64::*;
    // SAFETY: caller guarantees avx2.
    unsafe {
        #[rustfmt::skip]
        let lookup = _mm256_setr_epi8(
            0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
            0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
        );
        let low_mask = _mm256_set1_epi8(0x0f);
        let lo = _mm256_and_si256(v, low_mask);
        let hi = _mm256_and_si256(_mm256_srli_epi16::<4>(v), low_mask);
        let cnt = _mm256_add_epi8(_mm256_shuffle_epi8(lookup, lo), _mm256_shuffle_epi8(lookup, hi));
        _mm256_sad_epu8(cnt, _mm256_setzero_si256())
    }
}

/// Per-u64-lane popcount of one zmm via the nibble LUT + `vpsadbw`.
#[cfg(target_feature = "avx512bw")]
#[allow(dead_code)] // unused when avx512vpopcntdq is enabled
#[inline(always)]
pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
    use core::arch::x86_64::*;
    // SAFETY: caller guarantees avx512bw.
    unsafe {
        let lookup = _mm512_set4_epi32(0x0403_0302, 0x0302_0201, 0x0302_0201, 0x0201_0100);
        let low_mask = _mm512_set1_epi8(0x0f);
        let lo = _mm512_and_si512(v, low_mask);
        let hi = _mm512_and_si512(_mm512_srli_epi16::<4>(v), low_mask);
        let cnt = _mm512_add_epi8(_mm512_shuffle_epi8(lookup, lo), _mm512_shuffle_epi8(lookup, hi));
        _mm512_sad_epu8(cnt, _mm512_setzero_si512())
    }
}

/// AVX2 nibble-LUT popcount (Muła, Kurz, Lemire 2017), 32 bytes per step.
#[cfg(target_feature = "avx2")]
pub fn popcount_avx2(words: &[u64]) -> usize {
    use core::arch::x86_64::*;
    let (chunks, rem) = words.as_chunks::<4>();
    let mut total = 0usize;
    // SAFETY: avx2 is a compile-time feature here; loads are 32 bytes inside `chunks`.
    unsafe {
        #[rustfmt::skip]
        let lookup = _mm256_setr_epi8(
            0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
            0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
        );
        let low_mask = _mm256_set1_epi8(0x0f);
        let zero = _mm256_setzero_si256();
        let mut acc = zero;
        for block in chunks.chunks(31) {
            let mut local = zero;
            for c in block {
                let v = _mm256_loadu_si256(c.as_ptr() as *const __m256i);
                let lo = _mm256_and_si256(v, low_mask);
                let hi = _mm256_and_si256(_mm256_srli_epi16::<4>(v), low_mask);
                let cnt = _mm256_add_epi8(_mm256_shuffle_epi8(lookup, lo), _mm256_shuffle_epi8(lookup, hi));
                local = _mm256_add_epi8(local, cnt);
            }
            acc = _mm256_add_epi64(acc, _mm256_sad_epu8(local, zero));
        }
        let lanes: [u64; 4] = core::mem::transmute(acc);
        total += lanes.iter().sum::<u64>() as usize;
    }
    total + popcount_scalar(rem)
}

/// AVX-512BW nibble-LUT popcount, 64 bytes per step (no VPOPCNTDQ on this machine).
#[cfg(target_feature = "avx512bw")]
pub fn popcount_avx512(words: &[u64]) -> usize {
    use core::arch::x86_64::*;
    let (chunks, rem) = words.as_chunks::<8>();
    let mut total = 0usize;
    // SAFETY: avx512bw is a compile-time feature here; loads are 64 bytes inside `chunks`.
    unsafe {
        #[rustfmt::skip]
        let lookup = _mm512_set4_epi32(0x0403_0302, 0x0302_0201, 0x0302_0201, 0x0201_0100);
        let low_mask = _mm512_set1_epi8(0x0f);
        let zero = _mm512_setzero_si512();
        let mut acc = zero;
        for block in chunks.chunks(31) {
            let mut local = zero;
            for c in block {
                let v = _mm512_loadu_si512(c.as_ptr() as *const __m512i);
                let lo = _mm512_and_si512(v, low_mask);
                let hi = _mm512_and_si512(_mm512_srli_epi16::<4>(v), low_mask);
                let cnt = _mm512_add_epi8(_mm512_shuffle_epi8(lookup, lo), _mm512_shuffle_epi8(lookup, hi));
                local = _mm512_add_epi8(local, cnt);
            }
            acc = _mm512_add_epi64(acc, _mm512_sad_epu8(local, zero));
        }
        total += _mm512_reduce_add_epi64(acc) as usize;
    }
    total + popcount_scalar(rem)
}

/// AVX-512 VPOPCNTDQ: one `vpopcntq` per 8 words.
#[cfg(target_feature = "avx512vpopcntdq")]
pub fn popcount_vpopcnt(words: &[u64]) -> usize {
    use core::arch::x86_64::*;
    let (chunks, rem) = words.as_chunks::<8>();
    // SAFETY: avx512vpopcntdq compile-time feature; loads are one chunk wide.
    let total = unsafe {
        let mut acc = _mm512_setzero_si512();
        for c in chunks {
            acc = _mm512_add_epi64(acc, _mm512_popcnt_epi64(_mm512_loadu_si512(c.as_ptr() as *const __m512i)));
        }
        _mm512_reduce_add_epi64(acc) as usize
    };
    total + popcount_scalar(rem)
}

#[cfg(target_feature = "avx512vpopcntdq")]
pub fn rank_vpopcnt(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_vpopcnt(words) + partial.count_ones() as usize
}

/// NEON: `cnt` (byte popcount) accumulated with `uadalp` into u16 lanes, folded to u64
/// every 1024 vectors.
#[cfg(target_arch = "aarch64")]
pub fn popcount_neon(words: &[u64]) -> usize {
    use core::arch::aarch64::*;
    let (chunks, rem) = words.as_chunks::<2>();
    // SAFETY: NEON is baseline on aarch64; loads are 16 bytes inside `chunks`.
    let total = unsafe {
        let mut acc = vdupq_n_u64(0);
        for block in chunks.chunks(1024) {
            let mut acc16 = vdupq_n_u16(0);
            for c in block {
                acc16 = vpadalq_u8(acc16, vcntq_u8(vld1q_u8(c.as_ptr() as *const u8)));
            }
            acc = vpadalq_u32(acc, vpaddlq_u16(acc16));
        }
        vaddvq_u64(acc) as usize
    };
    total + popcount_scalar(rem)
}

#[cfg(target_arch = "aarch64")]
pub fn rank_neon(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_neon(words) + partial.count_ones() as usize
}

pub fn rank_scalar(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_scalar(words) + partial.count_ones() as usize
}

pub fn rank_portable(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_portable(words) + partial.count_ones() as usize
}

pub fn rank_portable_u8(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_portable_u8(words) + partial.count_ones() as usize
}

#[cfg(target_feature = "avx2")]
pub fn rank_avx2(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_avx2(words) + partial.count_ones() as usize
}

#[cfg(target_feature = "avx512bw")]
pub fn rank_avx512(bits: &[u64], i: usize) -> usize {
    let (words, partial) = split(bits, i);
    popcount_avx512(words) + partial.count_ones() as usize
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn reference(bits: &[u64], i: usize) -> usize {
        (0..i).filter(|&j| bits[j / 64] >> (j % 64) & 1 == 1).count()
    }

    fn check(f: fn(&[u64], usize) -> usize) {
        let mut rng = Rng::new(7);
        for &len in &[0usize, 1, 7, 8, 9, 31, 32, 33, 248, 249, 300] {
            for density in [0, 2, 4, 6, 8] {
                let bits = rng.words(len, density);
                let n = len * 64;
                let mut positions = vec![0, n, n / 2, n / 3];
                for _ in 0..8 {
                    positions.push(rng.next_u64() as usize % (n + 1));
                }
                for i in positions {
                    assert_eq!(reference(&bits, i), f(&bits, i), "len={len} density={density} i={i}");
                }
            }
        }
    }

    #[test]
    fn scalar() {
        check(rank_scalar);
    }
    #[test]
    fn portable() {
        check(rank_portable);
    }
    #[test]
    fn portable_u8() {
        check(rank_portable_u8);
    }
    #[cfg(target_feature = "avx2")]
    #[test]
    fn avx2() {
        check(rank_avx2);
    }
    #[cfg(target_feature = "avx512bw")]
    #[test]
    fn avx512() {
        check(rank_avx512);
    }
    #[cfg(target_feature = "avx512vpopcntdq")]
    #[test]
    fn vpopcnt() {
        check(rank_vpopcnt);
    }
    #[cfg(target_arch = "aarch64")]
    #[test]
    fn neon() {
        check(rank_neon);
    }
}
