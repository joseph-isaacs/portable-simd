bitpacking::expand::expand_sve2:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x5, x3
	b.lo .LBB22_10
	cbz x3, .LBB22_9
	ptrue p0.d
	mov w8, wzr
	mov x11, xzr
	mov x12, xzr
	mov x9, xzr
	mov x10, #-1
	b .LBB22_6
.LBB22_3:
	ldr x15, [x0, x9, lsl #3]
.LBB22_4:
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
.LBB22_5:
	lsl x15, x10, x13
	lsl x16, x12, #1
	tst x13, #0x40
	mvn w17, w13
	lsr x12, x12, x13
	fmov d1, x14
	csel x15, xzr, x15, ne
	lsl x16, x16, x17
	lsr x17, x11, x13
	bic x11, x11, x15
	sub w8, w8, w13
	orr x15, x16, x17
	fmov d0, x11
	csel x11, x12, x15, ne
	csel x12, xzr, x12, ne
	bdep z0.d, z0.d, z1.d
	subs x3, x3, #1
	str d0, [x4], #8
	b.eq .LBB22_9
.LBB22_6:
	ldr x14, [x2], #8
	fmov d0, x14
	cnt z0.d, p0/m, z0.d
	fmov x13, d0
	cmp w8, w13
	b.hs .LBB22_5
	cmp x9, x1
	b.lo .LBB22_3
	mov x15, xzr
	b .LBB22_4
.LBB22_9:
	ldp x29, x30, [sp], #16
	ret
.LBB22_10:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.2
	mov w1, #41
	bl core::panicking::panic
