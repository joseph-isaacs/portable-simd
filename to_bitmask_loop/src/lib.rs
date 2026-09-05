//! `Mask::<i8, 64>::to_bitmask()` in a tight loop: 64 bytes in, one u64 out, per iteration.
//! This is the byte->bit kernel; on AArch64 the portable version currently lowers each 16-lane
//! quarter separately (`addp v,v,v` x3 per quarter, then `umov`/`bfi`/`orr` or four `str h`).
#![feature(portable_simd)]
use core::simd::{Simd, cmp::SimdPartialEq};

/// Portable: bit i of out[j] = bytes[64*j + i] != 0.
#[inline(never)]
pub fn to_bitmask_loop(bytes: &[u8], out: &mut [u64]) {
    let (chunks, _) = bytes.as_chunks::<64>();
    for (c, o) in chunks.iter().zip(out.iter_mut()) {
        *o = Simd::<u8, 64>::from_array(*c).simd_ne(Simd::splat(0)).to_bitmask();
    }
}

/// Same loop, 32 lanes at a time (two `to_bitmask` per word).
#[inline(never)]
pub fn to_bitmask32_loop(bytes: &[u8], out: &mut [u64]) {
    let (chunks, _) = bytes.as_chunks::<64>();
    for (c, o) in chunks.iter().zip(out.iter_mut()) {
        let (h, _) = c.as_chunks::<32>();
        let lo = Simd::<u8, 32>::from_array(h[0]).simd_ne(Simd::splat(0)).to_bitmask();
        let hi = Simd::<u8, 32>::from_array(h[1]).simd_ne(Simd::splat(0)).to_bitmask();
        *o = lo | (hi << 32);
    }
}

/// NEON reference: what the portable loop should become (cmtst, and, addp tree, one store).
#[cfg(target_arch = "aarch64")]
#[inline(never)]
pub fn neon_loop(bytes: &[u8], out: &mut [u64]) {
    use core::arch::aarch64::*;
    let (chunks, _) = bytes.as_chunks::<64>();
    // SAFETY: NEON is baseline on aarch64; every chunk is 64 bytes.
    unsafe {
        let weights = vreinterpretq_u8_u64(vdupq_n_u64(0x8040_2010_0804_0201));
        for (c, o) in chunks.iter().zip(out.iter_mut()) {
            let p = c.as_ptr();
            let nz = |q: *const u8| {
                let v = vld1q_u8(q);
                vandq_u8(vtstq_u8(v, v), weights)
            };
            let ab = vpaddq_u8(nz(p), nz(p.add(16)));
            let cd = vpaddq_u8(nz(p.add(32)), nz(p.add(48)));
            let abcd = vpaddq_u8(ab, cd);
            let r = vpaddq_u8(abcd, abcd);
            *o = vgetq_lane_u64::<0>(vreinterpretq_u64_u8(r));
        }
    }
}

/// Scalar reference for checking.
pub fn scalar_loop(bytes: &[u8], out: &mut [u64]) {
    for (c, o) in bytes.chunks_exact(64).zip(out.iter_mut()) {
        *o = c.iter().enumerate().fold(0u64, |w, (i, &b)| w | (((b != 0) as u64) << i));
    }
}
