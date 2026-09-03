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
| scalar | 4.18 µs | 3.6514 GiB/s | 3.76 µs | 4.0571 GiB/s |
| swar | 1.10 µs | 13.909 GiB/s | 952.5 ns | 16.020 GiB/s |
| portable_u8x64 | 219.9 ns | 69.375 GiB/s | 139.4 ns | 109.42 GiB/s |
| portable_u8x32 | 221.5 ns | 68.882 GiB/s | 143.5 ns | 106.31 GiB/s |
| avx2 | 222.8 ns | 68.495 GiB/s | 139.2 ns | 109.60 GiB/s |
| avx512 | – | – | 140.6 ns | 108.52 GiB/s |

### rank

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| scalar/1024 | 187.0 ns | 30.598 GiB/s | 69.3 ns | 82.617 GiB/s |
| portable_u64x8/1024 | 186.5 ns | 30.675 GiB/s | 52.3 ns | 109.38 GiB/s |
| portable_u8x64/1024 | 164.3 ns | 34.822 GiB/s | 59.2 ns | 96.680 GiB/s |
| avx2/1024 | 163.8 ns | 34.926 GiB/s | 165.0 ns | 34.686 GiB/s |
| scalar/65536 | 12.12 µs | 30.206 GiB/s | 6.93 µs | 52.846 GiB/s |
| portable_u64x8/65536 | 12.02 µs | 30.480 GiB/s | 5.81 µs | 63.081 GiB/s |
| portable_u8x64/65536 | 10.60 µs | 34.546 GiB/s | 5.88 µs | 62.241 GiB/s |
| avx2/65536 | 10.80 µs | 33.900 GiB/s | 10.60 µs | 34.534 GiB/s |
| avx512/1024 | – | – | 132.6 ns | 43.144 GiB/s |
| avx512/65536 | – | – | 8.35 µs | 43.864 GiB/s |

### select64

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| naive | 29.78 µs | 137.56 Melem/s | 28.12 µs | 145.65 Melem/s |
| broadword | 12.39 µs | 330.66 Melem/s | 13.97 µs | 293.09 Melem/s |
| portable_u8x8 | 15.19 µs | 269.66 Melem/s | 12.03 µs | 340.45 Melem/s |
| pdep | 2.93 µs | 1.3987 Gelem/s | 2.94 µs | 1.3934 Gelem/s |

### select

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| scalar_scan+naive | 382.4 ns | 14.964 GiB/s | 350.9 ns | 16.308 GiB/s |
| scalar_scan+broadword | 386.5 ns | 14.806 GiB/s | 350.3 ns | 16.333 GiB/s |
| portable_scan+portable | 245.6 ns | 23.297 GiB/s | 143.2 ns | 39.971 GiB/s |
| scalar_scan+pdep | 575.7 ns | 9.9386 GiB/s | 354.1 ns | 16.159 GiB/s |
| scalar_scan8+pdep | 277.5 ns | 20.621 GiB/s | 277.4 ns | 20.626 GiB/s |
| portable_scan+pdep | 238.6 ns | 23.986 GiB/s | 139.3 ns | 41.083 GiB/s |

### filter

| variant | v3 (AVX2+BMI2) time | v3 thrpt | native (AVX-512) time | native thrpt |
|---|---|---|---|---|
| naive/mask1/8 | 70.76 µs | 883.23 MiB/s | 58.16 µs | 1.0495 GiB/s |
| scalar_hd/mask1/8 | 90.39 µs | 691.46 MiB/s | 90.28 µs | 692.30 MiB/s |
| scalar_byte_lut/mask1/8 | 101.19 µs | 617.62 MiB/s | 97.35 µs | 642.02 MiB/s |
| scalar_byte_lut_branchless/mask1/8 | 31.34 µs | 1.9476 GiB/s | 32.30 µs | 1.8898 GiB/s |
| vortex_lut/mask1/8 | 104.66 µs | 597.20 MiB/s | 99.14 µs | 630.45 MiB/s |
| vortex_lut_branchless/mask1/8 | 40.59 µs | 1.5037 GiB/s | 37.30 µs | 1.6363 GiB/s |
| portable_u64x4/mask1/8 | 31.93 µs | 1.9113 GiB/s | 28.97 µs | 2.1069 GiB/s |
| portable_u64x8/mask1/8 | 31.06 µs | 1.9653 GiB/s | 20.47 µs | 2.9820 GiB/s |
| portable_u64x8_branchless/mask1/8 | 32.24 µs | 1.8933 GiB/s | 21.67 µs | 2.8161 GiB/s |
| bmi2_pext/mask1/8 | 6.09 µs | 10.028 GiB/s | 5.94 µs | 10.271 GiB/s |
| bmi2_pext_branchless/mask1/8 | 7.68 µs | 7.9524 GiB/s | 7.80 µs | 7.8297 GiB/s |
| vortex_pext/mask1/8 | 7.83 µs | 7.7986 GiB/s | 7.22 µs | 8.4523 GiB/s |
| naive/mask4/8 | 160.02 µs | 390.58 MiB/s | 159.95 µs | 390.76 MiB/s |
| scalar_hd/mask4/8 | 90.66 µs | 689.36 MiB/s | 89.94 µs | 694.94 MiB/s |
| scalar_byte_lut/mask4/8 | 44.11 µs | 1.3837 GiB/s | 43.12 µs | 1.4154 GiB/s |
| scalar_byte_lut_branchless/mask4/8 | 34.00 µs | 1.7954 GiB/s | 36.51 µs | 1.6720 GiB/s |
| vortex_lut/mask4/8 | 45.23 µs | 1.3495 GiB/s | 44.51 µs | 1.3712 GiB/s |
| vortex_lut_branchless/mask4/8 | 40.38 µs | 1.5116 GiB/s | 36.25 µs | 1.6838 GiB/s |
| portable_u64x4/mask4/8 | 31.15 µs | 1.9594 GiB/s | 29.27 µs | 2.0850 GiB/s |
| portable_u64x8/mask4/8 | 31.25 µs | 1.9533 GiB/s | 20.58 µs | 2.9659 GiB/s |
| portable_u64x8_branchless/mask4/8 | 31.61 µs | 1.9306 GiB/s | 21.72 µs | 2.8096 GiB/s |
| bmi2_pext/mask4/8 | 6.49 µs | 9.4023 GiB/s | 6.01 µs | 10.158 GiB/s |
| bmi2_pext_branchless/mask4/8 | 7.63 µs | 8.0008 GiB/s | 7.97 µs | 7.6629 GiB/s |
| vortex_pext/mask4/8 | 7.43 µs | 8.2171 GiB/s | 7.27 µs | 8.3929 GiB/s |
| naive/mask7/8 | 244.45 µs | 255.67 MiB/s | 247.92 µs | 252.10 MiB/s |
| scalar_hd/mask7/8 | 90.79 µs | 688.41 MiB/s | 91.46 µs | 683.37 MiB/s |
| scalar_byte_lut/mask7/8 | 46.82 µs | 1.3037 GiB/s | 45.07 µs | 1.3541 GiB/s |
| scalar_byte_lut_branchless/mask7/8 | 33.51 µs | 1.8215 GiB/s | 37.81 µs | 1.6141 GiB/s |
| vortex_lut/mask7/8 | 46.89 µs | 1.3018 GiB/s | 46.62 µs | 1.3091 GiB/s |
| vortex_lut_branchless/mask7/8 | 39.27 µs | 1.5544 GiB/s | 39.01 µs | 1.5645 GiB/s |
| portable_u64x4/mask7/8 | 31.42 µs | 1.9424 GiB/s | 29.70 µs | 2.0550 GiB/s |
| portable_u64x8/mask7/8 | 31.13 µs | 1.9608 GiB/s | 21.09 µs | 2.8938 GiB/s |
| portable_u64x8_branchless/mask7/8 | 31.43 µs | 1.9417 GiB/s | 21.87 µs | 2.7908 GiB/s |
| bmi2_pext/mask7/8 | 7.26 µs | 8.4078 GiB/s | 6.95 µs | 8.7801 GiB/s |
| bmi2_pext_branchless/mask7/8 | 7.56 µs | 8.0783 GiB/s | 8.06 µs | 7.5768 GiB/s |
| vortex_pext/mask7/8 | 7.59 µs | 8.0378 GiB/s | 7.56 µs | 8.0689 GiB/s |
| naive/runs64 | 153.25 µs | 407.84 MiB/s | 142.12 µs | 439.78 MiB/s |
| scalar_hd/runs64 | 91.60 µs | 682.32 MiB/s | 90.40 µs | 691.38 MiB/s |
| scalar_byte_lut/runs64 | 31.37 µs | 1.9458 GiB/s | 30.19 µs | 2.0215 GiB/s |
| scalar_byte_lut_branchless/runs64 | 33.14 µs | 1.8417 GiB/s | 35.68 µs | 1.7105 GiB/s |
| vortex_lut/runs64 | 38.82 µs | 1.5723 GiB/s | 23.91 µs | 2.5525 GiB/s |
| vortex_lut_branchless/runs64 | 25.38 µs | 2.4047 GiB/s | 23.05 µs | 2.6483 GiB/s |
| portable_u64x4/runs64 | 31.31 µs | 1.9494 GiB/s | 29.25 µs | 2.0864 GiB/s |
| portable_u64x8/runs64 | 31.35 µs | 1.9467 GiB/s | 20.86 µs | 2.9264 GiB/s |
| portable_u64x8_branchless/runs64 | 31.29 µs | 1.9508 GiB/s | 21.62 µs | 2.8228 GiB/s |
| bmi2_pext/runs64 | 6.44 µs | 9.4819 GiB/s | 6.14 µs | 9.9380 GiB/s |
| bmi2_pext_branchless/runs64 | 7.52 µs | 8.1171 GiB/s | 7.99 µs | 7.6412 GiB/s |
| vortex_pext/runs64 | 6.91 µs | 8.8266 GiB/s | 7.21 µs | 8.4693 GiB/s |


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


## Comparison with vortex's bit filter

`vortex-data/vortex` (`vortex-array/src/arrays/bool/compute/filter.rs`, commit 265b705) filters a
`BitBuffer` by a mask with the same structure as `filter_bmi2` here: one PEXT per word into a
`u128` accumulator that is flushed every 64 bits. On top of that it has

* all-ones mask words copied without PEXT and all-zero words skipped (`vortex_*` variants here),
* output through a raw pointer sized from `true_count` (no per-word bounds check),
* runtime BMI2 dispatch, with a 64 KiB byte-LUT software PEXT as the fallback (`*_byte_lut` here),
* a separate sparse path below 5% density that walks set indices / slices (not ported: it is a
  different algorithm, not a bit-packing kernel).

Variants ported into this crate: `vortex_pext` (their loop + hardware PEXT), `vortex_lut` (their
loop + their LUT PEXT), `scalar_byte_lut` (their LUT PEXT with the plain writer here), and the
`*_branchless` LUT versions described below. The `runs64` mask (alternating runs, mean length 64)
mirrors their `make_correlated_runs` benchmark input and is where the word fast paths apply.

What the numbers say (within-run ratios; absolute times on this VM drift ~25% between runs):

* **Hardware PEXT loop**: `vortex_pext` and `bmi2_pext` are the same loop and within noise of
  each other (6–8 µs per 4096 words). The all-ones/all-zero fast paths cost ~10–20% on uniform
  masks (two extra compare-and-branch per word) and only break even on `runs64`; the per-word
  cost is the accumulator bookkeeping, not `pext`.
* **Software PEXT fallback**: vortex's byte-LUT is 2x faster than the Hacker's Delight compress
  at 50% density (44 vs 91 µs) but *slower* than it at 1/8 density (101 vs 90 µs): the
  `mask_byte != 0` branch mispredicts (a mask byte is non-zero with p = 1-(7/8)^8 = 66%).
  Dropping the branch (`scalar_byte_lut_branchless`; row 0 of the table is all zeros, and the
  offset advances by `popcount(0) = 0`, so the test is redundant) makes it density-insensitive:
  31–34 µs at every density, 3x faster at 1/8 and 25% faster at 4/8 and 7/8 than vortex's
  version, and equal to the portable `u64x8` Hacker's Delight compress on AVX2 (which stays
  1.5x ahead on AVX-512 thanks to `vpternlogq` and 512-bit lanes).
* **vortex's loop + branchless LUT** (`vortex_lut_branchless`) is the best non-BMI2 kernel on
  the run-structured mask (25 vs 33 µs) because whole words skip the LUT entirely, but it is
  ~20% slower than the plain writer on uniform masks. Which to prefer depends on the mask
  statistics vortex sees in practice; for a `Mask` that already knows its density or run
  structure, choosing per-buffer is cheap.
* Suggested change for vortex: remove the `if m != 0` guard in `pext_byte_lut` (strictly
  better on every input measured), and consider the SIMD Hacker's Delight compress as the
  fallback on AVX-512 machines without BMI2 (rare in practice, so low priority).


## Summary

| op | portable SIMD vs best intrinsic | note |
|---|---|---|
| byte → bit | identical code, identical speed | `to_bitmask()` is the intrinsic |
| rank / popcount | matches the intrinsic LUT popcount when written with `u8x64::count_ones` | `u64x8::count_ones` pays a `vpsadbw` per iteration; scalar auto-vectorises but only to ymm on AVX-512 |
| select, word scan | portable `u64x8` scan ≈ unrolled scalar popcnt scan, both 3–4x the naive loop | |
| select, in-word | portable `u8x8` is 1.4x slower than broadword and 7x slower than `pdep` | no portable equivalent of PDEP; dynamic lane index spills |
| filter | portable HD compress is 3–5x slower than `pext` | `pext` variant is limited by the bit writer, not by `pext`; branchless byte-LUT ties portable SIMD on AVX2 |
