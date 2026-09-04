#!/usr/bin/env bash
# Runs the criterion benchmarks under two feature sets and stores the raw output.
#   v3     = -C target-cpu=x86-64-v3  (AVX2, BMI1/2, POPCNT, LZCNT; no AVX-512)
#   native = -C target-cpu=native     (on the dev box: + AVX-512 F/BW/VL/DQ/VBMI/VBMI2/BITALG/VPOPCNTDQ/GFNI)
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p results
for cfg in v3 native; do
  case $cfg in
    v3) cpu=x86-64-v3 ;;
    native) cpu=native ;;
  esac
  echo "=== $cfg (target-cpu=$cpu)"
  RUSTFLAGS="-C target-cpu=$cpu" CARGO_TARGET_DIR="target/$cfg" \
    cargo bench --bench bitpacking -- --noplot --warm-up-time 1 --measurement-time 2 "$@" \
    2>&1 | tee "results/bench-$cfg.txt"
done
