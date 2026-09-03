# bitpacking

Four bit-packing primitives, each written three ways so the codegen and speed of
`std::simd` (the in-tree `core_simd` crate) can be compared against plain scalar code
and against the best hand-picked x86 intrinsics:

| op | what | scalar | portable SIMD | intrinsics |
|---|---|---|---|---|
| `byte_to_bit` | `&[u8]` (0 / non-0) → bitmap `&[u64]` | shift/or loop, SWAR multiply-gather | `u8x64.simd_ne(0).to_bitmask()` | `vpcmpeqb`+`vpmovmskb` (AVX2), `vptestmb` (AVX-512BW) |
| `rank` | popcount of bits `[0, i)` | `count_ones` loop | `u64x8::count_ones`, `u8x64::count_ones` + deferred widening | nibble-LUT `vpshufb`+`vpsadbw` (AVX2 / AVX-512BW) |
| `select` | position of the n-th set bit | popcount scan + naive / Vigna broadword in-word | `u64x8` scan + `u8x8` prefix-sum in-word | popcount scan + `pdep`/`tzcnt` |
| `filter` | bits of `values` where `mask` is set, packed | Hacker's Delight compress per word | HD compress on `u64x8` / `u64x4` lanes | `pext` per word |

All bitmaps are little-endian `&[u64]` (bit `i` is `words[i/64] >> (i%64) & 1`).
`filter` returns the number of output bits and needs `values.len()` words of output capacity.

The intrinsic variants are gated on compile-time `target_feature`s, so build with
`-C target-cpu=...`; running from this directory picks up the repo's pinned nightly.

```sh
cargo test --release                                   # RUSTFLAGS="-C target-cpu=native" to include AVX-512 variants
./run_bench.sh                                          # criterion, once for x86-64-v3 and once for native → results/
./dump_asm.sh                                           # cargo-show-asm for every variant → asm/{v3,native}/*.s
./summarize.py                                          # results/*.txt → markdown table
```

`RESULTS.md` holds the numbers and asm observations from the machine this was developed on.
