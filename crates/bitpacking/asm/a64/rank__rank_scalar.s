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
	lsl x9, x10, x9
	bic x9, x11, x9
	fmov d0, x9
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x9, d0
.LBB15_4:
	cmp x1, x8
	b.hi .LBB15_15
	cbz x1, .LBB15_8
	lsl x10, x1, #3
	sub x8, x10, #8
	cmp x8, #24
	b.hs .LBB15_9
	mov x11, xzr
	mov x8, x0
	b .LBB15_12
.LBB15_8:
	add x0, xzr, x9
	ldp x29, x30, [sp], #16
	ret
.LBB15_9:
	lsr x8, x8, #3
	movi v0.2d, #0000000000000000
	movi v1.2d, #0000000000000000
	add x13, x0, #16
	add x11, x8, #1
	and x12, x11, #0x3ffffffffffffffc
	and x14, x11, #0x3ffffffffffffffc
	add x8, x0, x12, lsl #3
.LBB15_10:
	ldp q2, q3, [x13, #-16]
	subs x14, x14, #4
	add x13, x13, #32
	cnt v2.16b, v2.16b
	cnt v3.16b, v3.16b
	uaddlp v2.8h, v2.16b
	uaddlp v3.8h, v3.16b
	uaddlp v2.4s, v2.8h
	uaddlp v3.4s, v3.8h
	uadalp v0.2d, v2.4s
	uadalp v1.2d, v3.4s
	b.ne .LBB15_10
	add v0.2d, v1.2d, v0.2d
	cmp x11, x12
	addp d0, v0.2d
	fmov x11, d0
	b.eq .LBB15_14
.LBB15_12:
	add x10, x0, x10
.LBB15_13:
	ldr d0, [x8], #8
	cmp x8, x10
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x11, x12, x11
	b.ne .LBB15_13
.LBB15_14:
	add x0, x11, x9
	ldp x29, x30, [sp], #16
	ret
.LBB15_15:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.48
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.48
	mov x0, xzr
	mov x2, x8
	bl core::slice::index::slice_index_fail
.LBB15_16:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.45
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.45
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.46
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.46
	mov w1, #53
	bl core::panicking::panic_fmt
.LBB15_17:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.47
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.47
	mov x0, x1
	mov x1, x8
	bl core::panicking::panic_bounds_check
