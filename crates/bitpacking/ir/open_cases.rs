//! The three mask->bitmask shapes still open on AArch64 after llvm/llvm-project#203420.
//!   rustc +nightly --edition 2024 --crate-type lib -O --emit=asm,llvm-ir --target aarch64-unknown-linux-gnu open_cases.rs
#![feature(portable_simd)]
use core::simd::{Simd, cmp::SimdPartialEq};

/// 1. 64 byte lanes -> u64 bitmask (byte->bit, the hot path of every bitpacking kernel).
#[unsafe(no_mangle)]
pub fn to_bitmask64(v: Simd<u8, 64>) -> u64 {
    v.simd_ne(Simd::splat(0)).to_bitmask()
}

/// 1b. 32 byte lanes -> u32 bitmask.
#[unsafe(no_mangle)]
pub fn to_bitmask32(v: Simd<u8, 32>) -> u64 {
    v.simd_ne(Simd::splat(0)).to_bitmask()
}

/// 2. Index of the first set lane in a 64-lane mask (`Mask::first_set`, used by find-first-match).
#[unsafe(no_mangle)]
pub fn first_set64(v: Simd<u8, 64>) -> Option<usize> {
    v.simd_ne(Simd::splat(0)).first_set()
}

/// 3. Mask stored straight to memory (the loop body of `bytes_to_bits_portable`).
///    From Rust this is case 1 + a store; a literal `store <64 x i1>` (LLVM repro `store64`)
///    only arises from other frontends or LLVM's own truncating-store combine.
#[unsafe(no_mangle)]
pub fn to_bitmask64_store(v: Simd<u8, 64>, out: &mut u64) {
    *out = v.simd_ne(Simd::splat(0)).to_bitmask();
}
