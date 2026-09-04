bitpacking::expand::expand_naive:
	cmp x5, x3
	b.lo .LBB23_13
	cbz x3, .LBB23_12
	ptrue p0.d
	mov x9, xzr
	mov w8, wzr
	mov x15, xzr
	mov x11, xzr
	mov x10, xzr
	mov x12, #-1
	b .LBB23_4
.LBB23_3:
	add x14, x9, #1
	str x17, [x4, x9, lsl #3]
	sub w8, w8, w13
	cmp x14, x3
	mov x9, x14
	mov x15, x16
	b.eq .LBB23_12
.LBB23_4:
	ldr x14, [x2, x9, lsl #3]
	fmov d0, x14
	cnt z0.d, p0/m, z0.d
	fmov x13, d0
	cmp w8, w13
	b.hs .LBB23_9
	cmp x10, x1
	b.hs .LBB23_7
	ldr x16, [x0, x10, lsl #3]
	b .LBB23_8
.LBB23_7:
	mov x16, xzr
.LBB23_8:
	lsr x17, x16, #1
	mvn w18, w8
	mov w5, w8
	lsl x16, x16, x5
	tst x5, #0x40
	add x10, x10, #1
	lsr x17, x17, x18
	add w8, w8, #64
	csel x17, x16, x17, ne
	csel x16, xzr, x16, ne
	orr x11, x17, x11
	orr x15, x16, x15
.LBB23_9:
	lsl x16, x11, #1
	mvn w17, w13
	lsr x18, x15, x13
	lsr x11, x11, x13
	tst x13, #0x40
	lsl x16, x16, x17
	lsl x17, x12, x13
	orr x16, x16, x18
	csel x5, xzr, x17, ne
	mov x17, xzr
	csel x16, x11, x16, ne
	csel x11, xzr, x11, ne
	cbz x14, .LBB23_3
	mov w18, wzr
	bic x15, x15, x5
.LBB23_11:
	lsr x5, x15, x18
	neg x6, x14
	sub x7, x14, #1
	and x6, x14, x6
	ands x14, x7, x14
	add w18, w18, #1
	sbfx x5, x5, #0, #1
	and x5, x5, x6
	orr x17, x5, x17
	b.ne .LBB23_11
	b .LBB23_3
.LBB23_12:
	ret
.LBB23_13:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	mov w1, #41
	bl core::panicking::panic
