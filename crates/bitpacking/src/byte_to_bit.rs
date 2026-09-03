//! Byte-per-element boolean array -> bitmap.
//!
//! Semantics: output bit `i` is set iff `bytes[i] != 0`. `out` must hold at least
//! `bytes.len().div_ceil(64)` words; a trailing partial word is zero-padded.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

#[inline(always)]
fn tail(bytes: &[u8]) -> u64 {
    let mut w = 0u64;
    for (i, &b) in bytes.iter().enumerate() {
        w |= ((b != 0) as u64) << i;
    }
    w
}

/// Baseline: one shift/or per byte. Left as-is to see what LLVM auto-vectorisation does.
pub fn bytes_to_bits_scalar(bytes: &[u8], out: &mut [u64]) {
    for (chunk, o) in bytes.chunks(64).zip(out.iter_mut()) {
        *o = tail(chunk);
    }
}

/// SWAR: test 8 bytes at a time for non-zero, then gather the 8 high bits with a multiply.
pub fn bytes_to_bits_swar(bytes: &[u8], out: &mut [u64]) {
    let (chunks, rem) = bytes.as_chunks::<64>();
    for (chunk, o) in chunks.iter().zip(out.iter_mut()) {
        let (words, _) = chunk.as_chunks::<8>();
        let mut w = 0u64;
        for (j, b) in words.iter().enumerate() {
            let x = u64::from_le_bytes(*b);
            // High bit of each byte becomes set iff the byte is non-zero.
            let nz = (((x & 0x7f7f_7f7f_7f7f_7f7f) + 0x7f7f_7f7f_7f7f_7f7f) | x) & 0x8080_8080_8080_8080;
            // Multiply-gather: bit 7+8i lands in bit 56+i; no two terms collide, so no carries.
            let bits = nz.wrapping_mul(0x0002_0408_1020_4081) >> 56;
            w |= bits << (8 * j);
        }
        *o = w;
    }
    if !rem.is_empty() {
        out[chunks.len()] = tail(rem);
    }
}

/// Portable SIMD: compare 64 bytes against zero and take the mask's bitmask.
pub fn bytes_to_bits_portable(bytes: &[u8], out: &mut [u64]) {
    let (chunks, rem) = bytes.as_chunks::<64>();
    for (chunk, o) in chunks.iter().zip(out.iter_mut()) {
        let v = Simd::<u8, 64>::from_array(*chunk);
        *o = v.simd_ne(Simd::splat(0)).to_bitmask();
    }
    if !rem.is_empty() {
        out[chunks.len()] = tail(rem);
    }
}

/// Portable SIMD, 32 lanes at a time (native AVX2 width) to see whether the 64-lane
/// version's legalisation split costs anything.
pub fn bytes_to_bits_portable32(bytes: &[u8], out: &mut [u64]) {
    let (chunks, rem) = bytes.as_chunks::<64>();
    for (chunk, o) in chunks.iter().zip(out.iter_mut()) {
        let (halves, _) = chunk.as_chunks::<32>();
        let lo = Simd::<u8, 32>::from_array(halves[0]).simd_ne(Simd::splat(0)).to_bitmask();
        let hi = Simd::<u8, 32>::from_array(halves[1]).simd_ne(Simd::splat(0)).to_bitmask();
        *o = lo | (hi << 32);
    }
    if !rem.is_empty() {
        out[chunks.len()] = tail(rem);
    }
}

/// AVX2: `vpcmpeqb` against zero + `vpmovmskb`, inverted.
#[cfg(target_feature = "avx2")]
pub fn bytes_to_bits_avx2(bytes: &[u8], out: &mut [u64]) {
    use core::arch::x86_64::*;
    let (chunks, rem) = bytes.as_chunks::<64>();
    for (chunk, o) in chunks.iter().zip(out.iter_mut()) {
        // SAFETY: chunk is 64 bytes, unaligned loads are fine; avx2 is a compile-time feature here.
        unsafe {
            let zero = _mm256_setzero_si256();
            let lo = _mm256_loadu_si256(chunk.as_ptr() as *const __m256i);
            let hi = _mm256_loadu_si256(chunk.as_ptr().add(32) as *const __m256i);
            let mlo = !(_mm256_movemask_epi8(_mm256_cmpeq_epi8(lo, zero)) as u32);
            let mhi = !(_mm256_movemask_epi8(_mm256_cmpeq_epi8(hi, zero)) as u32);
            *o = mlo as u64 | ((mhi as u64) << 32);
        }
    }
    if !rem.is_empty() {
        out[chunks.len()] = tail(rem);
    }
}

/// AVX-512BW: a single `vptestmb` produces the 64-bit mask directly.
#[cfg(target_feature = "avx512bw")]
pub fn bytes_to_bits_avx512(bytes: &[u8], out: &mut [u64]) {
    use core::arch::x86_64::*;
    let (chunks, rem) = bytes.as_chunks::<64>();
    for (chunk, o) in chunks.iter().zip(out.iter_mut()) {
        // SAFETY: chunk is 64 bytes; avx512bw is a compile-time feature here.
        unsafe {
            let v = _mm512_loadu_si512(chunk.as_ptr() as *const __m512i);
            *o = _mm512_test_epi8_mask(v, v);
        }
    }
    if !rem.is_empty() {
        out[chunks.len()] = tail(rem);
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn check(f: fn(&[u8], &mut [u64])) {
        let mut rng = Rng::new(1);
        for &len in &[0usize, 1, 63, 64, 65, 127, 128, 1000, 4096, 4097] {
            for density in [0, 1, 4, 7, 8] {
                let bytes = rng.bytes(len, density);
                let mut expect = vec![0u64; len.div_ceil(64)];
                let mut got = vec![0xdead_beefu64; len.div_ceil(64)];
                bytes_to_bits_scalar(&bytes, &mut expect);
                f(&bytes, &mut got);
                assert_eq!(expect, got, "len={len} density={density}");
            }
        }
    }

    #[test]
    fn swar() {
        check(bytes_to_bits_swar);
    }
    #[test]
    fn portable() {
        check(bytes_to_bits_portable);
    }
    #[test]
    fn portable32() {
        check(bytes_to_bits_portable32);
    }
    #[cfg(target_feature = "avx2")]
    #[test]
    fn avx2() {
        check(bytes_to_bits_avx2);
    }
    #[cfg(target_feature = "avx512bw")]
    #[test]
    fn avx512() {
        check(bytes_to_bits_avx512);
    }
}
