bitpacking::expand::expand_scalar:
	stp x29, x30, [sp, #-32]!
	stp x20, x19, [sp, #16]
	mov x29, sp
	cmp x5, x3
	b.lo .LBB24_10
	cbz x3, .LBB24_9
	ptrue p0.d
	mov w8, wzr
	mov x11, xzr
	mov x12, xzr
	mov x9, xzr
	mov x10, #-1
	b .LBB24_6
.LBB24_3:
	ldr x15, [x0, x9, lsl #3]
.LBB24_4:
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
.LBB24_5:
	mvn x15, x14
	lsl x20, x10, x13
	tst x13, #0x40
	lsl x16, x15, #1
	eon x15, x14, x15, lsl #2
	sub w8, w8, w13
	csel x20, xzr, x20, ne
	eor x15, x15, x16
	bic x20, x11, x20
	lsr x11, x11, x13
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
	and x16, x15, x14
	eor x19, x16, x14
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
	mvn w7, w13
	and x6, x18, x5, lsl #4
	bic x18, x5, x18
	lsl x5, x12, #1
	lsr x12, x12, x13
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
	and x14, x15, x14
	str x14, [x4], #8
	b.eq .LBB24_9
.LBB24_6:
	ldr x14, [x2], #8
	fmov d0, x14
	cnt z0.d, p0/m, z0.d
	fmov x13, d0
	cmp w8, w13
	b.hs .LBB24_5
	cmp x9, x1
	b.lo .LBB24_3
	mov x15, xzr
	b .LBB24_4
.LBB24_9:
	ldp x20, x19, [sp, #16]
	ldp x29, x30, [sp], #32
	ret
.LBB24_10:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	mov w1, #41
	bl core::panicking::panic
