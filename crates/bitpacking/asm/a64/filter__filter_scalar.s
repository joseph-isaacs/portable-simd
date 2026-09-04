bitpacking::filter::filter_scalar:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB26_12
	cbz x1, .LBB26_10
	mov x8, x0
	mov w9, wzr
	mov x0, xzr
	mov x10, xzr
	mov x11, xzr
	b .LBB26_4
.LBB26_3:
	subs x1, x1, #1
	b.eq .LBB26_7
.LBB26_4:
	ldr x12, [x2], #8
	ldr x3, [x8], #8
	mvn x13, x12
	fmov d0, x12
	lsl x14, x13, #1
	eon x13, x12, x13, lsl #2
	and x3, x12, x3
	eor x13, x13, x14
	cnt v0.8b, v0.8b
	eor x13, x14, x13, lsl #2
	eor x13, x13, x13, lsl #4
	addv b0, v0.8b
	eor x13, x13, x13, lsl #8
	eor x13, x13, x13, lsl #16
	eor x13, x13, x13, lsl #32
	bic x14, x14, x13
	and x6, x13, x12
	and x13, x13, x3
	eor x15, x14, x14, lsl #1
	eor x7, x6, x12
	eor x3, x13, x3
	orr x6, x7, x6, lsr #1
	orr x13, x3, x13, lsr #1
	eor x15, x15, x15, lsl #2
	eor x15, x15, x15, lsl #4
	eor x15, x15, x15, lsl #8
	eor x15, x15, x15, lsl #16
	eor x15, x15, x15, lsl #32
	bic x14, x14, x15
	and x15, x15, x6
	eor x16, x14, x14, lsl #1
	eor x3, x15, x6
	and x6, x15, x13
	orr x15, x3, x15, lsr #2
	eor x13, x6, x13
	eor x16, x16, x16, lsl #2
	orr x13, x13, x6, lsr #2
	eor x16, x16, x16, lsl #4
	eor x16, x16, x16, lsl #8
	eor x16, x16, x16, lsl #16
	eor x16, x16, x16, lsl #32
	bic x14, x14, x16
	and x16, x16, x15
	eor x17, x14, x14, lsl #1
	eor x15, x16, x15
	and x3, x16, x13
	orr x15, x15, x16, lsr #4
	eor x13, x3, x13
	eor x17, x17, x17, lsl #2
	orr x13, x13, x3, lsr #4
	eor x17, x17, x17, lsl #4
	eor x17, x17, x17, lsl #8
	eor x17, x17, x17, lsl #16
	eor x17, x17, x17, lsl #32
	bic x14, x14, x17
	and x16, x17, x15
	eor x18, x14, x14, lsl #1
	eor x15, x16, x15
	and x17, x16, x13
	orr x15, x15, x16, lsr #8
	eor x13, x17, x13
	eor x18, x18, x18, lsl #2
	orr x13, x13, x17, lsr #8
	eor x18, x18, x18, lsl #4
	eor x18, x18, x18, lsl #8
	eor x18, x18, x18, lsl #16
	eor x18, x18, x18, lsl #32
	bic x14, x14, x18
	and x16, x18, x15
	eor x14, x14, x14, lsl #1
	and x17, x16, x13
	eor x15, x16, x15
	eor x13, x17, x13
	orr x15, x15, x16, lsr #16
	fmov w16, s0
	eor x14, x14, x14, lsl #2
	orr x13, x13, x17, lsr #16
	eor x14, x14, x14, lsl #4
	and x12, x15, x13
	mvn w15, w9
	eor x14, x14, x14, lsl #8
	eor x14, x14, x14, lsl #16
	eor x14, x14, x14, lsl #32
	and x12, x12, x14
	mov w14, w9
	add w9, w9, w16
	eor x13, x12, x13
	tst x14, #0x40
	orr x12, x13, x12, lsr #32
	lsr x13, x12, #1
	lsl x12, x12, x14
	lsr x13, x13, x15
	csel x13, x12, x13, ne
	csel x12, xzr, x12, ne
	cmp w9, #63
	orr x11, x13, x11
	orr x10, x12, x10
	b.ls .LBB26_3
	cmp x0, x5
	b.hs .LBB26_13
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x11
	mov x11, xzr
	b .LBB26_3
.LBB26_7:
	cbz w9, .LBB26_11
	cmp x0, x5
	b.hs .LBB26_14
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	add x0, x8, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_10:
	add x0, xzr, xzr, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_11:
	add x0, xzr, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_12:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB26_13:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB26_14:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
