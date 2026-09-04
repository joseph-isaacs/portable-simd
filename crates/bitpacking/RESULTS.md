# Results

Machine: Intel Xeon VM, 4 vCPU. The first runs were on a Cascade-Lake-class host (2.8 GHz,
AVX-512 F/BW/VL/DQ/VNNI, no VBMI/VPOPCNTDQ); the VM was migrated mid-way to an Ice-Lake-class host
(2.1 GHz model string, AVX-512 + VBMI, VBMI2, BITALG, VPOPCNTDQ, GFNI). **Every number below is
from one final run on the Ice-Lake host.**
Toolchain: `nightly-2026-04-28`, `core_simd` from this tree, criterion 0.5, `-C codegen-units=1`.

Four builds: `v3` = `-C target-cpu=x86-64-v3` (AVX2 + BMI2), `native` = `-C target-cpu=native`
(adds AVX-512 incl. VBMI/VBMI2/VPOPCNTDQ), `a64` = `aarch64-unknown-linux-gnu` baseline NEON and
`a64sve2` = `+sve2,+sve2-bitperm`, the latter two cross-compiled and run under `qemu-aarch64 -cpu max`
(user-mode emulation: correctness and asm are real, timings are of the emulator, see the aarch64
section). The aarch64 runs cover the representative parameters only. Intrinsic variants exist only where their feature is
enabled at compile time. Inputs are L1-resident (8–64 KiB) so the numbers measure compute, not
bandwidth; the `/65536` rows are 512 KiB (L2). Times are criterion medians; absolute times on this
VM drift between runs, so compare within a run. See `results/bench-*.txt` for the full output.

Benchmarks: `byte_to_bit` packs 16 KiB of bytes; `rank` counts 3/4 of a bitmap; `select64` is 4096
random in-word queries; `select` finds the bit at 3/4 of a 50%-dense 8 KiB bitmap; `filter` /
`expand` compress / expand 4096 words at three mask densities (+ a run-structured mask for filter);
`rank_index` builds the per-word prefix table; `select_all64` is 4096 random words; `bitmap_to_indices`
lists set bits of an 8 KiB bitmap; `bit_to_byte` expands 256 words; `unpack` decodes 16384 k-bit values.

## Three tiers: auto-vectorised scalar → portable SIMD → intrinsics

Best variant of each tier per kernel and build (representative parameters: 8 KiB bitmaps, mask
4/8, k = 3). "auto→portable" is how much portable SIMD gains over the best scalar code (LLVM may
auto-vectorise it); "portable→intr" is how much is still left on the table for hand-written
intrinsics. A hole in portable SIMD is a row where the second ratio is well above 1, or where the
first is at or below 1.

| kernel | build | auto-vec (best) | portable (best) | intrinsics (best) | auto→portable | portable→intr |
|---|---|---|---|---|---|---|
| byte→bit | v3 | swar 1000ns | portable_u8x32 205ns | avx2 201ns | 4.9x | 1.0x |
| byte→bit | native | swar 846ns | portable_u8x32 126ns | avx2 130ns | 6.7x | 1.0x |
| rank/popcount | v3 | scalar 165ns | portable_u8x64 142ns | avx2 144ns | 1.2x | 1.0x |
| rank/popcount | native | scalar 65ns | portable_u64x8 56ns | avx512_vpopcnt 55ns | 1.2x | 1.0x |
| select64 in-word | v3 | broadword 10.7µs | portable_u8x8 13.2µs | pdep 2.5µs | 0.8x | 5.4x |
| select64 in-word | native | broadword 12.2µs | portable_u8x8 10.5µs | pdep 2.6µs | 1.2x | 4.1x |
| select whole | v3 | scalar_scan+naive 318ns | portable_scan+portable 212ns | portable_scan+pdep 210ns | 1.5x | 1.0x |
| select whole | native | scalar_scan+naive 293ns | portable_scan+portable 140ns | portable_scan+pdep 135ns | 2.1x | 1.0x |
| filter (PEXT) | v3 | scalar_byte_lut_branchless 26.8µs | portable_u64x4 27.6µs | bmi2_pext 6.5µs | 1.0x | 4.2x |
| filter (PEXT) | native | vortex_lut_branchless 27.2µs | portable_u64x8 18.0µs | bmi2_pext_branchless 6.4µs | 1.5x | 2.8x |
| expand (PDEP) | v3 | scalar_hd 81.9µs | portable_u64x8 28.7µs | bmi2_pdep 8.4µs | 2.9x | 3.4x |
| expand (PDEP) | native | scalar_hd 78.0µs | portable_u64x8 16.6µs | bmi2_pdep 8.1µs | 4.7x | 2.1x |
| rank index | v3 | scalar 323ns | portable_u64x8 465ns | avx2 464ns | 0.7x | 1.0x |
| rank index | native | scalar 322ns | portable_u64x8 268ns | avx512 268ns | 1.2x | 1.0x |
| select_all64 | v3 | scalar_tzcnt 65.6µs | portable_lut 15.8µs | avx2_lut 16.5µs | 4.2x | 1.0x |
| select_all64 | native | scalar_tzcnt 58.1µs | portable_lut 17.3µs | vbmi2_compressb 12.8µs | 3.4x | 1.4x |
| bitmap→indices | v3 | scalar_tzcnt 10.2µs | portable_lut 7.4µs | avx2_lut 7.9µs | 1.4x | 0.9x |
| bitmap→indices | native | scalar_tzcnt 10.6µs | portable_lut 5.6µs | vbmi2_compressb 3.4µs | 1.9x | 1.7x |
| bit→byte | v3 | swar 640ns | portable_select 286ns | avx2 291ns | 2.2x | 1.0x |
| bit→byte | native | swar 463ns | portable_select 100ns | avx512 95ns | 4.6x | 1.1x |
| unpack k=3 | v3 | scalar 3.5µs | portable_mul 791ns | pdep 698ns | 4.4x | 1.1x |
| unpack k=3 | native | scalar 2.6µs | portable_mul 666ns | vbmi_multishift 201ns | 4.0x | 3.3x |


### aarch64: static comparison (instructions per unit of work, `a64` build)

qemu timings cannot rank these (see below), so this table counts instructions in the hot loop as
read from `asm/a64/*.s`. Same three tiers as the x86 table.

| kernel | unit | auto-vec / scalar | portable SIMD | NEON intrinsics | verdict |
|---|---|---|---|---|---|
| byte → bit | 64 B | SWAR ~12 scalar ops / 8 B (~100) | 4 x (`cmeq`,`bic`,`ext`,`zip1`,`addv h`,`str h`) + 2 `ldp` = 26 | 4 x (`ld`,`cmtst`,`and`) + 3 `addp` + `str` = 16 | portable 1.6x more instrs and 4 horizontal `addv` |
| bit → byte | 64 B | SWAR ~45 | **~150** (`ubfx` + `mov v.b[i]` per bit) | 28 (8 `dup`, 4 `and`/`cmeq`/`bic`, 2 `stp`) | **scalarised `from_bitmask`**: 5x NEON, 3x worse than SWAR |
| popcount | 16 B | `fmov`,`cnt`,`addv`,`fmov` x2 = 8 | `cnt`,`uaddlp`,`uaddlp`,`uadalp` = 4 | `cnt`,`uadalp` = 2 | portable re-widens every vector |
| rank index | 8 words | 8 x (`fmov`,`cnt`,`addv`,`fmov`,`add`,`str`) ≈ 48 | 4 x (`cnt` + 3 `uaddlp`) + ~20 `ext`/`zip1`/`add`/`sub` + stores ≈ 50 | (not written) | parity; the 8-lane scan is 4 two-lane vectors |
| select64 in-word | 1 query | broadword ~30 scalar | `cnt`, 3 x (`shl`,`add`), `cmhs`, `addv`, stack round trip ≈ 20 | the same instructions | tie; both pay `addv` + spill; scalar broadword is competitive |
| filter / expand | 1 word | HD compress ~90 scalar | 2-lane HD: ~½ the ops per word, 4 vectors for `u64x8` | none (no NEON PEXT); `bext` on SVE2 only | 128-bit lanes give ≤2x; the hole is the missing instruction |
| unpack k=3 | 16 values | 9 per 8 values (`lsr`,`and`,`strb`) | `ldr q`, 2 `tbl`, 2 `ushl`, `uzp1`, `and`, `str` = 8 | identical | **parity**: static `Swizzle` = `tbl`, lane shift = `ushl` |
| set-bit indices | 1 byte | `rbit`,`clz`,`str`,`bic` per set bit | `ubfx`, `ldr d`, 2 `ushll`, `add`, 2 `str q`, `cnt` = 8 | same idiom | parity; no lane compress on NEON either |

## Numbers

x86 columns are hardware; `a64`/`a64sve2` columns are **qemu user-mode emulation** and only
show that the code runs (a `tbl`, `addv` or SVE `bext` costs a helper call each, so vector code is
penalised ~5–300x relative to scalar and SVE2 rows are meaningless as timings).

### byte_to_bit

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar | 3.69 µs | 3.30 µs | 72.01 µs | 119.57 µs |
| swar | 1000.0 ns | 845.6 ns | 2.37 µs | 8.44 µs |
| portable_u8x64 | 205.6 ns | 130.4 ns | 8.01 µs | 7.80 µs |
| portable_u8x32 | 204.8 ns | 126.4 ns | 7.33 µs | 7.67 µs |
| avx2 | 200.9 ns | 130.2 ns | – | – |
| avx512 | – | 133.6 ns | – | – |
| neon | – | – | 14.17 µs | 13.68 µs |

### rank

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar/1024 | 165.0 ns | 65.0 ns | 4.30 µs | 1.60 µs |
| portable_u64x8/1024 | 162.6 ns | 56.0 ns | 4.21 µs | 3.55 µs |
| portable_u8x64/1024 | 141.8 ns | 64.5 ns | 2.33 µs | 2.57 µs |
| avx2/1024 | 144.3 ns | 145.1 ns | – | – |
| scalar/65536 | 10.51 µs | 5.77 µs | – | – |
| portable_u64x8/65536 | 10.66 µs | 4.70 µs | – | – |
| portable_u8x64/65536 | 10.15 µs | 5.65 µs | – | – |
| avx2/65536 | 10.11 µs | 9.88 µs | – | – |
| avx512_lut/1024 | – | 127.8 ns | – | – |
| avx512_vpopcnt/1024 | – | 54.9 ns | – | – |
| avx512_lut/65536 | – | 8.47 µs | – | – |
| avx512_vpopcnt/65536 | – | 5.24 µs | – | – |
| neon/1024 | – | – | 4.93 µs | 4.47 µs |

### select64

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| naive | 22.48 µs | 22.38 µs | 157.67 µs | 157.08 µs |
| broadword | 10.65 µs | 12.24 µs | 43.15 µs | 216.44 µs |
| portable_u8x8 | 13.18 µs | 10.52 µs | 347.23 µs | 441.32 µs |
| pdep | 2.46 µs | 2.57 µs | – | – |
| neon | – | – | 152.16 µs | 153.90 µs |
| sve2_bdep | – | – | – | 2119.60 µs |

### select

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar_scan+naive | 318.1 ns | 293.3 ns | 12.48 µs | 13.47 µs |
| scalar_scan+broadword | 341.4 ns | 299.5 ns | 4.16 µs | 13.85 µs |
| portable_scan+portable | 212.5 ns | 139.6 ns | 4.99 µs | 5.17 µs |
| scalar_scan+pdep | 343.3 ns | 305.3 ns | – | – |
| scalar_scan8+pdep | 255.0 ns | 244.9 ns | – | – |
| portable_scan+pdep | 209.9 ns | 135.2 ns | – | – |
| scalar_scan8+broadword | – | – | 3.88 µs | 11.13 µs |
| portable_scan+neon | – | – | 5.08 µs | 3.59 µs |
| portable_scan+sve2 | – | – | – | 4.56 µs |

### filter

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| naive/mask1/8 | 56.90 µs | 47.63 µs | – | – |
| scalar_hd/mask1/8 | 79.88 µs | 78.22 µs | – | – |
| scalar_byte_lut/mask1/8 | 82.25 µs | 86.58 µs | – | – |
| scalar_byte_lut_branchless/mask1/8 | 26.16 µs | 25.60 µs | – | – |
| vortex_lut/mask1/8 | 79.00 µs | 82.10 µs | – | – |
| vortex_lut_branchless/mask1/8 | 28.55 µs | 26.89 µs | – | – |
| portable_u64x4/mask1/8 | 26.51 µs | 24.72 µs | – | – |
| portable_u64x8/mask1/8 | 26.80 µs | 18.41 µs | – | – |
| portable_u64x8_branchless/mask1/8 | 27.25 µs | 18.64 µs | – | – |
| bmi2_pext/mask1/8 | 5.29 µs | 5.23 µs | – | – |
| bmi2_pext_branchless/mask1/8 | 6.79 µs | 6.61 µs | – | – |
| vortex_pext/mask1/8 | 6.93 µs | 7.05 µs | – | – |
| naive/mask4/8 | 137.09 µs | 146.11 µs | 377.88 µs | 413.31 µs |
| scalar_hd/mask4/8 | 76.45 µs | 79.17 µs | 136.70 µs | 148.89 µs |
| scalar_byte_lut/mask4/8 | 32.72 µs | 35.44 µs | 260.79 µs | 1067.40 µs |
| scalar_byte_lut_branchless/mask4/8 | 26.79 µs | 27.21 µs | 180.66 µs | 1017.00 µs |
| vortex_lut/mask4/8 | 36.68 µs | 37.73 µs | 260.55 µs | 1174.70 µs |
| vortex_lut_branchless/mask4/8 | 30.52 µs | 27.20 µs | 183.30 µs | 1093.70 µs |
| portable_u64x4/mask4/8 | 27.63 µs | 24.82 µs | 122.06 µs | 715.18 µs |
| portable_u64x8/mask4/8 | 27.71 µs | 17.98 µs | 137.67 µs | 570.96 µs |
| portable_u64x8_branchless/mask4/8 | 27.71 µs | 18.75 µs | 146.12 µs | 635.28 µs |
| bmi2_pext/mask4/8 | 6.54 µs | 6.72 µs | – | – |
| bmi2_pext_branchless/mask4/8 | 6.86 µs | 6.40 µs | – | – |
| vortex_pext/mask4/8 | 7.34 µs | 7.10 µs | – | – |
| naive/mask7/8 | 213.90 µs | 217.76 µs | – | – |
| scalar_hd/mask7/8 | 78.33 µs | 70.97 µs | – | – |
| scalar_byte_lut/mask7/8 | 39.27 µs | 36.81 µs | – | – |
| scalar_byte_lut_branchless/mask7/8 | 25.70 µs | 27.11 µs | – | – |
| vortex_lut/mask7/8 | 43.33 µs | 38.58 µs | – | – |
| vortex_lut_branchless/mask7/8 | 30.73 µs | 26.82 µs | – | – |
| portable_u64x4/mask7/8 | 28.15 µs | 24.75 µs | – | – |
| portable_u64x8/mask7/8 | 26.98 µs | 18.05 µs | – | – |
| portable_u64x8_branchless/mask7/8 | 25.96 µs | 18.22 µs | – | – |
| bmi2_pext/mask7/8 | 5.87 µs | 5.84 µs | – | – |
| bmi2_pext_branchless/mask7/8 | 6.98 µs | 6.52 µs | – | – |
| vortex_pext/mask7/8 | 6.54 µs | 6.79 µs | – | – |
| naive/runs64 | 129.69 µs | 134.31 µs | – | – |
| scalar_hd/runs64 | 72.52 µs | 78.78 µs | – | – |
| scalar_byte_lut/runs64 | 26.66 µs | 30.16 µs | – | – |
| scalar_byte_lut_branchless/runs64 | 25.64 µs | 26.44 µs | – | – |
| vortex_lut/runs64 | 20.03 µs | 20.19 µs | – | – |
| vortex_lut_branchless/runs64 | 18.69 µs | 18.03 µs | – | – |
| portable_u64x4/runs64 | 27.64 µs | 25.67 µs | – | – |
| portable_u64x8/runs64 | 27.34 µs | 18.45 µs | – | – |
| portable_u64x8_branchless/runs64 | 27.75 µs | 17.67 µs | – | – |
| bmi2_pext/runs64 | 5.51 µs | 5.32 µs | – | – |
| bmi2_pext_branchless/runs64 | 6.74 µs | 6.77 µs | – | – |
| vortex_pext/runs64 | 6.05 µs | 5.88 µs | – | – |
| vbmi2_compressb/mask1/8 | – | 8.91 µs | – | – |
| vbmi2_compressb/mask4/8 | – | 9.36 µs | – | – |
| vbmi2_compressb/mask7/8 | – | 9.27 µs | – | – |
| vbmi2_compressb/runs64 | – | 9.41 µs | – | – |
| sve2_bext/mask4/8 | – | – | – | 1957.30 µs |

### rank_index

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar/1024 | 322.9 ns | 322.2 ns | 6.88 µs | 14.35 µs |
| portable_u64x8/1024 | 464.6 ns | 268.3 ns | 7.03 µs | 4.95 µs |
| avx2/1024 | 463.5 ns | 462.1 ns | – | – |
| scalar/65536 | 28.06 µs | 22.76 µs | – | – |
| portable_u64x8/65536 | 29.00 µs | 18.68 µs | – | – |
| avx2/65536 | 31.00 µs | 29.25 µs | – | – |
| avx512/1024 | – | 268.5 ns | – | – |
| avx512/65536 | – | 18.14 µs | – | – |

### select_all64

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar_tzcnt | 65.60 µs | 58.13 µs | – | – |
| portable_lut | 15.78 µs | 17.28 µs | – | – |
| avx2_lut | 16.49 µs | 17.13 µs | – | – |
| avx512_compress | – | 15.32 µs | – | – |
| vbmi2_compressb | – | 12.79 µs | – | – |

### bitmap_to_indices

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar_tzcnt/mask1/8 | 3.73 µs | 4.39 µs | – | – |
| portable_lut/mask1/8 | 7.89 µs | 5.57 µs | – | – |
| avx2_lut/mask1/8 | 7.50 µs | 5.60 µs | – | – |
| scalar_tzcnt/mask4/8 | 10.16 µs | 10.56 µs | 158.91 µs | 149.40 µs |
| portable_lut/mask4/8 | 7.37 µs | 5.59 µs | 116.31 µs | 316.75 µs |
| avx2_lut/mask4/8 | 7.91 µs | 5.53 µs | – | – |
| scalar_tzcnt/mask7/8 | 18.84 µs | 18.11 µs | – | – |
| portable_lut/mask7/8 | 7.22 µs | 5.53 µs | – | – |
| avx2_lut/mask7/8 | 7.60 µs | 5.61 µs | – | – |
| avx512_compress/mask1/8 | – | 5.25 µs | – | – |
| vbmi2_compressb/mask1/8 | – | 3.73 µs | – | – |
| avx512_compress/mask4/8 | – | 5.03 µs | – | – |
| vbmi2_compressb/mask4/8 | – | 3.36 µs | – | – |
| avx512_compress/mask7/8 | – | 5.00 µs | – | – |
| vbmi2_compressb/mask7/8 | – | 7.22 µs | – | – |

### bit_to_byte

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar | 2.03 µs | 1.63 µs | 67.62 µs | 235.92 µs |
| swar | 640.4 ns | 463.0 ns | 6.23 µs | 5.14 µs |
| portable_select | 286.0 ns | 99.9 ns | 10.59 µs | 8.01 µs |
| portable_to_simd | 295.2 ns | 101.4 ns | 8.04 µs | 8.09 µs |
| avx2 | 290.8 ns | 221.8 ns | – | – |
| pdep | 652.9 ns | 616.4 ns | – | – |
| avx512 | – | 94.7 ns | – | – |
| neon | – | – | 4.81 µs | 4.98 µs |

### expand

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| naive/mask1/8 | 46.68 µs | 46.93 µs | – | – |
| scalar_hd/mask1/8 | 75.58 µs | 80.02 µs | – | – |
| portable_u64x8/mask1/8 | 27.06 µs | 15.66 µs | – | – |
| bmi2_pdep/mask1/8 | 7.62 µs | 7.67 µs | – | – |
| naive/mask4/8 | 130.56 µs | 117.87 µs | 378.32 µs | 429.52 µs |
| scalar_hd/mask4/8 | 81.92 µs | 78.01 µs | 120.91 µs | 174.28 µs |
| portable_u64x8/mask4/8 | 28.69 µs | 16.59 µs | 204.48 µs | 483.29 µs |
| bmi2_pdep/mask4/8 | 8.43 µs | 8.08 µs | – | – |
| naive/mask7/8 | 192.27 µs | 186.18 µs | – | – |
| scalar_hd/mask7/8 | 83.21 µs | 81.38 µs | – | – |
| portable_u64x8/mask7/8 | 27.66 µs | 17.18 µs | – | – |
| bmi2_pdep/mask7/8 | 8.93 µs | 8.24 µs | – | – |
| vbmi2_expandb/mask1/8 | – | 10.47 µs | – | – |
| vbmi2_expandb/mask4/8 | – | 10.85 µs | – | – |
| vbmi2_expandb/mask7/8 | – | 10.15 µs | – | – |
| sve2_bdep/mask4/8 | – | – | – | 2520.20 µs |

### unpack

| variant | v3 | native | a64 | a64sve2 |
|---|---|---|---|---|
| scalar/k1 | 3.83 µs | 2.58 µs | – | – |
| portable_mul/k1 | 980.8 ns | 679.0 ns | – | – |
| portable_shift/k1 | 997.1 ns | 676.3 ns | – | – |
| pdep/k1 | 665.8 ns | 623.5 ns | – | – |
| avx2/k1 | 716.6 ns | 695.0 ns | – | – |
| scalar/k3 | 3.51 µs | 2.64 µs | 26.99 µs | 46.48 µs |
| portable_mul/k3 | 790.8 ns | 665.8 ns | 50.77 µs | 167.62 µs |
| portable_shift/k3 | 819.0 ns | 681.6 ns | 42.78 µs | 164.80 µs |
| pdep/k3 | 697.5 ns | 762.6 ns | – | – |
| avx2/k3 | 792.6 ns | 711.0 ns | – | – |
| scalar/k7 | 3.94 µs | 2.54 µs | – | – |
| portable_mul/k7 | 881.8 ns | 733.0 ns | – | – |
| portable_shift/k7 | 867.0 ns | 695.0 ns | – | – |
| pdep/k7 | 673.9 ns | 704.7 ns | – | – |
| avx2/k7 | 738.5 ns | 648.1 ns | – | – |
| avx512/k1 | – | 908.8 ns | – | – |
| vbmi_multishift/k1 | – | 196.5 ns | – | – |
| avx512/k3 | – | 958.9 ns | – | – |
| vbmi_multishift/k3 | – | 200.8 ns | – | – |
| avx512/k7 | – | 895.3 ns | – | – |
| vbmi_multishift/k7 | – | 189.9 ns | – | – |
| neon/k3 | – | – | 49.55 µs | 161.08 µs |
| sve2_bdep/k3 | – | – | – | 678.72 µs |


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

* On v3 (no VPOPCNTDQ) everything is the nibble-LUT (`vpand`, `vpsrlw`, `vpshufb` x2,
  `vpaddb`) + `vpsadbw` scheme. On native `Simd::count_ones` lowers straight to `vpopcntq`,
  which beats the hand-written LUT by 2.3x; the explicit `_mm512_popcnt_epi64` version ties it.
* `rank_scalar`'s `count_ones` loop is auto-vectorised by LLVM into that same LUT
  scheme on v3 (4 accumulators, `vpsadbw` per vector) and into `vpopcntq` on native, so it
  ties `portable_u64x8` on v3 and comes within 10% on native (it stays on **ymm**, LLVM's
  default `prefer-vector-width=256`, while `Simd<u64, 8>` is an explicit **zmm**).
* On v3 `Simd<u64, 8>::count_ones()` lowers to LUT + `vpsadbw` **every iteration**, while
  `Simd<u8, 64>::count_ones()` lowers to just the LUT; accumulating bytes for 31 iterations
  before one `vpsadbw` (`popcount_portable_u8`) reproduces the Muła AVX2 popcount by hand,
  instruction-for-instruction the same as `popcount_avx2`, and the numbers match. On native
  the byte trick is counter-productive (`vpopcntb` is not what LLVM picks; it stays LUT).

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
* The VBMI2 route (`vpmovm2b` + `vpcompressb` + `vpmovb2m`, a 3-instruction PEXT) is
  1.5–1.7x slower than `pext` in the same writer loop: the same bookkeeping bound, plus
  mask-register round trips.



### rank index (exclusive prefix popcount per word)

* Portable `u64x8::count_ones()` + three `shift_elements_right` + add steps lowers to
  `vpopcntq` + three `valignq`/`vpaddq` pairs + `vpmovqd` on native: the same shape as the
  hand-written AVX-512 version (which uses masked `vpermq` for the shifts). On v3 the scan
  becomes `vpermq`/`vpblendd`/`vperm2i128` juggling across the two 128-bit lanes (about 12
  extra shuffles per 8 words), while the AVX2 intrinsic version does it in 4.
* The first version carried the running total through `incl[7]` (a `vextracti32x4` +
  `vpextrq` + scalar add + `vpbroadcastq` per 8 words): that loop-carried chain made even the
  intrinsic versions slower than the scalar `popcnt; add` loop. Keeping the carry as a
  broadcast vector (`carry += simd_swizzle!(incl, [7; 8])`, one `vpermq` + `vpaddq`) is the
  fix, and it is expressible in portable code.
* The scalar loop is a serial `popcnt; add` chain (one word per cycle at best) and does not
  auto-vectorise, because the running sum is a loop-carried dependency.

### set-bit indices (`select_all64` / `bitmap_to_indices`)

* Portable byte-table version: `movzx` + `vpmovzxbd [table]` + `vpaddd` + store + `popcnt`
  per byte — exactly the AVX2 intrinsic sequence. Density-independent (8 stores per word).
* `vpcompressd` (AVX-512F): 4 compress + 4 stores per word; `vpcompressb` (VBMI2): 1
  compress + 4 widen/add/store. Both are also density-independent.
* The `tzcnt`/`blsr` scalar loop is the only density-dependent variant and wins at 1/8.

### bit → byte expand

* Portable `Mask::from_bitmask(w).select(1, 0)` and the `to_simd() & 1` spelling compile to
  the same code: `kmovq` + zero-masked `vmovdqu8` broadcast on native (the AVX-512BW intrinsic
  is one instruction, `vpbroadcastb{k}{z}`, and LLVM emits the equivalent), and
  `vpbroadcastq` + `vpshufb` + `vpand` + `vpcmpeqb` + `vpand` per 32 bytes on v3 (the intrinsic
  uses `vpminub` instead of `vpcmpeqb`+`vpand`, one op fewer).
* `pdep` (8 per word) and SWAR are far behind a vector store per 32/64 bytes.

### bit expand (`expand` = inverse of `filter`, PDEP per word)

* Same story as compress: `pdep` is one instruction, the Hacker's Delight expand is ~110
  lane-local ops per 8 words (with `vpternlogq` folding on native), and both sit behind the
  serial variable-width bit reader.
* `vpexpandb` (VBMI2) gives a 3-instruction PDEP (`vpmovm2b`, `vpexpandb`, `vpmovb2m`) that
  is the only vector-side PDEP; it is measured against `pdep`.

### k-bit unpack (`unpack::<K>`)

* The portable multiply-align (`(w * 2^(8-s)) >> 8`) and the natural per-lane shift
  (`w >> s`) spellings compile to *identical* code: LLVM canonicalises both to
  `vpmulhuw` + `vpblendw` on v3 (no `vpsrlvw` there) and to `vpsrlvw` on native. The static
  `Swizzle` byte gather becomes a `vbroadcasti128` load + one `vpshufb`, and the u16 -> u8
  narrow is `vpackuswb` (v3) or `vpmovwb` (native). ~9 instructions per 16 values, the same as
  the AVX2 intrinsic version.
* `pdep` unpacks 8 values per instruction from a byte-aligned group (8K bits = K bytes).
* `vpermb` + `vpmultishiftqb` (VBMI) does 64 values in 4 instructions; there is no portable
  spelling of either (a 64-lane `swizzle_dyn` does become `vpermb` on native, but nothing
  expresses the multishift).

### Note: the host changed mid-way

The first runs (the original four kernels and the vortex comparison) were on a
Cascade-Lake-class host (2.8 GHz, AVX-512 F/BW/VL/DQ/VNNI only; `Simd::count_ones` lowered to the
`vpshufb` LUT there). The VM was later migrated to an Ice-Lake-class host (2.1 GHz model string,
plus AVX-512 VBMI, VBMI2, BITALG, VPOPCNTDQ, GFNI). All numbers in this file are from one final
run on the Ice-Lake host, so on native `Simd::count_ones` is `vpopcntq`, the LUT popcount is the
slow one, and `vpcompressb`/`vpexpandb`/`vpmultishiftqb` are available and measured.


## aarch64 (NEON / SVE2) under qemu

Cross-compiled with the same nightly (`aarch64-unknown-linux-gnu`, cross gcc as linker) and run
under `qemu-aarch64 -cpu max` (user-mode TCG). Two builds: `a64` = baseline ARMv8 NEON;
`a64sve2` = `+sve2,+sve2-bitperm`, which adds `bext`/`bdep` (SVE2 BitPerm; Neoverse N2/V2 class
hardware) used through inline asm on lane 0 of a Z register, plus SVE `cnt z.d` which LLVM then
picks for `count_ones`.

**qemu timings measure the emulator, not a CPU.** TCG translates each NEON instruction into a
helper call or a host vector op with very uneven costs (a `tbl` or `addv` costs far more than an
`and`), so only coarse ratios (2x and up) mean anything, and the "auto→portable" step is
systematically understated because scalar code emulates cheaply. The asm instruction counts below
are the reliable signal.

Per-loop instruction counts, `a64` build (same source as x86):

| kernel | portable SIMD | NEON intrinsics | notes |
|---|---|---|---|
| byte → bit (`to_bitmask`) | 6 / 16 B: `cmeq`, `bic`, `ext`, `zip1`, **`addv h`**, `str h` | 1.75 / 16 B: `cmtst`, `and`, 3 `addp` per 64 B, one `str` | LLVM's bitmask lowering uses a horizontal `addv` per 16 lanes and four 2-byte stores; the pairwise-add tree is the known idiom |
| bit → byte (`Mask::from_bitmask().select`) | **~150 / 64 B**: `ubfx` per bit + `mov v.b[i]` lane insert | 28 / 64 B: 8 `dup` lane, `and`, `cmeq`, `bic`, 2 `stp` | **scalarised** — the biggest aarch64 hole; x86 gets `kmov`+masked broadcast |
| popcount (`u64x8::count_ones`) | 4 / 16 B: `cnt`, `uaddlp` x2, `uadalp` | 2 / 16 B: `cnt`, `uadalp` into u16, fold rarely | portable widens to u64 every vector; `u8x64` variant does not help (LLVM re-widens) |
| rank index | 8 words: 4x(`cnt`+3 `uaddlp`) + ~20 `ext`/`zip1`/`add`/`sub` | — | the 8-lane scan is 4 two-lane vectors: every `shift_elements_right` becomes `ext` pairs |
| select64 in-word (`u8x8`) | `cnt`, 3x(`shl`+`add`), `cmhs`, `addv b`, stack round-trip for the dynamic lane | same instructions written by hand | tie; both pay the `addv` and the spill |
| filter / expand (Hacker's Delight) | 2-lane vectors: ~110 ops per 8 words become 4x that in `eor`/`shl`/`and`/`orr` (239 `eor`, 124 `shl` in the function) | no NEON PEXT; `bext` on SVE2 only | 128-bit vectors give no lane-count advantage over scalar; the win vs scalar is just ILP |
| unpack k=3 | `ldr q`, 2 `tbl`, 2 `ushl`, `uzp1`, `and`, `str` per 16 values | same | **identical** — the static `Swizzle` gather is `tbl`, the per-lane shift is `ushl` with negative amounts |
| set-bit indices | `ubfx`, `ldr d [LUT]`, `ushll` x2, `add`, `str q` x2, `cnt` per byte | same | tie; no lane compress on NEON either |

`a64sve2`: `bext`/`bdep` work as expected (`fmov d0, x; fmov d1, m; bext z0.d, z0.d, z1.d; fmov x, d0`
— the two moves each way are the price of using a Z register from scalar code; a real SVE2 kernel
would load whole vectors). LLVM also switches `count_ones` to `cnt z.d, p/m` with SVE enabled.

Portable-simd holes specific to aarch64, ranked:

1. `Mask::<i8, 64>::from_bitmask(u64)` scalarises (per-bit extract + lane insert). The fix is a
   NEON-specific lowering (`dup` byte lanes, `cmtst` against bit weights) either in LLVM or in
   `from_bitmask` itself, the way `swizzle_dyn` special-cases NEON.
2. `Mask::<i8, 64>::to_bitmask()` lowers to `addv` + 2-byte stores; the `addp` tree is ~3x fewer
   instructions and avoids the horizontal reduction.
3. `Simd<u64, N>::count_ones()` re-widens to u64 every vector (`uaddlp` x2 + `uadalp`); there
   is no way to say "keep byte counts and fold later" that survives LLVM (it re-widens
   `Simd<u8, 64>::count_ones()` too).
4. Anything that needs cross-lane movement on 8 x u64 (rank index scan, `shift_elements_right`)
   is 4 vectors wide on NEON and turns into `ext`/`zip` chains.
5. As on x86: no PEXT/PDEP-class op. On NEON there is no instruction to lower it to at all; on
   SVE2 `bext`/`bdep` exist but would need an SVE-width vector type to be useful.

The qemu numbers in the table above bear this out only in sign: e.g. NEON `bits_to_bytes` at 4.8 µs
vs portable 8.0 µs, and the SVE2 `bext` rows at ~2 ms are pure helper-call cost.

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

Filter of 4096 words, v3 build (AVX2 + BMI2), this run:

| variant | mask 1/8 | mask 4/8 | mask 7/8 | runs64 |
|---|---|---|---|---|
| scalar Hacker's Delight | 79.9 µs | 76.5 µs | 78.3 µs | 72.5 µs |
| vortex byte-LUT (as is) | 82.2 µs | 32.7 µs | 39.3 µs | 26.7 µs |
| byte-LUT, branch removed | 26.2 µs | 26.8 µs | 25.7 µs | 25.6 µs |
| vortex loop + LUT | 79.0 µs | 36.7 µs | 43.3 µs | 20.0 µs |
| vortex loop + branchless LUT | 28.5 µs | 30.5 µs | 30.7 µs | 18.7 µs |
| portable `u64x8` HD | 26.8 µs | 27.7 µs | 27.0 µs | 27.3 µs |
| `pext`, plain writer | 5.3 µs | 6.5 µs | 5.9 µs | 5.5 µs |
| vortex loop + `pext` | 6.9 µs | 7.3 µs | 6.5 µs | 6.0 µs |

* **Hardware PEXT loop**: `vortex_pext` and `bmi2_pext` are the same loop and within noise of
  each other. The all-ones/all-zero fast paths cost a little on uniform masks (two extra
  compare-and-branch per word) and only pay off on `runs64`; the per-word cost is the
  accumulator bookkeeping, not `pext`.
* **Software PEXT fallback**: vortex's byte-LUT is 2x faster than the Hacker's Delight compress
  at 50% density but no faster than it at 1/8 density: the `mask_byte != 0` branch mispredicts
  (a mask byte is non-zero with p = 1-(7/8)^8 = 66%). Dropping the branch (row 0 of the table
  is all zeros and the offset advances by `popcount(0) = 0`, so the test is redundant) makes it
  density-insensitive, 3–4x faster at 1/8 and ~40% faster at 4/8 and 7/8, and equal to the
  portable `u64x8` Hacker's Delight compress on AVX2 (which is 1.5x ahead on AVX-512 thanks to
  `vpternlogq` and 512-bit lanes).
* **vortex's loop + branchless LUT** is the best non-BMI2 kernel on the run-structured mask
  because whole words skip the LUT entirely, and ~10–15% slower than the plain writer on
  uniform masks.
* Suggested change for vortex: remove the `if m != 0` guard in `pext_byte_lut` (strictly better
  on every input measured).

## Scorecard: best portable-SIMD variant vs best variant of any kind

Representative parameter per group: 8 KiB bitmaps, mask 4/8, k = 3. Ratio = portable ÷ best.

| kernel | best portable v3 | best any v3 | ratio | best portable native | best any native | ratio | what portable-simd lacks |
|---|---|---|---|---|---|---|---|
| byte → bit | portable_u8x32 205 ns | avx2 201 ns | 1.0x | portable_u8x32 126 ns | portable_u8x32 126 ns | 1.0x | none: `to_bitmask()` is the intrinsic |
| rank (popcount) | portable_u8x64 142 ns | portable_u8x64 142 ns | 1.0x | portable_u64x8 56 ns | avx512_vpopcnt 55 ns | 1.0x | v3: byte-lane popcount idiom is user knowledge; no `vpsadbw`-style horizontal byte sum |
| select64 (in-word) | portable_u8x8 13.2 µs | pdep 2.5 µs | 5.4x | portable_u8x8 10.5 µs | pdep 2.6 µs | 4.1x | no PDEP/bit-deposit op; dynamic lane index spills; no lane prefix-sum |
| select (scan + in-word) | portable_scan+pdep 210 ns | portable_scan+pdep 210 ns | 1.0x | portable_scan+pdep 135 ns | portable_scan+pdep 135 ns | 1.0x | as above; the scan half is fully closed |
| filter (bit compress) | portable_u64x4/mask4 27.6 µs | bmi2_pext/mask4 6.5 µs | 4.2x | portable_u64x8/mask4 18.0 µs | bmi2_pext_branchless/mask4 6.4 µs | 2.8x | no PEXT / `Mask::compress`; no lane compress (`vpcompressb`) |
| expand (bit deposit) | portable_u64x8/mask4 28.7 µs | bmi2_pdep/mask4 8.4 µs | 3.4x | portable_u64x8/mask4 16.6 µs | bmi2_pdep/mask4 8.1 µs | 2.1x | no PDEP; no lane expand (`vpexpandb`) |
| rank index (prefix popcount) | portable_u64x8 465 ns | scalar 323 ns | 1.4x | portable_u64x8 268 ns | portable_u64x8 268 ns | 1.0x | v3: cross-lane element shifts cost 3 shuffles each; a `scan`/prefix-sum op would fix it |
| select_all64 (set-bit positions) | portable_lut 15.8 µs | portable_lut 15.8 µs | 1.0x | portable_lut 17.3 µs | vbmi2_compressb 12.8 µs | 1.4x | no lane compress; byte-table version ties AVX2 but not `vpcompressb` |
| bitmap → indices | portable_lut/mask4 7.4 µs | portable_lut/mask4 7.4 µs | 1.0x | portable_lut/mask4 5.6 µs | vbmi2_compressb/mask4 3.4 µs | 1.7x | same; scalar `tzcnt` loop still wins at low density |
| bit → byte expand | portable_select 286 ns | portable_select 286 ns | 1.0x | portable_select 100 ns | avx512 95 ns | 1.1x | none: `Mask::from_bitmask().select()` is the intrinsic |
| k-bit unpack (k=3) | portable_mul 791 ns | pdep 698 ns | 1.1x | portable_mul 666 ns | vbmi_multishift 201 ns | 3.3x | no `vpmultishiftqb` / bit-field extract; `vpermb`-class 64-byte table lookup only via `swizzle_dyn` |

Cross-cutting gaps, in order of how many kernels they cost:

1. **No bit-manipulation tier** (PEXT / PDEP / bit-field extract): filter, expand, in-word
   select, and k-bit unpack are the four losses, all for this reason. A `u64xN::bit_compress(mask)`
   / `bit_expand(mask)` pair would lower to `pext`/`pdep` on x86 (and `vpcompressb`/`vpexpandb`
   or the Hacker's Delight sequence elsewhere).
2. **No lane compress / expand** (`vpcompressb/d/q`, `vpexpandb`): set-bit indices and any
   filter-style kernel.
3. **No prefix-sum / scan** and cheap cross-lane element shifts: rank index on AVX2 pays 3
   shuffles per `shift_elements_right`.
4. **Dynamic lane indexing** (`v[i]` with runtime `i`) goes through the stack.
5. **No multishift / per-byte bit-field gather** (`vpmultishiftqb`): k-bit unpack is 3x off.

Where portable SIMD is already at parity: `to_bitmask`, `from_bitmask().select()`,
`count_ones` (with `vpopcntq` where available), the lane compare + bitmask + popcount idiom,
static `Swizzle` byte gathers (they become `vpshufb`), and LLVM's `vpternlogq` folding.
