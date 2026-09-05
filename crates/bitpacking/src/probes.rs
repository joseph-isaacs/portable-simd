//! Small entry points to inspect codegen of `Mask` helpers on other targets
//! (`cargo rustc --lib --target aarch64-unknown-linux-gnu -- --emit=llvm-ir`).
use core_simd::simd::{Mask, Simd};
use core_simd::simd::prelude::*;

pub fn first_set64(v: &[u8; 64]) -> Option<usize> {
    Simd::<u8, 64>::from_array(*v).simd_ne(Simd::splat(0)).first_set()
}
pub fn first_set16(v: &[u8; 16]) -> Option<usize> {
    Simd::<u8, 16>::from_array(*v).simd_ne(Simd::splat(0)).first_set()
}
pub fn last_set64(v: &[u8; 64]) -> Option<usize> {
    Simd::<u8, 64>::from_array(*v).simd_ne(Simd::splat(0)).last_set()
}
pub fn any64(v: &[u8; 64]) -> bool {
    Mask::<i8, 64>::from(Simd::<u8, 64>::from_array(*v).simd_ne(Simd::splat(0))).any()
}
