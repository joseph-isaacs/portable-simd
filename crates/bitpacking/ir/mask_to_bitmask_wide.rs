//! Same cases as mask_to_bitmask_wide.ll, from Rust:
//!   rustc +nightly --edition 2024 --crate-type lib -O --emit=asm --target aarch64-unknown-linux-gnu mask_to_bitmask_wide.rs
#![feature(portable_simd)]
use core::simd::{Simd, cmp::SimdPartialEq};
#[unsafe(no_mangle)] pub fn m8_i64(v: Simd<u64, 8>) -> u64 { v.simd_ne(Simd::splat(0)).to_bitmask() }
#[unsafe(no_mangle)] pub fn m8_i32(v: Simd<u32, 8>) -> u64 { v.simd_ne(Simd::splat(0)).to_bitmask() }
#[unsafe(no_mangle)] pub fn m16_i32(v: Simd<u32, 16>) -> u64 { v.simd_ne(Simd::splat(0)).to_bitmask() }
#[unsafe(no_mangle)] pub fn m16_i16(v: Simd<u16, 16>) -> u64 { v.simd_ne(Simd::splat(0)).to_bitmask() }
#[unsafe(no_mangle)] pub fn m32_i16(v: Simd<u16, 32>) -> u64 { v.simd_ne(Simd::splat(0)).to_bitmask() }
