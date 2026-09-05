; ModuleID = 'lib.342725b26d02ed7a-cgu.0'
source_filename = "lib.342725b26d02ed7a-cgu.0"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-gnu"

; lib::scalar_loop
; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define void @_RNvCs4tBK5thUKo0_3lib11scalar_loop(ptr noalias nofree noundef nonnull readonly captures(none) %bytes.0, i64 noundef range(i64 0, -9223372036854775808) %bytes.1, ptr noalias nofree noundef nonnull writeonly align 8 captures(none) %out.0, i64 noundef range(i64 0, 1152921504606846976) %out.1) unnamed_addr #0 personality ptr @rust_eh_personality !guid !4 {
_RINvYINtNtNtCs1JkTRtNJhRR_4core5slice4iter11ChunksExacthENtNtNtNtBa_4iter6traits8iterator8Iterator3zipINtB6_7IterMutyEECs4tBK5thUKo0_3lib.exit:
  %n.i.i.i.i8 = lshr i64 %bytes.1, 6
  %len.i.i1 = tail call i64 @llvm.umin.i64(i64 %n.i.i.i.i8, i64 %out.1)
  %_2.i9.not = icmp eq i64 %len.i.i1, 0
  br i1 %_2.i9.not, label %bb6, label %bb5

bb5:                                              ; preds = %_RINvYINtNtNtCs1JkTRtNJhRR_4core5slice4iter11ChunksExacthENtNtNtNtBa_4iter6traits8iterator8Iterator3zipINtB6_7IterMutyEECs4tBK5thUKo0_3lib.exit, %bb5
  %iter.sroa.12.010 = phi i64 [ %11, %bb5 ], [ 0, %_RINvYINtNtNtCs1JkTRtNJhRR_4core5slice4iter11ChunksExacthENtNtNtNtBa_4iter6traits8iterator8Iterator3zipINtB6_7IterMutyEECs4tBK5thUKo0_3lib.exit ]
  %start1.i.i = shl i64 %iter.sroa.12.010, 6
  %data.i.i2 = getelementptr inbounds nuw i8, ptr %bytes.0, i64 %start1.i.i
  %wide.load = load <16 x i8>, ptr %data.i.i2, align 1
  %.not = icmp eq <16 x i8> %wide.load, zeroinitializer
  %0 = select <16 x i1> %.not, <16 x i64> zeroinitializer, <16 x i64> <i64 1, i64 2, i64 4, i64 8, i64 16, i64 32, i64 64, i64 128, i64 256, i64 512, i64 1024, i64 2048, i64 4096, i64 8192, i64 16384, i64 32768>
  %1 = getelementptr inbounds nuw i8, ptr %data.i.i2, i64 16
  %wide.load.1 = load <16 x i8>, ptr %1, align 1
  %.not11 = icmp eq <16 x i8> %wide.load.1, zeroinitializer
  %2 = select <16 x i1> %.not11, <16 x i64> zeroinitializer, <16 x i64> <i64 65536, i64 131072, i64 262144, i64 524288, i64 1048576, i64 2097152, i64 4194304, i64 8388608, i64 16777216, i64 33554432, i64 67108864, i64 134217728, i64 268435456, i64 536870912, i64 1073741824, i64 2147483648>
  %3 = or disjoint <16 x i64> %2, %0
  %4 = getelementptr inbounds nuw i8, ptr %data.i.i2, i64 32
  %wide.load.2 = load <16 x i8>, ptr %4, align 1
  %.not12 = icmp eq <16 x i8> %wide.load.2, zeroinitializer
  %5 = select <16 x i1> %.not12, <16 x i64> zeroinitializer, <16 x i64> <i64 4294967296, i64 8589934592, i64 17179869184, i64 34359738368, i64 68719476736, i64 137438953472, i64 274877906944, i64 549755813888, i64 1099511627776, i64 2199023255552, i64 4398046511104, i64 8796093022208, i64 17592186044416, i64 35184372088832, i64 70368744177664, i64 140737488355328>
  %6 = or disjoint <16 x i64> %5, %3
  %7 = getelementptr inbounds nuw i8, ptr %data.i.i2, i64 48
  %wide.load.3 = load <16 x i8>, ptr %7, align 1
  %.not13 = icmp eq <16 x i8> %wide.load.3, zeroinitializer
  %8 = select <16 x i1> %.not13, <16 x i64> zeroinitializer, <16 x i64> <i64 281474976710656, i64 562949953421312, i64 1125899906842624, i64 2251799813685248, i64 4503599627370496, i64 9007199254740992, i64 18014398509481984, i64 36028797018963968, i64 72057594037927936, i64 144115188075855872, i64 288230376151711744, i64 576460752303423488, i64 1152921504606846976, i64 2305843009213693952, i64 4611686018427387904, i64 -9223372036854775808>
  %9 = or disjoint <16 x i64> %8, %6
  %10 = tail call i64 @llvm.vector.reduce.or.v16i64(<16 x i64> %9)
  %11 = add nuw nsw i64 %iter.sroa.12.010, 1
  %_3.i.i = getelementptr inbounds nuw [8 x i8], ptr %out.0, i64 %iter.sroa.12.010
  store i64 %10, ptr %_3.i.i, align 8
  %exitcond.not = icmp eq i64 %11, %len.i.i1
  br i1 %exitcond.not, label %bb6, label %bb5

bb6:                                              ; preds = %bb5, %_RINvYINtNtNtCs1JkTRtNJhRR_4core5slice4iter11ChunksExacthENtNtNtNtBa_4iter6traits8iterator8Iterator3zipINtB6_7IterMutyEECs4tBK5thUKo0_3lib.exit
  ret void
}

; lib::to_bitmask_loop
; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define void @_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop(ptr noalias nofree noundef nonnull readonly captures(none) %bytes.0, i64 noundef range(i64 0, -9223372036854775808) %bytes.1, ptr noalias nofree noundef nonnull writeonly align 8 captures(none) %out.0, i64 noundef range(i64 0, 1152921504606846976) %out.1) unnamed_addr #1 personality ptr @rust_eh_personality !guid !5 {
start:
  %0 = lshr i64 %bytes.1, 6
  %len.i.i2 = tail call i64 @llvm.umin.i64(i64 %0, i64 %out.1)
  %_2.i7.not = icmp eq i64 %len.i.i2, 0
  br i1 %_2.i7.not, label %bb6, label %bb5

bb5:                                              ; preds = %start, %bb5
  %iter.sroa.8.08 = phi i64 [ %1, %bb5 ], [ 0, %start ]
  %1 = add nuw nsw i64 %iter.sroa.8.08, 1
  %_3.i.i = getelementptr inbounds nuw [64 x i8], ptr %bytes.0, i64 %iter.sroa.8.08
  %_3.i1.i = getelementptr inbounds nuw [8 x i8], ptr %out.0, i64 %iter.sroa.8.08
  %_17.sroa.0.0.copyload = load <64 x i8>, ptr %_3.i.i, align 1
  %2 = icmp ne <64 x i8> %_17.sroa.0.0.copyload, zeroinitializer
  store <64 x i1> %2, ptr %_3.i1.i, align 8
  %exitcond.not = icmp eq i64 %1, %len.i.i2
  br i1 %exitcond.not, label %bb6, label %bb5

bb6:                                              ; preds = %bb5, %start
  ret void
}

; lib::to_bitmask32_loop
; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define void @_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop(ptr noalias nofree noundef nonnull readonly captures(none) %bytes.0, i64 noundef range(i64 0, -9223372036854775808) %bytes.1, ptr noalias nofree noundef nonnull writeonly align 8 captures(none) %out.0, i64 noundef range(i64 0, 1152921504606846976) %out.1) unnamed_addr #1 personality ptr @rust_eh_personality !guid !6 {
start:
  %0 = lshr i64 %bytes.1, 6
  %len.i.i6 = tail call i64 @llvm.umin.i64(i64 %0, i64 %out.1)
  %_2.i15.not = icmp eq i64 %len.i.i6, 0
  br i1 %_2.i15.not, label %bb6, label %bb10

bb6:                                              ; preds = %bb10, %start
  ret void

bb10:                                             ; preds = %start, %bb10
  %iter.sroa.8.016 = phi i64 [ %1, %bb10 ], [ 0, %start ]
  %1 = add nuw nsw i64 %iter.sroa.8.016, 1
  %_3.i.i = getelementptr inbounds nuw [64 x i8], ptr %bytes.0, i64 %iter.sroa.8.016
  %_3.i1.i = getelementptr inbounds nuw [8 x i8], ptr %out.0, i64 %iter.sroa.8.016
  %_20.sroa.0.0.copyload = load <32 x i8>, ptr %_3.i.i, align 1
  %2 = getelementptr inbounds nuw i8, ptr %_3.i.i, i64 32
  %_27.sroa.0.0.copyload = load <32 x i8>, ptr %2, align 1
  %3 = shufflevector <32 x i8> %_20.sroa.0.0.copyload, <32 x i8> %_27.sroa.0.0.copyload, <64 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15, i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23, i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31, i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39, i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %4 = icmp ne <64 x i8> %3, zeroinitializer
  store <64 x i1> %4, ptr %_3.i1.i, align 8
  %exitcond.not = icmp eq i64 %1, %len.i.i6
  br i1 %exitcond.not, label %bb6, label %bb10
}

; lib::neon_loop
; Function Attrs: nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable
define void @_RNvCs4tBK5thUKo0_3lib9neon_loop(ptr noalias nofree noundef nonnull readonly captures(none) %bytes.0, i64 noundef range(i64 0, -9223372036854775808) %bytes.1, ptr noalias nofree noundef nonnull writeonly align 8 captures(none) %out.0, i64 noundef range(i64 0, 1152921504606846976) %out.1) unnamed_addr #1 personality ptr @rust_eh_personality !guid !7 {
start:
  %0 = lshr i64 %bytes.1, 6
  %len.i.i1 = tail call i64 @llvm.umin.i64(i64 %0, i64 %out.1)
  %_2.i64.not = icmp eq i64 %len.i.i1, 0
  br i1 %_2.i64.not, label %bb8, label %bb7

bb7:                                              ; preds = %start, %bb7
  %iter.sroa.8.065 = phi i64 [ %1, %bb7 ], [ 0, %start ]
  %1 = add nuw nsw i64 %iter.sroa.8.065, 1
  %_3.i.i = getelementptr inbounds nuw [64 x i8], ptr %bytes.0, i64 %iter.sroa.8.065
  %_3.i1.i = getelementptr inbounds nuw [8 x i8], ptr %out.0, i64 %iter.sroa.8.065
  %.sroa.013.0.copyload = load <16 x i8>, ptr %_3.i.i, align 1
  %.not = icmp eq <16 x i8> %.sroa.013.0.copyload, zeroinitializer
  %2 = select <16 x i1> %.not, <16 x i8> zeroinitializer, <16 x i8> <i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128, i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128>
  %_22 = getelementptr inbounds nuw i8, ptr %_3.i.i, i64 16
  %.sroa.020.0.copyload = load <16 x i8>, ptr %_22, align 1
  %.not61 = icmp eq <16 x i8> %.sroa.020.0.copyload, zeroinitializer
  %3 = select <16 x i1> %.not61, <16 x i8> zeroinitializer, <16 x i8> <i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128, i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128>
  %even.i = shufflevector <16 x i8> %2, <16 x i8> %3, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %odd.i = shufflevector <16 x i8> %2, <16 x i8> %3, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %4 = or disjoint <16 x i8> %even.i, %odd.i
  %_25 = getelementptr inbounds nuw i8, ptr %_3.i.i, i64 32
  %.sroa.030.0.copyload = load <16 x i8>, ptr %_25, align 1
  %.not62 = icmp eq <16 x i8> %.sroa.030.0.copyload, zeroinitializer
  %5 = select <16 x i1> %.not62, <16 x i8> zeroinitializer, <16 x i8> <i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128, i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128>
  %_27 = getelementptr inbounds nuw i8, ptr %_3.i.i, i64 48
  %.sroa.037.0.copyload = load <16 x i8>, ptr %_27, align 1
  %.not63 = icmp eq <16 x i8> %.sroa.037.0.copyload, zeroinitializer
  %6 = select <16 x i1> %.not63, <16 x i8> zeroinitializer, <16 x i8> <i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128, i8 1, i8 2, i8 4, i8 8, i8 16, i8 32, i8 64, i8 -128>
  %even.i5 = shufflevector <16 x i8> %5, <16 x i8> %6, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %odd.i6 = shufflevector <16 x i8> %5, <16 x i8> %6, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %7 = or disjoint <16 x i8> %even.i5, %odd.i6
  %even.i7 = shufflevector <16 x i8> %4, <16 x i8> %7, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 16, i32 18, i32 20, i32 22, i32 24, i32 26, i32 28, i32 30>
  %odd.i8 = shufflevector <16 x i8> %4, <16 x i8> %7, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 17, i32 19, i32 21, i32 23, i32 25, i32 27, i32 29, i32 31>
  %8 = or disjoint <16 x i8> %even.i7, %odd.i8
  %even.i9 = shufflevector <16 x i8> %8, <16 x i8> poison, <16 x i32> <i32 0, i32 2, i32 4, i32 6, i32 8, i32 10, i32 12, i32 14, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %odd.i10 = shufflevector <16 x i8> %8, <16 x i8> poison, <16 x i32> <i32 1, i32 3, i32 5, i32 7, i32 9, i32 11, i32 13, i32 15, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison, i32 poison>
  %9 = or disjoint <16 x i8> %even.i9, %odd.i10
  %10 = bitcast <16 x i8> %9 to <2 x i64>
  %.sroa.056.0.vec.extract = extractelement <2 x i64> %10, i64 0
  store i64 %.sroa.056.0.vec.extract, ptr %_3.i1.i, align 8
  %exitcond.not = icmp eq i64 %1, %len.i.i1
  br i1 %exitcond.not, label %bb8, label %bb7

bb8:                                              ; preds = %bb7, %start
  ret void
}

; Function Attrs: nounwind uwtable
declare noundef range(i32 0, 10) i32 @rust_eh_personality(i32 noundef, i32 noundef, i64 noundef, ptr noundef, ptr noundef) unnamed_addr #2

; Function Attrs: mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umin.i64(i64, i64) #3

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.or.v16i64(<16 x i64>) #4

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #1 = { nofree noinline norecurse nosync nounwind memory(argmem: readwrite) uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #2 = { nounwind uwtable "frame-pointer"="non-leaf" "probe-stack"="inline-asm" "target-cpu"="generic" "target-features"="+v8a,+outline-atomics" }
attributes #3 = { mustprogress nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{i32 7, !"uwtable", i32 2}
!2 = !{i32 7, !"frame-pointer", i32 1}
!3 = !{!"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"}
!4 = !{i64 7737817995209722228}
!5 = !{i64 9039646639982364310}
!6 = !{i64 2175608035279614488}
!7 = !{i64 7379247923822912998}
