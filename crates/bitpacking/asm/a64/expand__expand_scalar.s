bitpacking::expand::expand_scalar:
	stp x29, x30, [sp, #-32]!
	stp x20, x19, [sp, #16]
	mov x29, sp
	cmp x5, x3
	b.lo .LBB23_10
	cbz x3, .LBB23_9
	mov w8, wzr
	mov x11, xzr
	mov x12, xzr
	mov x9, xzr
	mov x10, #-1
	b .LBB23_6
.LBB23_3:
	ldr x15, [x0, x9, lsl #3]
.LBB23_4:
	lsr x16, x15, #1
	mvn w17, w8
	mov w18, w8
	lsl x15, x15, x18
	tst x18, #0x40
	add x9, x9, #1
	lsr x16, x16, x17
	add w8, w8, #64
	csel x16, x15, x16, ne
	csel x15, xzr, x15, ne
	orr x12, x16, x12
	orr x11, x15, x11
.LBB23_5:
	mvn x15, x13
	lsl x20, x10, x14
	tst x14, #0x40
	lsl x16, x15, #1
	eon x15, x13, x15, lsl #2
	sub w8, w8, w14
	csel x20, xzr, x20, ne
	eor x15, x15, x16
	bic x20, x11, x20
	lsr x11, x11, x14
	eor x15, x16, x15, lsl #2
	eor x15, x15, x15, lsl #4
	eor x15, x15, x15, lsl #8
	eor x15, x15, x15, lsl #16
	eor x15, x15, x15, lsl #32
	bic x16, x16, x15
	eor x17, x16, x16, lsl #1
	eor x17, x17, x17, lsl #2
	eor x17, x17, x17, lsl #4
	eor x17, x17, x17, lsl #8
	eor x17, x17, x17, lsl #16
	eor x17, x17, x17, lsl #32
	bic x16, x16, x17
	eor x18, x16, x16, lsl #1
	eor x18, x18, x18, lsl #2
	eor x18, x18, x18, lsl #4
	eor x18, x18, x18, lsl #8
	eor x18, x18, x18, lsl #16
	eor x18, x18, x18, lsl #32
	bic x16, x16, x18
	eor x5, x16, x16, lsl #1
	eor x5, x5, x5, lsl #2
	eor x5, x5, x5, lsl #4
	eor x5, x5, x5, lsl #8
	eor x5, x5, x5, lsl #16
	eor x5, x5, x5, lsl #32
	bic x6, x16, x5
	eor x16, x6, x6, lsl #1
	eor x16, x16, x16, lsl #2
	eor x7, x16, x16, lsl #4
	and x16, x15, x13
	eor x19, x16, x13
	eor x7, x7, x7, lsl #8
	orr x19, x19, x16, lsr #1
	eor x7, x7, x7, lsl #16
	and x17, x17, x19
	eor x19, x17, x19
	eor x7, x7, x7, lsl #32
	orr x19, x19, x17, lsr #2
	bic x6, x6, x7
	and x18, x18, x19
	eor x6, x6, x6, lsl #1
	eor x19, x18, x19
	orr x19, x19, x18, lsr #4
	eor x6, x6, x6, lsl #2
	and x5, x5, x19
	eor x6, x6, x6, lsl #4
	eor x19, x5, x19
	orr x19, x19, x5, lsr #8
	eor x6, x6, x6, lsl #8
	and x7, x7, x19
	eor x6, x6, x6, lsl #16
	eor x19, x7, x19
	orr x19, x19, x7, lsr #16
	eor x6, x6, x6, lsl #32
	and x6, x6, x19
	and x19, x6, x20, lsl #32
	bic x6, x20, x6
	orr x6, x19, x6
	and x19, x7, x6, lsl #16
	bic x6, x6, x7
	orr x6, x19, x6
	and x7, x5, x6, lsl #8
	bic x5, x6, x5
	orr x5, x7, x5
	mvn w7, w14
	and x6, x18, x5, lsl #4
	bic x18, x5, x18
	lsl x5, x12, #1
	lsr x12, x12, x14
	orr x18, x6, x18
	and x6, x17, x18, lsl #2
	bic x17, x18, x17
	lsl x18, x5, x7
	orr x17, x6, x17
	orr x11, x18, x11
	and x15, x15, x17, lsl #1
	bic x16, x17, x16
	csel x11, x12, x11, ne
	csel x12, xzr, x12, ne
	subs x3, x3, #1
	orr x15, x15, x16
	and x13, x15, x13
	str x13, [x4], #8
	b.eq .LBB23_9
.LBB23_6:
	ldr x13, [x2], #8
	fmov d0, x13
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x14, d0
	cmp w8, w14
	b.hs .LBB23_5
	cmp x9, x1
	b.lo .LBB23_3
	mov x15, xzr
	b .LBB23_4
.LBB23_9:
	ldp x20, x19, [sp, #16]
	ldp x29, x30, [sp], #32
	ret
.LBB23_10:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.0
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.0
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.2
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.2
	mov w1, #41
	bl core::panicking::panic
