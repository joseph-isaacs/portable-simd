
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
