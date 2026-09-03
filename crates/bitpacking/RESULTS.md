# Results

Machine: Intel Xeon (Cascade-Lake-class, 2.8 GHz, 4 vCPU VM) with AVX2, BMI1/2, POPCNT,
AVX-512 F/BW/VL/DQ/VNNI. **No** AVX-512 VBMI2 (`vpcompressb`) and **no** VPOPCNTDQ.
Toolchain: `nightly-2026-04-28`, `core_simd` from this tree, criterion 0.5, `-C codegen-units=1`.

Two builds: `v3` = `-C target-cpu=x86-64-v3` (AVX2 + BMI2), `native` = `-C target-cpu=native`
(adds AVX-512). Intrinsic variants exist only where their feature is enabled at compile time.
Inputs are L1-resident (8–64 KiB) so the numbers measure compute, not bandwidth; the `rank/65536`
rows are 512 KiB (L2). Times are criterion medians; see `results/bench-*.txt` for the full output.

Benchmarks: `byte_to_bit` packs 16 KiB of bytes; `rank` counts 3/4 of a bitmap; `select64` is
4096 random in-word queries; `select` finds the bit at 3/4 of a 50%-dense 8 KiB bitmap;
`filter` compresses 4096 words (32 KiB values + 32 KiB mask) at three mask densities.

## Numbers

### byte_to_bit

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| scalar | 4.85 µs | 3.1493 GiB/s | 4.00 µs | 3.8101 GiB/s |
| swar | 1.32 µs | 11.550 GiB/s | 1.25 µs | 12.166 GiB/s |
| portable_u8x64 | 252.1 ns | 60.532 GiB/s | 134.6 ns | 113.36 GiB/s |
| portable_u8x32 | 254.3 ns | 59.998 GiB/s | 135.3 ns | 112.81 GiB/s |
| avx2 | 248.1 ns | 61.499 GiB/s | 135.3 ns | 112.81 GiB/s |
| avx512 | – | – | 132.8 ns | 114.92 GiB/s |

### rank

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| scalar/1024 | 211.4 ns | 27.066 GiB/s | 197.6 ns | 28.957 GiB/s |
| portable_u64x8/1024 | 197.5 ns | 28.977 GiB/s | 145.3 ns | 39.388 GiB/s |
| portable_u8x64/1024 | 179.0 ns | 31.969 GiB/s | 141.2 ns | 40.526 GiB/s |
| avx2/1024 | 185.5 ns | 30.841 GiB/s | 175.8 ns | 32.539 GiB/s |
| scalar/65536 | 13.39 µs | 27.345 GiB/s | 13.87 µs | 26.413 GiB/s |
| portable_u64x8/65536 | 13.10 µs | 27.956 GiB/s | 10.16 µs | 36.057 GiB/s |
| portable_u8x64/65536 | 12.34 µs | 29.671 GiB/s | 9.80 µs | 37.371 GiB/s |
| avx2/65536 | 11.79 µs | 31.067 GiB/s | 13.24 µs | 27.664 GiB/s |
| avx512/1024 | – | – | 132.3 ns | 43.235 GiB/s |
| avx512/65536 | – | – | 9.42 µs | 38.891 GiB/s |

### select64

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| naive | 60.54 µs | 67.657 Melem/s | 56.23 µs | 72.848 Melem/s |
| broadword | 14.29 µs | 286.73 Melem/s | 12.42 µs | 329.77 Melem/s |
| portable_u8x8 | 21.09 µs | 194.24 Melem/s | 18.91 µs | 216.55 Melem/s |
| pdep | 2.90 µs | 1.4108 Gelem/s | 2.57 µs | 1.5922 Gelem/s |

### select

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| scalar_scan+naive | 1.02 µs | 5.5940 GiB/s | 1.00 µs | 5.7187 GiB/s |
| scalar_scan+broadword | 1.02 µs | 5.6104 GiB/s | 952.0 ns | 6.0107 GiB/s |
| portable_scan+portable | 321.0 ns | 17.828 GiB/s | 238.1 ns | 24.029 GiB/s |
| scalar_scan+pdep | 1.03 µs | 5.5682 GiB/s | 958.4 ns | 5.9706 GiB/s |
| scalar_scan8+pdep | 338.5 ns | 16.906 GiB/s | 314.3 ns | 18.206 GiB/s |
| portable_scan+pdep | 285.5 ns | 20.041 GiB/s | 231.3 ns | 24.739 GiB/s |

### filter

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| naive/mask1/8 | 66.10 µs | 945.53 MiB/s | 71.40 µs | 875.36 MiB/s |
| scalar_hd/mask1/8 | 106.84 µs | 584.99 MiB/s | 106.60 µs | 586.31 MiB/s |
| portable_u64x4/mask1/8 | 34.45 µs | 1.7716 GiB/s | 32.56 µs | 1.8746 GiB/s |
| portable_u64x8/mask1/8 | 34.39 µs | 1.7748 GiB/s | 27.74 µs | 2.2002 GiB/s |
| portable_u64x8_branchless/mask1/8 | 34.85 µs | 1.7514 GiB/s | 28.52 µs | 2.1397 GiB/s |
| bmi2_pext/mask1/8 | 10.62 µs | 5.7442 GiB/s | 9.06 µs | 6.7331 GiB/s |
| bmi2_pext_branchless/mask1/8 | 9.52 µs | 6.4117 GiB/s | 9.94 µs | 6.1432 GiB/s |
| naive/mask4/8 | 143.97 µs | 434.11 MiB/s | 143.77 µs | 434.72 MiB/s |
| scalar_hd/mask4/8 | 107.74 µs | 580.13 MiB/s | 106.48 µs | 586.95 MiB/s |
| portable_u64x4/mask4/8 | 35.49 µs | 1.7196 GiB/s | 32.80 µs | 1.8610 GiB/s |
| portable_u64x8/mask4/8 | 34.25 µs | 1.7822 GiB/s | 28.23 µs | 2.1620 GiB/s |
| portable_u64x8_branchless/mask4/8 | 35.06 µs | 1.7407 GiB/s | 29.27 µs | 2.0852 GiB/s |
| bmi2_pext/mask4/8 | 10.85 µs | 5.6252 GiB/s | 9.32 µs | 6.5487 GiB/s |
| bmi2_pext_branchless/mask4/8 | 9.64 µs | 6.3295 GiB/s | 9.94 µs | 6.1382 GiB/s |
| naive/mask7/8 | 202.43 µs | 308.75 MiB/s | 216.98 µs | 288.04 MiB/s |
| scalar_hd/mask7/8 | 108.16 µs | 577.84 MiB/s | 106.70 µs | 585.77 MiB/s |
| portable_u64x4/mask7/8 | 35.20 µs | 1.7342 GiB/s | 33.59 µs | 1.8171 GiB/s |
| portable_u64x8/mask7/8 | 35.66 µs | 1.7115 GiB/s | 29.19 µs | 2.0907 GiB/s |
| portable_u64x8_branchless/mask7/8 | 34.85 µs | 1.7513 GiB/s | 28.35 µs | 2.1532 GiB/s |
| bmi2_pext/mask7/8 | 13.01 µs | 4.6910 GiB/s | 10.46 µs | 5.8323 GiB/s |
| bmi2_pext_branchless/mask7/8 | 9.56 µs | 6.3841 GiB/s | 9.66 µs | 6.3162 GiB/s |

## What the asm shows (`asm/{v3,native}/*.s`)

### byte → bit

* `bytes_to_bits_portable` (`u8x64.simd_ne(0).to_bitmask()`) compiles to *exactly* the
  intrinsic loop: `vpcmpeqb` + `vpmovmskb` + `shl/or/not` per 32 bytes on v3, and
  `vmovdqu64` + `vptestmb` + `kmovq [mem], k` per 64 bytes on native. The 32-lane and
  64-lane portable versions produce the same code on v3 (the 64-lane vector is split
  for free).
* The scalar loop *is* auto-vectorised, but badly: 4 bytes at a time through
  `vpmovzxbq` + variable `vpsllvq` + `vpor`, then a horizontal or. Hence 3 GiB/s vs
  60+ GiB/s.
* SWAR (`x * 0x0002040810204081 >> 56`) is 4x faster than the naive loop but still 5x
  slower than a single vector compare.

### rank / popcount

* No `vpopcntdq` on this CPU, so everything is the nibble-LUT (`vpand`, `vpsrlw`,
  `vpshufb` x2, `vpaddb`) + `vpsadbw` scheme.
* `rank_scalar`'s `count_ones` loop is auto-vectorised by LLVM into that same LUT
  scheme (4 accumulators, `vpsadbw` per vector). On v3 it therefore ties
  `portable_u64x8`. On native it stays on **ymm** (LLVM's default
  `prefer-vector-width=256` for the auto-vectoriser) while `Simd<u64, 8>` is an explicit
  **zmm**, which is why the portable version pulls ahead there.
* `Simd<u64, 8>::count_ones()` lowers to LUT + `vpsadbw` **every iteration**.
  `Simd<u8, 64>::count_ones()` lowers to just the LUT, and accumulating bytes for 31
  iterations before one `vpsadbw` (`popcount_portable_u8`) reproduces the Muła AVX2
  popcount by hand; its inner loop is instruction-for-instruction the same as the
  intrinsic `popcount_avx2` / `popcount_avx512`, and the numbers match within noise.

### select (n-th set bit)

* In-word `select64`:
  * `pdep` + `tzcnt` is 4 instructions and ~6x faster than anything else.
  * Vigna's broadword select is ~30 scalar ops incl. two `imul` and a `popcnt`.
  * The portable `u8x8` version lowers reasonably (LUT popcount on xmm, three
    `vpsllq`+`vpaddb` prefix steps, `vpminub`+`vpcmpeqb`+`vpmovmskb`+`popcnt` to find the
    byte) but the dynamic lane index `prefix[byte]` goes through a stack spill
    (`vmovq [rsp]`, `movzx [rsp+rax]`), and there is no cheap 8-lane u8 vector on x86
    so it runs in xmm with extra moves. It ends up ~40% slower than broadword.
  * Masking the table index with `& 7` removed a `panic_bounds_check` from both the
    broadword and portable variants at no cost.
* Word scan: the simple per-word `popcnt; sub; jb` loop is frontend/branch bound at
  ~3.5 cycles per word, so the in-word choice is invisible in the whole-bitmap numbers.
  Summing 8 `popcnt`s before testing (`scan_scalar8`) or using `u64x8::count_ones` +
  `reduce_sum` (`scan_portable`) is 3–4x faster; the two are close to each other.

### filter (bit compress)

* `pext` is one 3-cycle-latency, 1/cycle instruction per word; the portable
  Hacker's-Delight compress is ~100 vector ops per 8 words (6 rounds × [6 shift/xor
  parallel-suffix + and/xor/shift/or moves]). On native LLVM folds many of the
  xor/and/or triples into `vpternlogq`, which is where the AVX-512 gain in
  `portable_u64x8` comes from.
* `pext` itself is invisible in the numbers: the per-word cost (~6.5 cycles at
  2.8 GHz) is the bit writer, ~25 instructions of `u128` shift/or/`cmov` bookkeeping
  per word. The branchless writer (unconditional store, `shr 6` for "did we fill a
  word", `cmov`s) only buys 10–25% and only when the flush pattern is irregular
  (mask 7/8), so the loop is frontend-bound, not mispredict-bound. The next step
  would be to cut bookkeeping per word, e.g. by pairing words into a 128-bit chunk
  before appending.
* Nothing better is available without AVX-512 VBMI2 (`vpcompressb`); with only
  AVX-512F `vpcompressd` would need 16 dword lanes per 16 bits, which is not
  competitive with one `pext` per 64 bits.

## Summary

| op | portable SIMD vs best intrinsic | note |
|---|---|---|
| byte → bit | identical code, identical speed | `to_bitmask()` is the intrinsic |
| rank / popcount | matches the intrinsic LUT popcount when written with `u8x64::count_ones` | `u64x8::count_ones` pays a `vpsadbw` per iteration; scalar auto-vectorises but only to ymm on AVX-512 |
| select, word scan | portable `u64x8` scan ≈ unrolled scalar popcnt scan, both 3–4x the naive loop | |
| select, in-word | portable `u8x8` is 1.4x slower than broadword and 7x slower than `pdep` | no portable equivalent of PDEP; dynamic lane index spills |
| filter | portable HD compress is 3–3.5x slower than `pext` (2.2 vs 6.4 GiB/s) | `pext` variant is limited by the bit writer, not by `pext` |
