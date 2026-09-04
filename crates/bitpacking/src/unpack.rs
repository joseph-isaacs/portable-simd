//! Unpack `K`-bit fields (`K` = 1..=7) from an LSB-first bit stream into one byte per value.
//! Value `j` occupies bits `[j*K, j*K + K)` of `packed` (Parquet-style bit packing, not the
//! FastLanes transposed layout).
//!
//! All variants may read up to 64 bytes past the last needed byte, so
//! `packed.len() >= (out.len() * K).div_ceil(8) + 64` is required.

use core_simd::simd::{Simd, Swizzle};
use core_simd::simd::prelude::*;

#[inline(always)]
fn check<const K: usize>(packed: &[u8], out: &[u8]) {
    const { assert!(K >= 1 && K <= 7) };
    assert!(packed.len() >= (out.len() * K).div_ceil(8) + 64, "need 64 bytes of read slack");
}

/// Byte-repeated field mask, e.g. `0x0707..07` for K = 3.
#[allow(dead_code)]
const fn byte_mask<const K: usize>() -> u64 {
    ((1u64 << K) - 1) * 0x0101_0101_0101_0101
}

/// Eight values per iteration: one u64 load, 8 shift+mask.
pub fn unpack_scalar<const K: usize>(packed: &[u8], out: &mut [u8]) {
    check::<K>(packed, out);
    let mask = (1u8 << K) - 1;
    for (g, chunk) in out.chunks_mut(8).enumerate() {
        let w = u64::from_le_bytes(packed[g * K..g * K + 8].try_into().unwrap());
        for (i, o) in chunk.iter_mut().enumerate() {
            *o = ((w >> (i * K)) as u8) & mask;
        }
    }
}

/// BMI2: `pdep` deposits 8 fields into the low `K` bits of 8 bytes; the 8-value group starts on
/// a byte boundary (`8K` bits = `K` bytes), so it is one load, one `pdep`, one store.
#[cfg(target_feature = "bmi2")]
pub fn unpack_pdep<const K: usize>(packed: &[u8], out: &mut [u8]) {
    use core::arch::x86_64::_pdep_u64;
    check::<K>(packed, out);
    let (chunks, rem) = out.as_chunks_mut::<8>();
    for (g, chunk) in chunks.iter_mut().enumerate() {
        let w = u64::from_le_bytes(packed[g * K..g * K + 8].try_into().unwrap());
        // SAFETY: bmi2 compile-time feature.
        *chunk = unsafe { _pdep_u64(w, byte_mask::<K>()) }.to_le_bytes();
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * K..], rem);
    }
}

/// Gather indices for 16 values: u16 lane `t` is bytes `(t*K)/8` and `(t*K)/8 + 1`.
struct Gather<const K: usize>;
impl<const K: usize> Swizzle<32> for Gather<K> {
    const INDEX: [usize; 32] = {
        let mut idx = [0usize; 32];
        let mut t = 0;
        while t < 16 {
            idx[2 * t] = (t * K) / 8;
            idx[2 * t + 1] = (t * K) / 8 + 1;
            t += 1;
        }
        idx
    };
}

const fn shifts<const K: usize>() -> [u16; 16] {
    let mut s = [0u16; 16];
    let mut t = 0;
    while t < 16 {
        s[t] = ((t * K) % 8) as u16;
        t += 1;
    }
    s
}

const fn muls<const K: usize>() -> [u16; 16] {
    let mut m = [0u16; 16];
    let mut t = 0;
    while t < 16 {
        m[t] = 1 << (8 - (t * K) % 8);
        t += 1;
    }
    m
}

/// Portable SIMD, 16 values per step: gather the two bytes covering each field into u16
/// lanes with a static swizzle, then per-lane `(w * 2^(8-s)) >> 8 & mask` (the multiply is a
/// left shift by `8 - s`, so a uniform right shift by 8 aligns every field).
pub fn unpack_portable_mul<const K: usize>(packed: &[u8], out: &mut [u8]) {
    check::<K>(packed, out);
    let mul = Simd::<u16, 16>::from_array(muls::<K>());
    let mask = Simd::<u16, 16>::splat((1 << K) - 1);
    let (chunks, rem) = out.as_chunks_mut::<16>();
    for (g, chunk) in chunks.iter_mut().enumerate() {
        let src = Simd::<u8, 32>::from_slice(&packed[g * 2 * K..]);
        let w = Simd::<u16, 16>::from_ne_bytes(Gather::<K>::swizzle(src));
        *chunk = (((w * mul) >> 8) & mask).cast::<u8>().to_array();
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 2 * K..], rem);
    }
}

/// Same gather, but the natural spelling: a per-lane variable right shift.
pub fn unpack_portable_shift<const K: usize>(packed: &[u8], out: &mut [u8]) {
    check::<K>(packed, out);
    let sh = Simd::<u16, 16>::from_array(shifts::<K>());
    let mask = Simd::<u16, 16>::splat((1 << K) - 1);
    let (chunks, rem) = out.as_chunks_mut::<16>();
    for (g, chunk) in chunks.iter_mut().enumerate() {
        let src = Simd::<u8, 32>::from_slice(&packed[g * 2 * K..]);
        let w = Simd::<u16, 16>::from_ne_bytes(Gather::<K>::swizzle(src));
        *chunk = ((w >> sh) & mask).cast::<u8>().to_array();
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 2 * K..], rem);
    }
}

/// In-lane `vpshufb` gather indices: 8 values per 128-bit lane, source at byte offset `8K/8 = K`
/// per lane, so each lane's 16 source bytes are loaded separately.
#[allow(dead_code)]
const fn lane_gather<const K: usize>() -> [u8; 16] {
    let mut idx = [0u8; 16];
    let mut t = 0;
    while t < 8 {
        idx[2 * t] = ((t * K) / 8) as u8;
        idx[2 * t + 1] = ((t * K) / 8 + 1) as u8;
        t += 1;
    }
    idx
}

#[allow(dead_code)]
const fn lane_muls<const K: usize>() -> [u16; 8] {
    let mut m = [0u16; 8];
    let mut t = 0;
    while t < 8 {
        m[t] = 1 << (8 - (t * K) % 8);
        t += 1;
    }
    m
}

/// AVX2, 16 values per step: two 16-byte loads (offsets 0 and K) into one ymm, in-lane
/// `vpshufb`, `vpmullw`, `vpsrlw`, `vpand`, narrow with `vpackuswb` + `vpermq`.
#[cfg(target_feature = "avx2")]
pub fn unpack_avx2<const K: usize>(packed: &[u8], out: &mut [u8]) {
    use core::arch::x86_64::*;
    check::<K>(packed, out);
    let g16 = lane_gather::<K>();
    let m8 = lane_muls::<K>();
    let mut gather = [0u8; 32];
    gather[..16].copy_from_slice(&g16);
    gather[16..].copy_from_slice(&g16);
    let mut mul = [0u16; 16];
    mul[..8].copy_from_slice(&m8);
    mul[8..].copy_from_slice(&m8);
    let gather: __m256i = Simd::<u8, 32>::from_array(gather).into();
    let mul: __m256i = Simd::<u16, 16>::from_array(mul).into();
    let (chunks, rem) = out.as_chunks_mut::<16>();
    // SAFETY: avx2 compile-time feature; the slack assertion covers every 16-byte load.
    unsafe {
        let mask = _mm256_set1_epi16(((1u16 << K) - 1) as i16);
        let compact = _mm256_setr_epi32(0, 1, 4, 5, 0, 0, 0, 0);
        for (g, chunk) in chunks.iter_mut().enumerate() {
            let p = packed.as_ptr().add(g * 2 * K);
            let lo = _mm_loadu_si128(p as *const __m128i);
            let hi = _mm_loadu_si128(p.add(K) as *const __m128i);
            let v = _mm256_inserti128_si256::<1>(_mm256_castsi128_si256(lo), hi);
            let w = _mm256_shuffle_epi8(v, gather);
            let f = _mm256_and_si256(_mm256_srli_epi16::<8>(_mm256_mullo_epi16(w, mul)), mask);
            let packed8 = _mm256_permutevar8x32_epi32(_mm256_packus_epi16(f, f), compact);
            _mm_storeu_si128(chunk.as_mut_ptr() as *mut __m128i, _mm256_castsi256_si128(packed8));
        }
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 2 * K..], rem);
    }
}

/// AVX-512BW, 32 values per step: four 16-byte loads into one zmm, in-lane `vpshufb`,
/// `vpmullw`, `vpsrlw`, `vpand`, narrow with `vpmovwb`.
#[cfg(target_feature = "avx512bw")]
pub fn unpack_avx512<const K: usize>(packed: &[u8], out: &mut [u8]) {
    use core::arch::x86_64::*;
    check::<K>(packed, out);
    let g16 = lane_gather::<K>();
    let m8 = lane_muls::<K>();
    let mut gather = [0u8; 64];
    let mut mul = [0u16; 32];
    for l in 0..4 {
        gather[16 * l..16 * l + 16].copy_from_slice(&g16);
        mul[8 * l..8 * l + 8].copy_from_slice(&m8);
    }
    let gather: __m512i = Simd::<u8, 64>::from_array(gather).into();
    let mul: __m512i = Simd::<u16, 32>::from_array(mul).into();
    let (chunks, rem) = out.as_chunks_mut::<32>();
    // SAFETY: avx512bw compile-time feature; the slack assertion covers every 16-byte load.
    unsafe {
        let mask = _mm512_set1_epi16(((1u16 << K) - 1) as i16);
        for (g, chunk) in chunks.iter_mut().enumerate() {
            let p = packed.as_ptr().add(g * 4 * K);
            let l0 = _mm_loadu_si128(p as *const __m128i);
            let l1 = _mm_loadu_si128(p.add(K) as *const __m128i);
            let l2 = _mm_loadu_si128(p.add(2 * K) as *const __m128i);
            let l3 = _mm_loadu_si128(p.add(3 * K) as *const __m128i);
            let v = _mm512_castsi128_si512(l0);
            let v = _mm512_inserti32x4::<1>(v, l1);
            let v = _mm512_inserti32x4::<2>(v, l2);
            let v = _mm512_inserti32x4::<3>(v, l3);
            let w = _mm512_shuffle_epi8(v, gather);
            let f = _mm512_and_si512(_mm512_srli_epi16::<8>(_mm512_mullo_epi16(w, mul)), mask);
            _mm256_storeu_si256(chunk.as_mut_ptr() as *mut __m256i, _mm512_cvtepi16_epi8(f));
        }
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 4 * K..], rem);
    }
}

/// AVX-512 VBMI, 64 values per step: `vpermb` gathers each 8-value group (K bytes) into a
/// qword lane, `vpmultishiftqb` pulls the 8 fields to byte boundaries, `vpand` masks. This is
/// the instruction pair designed for exactly this job.
#[cfg(target_feature = "avx512vbmi")]
pub fn unpack_vbmi<const K: usize>(packed: &[u8], out: &mut [u8]) {
    use core::arch::x86_64::*;
    check::<K>(packed, out);
    let gather: __m512i = Simd::<u8, 64>::from_array(core::array::from_fn(|i| ((i / 8) * K + i % 8) as u8)).into();
    let ctrl: __m512i = Simd::<u8, 64>::from_array(core::array::from_fn(|i| ((i % 8) * K) as u8)).into();
    let (chunks, rem) = out.as_chunks_mut::<64>();
    // SAFETY: avx512vbmi compile-time feature; the slack assertion covers every 64-byte load.
    unsafe {
        let mask = _mm512_set1_epi8(((1u16 << K) - 1) as i8);
        for (g, chunk) in chunks.iter_mut().enumerate() {
            let v = _mm512_loadu_si512(packed.as_ptr().add(g * 8 * K) as *const __m512i);
            let lanes = _mm512_permutexvar_epi8(gather, v);
            let fields = _mm512_and_si512(_mm512_multishift_epi64_epi8(ctrl, lanes), mask);
            _mm512_storeu_si512(chunk.as_mut_ptr() as *mut __m512i, fields);
        }
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 8 * K..], rem);
    }
}

/// NEON, 16 values per step: `tbl` gathers the two bytes of each field into u16 lanes
/// (8 per 16-byte load), `ushl` by a negative per-lane amount shifts right, `and`, `xtn` narrows.
#[cfg(target_arch = "aarch64")]
pub fn unpack_neon<const K: usize>(packed: &[u8], out: &mut [u8]) {
    use core::arch::aarch64::*;
    check::<K>(packed, out);
    let (chunks, rem) = out.as_chunks_mut::<16>();
    // SAFETY: NEON is baseline; the slack assertion covers every 16-byte load.
    unsafe {
        let idx = vld1q_u8(lane_gather::<K>().as_ptr());
        let mut sh = [0i16; 8];
        for t in 0..8 {
            sh[t] = -(((t * K) % 8) as i16);
        }
        let sh = vld1q_s16(sh.as_ptr());
        let mask = vdupq_n_u16((1u16 << K) - 1);
        for (g, chunk) in chunks.iter_mut().enumerate() {
            let p = packed.as_ptr().add(g * 2 * K);
            let a = vreinterpretq_u16_u8(vqtbl1q_u8(vld1q_u8(p), idx));
            let b = vreinterpretq_u16_u8(vqtbl1q_u8(vld1q_u8(p.add(K)), idx));
            let fa = vandq_u16(vshlq_u16(a, sh), mask);
            let fb = vandq_u16(vshlq_u16(b, sh), mask);
            vst1q_u8(chunk.as_mut_ptr(), vcombine_u8(vmovn_u16(fa), vmovn_u16(fb)));
        }
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * 2 * K..], rem);
    }
}

/// SVE2 BitPerm `bdep`: the PDEP form, 8 values per instruction (plus the moves).
#[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
pub fn unpack_sve2<const K: usize>(packed: &[u8], out: &mut [u8]) {
    check::<K>(packed, out);
    let (chunks, rem) = out.as_chunks_mut::<8>();
    for (g, chunk) in chunks.iter_mut().enumerate() {
        let w = u64::from_le_bytes(packed[g * K..g * K + 8].try_into().unwrap());
        *chunk = crate::expand::pdep_sve2(w, byte_mask::<K>()).to_le_bytes();
    }
    if !rem.is_empty() {
        let g = chunks.len();
        unpack_scalar::<K>(&packed[g * K..], rem);
    }
}

// Non-generic K = 3 instantiations so the asm can be dumped by name.
pub fn unpack3_scalar(packed: &[u8], out: &mut [u8]) {
    unpack_scalar::<3>(packed, out)
}
pub fn unpack3_portable_mul(packed: &[u8], out: &mut [u8]) {
    unpack_portable_mul::<3>(packed, out)
}
pub fn unpack3_portable_shift(packed: &[u8], out: &mut [u8]) {
    unpack_portable_shift::<3>(packed, out)
}
#[cfg(target_feature = "bmi2")]
pub fn unpack3_pdep(packed: &[u8], out: &mut [u8]) {
    unpack_pdep::<3>(packed, out)
}
#[cfg(target_feature = "avx2")]
pub fn unpack3_avx2(packed: &[u8], out: &mut [u8]) {
    unpack_avx2::<3>(packed, out)
}
#[cfg(target_feature = "avx512bw")]
pub fn unpack3_avx512(packed: &[u8], out: &mut [u8]) {
    unpack_avx512::<3>(packed, out)
}
#[cfg(target_feature = "avx512vbmi")]
pub fn unpack3_vbmi(packed: &[u8], out: &mut [u8]) {
    unpack_vbmi::<3>(packed, out)
}
#[cfg(target_arch = "aarch64")]
pub fn unpack3_neon(packed: &[u8], out: &mut [u8]) {
    unpack_neon::<3>(packed, out)
}
#[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
pub fn unpack3_sve2(packed: &[u8], out: &mut [u8]) {
    unpack_sve2::<3>(packed, out)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::util::Rng;

    fn reference<const K: usize>(packed: &[u8], n: usize) -> Vec<u8> {
        (0..n)
            .map(|j| {
                let mut v = 0u8;
                for b in 0..K {
                    let bit = j * K + b;
                    v |= ((packed[bit / 8] >> (bit % 8)) & 1) << b;
                }
                v
            })
            .collect()
    }

    fn check_all<const K: usize>() {
        let mut rng = Rng::new(61 + K as u64);
        let fns: Vec<(&str, fn(&[u8], &mut [u8]))> = vec![
            ("scalar", unpack_scalar::<K>),
            ("portable_mul", unpack_portable_mul::<K>),
            ("portable_shift", unpack_portable_shift::<K>),
            #[cfg(target_feature = "bmi2")]
            ("pdep", unpack_pdep::<K>),
            #[cfg(target_feature = "avx2")]
            ("avx2", unpack_avx2::<K>),
            #[cfg(target_feature = "avx512bw")]
            ("avx512", unpack_avx512::<K>),
            #[cfg(target_feature = "avx512vbmi")]
            ("vbmi", unpack_vbmi::<K>),
            #[cfg(target_arch = "aarch64")]
            ("neon", unpack_neon::<K>),
            #[cfg(all(target_arch = "aarch64", target_feature = "sve2-bitperm"))]
            ("sve2", unpack_sve2::<K>),
        ];
        for &n in &[0usize, 1, 7, 8, 15, 16, 17, 31, 32, 33, 100, 1000] {
            let packed = rng.bytes((n * K).div_ceil(8) + 64, 8).iter().map(|b| b ^ 0x5a).collect::<Vec<u8>>();
            let expect = reference::<K>(&packed, n);
            for (name, f) in &fns {
                let mut got = vec![0xffu8; n];
                f(&packed, &mut got);
                assert_eq!(expect, got, "K={K} n={n} variant={name}");
            }
        }
    }

    #[test]
    fn k1() {
        check_all::<1>();
    }
    #[test]
    fn k2() {
        check_all::<2>();
    }
    #[test]
    fn k3() {
        check_all::<3>();
    }
    #[test]
    fn k4() {
        check_all::<4>();
    }
    #[test]
    fn k5() {
        check_all::<5>();
    }
    #[test]
    fn k6() {
        check_all::<6>();
    }
    #[test]
    fn k7() {
        check_all::<7>();
    }
}
