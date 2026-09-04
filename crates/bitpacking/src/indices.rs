//! Positions of all set bits: per word (`select_all64`) and streaming over a bitmap
//! (`bitmap_to_indices`). This is vortex's `BitBuffer::set_indices()` shape.
//!
//! All writers require 64 words of slack past the last real output (`out.len() >= count + 64`)
//! so that the vector variants can store full groups unconditionally.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

/// `POS_LUT[b]`: positions of the set bits of byte `b`, one per byte, LSB first; unused = 0.
static POS_LUT: [u64; 256] = {
    let mut t = [0u64; 256];
    let mut b = 0;
    while b < 256 {
        let mut n = 0;
        let mut i = 0;
        while i < 8 {
            if (b >> i) & 1 == 1 {
                t[b] |= (i as u64) << (8 * n);
                n += 1;
            }
            i += 1;
        }
        b += 1;
    }
    t
};

/// `tzcnt` / `blsr` loop: one iteration per set bit.
#[inline]
pub fn select_all64_scalar(mut w: u64, base: u32, out: &mut [u32]) -> usize {
    assert!(out.len() >= 64);
    let ptr = out.as_mut_ptr();
    let mut n = 0;
    while w != 0 {
        // SAFETY: n < popcount(w) <= 64 <= out.len().
        unsafe { ptr.add(n).write(base + w.trailing_zeros()) };
        w &= w - 1;
        n += 1;
    }
    n
}

/// Portable SIMD: per byte, table of 8 positions -> widen to u32 -> add base -> store 8,
/// advance by popcount(byte). Density-independent: always 8 stores per word.
#[inline]
pub fn select_all64_portable(w: u64, base: u32, out: &mut [u32]) -> usize {
    assert!(out.len() >= 64);
    let ptr = out.as_mut_ptr();
    let mut n = 0;
    let mut j = 0;
    while j < 8 {
        let b = (w >> (8 * j)) as u8;
        let pos = Simd::<u8, 8>::from_array(POS_LUT[b as usize].to_le_bytes()).cast::<u32>()
            + Simd::splat(base + 8 * j as u32);
        // SAFETY: n <= 56 here and out has >= 64 elements.
        unsafe { (ptr.add(n) as *mut [u32; 8]).write_unaligned(pos.to_array()) };
        n += b.count_ones() as usize;
        j += 1;
    }
    n
}

/// AVX2 spelling of the same byte-table scheme (`vpmovzxbd` + `vpaddd` + store).
#[cfg(target_feature = "avx2")]
#[inline]
pub fn select_all64_avx2(w: u64, base: u32, out: &mut [u32]) -> usize {
    use core::arch::x86_64::*;
    assert!(out.len() >= 64);
    let ptr = out.as_mut_ptr();
    let mut n = 0;
    let mut j = 0;
    while j < 8 {
        let b = (w >> (8 * j)) as u8;
        // SAFETY: avx2 compile-time feature; n <= 56 and out has >= 64 elements.
        unsafe {
            let pos = _mm256_cvtepu8_epi32(_mm_cvtsi64_si128(POS_LUT[b as usize] as i64));
            let pos = _mm256_add_epi32(pos, _mm256_set1_epi32((base + 8 * j as u32) as i32));
            _mm256_storeu_si256(ptr.add(n) as *mut __m256i, pos);
        }
        n += b.count_ones() as usize;
        j += 1;
    }
    n
}

/// AVX-512F: `vpcompressd` of an iota vector per 16 bits: 4 compress + 4 stores per word.
#[cfg(target_feature = "avx512f")]
#[inline]
pub fn select_all64_avx512(w: u64, base: u32, out: &mut [u32]) -> usize {
    use core::arch::x86_64::*;
    assert!(out.len() >= 64);
    let ptr = out.as_mut_ptr();
    let mut n = 0;
    // SAFETY: avx512f compile-time feature; n <= 48 and out has >= 64 elements.
    unsafe {
        let iota = _mm512_setr_epi32(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);
        let mut j = 0;
        while j < 4 {
            let k = (w >> (16 * j)) as u16;
            let v = _mm512_add_epi32(iota, _mm512_set1_epi32((base + 16 * j as u32) as i32));
            _mm512_storeu_si512(ptr.add(n) as *mut __m512i, _mm512_maskz_compress_epi32(k, v));
            n += k.count_ones() as usize;
            j += 1;
        }
    }
    n
}

/// AVX-512 VBMI2: one `vpcompressb` of a 64-byte iota per word, then 4 x widen (`vpmovzxbd`)
/// + add base + store.
#[cfg(target_feature = "avx512vbmi2")]
#[inline]
pub fn select_all64_vbmi2(w: u64, base: u32, out: &mut [u32]) -> usize {
    use core::arch::x86_64::*;
    assert!(out.len() >= 64);
    let ptr = out.as_mut_ptr();
    // SAFETY: avx512vbmi2 compile-time feature; 64 u32 of slack.
    unsafe {
        let iota: __m512i = Simd::<u8, 64>::from_array(core::array::from_fn(|i| i as u8)).into();
        let c = _mm512_maskz_compress_epi8(w, iota);
        let b = _mm512_set1_epi32(base as i32);
        _mm512_storeu_si512(ptr as *mut __m512i, _mm512_add_epi32(_mm512_cvtepu8_epi32(_mm512_extracti32x4_epi32::<0>(c)), b));
        _mm512_storeu_si512(ptr.add(16) as *mut __m512i, _mm512_add_epi32(_mm512_cvtepu8_epi32(_mm512_extracti32x4_epi32::<1>(c)), b));
        _mm512_storeu_si512(ptr.add(32) as *mut __m512i, _mm512_add_epi32(_mm512_cvtepu8_epi32(_mm512_extracti32x4_epi32::<2>(c)), b));
        _mm512_storeu_si512(ptr.add(48) as *mut __m512i, _mm512_add_epi32(_mm512_cvtepu8_epi32(_mm512_extracti32x4_epi32::<3>(c)), b));
    }
    w.count_ones() as usize
}

#[inline(always)]
fn bitmap_to_indices_with(bits: &[u64], out: &mut [u32], f: impl Fn(u64, u32, &mut [u32]) -> usize) -> usize {
    let mut n = 0;
    for (i, &w) in bits.iter().enumerate() {
        n += f(w, (i * 64) as u32, &mut out[n..]);
    }
    n
}

/// Returns the number of indices written; `out` needs `popcount + 64` capacity.
pub fn bitmap_to_indices_scalar(bits: &[u64], out: &mut [u32]) -> usize {
    bitmap_to_indices_with(bits, out, select_all64_scalar)
}

pub fn bitmap_to_indices_portable(bits: &[u64], out: &mut [u32]) -> usize {
    bitmap_to_indices_with(bits, out, select_all64_portable)
}

#[cfg(target_feature = "avx2")]
pub fn bitmap_to_indices_avx2(bits: &[u64], out: &mut [u32]) -> usize {
    bitmap_to_indices_with(bits, out, select_all64_avx2)
}

#[cfg(target_feature = "avx512f")]
pub fn bitmap_to_indices_avx512(bits: &[u64], out: &mut [u32]) -> usize {
    bitmap_to_indices_with(bits, out, select_all64_avx512)
}

#[cfg(target_feature = "avx512vbmi2")]
pub fn bitmap_to_indices_vbmi2(bits: &[u64], out: &mut [u32]) -> usize {
    bitmap_to_indices_with(bits, out, select_all64_vbmi2)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn reference(bits: &[u64]) -> Vec<u32> {
        (0..bits.len() * 64).filter(|&j| bits[j / 64] >> (j % 64) & 1 == 1).map(|j| j as u32).collect()
    }

    fn check(f: fn(&[u64], &mut [u32]) -> usize) {
        let mut rng = Rng::new(31);
        for &len in &[0usize, 1, 2, 5, 8, 9, 100] {
            for density in [0, 1, 4, 7, 8] {
                let bits = rng.words(len, density);
                let expect = reference(&bits);
                let mut got = vec![0xffff_ffffu32; expect.len() + 64];
                let n = f(&bits, &mut got);
                assert_eq!(expect.len(), n, "len={len} density={density}");
                assert_eq!(expect, got[..n], "len={len} density={density}");
            }
        }
    }

    #[test]
    fn scalar() {
        check(bitmap_to_indices_scalar);
    }
    #[test]
    fn portable() {
        check(bitmap_to_indices_portable);
    }
    #[cfg(target_feature = "avx2")]
    #[test]
    fn avx2() {
        check(bitmap_to_indices_avx2);
    }
    #[cfg(target_feature = "avx512f")]
    #[test]
    fn avx512() {
        check(bitmap_to_indices_avx512);
    }
    #[cfg(target_feature = "avx512vbmi2")]
    #[test]
    fn vbmi2() {
        check(bitmap_to_indices_vbmi2);
    }
}
