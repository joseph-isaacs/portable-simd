//! Bit-packing primitives implemented three ways each:
//!
//! * `*_scalar`   – plain integer code (baseline; LLVM may still auto-vectorise it),
//! * `*_portable` – `std::simd` (here the in-tree `core_simd` crate) only,
//! * `*_avx2` / `*_avx512` / `*_bmi2` – hand-picked x86 intrinsics, the "best we can do".
//!
//! Operations:
//!
//! * [`byte_to_bit`]: pack a byte-per-element boolean array into a bitmap.
//! * [`rank`]: `rank(i)` = number of set bits in `[0, i)`.
//! * [`select`]: position of the n-th set bit (0-based).
//! * [`filter`]: keep the bits of one bitmap where a second, equally long bitmap is set,
//!   packed densely (a.k.a. bit compress / PEXT over a whole bitmap).
//!
//! All bitmaps are little-endian `&[u64]`: bit `i` lives in `words[i / 64] >> (i % 64) & 1`.
#![feature(portable_simd)]

pub mod byte_to_bit;
pub mod filter;
pub mod rank;
pub mod select;
pub mod util;
