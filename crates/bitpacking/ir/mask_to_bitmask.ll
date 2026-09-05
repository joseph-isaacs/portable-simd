; Repro: vector-compare -> scalar bitmask on AArch64 for 32 and 64 lanes.
; This is exactly what `Mask::<i8, N>::to_bitmask()` becomes after rustc/LLVM simplification.
;   llc -O2 -mtriple=aarch64-unknown-linux-gnu mask_to_bitmask.ll -o -
target triple = "aarch64-unknown-linux-gnu"

define i16 @m16(<16 x i8> %v) {
  %c = icmp ne <16 x i8> %v, zeroinitializer
  %m = bitcast <16 x i1> %c to i16
  ret i16 %m
}

define i32 @m32(<32 x i8> %v) {
  %c = icmp ne <32 x i8> %v, zeroinitializer
  %m = bitcast <32 x i1> %c to i32
  ret i32 %m
}

define i64 @m64(<64 x i8> %v) {
  %c = icmp ne <64 x i8> %v, zeroinitializer
  %m = bitcast <64 x i1> %c to i64
  ret i64 %m
}
