bitpacking::rank::rank_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x2, x1, lsl #6
	b.hi .LBB15_16
	mov x8, x1
	lsr x1, x2, #6
	ands x9, x2, #0x3f
	b.eq .LBB15_4
	cmp x1, x8
	b.hs .LBB15_17
	mov x10, #-1
	ldr x11, [x0, x1, lsl #3]
	ptrue p0.d
	lsl x9, x10, x9
	bic x9, x11, x9
	fmov d0, x9
	cnt z0.d, p0/m, z0.d
	fmov x9, d0
.LBB15_4:
	cmp x1, x8
	b.hi .LBB15_15
	cbz x1, .LBB15_8
	lsl x8, x1, #3
	cntw x11
	sub x10, x8, #8
	lsr x10, x10, #3
	add x10, x10, #1
	cmp x10, x11
	b.hs .LBB15_9
	mov x12, xzr
	mov x10, x0
	b .LBB15_12
.LBB15_8:
	add x0, xzr, x9
	ldp x29, x30, [sp], #16
	ret
.LBB15_9:
	mov x11, #-1
	movi v0.2d, #0000000000000000
	movi v1.2d, #0000000000000000
	incw x11
	ptrue p0.d
	mov x13, x0
	and x11, x10, x11
	sub x12, x10, x11
	add x10, x0, x12, lsl #3
.LBB15_10:
	ldr z2, [x13]
	ldr z3, [x13, #1, mul vl]
	decw x12
	incb x13, all, mul #2
	cnt z2.d, p0/m, z2.d
	cnt z3.d, p0/m, z3.d
	add z0.d, z2.d, z0.d
	add z1.d, z3.d, z1.d
	cbnz x12, .LBB15_10
	add z0.d, z1.d, z0.d
	uaddv d0, p0, z0.d
	fmov x12, d0
	cbz x11, .LBB15_14
.LBB15_12:
	ptrue p0.d
	add x8, x0, x8
.LBB15_13:
	ldr x11, [x10], #8
	cmp x10, x8
	fmov d0, x11
	cnt z0.d, p0/m, z0.d
	fmov x11, d0
	add x12, x11, x12
	b.ne .LBB15_13
.LBB15_14:
	add x0, x12, x9
	ldp x29, x30, [sp], #16
	ret
.LBB15_15:
	adrp x3, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.50
	add x3, x3, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.50
	mov x0, xzr
	mov x2, x8
	bl core::slice::index::slice_index_fail
.LBB15_16:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.47
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.47
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.48
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.48
	mov w1, #53
	bl core::panicking::panic_fmt
.LBB15_17:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.49
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.49
	mov x0, x1
	mov x1, x8
	bl core::panicking::panic_bounds_check
