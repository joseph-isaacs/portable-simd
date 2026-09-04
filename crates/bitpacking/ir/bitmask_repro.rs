//! Minimal reproducers for the mask <-> bitmask lowerings, compile with
//!   rustc +nightly --edition 2024 --crate-type lib -O --emit=llvm-ir --target aarch64-unknown-linux-gnu ir/bitmask_repro.rs
//! and feed the .ll to `llc -O2 -mtriple=aarch64` (or `-mtriple=x86_64 -mattr=+avx2`).
#![feature(portable_simd)]
use core::simd::{Mask, Select, Simd, cmp::SimdPartialEq};

/// `to_bitmask`: icmp + bitcast <64 x i1> to i64
#[unsafe(no_mangle)]
pub fn bytes_to_bits(v: Simd<u8, 64>) -> u64 {
    v.simd_ne(Simd::splat(0)).to_bitmask()
}

/// `from_bitmask`: trunc/bitcast i64 to <64 x i1> + select
#[unsafe(no_mangle)]
pub fn bits_to_bytes(w: u64) -> Simd<u8, 64> {
    Mask::<i8, 64>::from_bitmask(w).select(Simd::splat(1), Simd::splat(0))
}

/// 16-lane versions (the size LLVM's special cases target)
#[unsafe(no_mangle)]
pub fn bytes_to_bits16(v: Simd<u8, 16>) -> u64 {
    v.simd_ne(Simd::splat(0)).to_bitmask()
}
#[unsafe(no_mangle)]
pub fn bits_to_bytes16(w: u64) -> Simd<u8, 16> {
    Mask::<i8, 16>::from_bitmask(w).select(Simd::splat(1), Simd::splat(0))
}
