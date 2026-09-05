; Mask -> bitmask for wide-element masks (Mask<i16/i32/i64, N>::to_bitmask()).
;   llc -O2 -mtriple=aarch64-unknown-linux-gnu mask_to_bitmask_wide.ll -o -
target triple = "aarch64-unknown-linux-gnu"

define i8 @m8_i64(<8 x i64> %v) {          ; u64x8 compare -> bitmask (select scan)
  %c = icmp ne <8 x i64> %v, zeroinitializer
  %m = bitcast <8 x i1> %c to i8
  ret i8 %m
}
define i8 @m8_i32(<8 x i32> %v) {
  %c = icmp ne <8 x i32> %v, zeroinitializer
  %m = bitcast <8 x i1> %c to i8
  ret i8 %m
}
define i16 @m16_i32(<16 x i32> %v) {
  %c = icmp ne <16 x i32> %v, zeroinitializer
  %m = bitcast <16 x i1> %c to i16
  ret i16 %m
}
define i16 @m16_i16(<16 x i16> %v) {
  %c = icmp ne <16 x i16> %v, zeroinitializer
  %m = bitcast <16 x i1> %c to i16
  ret i16 %m
}
define i32 @m32_i16(<32 x i16> %v) {
  %c = icmp ne <32 x i16> %v, zeroinitializer
  %m = bitcast <32 x i1> %c to i32
  ret i32 %m
}

; --- neighbours of the same lowering ---
declare i32 @llvm.cttz.i32(i32, i1)
declare i64 @llvm.cttz.i64(i64, i1)

define i32 @first_set32(<32 x i8> %v) {     ; Mask::<i8,32>::first_set(): performCTTZCombine covers <= 32 lanes
  %c = icmp ne <32 x i8> %v, zeroinitializer
  %m = bitcast <32 x i1> %c to i32
  %t = call i32 @llvm.cttz.i32(i32 %m, i1 false)
  ret i32 %t
}
define i64 @first_set64(<64 x i8> %v) {     ; 64 lanes: falls back to full bitmask + rbit/clz
  %c = icmp ne <64 x i8> %v, zeroinitializer
  %m = bitcast <64 x i1> %c to i64
  %t = call i64 @llvm.cttz.i64(i64 %m, i1 false)
  ret i64 %t
}
define void @store64(<64 x i8> %v, ptr %p) { ; storing a Mask<i8,64> as 8 bytes (combineBoolVectorAndTruncateStore)
  %c = icmp ne <64 x i8> %v, zeroinitializer
  store <64 x i1> %c, ptr %p
  ret void
}
