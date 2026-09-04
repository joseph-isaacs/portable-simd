bitpacking::filter::filter_portable4:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB29_27
	lsr x9, x1, #2
	mov x8, x0
	cbz x9, .LBB29_16
	mov w12, wzr
	mov x13, xzr
	mov x14, xzr
	mov x0, xzr
	mov x10, x8
	mov x11, x2
	b .LBB29_4
.LBB29_3:
	subs x9, x9, #1
	add x11, x11, #32
	add x10, x10, #32
	b.eq .LBB29_17
.LBB29_4:
	ldp q2, q0, [x11]
	and w17, w12, #0x7f
	mvn w18, w12
	tst x17, #0x40
	mvn v1.16b, v2.16b
	shl v3.2d, v1.2d, #2
	add v4.2d, v1.2d, v1.2d
	eor v1.16b, v3.16b, v1.16b
	eor v1.16b, v1.16b, v4.16b
	shl v1.2d, v1.2d, #2
	eor v1.16b, v1.16b, v4.16b
	shl v3.2d, v1.2d, #4
	eor v1.16b, v3.16b, v1.16b
	shl v3.2d, v1.2d, #8
	eor v1.16b, v3.16b, v1.16b
	shl v3.2d, v1.2d, #16
	eor v1.16b, v3.16b, v1.16b
	shl v3.2d, v1.2d, #32
	eor v3.16b, v3.16b, v1.16b
	bic v1.16b, v4.16b, v3.16b
	and v18.16b, v3.16b, v2.16b
	add v4.2d, v1.2d, v1.2d
	eor v20.16b, v18.16b, v2.16b
	ushr v18.2d, v18.2d, #1
	eor v4.16b, v4.16b, v1.16b
	orr v18.16b, v20.16b, v18.16b
	shl v5.2d, v4.2d, #2
	eor v4.16b, v5.16b, v4.16b
	shl v5.2d, v4.2d, #4
	eor v4.16b, v5.16b, v4.16b
	shl v5.2d, v4.2d, #8
	eor v4.16b, v5.16b, v4.16b
	shl v5.2d, v4.2d, #16
	eor v4.16b, v5.16b, v4.16b
	shl v5.2d, v4.2d, #32
	eor v4.16b, v5.16b, v4.16b
	bic v1.16b, v1.16b, v4.16b
	and v4.16b, v4.16b, v18.16b
	add v5.2d, v1.2d, v1.2d
	eor v5.16b, v5.16b, v1.16b
	shl v6.2d, v5.2d, #2
	eor v5.16b, v6.16b, v5.16b
	shl v6.2d, v5.2d, #4
	eor v5.16b, v6.16b, v5.16b
	shl v6.2d, v5.2d, #8
	eor v5.16b, v6.16b, v5.16b
	shl v6.2d, v5.2d, #16
	eor v5.16b, v6.16b, v5.16b
	shl v6.2d, v5.2d, #32
	eor v5.16b, v6.16b, v5.16b
	bic v1.16b, v1.16b, v5.16b
	add v6.2d, v1.2d, v1.2d
	eor v6.16b, v6.16b, v1.16b
	shl v7.2d, v6.2d, #2
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #4
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #8
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #16
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #32
	eor v6.16b, v7.16b, v6.16b
	bic v7.16b, v1.16b, v6.16b
	add v1.2d, v7.2d, v7.2d
	eor v1.16b, v1.16b, v7.16b
	shl v16.2d, v1.2d, #2
	eor v1.16b, v16.16b, v1.16b
	shl v16.2d, v1.2d, #4
	eor v1.16b, v16.16b, v1.16b
	shl v16.2d, v1.2d, #8
	eor v16.16b, v16.16b, v1.16b
	ldp q17, q1, [x10]
	and v17.16b, v17.16b, v2.16b
	shl v19.2d, v16.2d, #16
	cnt v2.16b, v2.16b
	eor v16.16b, v19.16b, v16.16b
	and v3.16b, v3.16b, v17.16b
	eor v17.16b, v3.16b, v17.16b
	ushr v3.2d, v3.2d, #1
	shl v19.2d, v16.2d, #32
	orr v3.16b, v17.16b, v3.16b
	eor v16.16b, v19.16b, v16.16b
	eor v17.16b, v4.16b, v18.16b
	ushr v18.2d, v4.2d, #2
	and v4.16b, v4.16b, v3.16b
	bic v7.16b, v7.16b, v16.16b
	orr v17.16b, v17.16b, v18.16b
	eor v3.16b, v4.16b, v3.16b
	ushr v4.2d, v4.2d, #2
	add v18.2d, v7.2d, v7.2d
	and v5.16b, v5.16b, v17.16b
	orr v3.16b, v3.16b, v4.16b
	eor v4.16b, v18.16b, v7.16b
	eor v7.16b, v5.16b, v17.16b
	ushr v17.2d, v5.2d, #4
	and v5.16b, v5.16b, v3.16b
	shl v18.2d, v4.2d, #2
	orr v7.16b, v7.16b, v17.16b
	eor v3.16b, v5.16b, v3.16b
	ushr v5.2d, v5.2d, #4
	eor v4.16b, v18.16b, v4.16b
	and v6.16b, v6.16b, v7.16b
	orr v3.16b, v3.16b, v5.16b
	shl v5.2d, v4.2d, #4
	eor v7.16b, v6.16b, v7.16b
	ushr v17.2d, v6.2d, #8
	eor v4.16b, v5.16b, v4.16b
	and v5.16b, v6.16b, v3.16b
	orr v6.16b, v7.16b, v17.16b
	eor v3.16b, v5.16b, v3.16b
	ushr v5.2d, v5.2d, #8
	shl v7.2d, v4.2d, #8
	orr v3.16b, v3.16b, v5.16b
	and v5.16b, v16.16b, v6.16b
	eor v4.16b, v7.16b, v4.16b
	and v7.16b, v5.16b, v3.16b
	shl v16.2d, v4.2d, #16
	eor v6.16b, v5.16b, v6.16b
	ushr v5.2d, v5.2d, #16
	eor v3.16b, v7.16b, v3.16b
	ushr v7.2d, v7.2d, #16
	eor v4.16b, v16.16b, v4.16b
	orr v5.16b, v6.16b, v5.16b
	orr v3.16b, v3.16b, v7.16b
	shl v6.2d, v4.2d, #32
	eor v4.16b, v6.16b, v4.16b
	and v5.16b, v5.16b, v3.16b
	and v4.16b, v5.16b, v4.16b
	uaddlp v5.8h, v2.16b
	eor v3.16b, v4.16b, v3.16b
	ushr v4.2d, v4.2d, #32
	orr v2.16b, v3.16b, v4.16b
	uaddlp v3.4s, v5.8h
	fmov x15, d2
	uaddlp v3.2d, v3.4s
	lsr x16, x15, #1
	fmov w3, s3
	lsl x15, x15, x17
	lsr x16, x16, x18
	csel x17, xzr, x15, ne
	add w12, w12, w3
	orr x13, x17, x13
	csel x16, x15, x16, ne
	cmp w12, #63
	orr x15, x16, x14
	b.ls .LBB29_7
	cmp x0, x5
	b.hs .LBB29_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w12, w12, #64
	mov x13, x15
	mov x15, xzr
.LBB29_7:
	mov x14, v2.d[1]
	mov w16, v3.s[2]
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
	b.lo .LBB29_10
	cmp x0, x5
	b.hs .LBB29_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x12
	mov w14, w16
	mov x12, xzr
.LBB29_10:
	mvn v2.16b, v0.16b
	and v1.16b, v1.16b, v0.16b
	and w17, w14, #0x7f
	mvn w18, w14
	tst x17, #0x40
	shl v3.2d, v2.2d, #2
	add v4.2d, v2.2d, v2.2d
	eor v2.16b, v3.16b, v2.16b
	eor v2.16b, v2.16b, v4.16b
	shl v2.2d, v2.2d, #2
	eor v2.16b, v2.16b, v4.16b
	shl v3.2d, v2.2d, #4
	eor v2.16b, v3.16b, v2.16b
	shl v3.2d, v2.2d, #8
	eor v2.16b, v3.16b, v2.16b
	shl v3.2d, v2.2d, #16
	eor v2.16b, v3.16b, v2.16b
	shl v3.2d, v2.2d, #32
	eor v2.16b, v3.16b, v2.16b
	bic v4.16b, v4.16b, v2.16b
	add v3.2d, v4.2d, v4.2d
	eor v3.16b, v3.16b, v4.16b
	shl v5.2d, v3.2d, #2
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #4
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #8
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #16
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #32
	eor v3.16b, v5.16b, v3.16b
	bic v5.16b, v4.16b, v3.16b
	add v4.2d, v5.2d, v5.2d
	eor v4.16b, v4.16b, v5.16b
	shl v6.2d, v4.2d, #2
	eor v4.16b, v6.16b, v4.16b
	shl v6.2d, v4.2d, #4
	eor v4.16b, v6.16b, v4.16b
	shl v6.2d, v4.2d, #8
	eor v4.16b, v6.16b, v4.16b
	shl v6.2d, v4.2d, #16
	eor v4.16b, v6.16b, v4.16b
	shl v6.2d, v4.2d, #32
	eor v4.16b, v6.16b, v4.16b
	bic v5.16b, v5.16b, v4.16b
	add v6.2d, v5.2d, v5.2d
	eor v6.16b, v6.16b, v5.16b
	shl v7.2d, v6.2d, #2
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #4
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #8
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #16
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #32
	eor v6.16b, v7.16b, v6.16b
	bic v5.16b, v5.16b, v6.16b
	add v7.2d, v5.2d, v5.2d
	eor v7.16b, v7.16b, v5.16b
	shl v16.2d, v7.2d, #2
	eor v7.16b, v16.16b, v7.16b
	shl v16.2d, v7.2d, #4
	eor v7.16b, v16.16b, v7.16b
	shl v16.2d, v7.2d, #8
	eor v7.16b, v16.16b, v7.16b
	and v16.16b, v2.16b, v0.16b
	and v2.16b, v2.16b, v1.16b
	shl v17.2d, v7.2d, #16
	eor v18.16b, v16.16b, v0.16b
	ushr v16.2d, v16.2d, #1
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #1
	cnt v0.16b, v0.16b
	eor v7.16b, v17.16b, v7.16b
	orr v16.16b, v18.16b, v16.16b
	orr v1.16b, v1.16b, v2.16b
	shl v17.2d, v7.2d, #32
	and v3.16b, v3.16b, v16.16b
	eor v2.16b, v17.16b, v7.16b
	eor v7.16b, v3.16b, v16.16b
	ushr v16.2d, v3.2d, #2
	and v3.16b, v3.16b, v1.16b
	bic v5.16b, v5.16b, v2.16b
	orr v7.16b, v7.16b, v16.16b
	eor v1.16b, v3.16b, v1.16b
	ushr v3.2d, v3.2d, #2
	add v16.2d, v5.2d, v5.2d
	and v4.16b, v4.16b, v7.16b
	orr v1.16b, v1.16b, v3.16b
	eor v3.16b, v16.16b, v5.16b
	eor v5.16b, v4.16b, v7.16b
	ushr v7.2d, v4.2d, #4
	and v4.16b, v4.16b, v1.16b
	shl v16.2d, v3.2d, #2
	orr v5.16b, v5.16b, v7.16b
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #4
	eor v3.16b, v16.16b, v3.16b
	and v6.16b, v6.16b, v5.16b
	orr v1.16b, v1.16b, v4.16b
	shl v4.2d, v3.2d, #4
	eor v5.16b, v6.16b, v5.16b
	ushr v7.2d, v6.2d, #8
	eor v3.16b, v4.16b, v3.16b
	and v4.16b, v6.16b, v1.16b
	orr v5.16b, v5.16b, v7.16b
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #8
	shl v6.2d, v3.2d, #8
	and v2.16b, v2.16b, v5.16b
	orr v1.16b, v1.16b, v4.16b
	eor v3.16b, v6.16b, v3.16b
	eor v5.16b, v2.16b, v5.16b
	and v4.16b, v2.16b, v1.16b
	shl v6.2d, v3.2d, #16
	ushr v2.2d, v2.2d, #16
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #16
	eor v3.16b, v6.16b, v3.16b
	orr v2.16b, v5.16b, v2.16b
	orr v1.16b, v1.16b, v4.16b
	shl v4.2d, v3.2d, #32
	eor v3.16b, v4.16b, v3.16b
	and v2.16b, v2.16b, v1.16b
	and v2.16b, v2.16b, v3.16b
	uaddlp v3.8h, v0.16b
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #32
	orr v0.16b, v1.16b, v2.16b
	uaddlp v1.4s, v3.8h
	fmov x15, d0
	uaddlp v1.2d, v1.4s
	lsr x16, x15, #1
	fmov w3, s1
	lsr x16, x16, x18
	lsl x18, x15, x17
	add w15, w14, w3
	csel x14, x18, x16, ne
	csel x17, xzr, x18, ne
	subs w16, w15, #64
	orr x14, x14, x12
	orr x13, x17, x13
	b.lo .LBB29_13
	cmp x0, x5
	b.hs .LBB29_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x14
	mov w15, w16
	mov x14, xzr
.LBB29_13:
	mov x12, v0.d[1]
	mov w16, v1.s[2]
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
	b.lo .LBB29_3
	cmp x0, x5
	b.hs .LBB29_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	mov x13, x14
	mov w12, w15
	mov x14, xzr
	b .LBB29_3
.LBB29_16:
	mov x0, xzr
	mov x13, xzr
	mov x14, xzr
	mov w12, wzr
.LBB29_17:
	and x9, x1, #0x3
	cbz x9, .LBB29_23
	lsl x10, x1, #3
	and x10, x10, #0x7fffffffffffffe0
	add x8, x8, x10
	add x10, x2, x10
	b .LBB29_20
.LBB29_19:
	subs x9, x9, #1
	b.eq .LBB29_23
.LBB29_20:
	ldr x11, [x10], #8
	ldr x3, [x8], #8
	mvn x15, x11
	fmov d0, x11
	lsl x16, x15, #1
	and x3, x11, x3
	eor x15, x16, x15, lsl #2
	cnt v0.8b, v0.8b
	eon x15, x11, x15
	eor x15, x16, x15, lsl #2
	addv b0, v0.8b
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
	and x18, x2, x17
	eor x16, x16, x16, lsl #1
	and x1, x18, x15
	eor x17, x18, x17
	eor x15, x1, x15
	orr x17, x17, x18, lsr #16
	fmov w18, s0
	eor x16, x16, x16, lsl #2
	orr x15, x15, x1, lsr #16
	eor x16, x16, x16, lsl #4
	and x11, x17, x15
	mvn w17, w12
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
	b.ls .LBB29_19
	cmp x0, x5
	b.hs .LBB29_28
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w12, w12, #64
	mov x13, x14
	mov x14, xzr
	b .LBB29_19
.LBB29_23:
	cbz w12, .LBB29_26
	cmp x0, x5
	b.hs .LBB29_29
	str x13, [x4, x0, lsl #3]
.LBB29_26:
	lsl x8, x0, #6
	add x0, x8, w12, uxtw
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB29_27:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.50
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.50
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB29_28:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB29_29:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
