# to_bitmask in a tight loop (AArch64 repro)

`Mask::<i8, 64>::to_bitmask()` per 64-byte chunk, i.e. the byte->bit kernel.

```sh
# run (natively on an aarch64 box; under qemu only the assert is meaningful)
cargo +nightly run --release
# asm of the loop
cargo +nightly asm --lib --release --target aarch64-unknown-linux-gnu to_bitmask_loop::to_bitmask_loop
# IR for llc
rustc +nightly --edition 2024 --crate-type lib -O --emit=llvm-ir --target aarch64-unknown-linux-gnu -o ir/lib.ll src/lib.rs
llc -O2 -mtriple=aarch64-unknown-linux-gnu ir/lib.ll -o -
```

`ir/` holds the IR and the asm from `rustc 1.100.0-nightly` (LLVM 23.1.1) and from an `llc` built from
llvm/llvm-project main (2026-09-05, after #203420). The loop body today is `cmeq` x4, `bic` x4,
`addp v,v,v` x12, four `str h`; `neon_loop` shows the target: `cmtst`/`and` x4, `addp` x4, one `str`.
