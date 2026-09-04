#!/usr/bin/env bash
# Runs the criterion benchmarks under several feature sets and stores the raw output.
#   v3      = x86-64, -C target-cpu=x86-64-v3  (AVX2, BMI1/2, POPCNT; no AVX-512)
#   native  = x86-64, -C target-cpu=native     (dev box: Ice-Lake-class AVX-512 incl. VBMI/VBMI2/VPOPCNTDQ)
#   a64     = aarch64-unknown-linux-gnu, baseline NEON, run under qemu-user (see .cargo/config.toml)
#   a64sve2 = aarch64 + SVE2 BitPerm (bext/bdep), run under qemu-user -cpu max
# qemu numbers measure the emulator (TCG), not hardware: use them for coarse ratios only.
# Usage: ./run_bench.sh [cfg...] [-- criterion args]
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p results
cfgs=()
while [ $# -gt 0 ] && [ "$1" != "--" ]; do cfgs+=("$1"); shift; done
[ $# -gt 0 ] && shift
[ ${#cfgs[@]} -eq 0 ] && cfgs=(v3 native a64 a64sve2)
for cfg in "${cfgs[@]}"; do
  case $cfg in
    v3)      flags="-C target-cpu=x86-64-v3"; target=() ;;
    native)  flags="-C target-cpu=native"; target=() ;;
    a64)     flags=""; target=(--target aarch64-unknown-linux-gnu) ;;
    a64sve2) flags="-C target-feature=+sve2,+sve2-bitperm"; target=(--target aarch64-unknown-linux-gnu) ;;
    *) echo "unknown cfg $cfg"; exit 1 ;;
  esac
  echo "=== $cfg ($flags ${target[*]:-})"
  RUSTFLAGS="$flags" CARGO_TARGET_DIR="target/$cfg" \
    cargo bench --bench bitpacking "${target[@]}" -- --noplot --warm-up-time 1 --measurement-time 2 "$@" \
    2>&1 | tee "results/bench-$cfg.txt"
done
