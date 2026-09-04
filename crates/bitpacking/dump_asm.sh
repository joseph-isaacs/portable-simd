#!/usr/bin/env bash
# Dumps the release asm of every top-level variant into asm/<cfg>/<function>.s using cargo-show-asm.
# cargo-asm matches names by substring, so ambiguous names are resolved to the exact match's index.
set -euo pipefail
cd "$(dirname "$0")"
FNS=(
  byte_to_bit::bytes_to_bits_scalar byte_to_bit::bytes_to_bits_swar
  byte_to_bit::bytes_to_bits_portable byte_to_bit::bytes_to_bits_portable32
  byte_to_bit::bytes_to_bits_avx2 byte_to_bit::bytes_to_bits_avx512
  rank::rank_scalar rank::popcount_portable rank::popcount_portable_u8 rank::popcount_avx2 rank::popcount_avx512 rank::popcount_vpopcnt
  select::select_naive select::select_broadword select::select_portable select::select_pdep select::select_scan8_pdep select::select_portable_scan_pdep
  rank_index::rank_index_scalar rank_index::rank_index_portable rank_index::rank_index_avx2 rank_index::rank_index_avx512
  indices::bitmap_to_indices_scalar indices::bitmap_to_indices_portable indices::bitmap_to_indices_avx2 indices::bitmap_to_indices_avx512 indices::bitmap_to_indices_vbmi2
  bit_to_byte::bits_to_bytes_scalar bit_to_byte::bits_to_bytes_swar bit_to_byte::bits_to_bytes_portable bit_to_byte::bits_to_bytes_portable_int
  bit_to_byte::bits_to_bytes_avx2 bit_to_byte::bits_to_bytes_avx512 bit_to_byte::bits_to_bytes_pdep
  expand::expand_naive expand::expand_scalar expand::expand_portable expand::expand_bmi2 expand::expand_vbmi2
  unpack::unpack3_scalar unpack::unpack3_portable_mul unpack::unpack3_portable_shift unpack::unpack3_pdep unpack::unpack3_avx2 unpack::unpack3_avx512 unpack::unpack3_vbmi
  filter::filter_naive filter::filter_scalar filter::filter_portable filter::filter_portable_branchless filter::filter_portable4 filter::filter_bmi2 filter::filter_bmi2_branchless filter::filter_byte_lut filter::filter_byte_lut_branchless filter::filter_vortex_lut filter::filter_vortex_lut_branchless filter::filter_vortex_pext filter::filter_vbmi2
)
for cfg in v3 native; do
  case $cfg in
    v3) cpu=x86-64-v3 ;;
    native) cpu=native ;;   # on the dev box: Ice-Lake-class, incl. AVX-512 VBMI/VBMI2/BITALG/VPOPCNTDQ/GFNI
  esac
  mkdir -p "asm/$cfg"
  export RUSTFLAGS="-C target-cpu=$cpu" CARGO_TARGET_DIR="target/$cfg"
  for f in "${FNS[@]}"; do
    out="asm/$cfg/${f//::/__}.s"
    name="bitpacking::$f"
    text=$(cargo asm --lib --release --simplify "$name" 2>&1 || true)
    if grep -q "Can't find any items" <<<"$text"; then
      rm -f "$out"; continue   # variant not compiled for this cfg (e.g. avx512 under v3)
    fi
    if grep -q "Try one of those" <<<"$text"; then
      idx=$(grep -E "^ *[0-9]+ \"$name\" " <<<"$text" | awk '{print $1}')
      text=$(cargo asm --lib --release --simplify "$name" "$idx" 2>/dev/null)
    fi
    text=$(grep -v '^ *Finished\|^ *Compiling\|^$' <<<"$text" || true)
    printf '%s\n' "$text" > "$out"
    echo "wrote $out ($(grep -cE '^\s+[a-z]' "$out") instrs)"
  done
done
