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
//! * [`expand`]: the inverse of `filter` (bit expand / PDEP over a whole bitmap).
//! * [`rank_index`]: exclusive prefix popcount per word (the index that makes rank O(1)).
//! * [`indices`]: positions of all set bits (per word, and streaming over a bitmap).
//! * [`bit_to_byte`]: bitmap -> one 0/1 byte per bit (inverse of `byte_to_bit`).
//! * [`unpack`]: k-bit fields (k = 1..7) from an LSB-first bit stream into bytes.
//!
//! All bitmaps are little-endian `&[u64]`: bit `i` lives in `words[i / 64] >> (i % 64) & 1`.
#![feature(portable_simd)]

pub mod bit_to_byte;
pub mod byte_to_bit;
pub mod expand;
pub mod filter;
pub mod indices;
pub mod rank;
pub mod rank_index;
pub mod select;
pub mod unpack;
pub mod util;
