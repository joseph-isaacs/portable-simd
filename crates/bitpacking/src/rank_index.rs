//! Rank index build: `out[i]` = number of set bits in `bits[..i]` (exclusive prefix popcount
//! per word). With this table `rank(i)` is one lookup plus one masked popcount.

use core_simd::simd::Simd;
use core_simd::simd::prelude::*;

pub fn rank_index_scalar(bits: &[u64], out: &mut [u32]) {
    assert!(out.len() >= bits.len());
    let mut acc = 0u32;
    for (&w, o) in bits.iter().zip(out.iter_mut()) {
        *o = acc;
        acc += w.count_ones();
    }
}

/// Portable SIMD: 8 popcounts, in-register inclusive scan (3 shift+add steps), and the
/// running total kept as a broadcast vector so the loop-carried chain is one permute + add
/// instead of an extract to scalar and back.
pub fn rank_index_portable(bits: &[u64], out: &mut [u32]) {
    use core_simd::simd::simd_swizzle;
    assert!(out.len() >= bits.len());
    let (chunks, rem) = bits.as_chunks::<8>();
    let (oc, orem) = out[..bits.len()].as_chunks_mut::<8>();
    let mut carry = Simd::<u64, 8>::splat(0);
    for (c, o) in chunks.iter().zip(oc) {
        let cnt = Simd::<u64, 8>::from_array(*c).count_ones();
        let mut incl = cnt;
        incl += incl.shift_elements_right::<1>(0);
        incl += incl.shift_elements_right::<2>(0);
        incl += incl.shift_elements_right::<4>(0);
        let excl = (incl - cnt) + carry;
        *o = excl.cast::<u32>().to_array();
        carry += simd_swizzle!(incl, [7, 7, 7, 7, 7, 7, 7, 7]);
    }
    let mut acc = carry[0] as u32;
    for (&w, o) in rem.iter().zip(orem) {
        *o = acc;
        acc += w.count_ones();
    }
}

/// AVX2: LUT popcount of 4 words, scan with `vpslldq` + lane broadcast, narrow to u32.
#[cfg(target_feature = "avx2")]
pub fn rank_index_avx2(bits: &[u64], out: &mut [u32]) {
    use core::arch::x86_64::*;
    assert!(out.len() >= bits.len());
    let (chunks, rem) = bits.as_chunks::<4>();
    let (oc, orem) = out[..bits.len()].as_chunks_mut::<4>();
    // SAFETY: avx2 is a compile-time feature; loads/stores are exactly one chunk wide.
    let carry = unsafe {
        let narrow = _mm256_setr_epi32(0, 2, 4, 6, 0, 0, 0, 0);
        let mut carry = _mm256_setzero_si256();
        for (c, o) in chunks.iter().zip(oc) {
            let cnt = crate::rank::popcount_epi64_avx2(_mm256_loadu_si256(c.as_ptr() as *const __m256i));
            // in-lane: e1 += e0, e3 += e2
            let mut incl = _mm256_add_epi64(cnt, _mm256_slli_si256::<8>(cnt));
            // cross-lane: e2, e3 += e1
            let b = _mm256_permute4x64_epi64::<0b01_01_01_01>(incl);
            incl = _mm256_add_epi64(incl, _mm256_blend_epi32::<0xF0>(_mm256_setzero_si256(), b));
            let excl = _mm256_add_epi64(_mm256_sub_epi64(incl, cnt), carry);
            let packed = _mm256_permutevar8x32_epi32(excl, narrow);
            _mm_storeu_si128(o.as_mut_ptr() as *mut __m128i, _mm256_castsi256_si128(packed));
            carry = _mm256_add_epi64(carry, _mm256_permute4x64_epi64::<0b11_11_11_11>(incl));
        }
        _mm256_extract_epi64::<0>(carry)
    };
    let mut acc = carry as u32;
    for (&w, o) in rem.iter().zip(orem) {
        *o = acc;
        acc += w.count_ones();
    }
}

/// AVX-512: LUT popcount of 8 words, scan with masked `vpermq` shifts, `vpmovqd` narrow.
#[cfg(target_feature = "avx512bw")]
pub fn rank_index_avx512(bits: &[u64], out: &mut [u32]) {
    use core::arch::x86_64::*;
    assert!(out.len() >= bits.len());
    let (chunks, rem) = bits.as_chunks::<8>();
    let (oc, orem) = out[..bits.len()].as_chunks_mut::<8>();
    // SAFETY: avx512bw is a compile-time feature; loads/stores are exactly one chunk wide.
    let carry = unsafe {
        let s1 = _mm512_setr_epi64(7, 0, 1, 2, 3, 4, 5, 6);
        let s2 = _mm512_setr_epi64(6, 7, 0, 1, 2, 3, 4, 5);
        let s4 = _mm512_setr_epi64(4, 5, 6, 7, 0, 1, 2, 3);
        let last = _mm512_set1_epi64(7);
        let mut carry = _mm512_setzero_si512();
        for (c, o) in chunks.iter().zip(oc) {
            #[cfg(target_feature = "avx512vpopcntdq")]
            let cnt = _mm512_popcnt_epi64(_mm512_loadu_si512(c.as_ptr() as *const __m512i));
            #[cfg(not(target_feature = "avx512vpopcntdq"))]
            let cnt = crate::rank::popcount_epi64_avx512(_mm512_loadu_si512(c.as_ptr() as *const __m512i));
            let mut incl = cnt;
            incl = _mm512_add_epi64(incl, _mm512_maskz_permutexvar_epi64(0xFE, s1, incl));
            incl = _mm512_add_epi64(incl, _mm512_maskz_permutexvar_epi64(0xFC, s2, incl));
            incl = _mm512_add_epi64(incl, _mm512_maskz_permutexvar_epi64(0xF0, s4, incl));
            let excl = _mm512_add_epi64(_mm512_sub_epi64(incl, cnt), carry);
            _mm256_storeu_si256(o.as_mut_ptr() as *mut __m256i, _mm512_cvtepi64_epi32(excl));
            carry = _mm512_add_epi64(carry, _mm512_permutexvar_epi64(last, incl));
        }
        let lanes: [i64; 8] = core::mem::transmute(carry);
        lanes[0]
    };
    let mut acc = carry as u32;
    for (&w, o) in rem.iter().zip(orem) {
        *o = acc;
        acc += w.count_ones();
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn check(f: fn(&[u64], &mut [u32])) {
        let mut rng = Rng::new(21);
        for &len in &[0usize, 1, 3, 4, 5, 7, 8, 9, 16, 17, 100] {
            for density in [0, 1, 4, 7, 8] {
                let bits = rng.words(len, density);
                let mut expect = vec![0u32; len];
                let mut got = vec![0xffff_ffffu32; len];
                rank_index_scalar(&bits, &mut expect);
                f(&bits, &mut got);
                assert_eq!(expect, got, "len={len} density={density}");
            }
        }
    }

    #[test]
    fn scalar_matches_rank() {
        let mut rng = Rng::new(22);
        let bits = rng.words(37, 4);
        let mut idx = vec![0u32; 37];
        rank_index_scalar(&bits, &mut idx);
        for i in 0..37 {
            assert_eq!(idx[i] as usize, crate::rank::rank_scalar(&bits, i * 64));
        }
    }
    #[test]
    fn portable() {
        check(rank_index_portable);
    }
    #[cfg(target_feature = "avx2")]
    #[test]
    fn avx2() {
        check(rank_index_avx2);
    }
    #[cfg(target_feature = "avx512bw")]
    #[test]
    fn avx512() {
        check(rank_index_avx512);
    }
}
