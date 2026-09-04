//! Bitmap -> one byte per bit (0 or 1). Inverse of `byte_to_bit`; `out.len() >= bits.len() * 64`.

use core_simd::simd::{Mask, Simd};
use core_simd::simd::prelude::*;

pub fn bits_to_bytes_scalar(bits: &[u64], out: &mut [u8]) {
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        for (i, o) in chunk.iter_mut().enumerate() {
            *o = ((w >> i) & 1) as u8;
        }
    }
}

/// SWAR: broadcast a byte, keep bit `j` in byte `j`, normalise non-zero bytes to 1.
pub fn bits_to_bytes_swar(bits: &[u64], out: &mut [u8]) {
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        for (j, o) in chunk.chunks_exact_mut(8).enumerate() {
            let b = (w >> (8 * j)) as u8 as u64;
            let spread = (b.wrapping_mul(0x0101_0101_0101_0101)) & 0x8040_2010_0804_0201;
            let ones = ((spread + 0x7f7f_7f7f_7f7f_7f7f) >> 7) & 0x0101_0101_0101_0101;
            o.copy_from_slice(&ones.to_le_bytes());
        }
    }
}

/// Portable SIMD: `Mask::from_bitmask` then select 1 / 0.
pub fn bits_to_bytes_portable(bits: &[u64], out: &mut [u8]) {
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        let m = Mask::<i8, 64>::from_bitmask(w);
        m.select(Simd::<u8, 64>::splat(1), Simd::splat(0)).copy_to_slice(chunk);
    }
}

/// Portable SIMD, alternative spelling: `to_simd()` (0 / -1) masked to the low bit.
pub fn bits_to_bytes_portable_int(bits: &[u64], out: &mut [u8]) {
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        let v = Mask::<i8, 64>::from_bitmask(w).to_simd() & Simd::splat(1);
        v.cast::<u8>().copy_to_slice(chunk);
    }
}

/// AVX2: broadcast the whole word once (`vpbroadcastq`), `vpshufb` each mask byte to 8
/// lanes (two index sets for the two halves), `vpand` with bit weights, `vpminub` with 1.
#[cfg(target_feature = "avx2")]
pub fn bits_to_bytes_avx2(bits: &[u64], out: &mut [u8]) {
    use core::arch::x86_64::*;
    assert!(out.len() >= bits.len() * 64);
    #[rustfmt::skip]
    let shuf_lo: __m256i = Simd::<u8, 32>::from_array([
        0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1,
        2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3,
    ]).into();
    #[rustfmt::skip]
    let shuf_hi: __m256i = Simd::<u8, 32>::from_array([
        4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5,
        6, 6, 6, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 7, 7,
    ]).into();
    #[rustfmt::skip]
    let weights: __m256i = Simd::<u8, 32>::from_array([
        1, 2, 4, 8, 16, 32, 64, 128, 1, 2, 4, 8, 16, 32, 64, 128,
        1, 2, 4, 8, 16, 32, 64, 128, 1, 2, 4, 8, 16, 32, 64, 128,
    ]).into();
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        // SAFETY: avx2 compile-time feature; chunk is 64 bytes.
        unsafe {
            let ones = _mm256_set1_epi8(1);
            let v = _mm256_set1_epi64x(w as i64);
            let lo = _mm256_and_si256(_mm256_shuffle_epi8(v, shuf_lo), weights);
            let hi = _mm256_and_si256(_mm256_shuffle_epi8(v, shuf_hi), weights);
            _mm256_storeu_si256(chunk.as_mut_ptr() as *mut __m256i, _mm256_min_epu8(lo, ones));
            _mm256_storeu_si256(chunk.as_mut_ptr().add(32) as *mut __m256i, _mm256_min_epu8(hi, ones));
        }
    }
}

/// AVX-512BW: one zero-masked broadcast per 64 bits.
#[cfg(target_feature = "avx512bw")]
pub fn bits_to_bytes_avx512(bits: &[u64], out: &mut [u8]) {
    use core::arch::x86_64::*;
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        // SAFETY: avx512bw compile-time feature; chunk is 64 bytes.
        unsafe { _mm512_storeu_si512(chunk.as_mut_ptr() as *mut __m512i, _mm512_maskz_set1_epi8(w, 1)) };
    }
}

/// BMI2: `pdep` each mask byte onto the low bit of 8 bytes.
#[cfg(target_feature = "bmi2")]
pub fn bits_to_bytes_pdep(bits: &[u64], out: &mut [u8]) {
    use core::arch::x86_64::_pdep_u64;
    assert!(out.len() >= bits.len() * 64);
    for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
        for (j, o) in chunk.chunks_exact_mut(8).enumerate() {
            // SAFETY: bmi2 compile-time feature.
            let v = unsafe { _pdep_u64(w >> (8 * j), 0x0101_0101_0101_0101) };
            o.copy_from_slice(&v.to_le_bytes());
        }
    }
}

/// NEON: `dup` each mask byte to 8 lanes, `cmtst` against bit weights, `and` 1, store 16.
#[cfg(target_arch = "aarch64")]
pub fn bits_to_bytes_neon(bits: &[u64], out: &mut [u8]) {
    use core::arch::aarch64::*;
    assert!(out.len() >= bits.len() * 64);
    // SAFETY: NEON is baseline on aarch64; chunk is 64 bytes.
    unsafe {
        let weights = vreinterpretq_u8_u64(vdupq_n_u64(0x8040_2010_0804_0201));
        let one = vdupq_n_u8(1);
        for (&w, chunk) in bits.iter().zip(out.chunks_exact_mut(64)) {
            let lo = vcreate_u8(w);
            let o = chunk.as_mut_ptr();
            let bc = |a: uint8x16_t| vandq_u8(vtstq_u8(a, weights), one);
            vst1q_u8(o, bc(vcombine_u8(vdup_lane_u8::<0>(lo), vdup_lane_u8::<1>(lo))));
            vst1q_u8(o.add(16), bc(vcombine_u8(vdup_lane_u8::<2>(lo), vdup_lane_u8::<3>(lo))));
            vst1q_u8(o.add(32), bc(vcombine_u8(vdup_lane_u8::<4>(lo), vdup_lane_u8::<5>(lo))));
            vst1q_u8(o.add(48), bc(vcombine_u8(vdup_lane_u8::<6>(lo), vdup_lane_u8::<7>(lo))));
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn check(f: fn(&[u64], &mut [u8])) {
        let mut rng = Rng::new(41);
        for &len in &[0usize, 1, 2, 7, 100] {
            for density in [0, 1, 4, 7, 8] {
                let bits = rng.words(len, density);
                let mut expect = vec![0u8; len * 64];
                let mut got = vec![0xffu8; len * 64];
                bits_to_bytes_scalar(&bits, &mut expect);
                f(&bits, &mut got);
                assert_eq!(expect, got, "len={len} density={density}");
                // round trip through byte_to_bit
                let mut back = vec![0u64; len];
                crate::byte_to_bit::bytes_to_bits_scalar(&got, &mut back);
                assert_eq!(bits, back);
            }
        }
    }

    #[test]
    fn swar() {
        check(bits_to_bytes_swar);
    }
    #[test]
    fn portable() {
        check(bits_to_bytes_portable);
        check(bits_to_bytes_portable_int);
    }
    #[cfg(target_feature = "avx2")]
    #[test]
    fn avx2() {
        check(bits_to_bytes_avx2);
    }
    #[cfg(target_feature = "avx512bw")]
    #[test]
    fn avx512() {
        check(bits_to_bytes_avx512);
    }
    #[cfg(target_feature = "bmi2")]
    #[test]
    fn pdep() {
        check(bits_to_bytes_pdep);
    }
    #[cfg(target_arch = "aarch64")]
    #[test]
    fn neon() {
        check(bits_to_bytes_neon);
    }
}
