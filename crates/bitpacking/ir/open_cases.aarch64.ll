; ModuleID = 'open_cases.36a71362e04c2977-cgu.0'
source_filename = "open_cases.36a71362e04c2977-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define { i64, i64 } @first_set64(ptr noalias nofree noundef readonly align 64 captures(none) dead_on_return dereferenceable(64) %v) unnamed_addr #0 !guid !4 {
start:
  %0 = load <64 x i8>, ptr %v, align 64
  %1 = icmp eq <64 x i8> %0, zeroinitializer
  %masked_index.i = select <64 x i1> %1, <64 x i8> splat (i8 -1), <64 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15, i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31, i8 32, i8 33, i8 34, i8 35, i8 36, i8 37, i8 38, i8 39, i8 40, i8 41, i8 42, i8 43, i8 44, i8 45, i8 46, i8 47, i8 48, i8 49, i8 50, i8 51, i8 52, i8 53, i8 54, i8 55, i8 56, i8 57, i8 58, i8 59, i8 60, i8 61, i8 62, i8 63>
  %2 = tail call i8 @llvm.vector.reduce.umin.v64i8(<64 x i8> %masked_index.i)
  %_0.i.i = icmp ne i8 %2, -1
  %_0.i6.i = sext i8 %2 to i64
  %spec.select1.i = zext i1 %_0.i.i to i64
  %3 = insertvalue { i64, i64 } poison, i64 %spec.select1.i, 0
  %4 = insertvalue { i64, i64 } %3, i64 %_0.i6.i, 1
  ret { i64, i64 } %4
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define noundef range(i64 0, 4294967296) i64 @to_bitmask32(ptr noalias nofree noundef readonly align 32 captures(none) dead_on_return dereferenceable(32) %v) unnamed_addr #0 !guid !5 {
start:
  %0 = load <32 x i8>, ptr %v, align 32
  %1 = icmp ne <32 x i8> %0, zeroinitializer
  %bitmask3.i = bitcast <32 x i1> %1 to i32
  %2 = zext i32 %bitmask3.i to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define noundef i64 @to_bitmask64(ptr noalias nofree noundef readonly align 64 captures(none) dead_on_return dereferenceable(64) %v) unnamed_addr #0 !guid !6 {
start:
  %0 = load <64 x i8>, ptr %v, align 64
  %1 = icmp ne <64 x i8> %0, zeroinitializer
  %2 = bitcast <64 x i1> %1 to i64
  ret i64 %2
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable
define void @to_bitmask64_store(ptr noalias nofree noundef readonly align 64 captures(none) dead_on_return dereferenceable(64) %v, ptr noalias nofree noundef writeonly align 8 captures(none) dereferenceable(8) initializes((0, 8)) %out) unnamed_addr #1 !guid !7 {
start:
  %0 = load <64 x i8>, ptr %v, align 64
  %1 = icmp ne <64 x i8> %0, zeroinitializer
  store <64 x i1> %1, ptr %out, align 8
  ret void
}

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.vector.reduce.umin.v64i8(<64 x i8>) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #2 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 1}
!3 = !{!"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"}
!4 = !{i64 7099971853837252836}
!5 = !{i64 6250296737226609569}
!6 = !{i64 -8790054838052629825}
!7 = !{i64 6250542233486744108}
