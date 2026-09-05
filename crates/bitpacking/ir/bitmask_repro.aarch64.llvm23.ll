; ModuleID = 'bitmask_repro.4722d322730c8f88-cgu.0'
source_filename = "bitmask_repro.4722d322730c8f88-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define void @bits_to_bytes(ptr dead_on_unwind noalias nofree noundef writable writeonly sret([64 x i8]) align 64 captures(none) dereferenceable(64) initializes((0, 64)) %_0, i64 noundef %w) unnamed_addr #0 personality ptr @rust_eh_personality !guid !4 {
start:
  %0 = bitcast i64 %w to <64 x i1>
  %_4.lobit = zext <64 x i1> %0 to <64 x i8>
  store <64 x i8> %_4.lobit, ptr %_0, align 64
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define void @bits_to_bytes16(ptr dead_on_unwind noalias nofree noundef writable writeonly sret([16 x i8]) align 16 captures(none) dereferenceable(16) initializes((0, 16)) %_0, i64 noundef %w) unnamed_addr #0 personality ptr @rust_eh_personality !guid !5 {
start:
  %bitmask1.i = trunc i64 %w to i16
  %0 = bitcast i16 %bitmask1.i to <16 x i1>
  %_4.lobit = zext <16 x i1> %0 to <16 x i8>
  store <16 x i8> %_4.lobit, ptr %_0, align 16
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define noundef i64 @bytes_to_bits(ptr noalias nofree noundef readonly align 64 captures(none) dead_on_return dereferenceable(64) %v) unnamed_addr #1 !guid !6 {
start:
  %0 = load <64 x i8>, ptr %v, align 64
  %1 = icmp ne <64 x i8> %0, zeroinitializer
  %2 = bitcast <64 x i1> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define noundef range(i64 0, 65536) i64 @bytes_to_bits16(ptr noalias nofree noundef readonly align 16 captures(none) dead_on_return dereferenceable(16) %v) unnamed_addr #1 !guid !7 {
start:
  %0 = load <16 x i8>, ptr %v, align 16
  %1 = icmp ne <16 x i8> %0, zeroinitializer
  %bitmask6.i = bitcast <16 x i1> %1 to i16
  %2 = zext i16 %bitmask6.i to i64
  ret i64 %2
}

; Function Attrs: nounwind uwtable
declare noundef range(i32 0, 10) i32 @rust_eh_personality(i32 noundef, i32 noundef, i64 noundef, ptr noundef, ptr noundef) unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #2 = { nounwind uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 1}
!3 = !{!"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"}
!4 = !{i64 -126812044676513035}
!5 = !{i64 5232475884205300866}
!6 = !{i64 9016651455504797019}
!7 = !{i64 5985729240786204716}
