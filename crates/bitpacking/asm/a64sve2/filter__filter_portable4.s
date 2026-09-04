bitpacking::filter::filter_portable4:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB31_27
	lsr x9, x1, #2
	mov x8, x0
	cbz x9, .LBB31_16
	ptrue p0.d, vl2
	mov w12, wzr
	mov x13, xzr
	mov x14, xzr
	mov x0, xzr
	mov x10, x8
	mov x11, x2
	b .LBB31_4
.LBB31_3:
	subs x9, x9, #1
	add x11, x11, #32
	add x10, x10, #32
	b.eq .LBB31_17
.LBB31_4:
	ldp q2, q0, [x11]
	and w17, w12, #0x7f
	mvn w18, w12
	tst x17, #0x40
	mvn v1.16b, v2.16b
	add v4.2d, v1.2d, v1.2d
	shl v3.2d, v1.2d, #2
	eor3 z3.d, z3.d, z1.d, z4.d
	shl v1.2d, v3.2d, #2
	eor v3.16b, v1.16b, v4.16b
	shl v5.2d, v3.2d, #4
	mov z6.d, z5.d
	eor3 z6.d, z6.d, z1.d, z4.d
	shl v1.2d, v6.2d, #8
	mov z7.d, z1.d
	eor3 z7.d, z7.d, z5.d, z3.d
	shl v5.2d, v7.2d, #16
	mov z3.d, z5.d
	eor3 z3.d, z3.d, z1.d, z6.d
	shl v3.2d, v3.2d, #32
	eor3 z3.d, z3.d, z5.d, z7.d
	bic v1.16b, v4.16b, v3.16b
	add v5.2d, v1.2d, v1.2d
	mov z6.d, z5.d
	bcax z6.d, z6.d, z4.d, z3.d
	shl v4.2d, v6.2d, #2
	mov z7.d, z4.d
	eor3 z7.d, z7.d, z5.d, z1.d
	shl v5.2d, v7.2d, #4
	mov z16.d, z5.d
	eor3 z16.d, z16.d, z4.d, z6.d
	shl v4.2d, v16.2d, #8
	mov z6.d, z4.d
	eor3 z6.d, z6.d, z5.d, z7.d
	shl v5.2d, v6.2d, #16
	mov z7.d, z5.d
	eor3 z7.d, z7.d, z4.d, z16.d
	shl v4.2d, v7.2d, #32
	eor3 z4.d, z4.d, z5.d, z6.d
	bic v6.16b, v1.16b, v4.16b
	add v5.2d, v6.2d, v6.2d
	mov z7.d, z5.d
	bcax z7.d, z7.d, z1.d, z4.d
	shl v1.2d, v7.2d, #2
	mov z16.d, z1.d
	eor3 z16.d, z16.d, z5.d, z6.d
	shl v5.2d, v16.2d, #4
	mov z17.d, z5.d
	eor3 z17.d, z17.d, z1.d, z7.d
	shl v1.2d, v17.2d, #8
	mov z7.d, z1.d
	eor3 z7.d, z7.d, z5.d, z16.d
	shl v16.2d, v7.2d, #16
	mov z5.d, z16.d
	eor3 z5.d, z5.d, z1.d, z17.d
	shl v5.2d, v5.2d, #32
	eor3 z5.d, z5.d, z16.d, z7.d
	bic v1.16b, v6.16b, v5.16b
	add v7.2d, v1.2d, v1.2d
	mov z16.d, z7.d
	bcax z16.d, z16.d, z6.d, z5.d
	shl v6.2d, v16.2d, #2
	mov z17.d, z6.d
	eor3 z17.d, z17.d, z7.d, z1.d
	shl v7.2d, v17.2d, #4
	mov z18.d, z7.d
	eor3 z18.d, z18.d, z6.d, z16.d
	shl v6.2d, v18.2d, #8
	mov z16.d, z6.d
	eor3 z16.d, z16.d, z7.d, z17.d
	shl v7.2d, v16.2d, #16
	mov z17.d, z7.d
	eor3 z17.d, z17.d, z6.d, z18.d
	shl v6.2d, v17.2d, #32
	eor3 z6.d, z6.d, z7.d, z16.d
	bic v16.16b, v1.16b, v6.16b
	add v7.2d, v16.2d, v16.2d
	mov z17.d, z7.d
	bcax z17.d, z17.d, z1.d, z6.d
	shl v1.2d, v17.2d, #2
	mov z18.d, z1.d
	eor3 z18.d, z18.d, z7.d, z16.d
	shl v7.2d, v18.2d, #4
	mov z19.d, z7.d
	eor3 z19.d, z19.d, z1.d, z17.d
	shl v1.2d, v19.2d, #8
	mov z17.d, z1.d
	eor3 z17.d, z17.d, z7.d, z18.d
	shl v18.2d, v17.2d, #16
	mov z7.d, z18.d
	eor3 z7.d, z7.d, z1.d, z19.d
	shl v7.2d, v7.2d, #32
	eor3 z7.d, z7.d, z18.d, z17.d
	and v18.16b, v3.16b, v2.16b
	ldp q17, q1, [x10]
	eor v20.16b, v18.16b, v2.16b
	ushr v18.2d, v18.2d, #1
	bic v19.16b, v16.16b, v7.16b
	and v17.16b, v17.16b, v2.16b
	cnt z2.d, p0/m, z2.d
	orr v18.16b, v20.16b, v18.16b
	add v21.2d, v19.2d, v19.2d
	and v3.16b, v3.16b, v17.16b
	and v4.16b, v4.16b, v18.16b
	mov z20.d, z21.d
	eor v17.16b, v3.16b, v17.16b
	ushr v3.2d, v3.2d, #1
	bcax z20.d, z20.d, z16.d, z7.d
	orr v3.16b, v17.16b, v3.16b
	eor v16.16b, v4.16b, v18.16b
	ushr v17.2d, v4.2d, #2
	and v4.16b, v4.16b, v3.16b
	fmov w3, s2
	shl v18.2d, v20.2d, #2
	orr v16.16b, v16.16b, v17.16b
	eor v3.16b, v4.16b, v3.16b
	ushr v4.2d, v4.2d, #2
	add w12, w12, w3
	mov z17.d, z18.d
	and v5.16b, v5.16b, v16.16b
	orr v3.16b, v3.16b, v4.16b
	eor3 z17.d, z17.d, z21.d, z19.d
	eor v4.16b, v5.16b, v16.16b
	ushr v16.2d, v5.2d, #4
	and v5.16b, v5.16b, v3.16b
	orr v4.16b, v4.16b, v16.16b
	shl v19.2d, v17.2d, #4
	eor v3.16b, v5.16b, v3.16b
	ushr v5.2d, v5.2d, #4
	mov z16.d, z19.d
	orr v3.16b, v3.16b, v5.16b
	and v5.16b, v6.16b, v4.16b
	eor3 z16.d, z16.d, z18.d, z20.d
	eor v4.16b, v5.16b, v4.16b
	ushr v18.2d, v5.2d, #8
	and v5.16b, v5.16b, v3.16b
	shl v6.2d, v16.2d, #8
	orr v4.16b, v4.16b, v18.16b
	eor v3.16b, v5.16b, v3.16b
	ushr v5.2d, v5.2d, #8
	mov z20.d, z6.d
	orr v3.16b, v3.16b, v5.16b
	and v5.16b, v7.16b, v4.16b
	eor3 z20.d, z20.d, z19.d, z17.d
	and v17.16b, v5.16b, v3.16b
	eor v4.16b, v5.16b, v4.16b
	ushr v5.2d, v5.2d, #16
	shl v7.2d, v20.2d, #16
	eor v3.16b, v17.16b, v3.16b
	orr v4.16b, v4.16b, v5.16b
	mov z18.d, z7.d
	eor3 z18.d, z18.d, z6.d, z16.d
	ushr v6.2d, v17.2d, #16
	orr v3.16b, v3.16b, v6.16b
	shl v16.2d, v18.2d, #32
	and v4.16b, v4.16b, v3.16b
	eor3 z16.d, z16.d, z7.d, z20.d
	and v4.16b, v4.16b, v16.16b
	eor v3.16b, v4.16b, v3.16b
	ushr v4.2d, v4.2d, #32
	orr v3.16b, v3.16b, v4.16b
	fmov x15, d3
	lsr x16, x15, #1
	lsl x15, x15, x17
	lsr x16, x16, x18
	csel x17, xzr, x15, ne
	orr x13, x17, x13
	csel x16, x15, x16, ne
	cmp w12, #63
	orr x15, x16, x14
	b.ls .LBB31_7
	cmp x0, x5
	b.hs .LBB31_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w12, w12, #64
	mov x13, x15
	mov x15, xzr
.LBB31_7:
	mov x14, v3.d[1]
	mov w16, v2.s[2]
	and w18, w12, #0x7f
	mvn w3, w12
	tst x18, #0x40
	lsr x17, x14, #1
	lsr x17, x17, x3
	lsl x3, x14, x18
	add w14, w12, w16
	csel x12, x3, x17, ne
	csel x17, xzr, x3, ne
	subs w16, w14, #64
	orr x12, x12, x15
	orr x13, x17, x13
	b.lo .LBB31_10
	cmp x0, x5
	b.hs .LBB31_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x12
	mov w14, w16
	mov x12, xzr
.LBB31_10:
	mvn v2.16b, v0.16b
	and v1.16b, v1.16b, v0.16b
	and w17, w14, #0x7f
	mvn w18, w14
	tst x17, #0x40
	add v3.2d, v2.2d, v2.2d
	shl v4.2d, v2.2d, #2
	eor3 z4.d, z4.d, z2.d, z3.d
	shl v2.2d, v4.2d, #2
	eor v4.16b, v2.16b, v3.16b
	shl v5.2d, v4.2d, #4
	mov z6.d, z5.d
	eor3 z6.d, z6.d, z2.d, z3.d
	shl v2.2d, v6.2d, #8
	mov z7.d, z2.d
	eor3 z7.d, z7.d, z5.d, z4.d
	shl v4.2d, v7.2d, #16
	mov z5.d, z4.d
	eor3 z5.d, z5.d, z2.d, z6.d
	shl v2.2d, v5.2d, #32
	eor3 z2.d, z2.d, z4.d, z7.d
	bic v4.16b, v3.16b, v2.16b
	add v5.2d, v4.2d, v4.2d
	mov z6.d, z5.d
	bcax z6.d, z6.d, z3.d, z2.d
	shl v3.2d, v6.2d, #2
	mov z7.d, z3.d
	eor3 z7.d, z7.d, z5.d, z4.d
	shl v5.2d, v7.2d, #4
	mov z16.d, z5.d
	eor3 z16.d, z16.d, z3.d, z6.d
	shl v3.2d, v16.2d, #8
	mov z6.d, z3.d
	eor3 z6.d, z6.d, z5.d, z7.d
	shl v5.2d, v6.2d, #16
	mov z7.d, z5.d
	eor3 z7.d, z7.d, z3.d, z16.d
	shl v3.2d, v7.2d, #32
	eor3 z3.d, z3.d, z5.d, z6.d
	bic v5.16b, v4.16b, v3.16b
	add v6.2d, v5.2d, v5.2d
	mov z7.d, z6.d
	bcax z7.d, z7.d, z4.d, z3.d
	shl v4.2d, v7.2d, #2
	mov z16.d, z4.d
	eor3 z16.d, z16.d, z6.d, z5.d
	shl v6.2d, v16.2d, #4
	mov z17.d, z6.d
	eor3 z17.d, z17.d, z4.d, z7.d
	shl v4.2d, v17.2d, #8
	mov z7.d, z4.d
	eor3 z7.d, z7.d, z6.d, z16.d
	shl v6.2d, v7.2d, #16
	mov z16.d, z6.d
	eor3 z16.d, z16.d, z4.d, z17.d
	shl v4.2d, v16.2d, #32
	eor3 z4.d, z4.d, z6.d, z7.d
	bic v6.16b, v5.16b, v4.16b
	add v7.2d, v6.2d, v6.2d
	mov z16.d, z7.d
	bcax z16.d, z16.d, z5.d, z4.d
	shl v5.2d, v16.2d, #2
	mov z17.d, z5.d
	eor3 z17.d, z17.d, z7.d, z6.d
	shl v7.2d, v17.2d, #4
	mov z18.d, z7.d
	eor3 z18.d, z18.d, z5.d, z16.d
	shl v5.2d, v18.2d, #8
	mov z16.d, z5.d
	eor3 z16.d, z16.d, z7.d, z17.d
	shl v7.2d, v16.2d, #16
	mov z17.d, z7.d
	eor3 z17.d, z17.d, z5.d, z18.d
	shl v5.2d, v17.2d, #32
	eor3 z5.d, z5.d, z7.d, z16.d
	bic v7.16b, v6.16b, v5.16b
	add v16.2d, v7.2d, v7.2d
	mov z17.d, z16.d
	bcax z17.d, z17.d, z6.d, z5.d
	shl v6.2d, v17.2d, #2
	mov z18.d, z6.d
	eor3 z18.d, z18.d, z16.d, z7.d
	shl v16.2d, v18.2d, #4
	mov z19.d, z16.d
	eor3 z19.d, z19.d, z6.d, z17.d
	shl v6.2d, v19.2d, #8
	mov z17.d, z6.d
	eor3 z17.d, z17.d, z16.d, z18.d
	shl v16.2d, v17.2d, #16
	mov z18.d, z16.d
	eor3 z18.d, z18.d, z6.d, z19.d
	shl v6.2d, v18.2d, #32
	eor3 z6.d, z6.d, z16.d, z17.d
	and v16.16b, v2.16b, v0.16b
	and v2.16b, v2.16b, v1.16b
	eor v18.16b, v16.16b, v0.16b
	ushr v16.2d, v16.2d, #1
	eor v1.16b, v2.16b, v1.16b
	bic v17.16b, v7.16b, v6.16b
	ushr v2.2d, v2.2d, #1
	cnt z0.d, p0/m, z0.d
	orr v16.16b, v18.16b, v16.16b
	add v19.2d, v17.2d, v17.2d
	orr v1.16b, v1.16b, v2.16b
	and v3.16b, v3.16b, v16.16b
	mov z18.d, z19.d
	eor v2.16b, v3.16b, v16.16b
	bcax z18.d, z18.d, z7.d, z6.d
	ushr v7.2d, v3.2d, #2
	and v3.16b, v3.16b, v1.16b
	orr v2.16b, v2.16b, v7.16b
	eor v1.16b, v3.16b, v1.16b
	ushr v3.2d, v3.2d, #2
	shl v16.2d, v18.2d, #2
	fmov w3, s0
	and v4.16b, v4.16b, v2.16b
	orr v1.16b, v1.16b, v3.16b
	mov z7.d, z16.d
	eor v2.16b, v4.16b, v2.16b
	ushr v3.2d, v4.2d, #4
	and v4.16b, v4.16b, v1.16b
	eor3 z7.d, z7.d, z19.d, z17.d
	orr v2.16b, v2.16b, v3.16b
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #4
	shl v17.2d, v7.2d, #4
	orr v1.16b, v1.16b, v4.16b
	and v4.16b, v5.16b, v2.16b
	mov z3.d, z17.d
	eor v2.16b, v4.16b, v2.16b
	eor3 z3.d, z3.d, z16.d, z18.d
	ushr v16.2d, v4.2d, #8
	and v4.16b, v4.16b, v1.16b
	orr v2.16b, v2.16b, v16.16b
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #8
	shl v5.2d, v3.2d, #8
	orr v1.16b, v1.16b, v4.16b
	and v4.16b, v6.16b, v2.16b
	mov z18.d, z5.d
	eor v2.16b, v4.16b, v2.16b
	eor3 z18.d, z18.d, z17.d, z7.d
	and v7.16b, v4.16b, v1.16b
	eor v1.16b, v7.16b, v1.16b
	shl v6.2d, v18.2d, #16
	mov z16.d, z6.d
	eor3 z16.d, z16.d, z5.d, z3.d
	ushr v3.2d, v4.2d, #16
	ushr v4.2d, v7.2d, #16
	orr v2.16b, v2.16b, v3.16b
	orr v1.16b, v1.16b, v4.16b
	shl v5.2d, v16.2d, #32
	and v2.16b, v2.16b, v1.16b
	eor3 z5.d, z5.d, z6.d, z18.d
	and v2.16b, v2.16b, v5.16b
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #32
	orr v1.16b, v1.16b, v2.16b
	fmov x15, d1
	lsr x16, x15, #1
	lsr x16, x16, x18
	lsl x18, x15, x17
	add w15, w14, w3
	csel x14, x18, x16, ne
	csel x17, xzr, x18, ne
	subs w16, w15, #64
	orr x14, x14, x12
	orr x13, x17, x13
	b.lo .LBB31_13
	cmp x0, x5
	b.hs .LBB31_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x14
	mov w15, w16
	mov x14, xzr
.LBB31_13:
	mov x12, v1.d[1]
	mov w16, v0.s[2]
	and w18, w15, #0x7f
	mvn w3, w15
	tst x18, #0x40
	lsr x17, x12, #1
	lsr x17, x17, x3
	lsl x3, x12, x18
	add w12, w15, w16
	csel x16, x3, x17, ne
	csel x17, xzr, x3, ne
	subs w15, w12, #64
	orr x14, x16, x14
	orr x13, x17, x13
	b.lo .LBB31_3
	cmp x0, x5
	b.hs .LBB31_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x14
	mov w12, w15
	mov x14, xzr
	b .LBB31_3
.LBB31_16:
	mov x0, xzr
	mov x13, xzr
	mov x14, xzr
	mov w12, wzr
.LBB31_17:
	and x9, x1, #0x3
	cbz x9, .LBB31_23
	lsl x10, x1, #3
	ptrue p0.d
	and x10, x10, #0x7fffffffffffffe0
	add x8, x8, x10
	add x10, x2, x10
	b .LBB31_20
.LBB31_19:
	subs x9, x9, #1
	b.eq .LBB31_23
.LBB31_20:
	ldr x11, [x10], #8
	ldr x3, [x8], #8
	mvn x15, x11
	fmov d0, x11
	lsl x16, x15, #1
	and x3, x11, x3
	eor x15, x16, x15, lsl #2
	cnt z0.d, p0/m, z0.d
	eon x15, x11, x15
	eor x15, x16, x15, lsl #2
	eor x15, x15, x15, lsl #4
	eor x15, x15, x15, lsl #8
	eor x15, x15, x15, lsl #16
	eor x15, x15, x15, lsl #32
	bic x16, x16, x15
	and x6, x15, x11
	and x15, x15, x3
	eor x17, x16, x16, lsl #1
	eor x7, x6, x11
	eor x3, x15, x3
	orr x6, x7, x6, lsr #1
	orr x15, x3, x15, lsr #1
	eor x17, x17, x17, lsl #2
	eor x17, x17, x17, lsl #4
	eor x17, x17, x17, lsl #8
	eor x17, x17, x17, lsl #16
	eor x17, x17, x17, lsl #32
	bic x16, x16, x17
	and x17, x17, x6
	eor x18, x16, x16, lsl #1
	eor x3, x17, x6
	and x6, x17, x15
	orr x17, x3, x17, lsr #2
	eor x15, x6, x15
	eor x18, x18, x18, lsl #2
	orr x15, x15, x6, lsr #2
	eor x18, x18, x18, lsl #4
	eor x18, x18, x18, lsl #8
	eor x18, x18, x18, lsl #16
	eor x18, x18, x18, lsl #32
	bic x16, x16, x18
	and x18, x18, x17
	eor x1, x16, x16, lsl #1
	eor x17, x18, x17
	and x3, x18, x15
	orr x17, x17, x18, lsr #4
	eor x15, x3, x15
	eor x1, x1, x1, lsl #2
	orr x15, x15, x3, lsr #4
	eor x1, x1, x1, lsl #4
	eor x1, x1, x1, lsl #8
	eor x1, x1, x1, lsl #16
	eor x1, x1, x1, lsl #32
	bic x16, x16, x1
	and x18, x1, x17
	eor x2, x16, x16, lsl #1
	eor x17, x18, x17
	and x1, x18, x15
	orr x17, x17, x18, lsr #8
	eor x15, x1, x15
	eor x2, x2, x2, lsl #2
	orr x15, x15, x1, lsr #8
	eor x2, x2, x2, lsl #4
	eor x2, x2, x2, lsl #8
	eor x2, x2, x2, lsl #16
	eor x2, x2, x2, lsl #32
	bic x16, x16, x2
	and x11, x2, x17
	eor x16, x16, x16, lsl #1
	and x18, x11, x15
	eor x17, x11, x17
	eor x15, x18, x15
	orr x11, x17, x11, lsr #16
	mvn w17, w12
	eor x16, x16, x16, lsl #2
	orr x15, x15, x18, lsr #16
	fmov w18, s0
	eor x16, x16, x16, lsl #4
	and x11, x11, x15
	eor x16, x16, x16, lsl #8
	eor x16, x16, x16, lsl #16
	eor x16, x16, x16, lsl #32
	and x11, x16, x11
	and w16, w12, #0x7f
	add w12, w12, w18
	eor x15, x11, x15
	tst x16, #0x40
	orr x11, x15, x11, lsr #32
	lsr x15, x11, #1
	lsl x11, x11, x16
	lsr x15, x15, x17
	csel x15, x11, x15, ne
	csel x11, xzr, x11, ne
	cmp w12, #63
	orr x14, x15, x14
	orr x13, x11, x13
	b.ls .LBB31_19
	cmp x0, x5
	b.hs .LBB31_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w12, w12, #64
	mov x13, x14
	mov x14, xzr
	b .LBB31_19
.LBB31_23:
	cbz w12, .LBB31_26
	cmp x0, x5
	b.hs .LBB31_29
	str x13, [x4, x0, lsl #3]
.LBB31_26:
	lsl x8, x0, #6
	add x0, x8, w12, uxtw
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB31_27:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.52
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.52
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB31_28:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB31_29:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
