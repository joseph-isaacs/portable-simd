bitpacking::filter::filter_portable_branchless:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB32_23
	lsr x9, x1, #3
	mov x8, x0
	cbz x9, .LBB32_13
	mov w14, wzr
	mov x13, xzr
	mov x12, xzr
	mov x0, xzr
	mov x10, x8
	mov x11, x2
.LBB32_3:
	cmp x0, x5
	b.hs .LBB32_24
	ldp q0, q3, [x11]
	mov w15, w14
	tst x15, #0x40
	mvn v1.16b, v0.16b
	shl v2.2d, v1.2d, #2
	add v4.2d, v1.2d, v1.2d
	eor v1.16b, v2.16b, v1.16b
	eor v1.16b, v1.16b, v4.16b
	shl v1.2d, v1.2d, #2
	eor v1.16b, v1.16b, v4.16b
	shl v2.2d, v1.2d, #4
	eor v1.16b, v2.16b, v1.16b
	shl v2.2d, v1.2d, #8
	eor v1.16b, v2.16b, v1.16b
	shl v2.2d, v1.2d, #16
	eor v1.16b, v2.16b, v1.16b
	shl v2.2d, v1.2d, #32
	eor v1.16b, v2.16b, v1.16b
	bic v4.16b, v4.16b, v1.16b
	and v18.16b, v1.16b, v0.16b
	add v2.2d, v4.2d, v4.2d
	eor v20.16b, v18.16b, v0.16b
	ushr v18.2d, v18.2d, #1
	eor v2.16b, v2.16b, v4.16b
	orr v18.16b, v20.16b, v18.16b
	shl v5.2d, v2.2d, #2
	eor v2.16b, v5.16b, v2.16b
	shl v5.2d, v2.2d, #4
	eor v2.16b, v5.16b, v2.16b
	shl v5.2d, v2.2d, #8
	eor v2.16b, v5.16b, v2.16b
	shl v5.2d, v2.2d, #16
	eor v2.16b, v5.16b, v2.16b
	shl v5.2d, v2.2d, #32
	eor v2.16b, v5.16b, v2.16b
	bic v5.16b, v4.16b, v2.16b
	and v2.16b, v2.16b, v18.16b
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
	bic v7.16b, v5.16b, v6.16b
	add v5.2d, v7.2d, v7.2d
	eor v5.16b, v5.16b, v7.16b
	shl v16.2d, v5.2d, #2
	eor v5.16b, v16.16b, v5.16b
	shl v16.2d, v5.2d, #4
	eor v5.16b, v16.16b, v5.16b
	shl v16.2d, v5.2d, #8
	eor v16.16b, v16.16b, v5.16b
	ldp q17, q5, [x10]
	and v17.16b, v17.16b, v0.16b
	shl v19.2d, v16.2d, #16
	cnt v0.16b, v0.16b
	and v1.16b, v1.16b, v17.16b
	eor v16.16b, v19.16b, v16.16b
	uaddlp v0.8h, v0.16b
	eor v17.16b, v1.16b, v17.16b
	ushr v1.2d, v1.2d, #1
	shl v19.2d, v16.2d, #32
	uaddlp v0.4s, v0.8h
	orr v1.16b, v17.16b, v1.16b
	eor v16.16b, v19.16b, v16.16b
	eor v17.16b, v2.16b, v18.16b
	ushr v18.2d, v2.2d, #2
	and v2.16b, v2.16b, v1.16b
	bic v7.16b, v7.16b, v16.16b
	orr v17.16b, v17.16b, v18.16b
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #2
	add v18.2d, v7.2d, v7.2d
	and v4.16b, v4.16b, v17.16b
	orr v1.16b, v1.16b, v2.16b
	eor v2.16b, v18.16b, v7.16b
	eor v7.16b, v4.16b, v17.16b
	ushr v17.2d, v4.2d, #4
	and v4.16b, v4.16b, v1.16b
	shl v18.2d, v2.2d, #2
	orr v7.16b, v7.16b, v17.16b
	eor v1.16b, v4.16b, v1.16b
	ushr v4.2d, v4.2d, #4
	eor v2.16b, v18.16b, v2.16b
	and v6.16b, v6.16b, v7.16b
	orr v1.16b, v1.16b, v4.16b
	shl v4.2d, v2.2d, #4
	eor v7.16b, v6.16b, v7.16b
	ushr v17.2d, v6.2d, #8
	and v6.16b, v6.16b, v1.16b
	eor v2.16b, v4.16b, v2.16b
	orr v4.16b, v7.16b, v17.16b
	eor v1.16b, v6.16b, v1.16b
	ushr v6.2d, v6.2d, #8
	shl v7.2d, v2.2d, #8
	orr v1.16b, v1.16b, v6.16b
	and v6.16b, v16.16b, v4.16b
	eor v2.16b, v7.16b, v2.16b
	and v7.16b, v6.16b, v1.16b
	shl v16.2d, v2.2d, #16
	eor v4.16b, v6.16b, v4.16b
	ushr v6.2d, v6.2d, #16
	eor v1.16b, v7.16b, v1.16b
	ushr v7.2d, v7.2d, #16
	eor v2.16b, v16.16b, v2.16b
	orr v4.16b, v4.16b, v6.16b
	orr v1.16b, v1.16b, v7.16b
	shl v6.2d, v2.2d, #32
	uaddlp v7.2d, v0.4s
	and v4.16b, v4.16b, v1.16b
	eor v2.16b, v6.16b, v2.16b
	fmov w17, s7
	and v2.16b, v4.16b, v2.16b
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #32
	orr v6.16b, v1.16b, v2.16b
	ldp q2, q0, [x11, #32]
	ldp q4, q1, [x10, #32]
	fmov x16, d6
	lsr x18, x16, #1
	lsl x3, x16, x15
	add w16, w14, w17
	mvn w15, w14
	lsr w14, w16, #6
	lsr x15, x18, x15
	csel x17, xzr, x3, ne
	orr x13, x17, x13
	str x13, [x4, x0, lsl #3]
	add x0, x0, x14
	csel x17, x3, x15, ne
	cmp x0, x5
	b.hs .LBB32_24
	mov w18, v7.s[2]
	mov x15, v6.d[1]
	and w14, w16, #0x3f
	orr x17, x17, x12
	and w3, w16, #0x40
	tst x3, #0x40
	csel x13, x17, x13, ne
	add w12, w14, w18
	lsl x16, x15, x16
	lsr w18, w12, #6
	orr x13, x16, x13
	str x13, [x4, x0, lsl #3]
	csel x16, xzr, x17, ne
	add x0, x0, x18
	cmp x0, x5
	b.hs .LBB32_24
	mvn v6.16b, v3.16b
	and v5.16b, v5.16b, v3.16b
	lsr x15, x15, #1
	eor x14, x14, #0x3f
	and w18, w12, #0x40
	lsr x14, x15, x14
	tst x18, #0x40
	shl v7.2d, v6.2d, #2
	add v16.2d, v6.2d, v6.2d
	orr x17, x14, x16
	and w14, w12, #0x3f
	csel x13, x17, x13, ne
	eor v6.16b, v7.16b, v6.16b
	eor v6.16b, v6.16b, v16.16b
	shl v6.2d, v6.2d, #2
	eor v6.16b, v6.16b, v16.16b
	shl v7.2d, v6.2d, #4
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #8
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #16
	eor v6.16b, v7.16b, v6.16b
	shl v7.2d, v6.2d, #32
	eor v6.16b, v7.16b, v6.16b
	bic v16.16b, v16.16b, v6.16b
	add v7.2d, v16.2d, v16.2d
	eor v7.16b, v7.16b, v16.16b
	shl v17.2d, v7.2d, #2
	eor v7.16b, v17.16b, v7.16b
	shl v17.2d, v7.2d, #4
	eor v7.16b, v17.16b, v7.16b
	shl v17.2d, v7.2d, #8
	eor v7.16b, v17.16b, v7.16b
	shl v17.2d, v7.2d, #16
	eor v7.16b, v17.16b, v7.16b
	shl v17.2d, v7.2d, #32
	eor v7.16b, v17.16b, v7.16b
	bic v17.16b, v16.16b, v7.16b
	add v16.2d, v17.2d, v17.2d
	eor v16.16b, v16.16b, v17.16b
	shl v18.2d, v16.2d, #2
	eor v16.16b, v18.16b, v16.16b
	shl v18.2d, v16.2d, #4
	eor v16.16b, v18.16b, v16.16b
	shl v18.2d, v16.2d, #8
	eor v16.16b, v18.16b, v16.16b
	shl v18.2d, v16.2d, #16
	eor v16.16b, v18.16b, v16.16b
	shl v18.2d, v16.2d, #32
	eor v16.16b, v18.16b, v16.16b
	bic v17.16b, v17.16b, v16.16b
	add v18.2d, v17.2d, v17.2d
	eor v18.16b, v18.16b, v17.16b
	shl v19.2d, v18.2d, #2
	eor v18.16b, v19.16b, v18.16b
	shl v19.2d, v18.2d, #4
	eor v18.16b, v19.16b, v18.16b
	shl v19.2d, v18.2d, #8
	eor v18.16b, v19.16b, v18.16b
	shl v19.2d, v18.2d, #16
	eor v18.16b, v19.16b, v18.16b
	shl v19.2d, v18.2d, #32
	eor v18.16b, v19.16b, v18.16b
	bic v17.16b, v17.16b, v18.16b
	add v19.2d, v17.2d, v17.2d
	eor v19.16b, v19.16b, v17.16b
	shl v20.2d, v19.2d, #2
	eor v19.16b, v20.16b, v19.16b
	shl v20.2d, v19.2d, #4
	eor v19.16b, v20.16b, v19.16b
	shl v20.2d, v19.2d, #8
	eor v19.16b, v20.16b, v19.16b
	and v20.16b, v6.16b, v3.16b
	and v6.16b, v6.16b, v5.16b
	shl v21.2d, v19.2d, #16
	eor v22.16b, v20.16b, v3.16b
	ushr v20.2d, v20.2d, #1
	eor v5.16b, v6.16b, v5.16b
	ushr v6.2d, v6.2d, #1
	cnt v3.16b, v3.16b
	eor v19.16b, v21.16b, v19.16b
	orr v20.16b, v22.16b, v20.16b
	orr v5.16b, v5.16b, v6.16b
	uaddlp v3.8h, v3.16b
	shl v21.2d, v19.2d, #32
	and v7.16b, v7.16b, v20.16b
	uaddlp v3.4s, v3.8h
	eor v6.16b, v21.16b, v19.16b
	eor v19.16b, v7.16b, v20.16b
	ushr v20.2d, v7.2d, #2
	and v7.16b, v7.16b, v5.16b
	bic v17.16b, v17.16b, v6.16b
	orr v19.16b, v19.16b, v20.16b
	eor v5.16b, v7.16b, v5.16b
	ushr v7.2d, v7.2d, #2
	add v20.2d, v17.2d, v17.2d
	and v16.16b, v16.16b, v19.16b
	orr v5.16b, v5.16b, v7.16b
	eor v7.16b, v20.16b, v17.16b
	eor v17.16b, v16.16b, v19.16b
	ushr v19.2d, v16.2d, #4
	and v16.16b, v16.16b, v5.16b
	shl v20.2d, v7.2d, #2
	orr v17.16b, v17.16b, v19.16b
	eor v5.16b, v16.16b, v5.16b
	ushr v16.2d, v16.2d, #4
	eor v7.16b, v20.16b, v7.16b
	and v18.16b, v18.16b, v17.16b
	orr v5.16b, v5.16b, v16.16b
	shl v16.2d, v7.2d, #4
	eor v17.16b, v18.16b, v17.16b
	ushr v19.2d, v18.2d, #8
	eor v7.16b, v16.16b, v7.16b
	and v16.16b, v18.16b, v5.16b
	orr v17.16b, v17.16b, v19.16b
	eor v5.16b, v16.16b, v5.16b
	ushr v16.2d, v16.2d, #8
	shl v18.2d, v7.2d, #8
	and v6.16b, v6.16b, v17.16b
	orr v5.16b, v5.16b, v16.16b
	eor v7.16b, v18.16b, v7.16b
	eor v17.16b, v6.16b, v17.16b
	and v16.16b, v6.16b, v5.16b
	shl v18.2d, v7.2d, #16
	ushr v6.2d, v6.2d, #16
	eor v5.16b, v16.16b, v5.16b
	ushr v16.2d, v16.2d, #16
	eor v7.16b, v18.16b, v7.16b
	orr v6.16b, v17.16b, v6.16b
	orr v5.16b, v5.16b, v16.16b
	shl v16.2d, v7.2d, #32
	eor v7.16b, v16.16b, v7.16b
	and v6.16b, v6.16b, v5.16b
	and v6.16b, v6.16b, v7.16b
	eor v7.16b, v6.16b, v5.16b
	ushr v6.2d, v6.2d, #32
	uaddlp v5.2d, v3.4s
	orr v3.16b, v7.16b, v6.16b
	fmov w15, s5
	add w16, w14, w15
	fmov x15, d3
	lsr w18, w16, #6
	lsl x12, x15, x12
	orr x13, x12, x13
	str x13, [x4, x0, lsl #3]
	add x0, x0, x18
	csel x12, xzr, x17, ne
	cmp x0, x5
	b.hs .LBB32_24
	lsr x17, x15, #1
	mov w18, v5.s[2]
	eor x14, x14, #0x3f
	mov x15, v3.d[1]
	and w3, w16, #0x40
	lsr x17, x17, x14
	and w14, w16, #0x3f
	tst x3, #0x40
	orr x17, x17, x12
	add w12, w14, w18
	lsl x16, x15, x16
	lsr w18, w12, #6
	csel x13, x17, x13, ne
	orr x13, x16, x13
	str x13, [x4, x0, lsl #3]
	add x0, x0, x18
	csel x16, xzr, x17, ne
	cmp x0, x5
	b.hs .LBB32_24
	mvn v3.16b, v2.16b
	and v4.16b, v4.16b, v2.16b
	lsr x15, x15, #1
	eor x14, x14, #0x3f
	and w18, w12, #0x40
	lsr x14, x15, x14
	tst x18, #0x40
	shl v5.2d, v3.2d, #2
	add v6.2d, v3.2d, v3.2d
	orr x17, x14, x16
	and w14, w12, #0x3f
	csel x13, x17, x13, ne
	eor v3.16b, v5.16b, v3.16b
	eor v3.16b, v3.16b, v6.16b
	shl v3.2d, v3.2d, #2
	eor v3.16b, v3.16b, v6.16b
	shl v5.2d, v3.2d, #4
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #8
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #16
	eor v3.16b, v5.16b, v3.16b
	shl v5.2d, v3.2d, #32
	eor v3.16b, v5.16b, v3.16b
	bic v6.16b, v6.16b, v3.16b
	add v5.2d, v6.2d, v6.2d
	eor v5.16b, v5.16b, v6.16b
	shl v7.2d, v5.2d, #2
	eor v5.16b, v7.16b, v5.16b
	shl v7.2d, v5.2d, #4
	eor v5.16b, v7.16b, v5.16b
	shl v7.2d, v5.2d, #8
	eor v5.16b, v7.16b, v5.16b
	shl v7.2d, v5.2d, #16
	eor v5.16b, v7.16b, v5.16b
	shl v7.2d, v5.2d, #32
	eor v5.16b, v7.16b, v5.16b
	bic v7.16b, v6.16b, v5.16b
	add v6.2d, v7.2d, v7.2d
	eor v6.16b, v6.16b, v7.16b
	shl v16.2d, v6.2d, #2
	eor v6.16b, v16.16b, v6.16b
	shl v16.2d, v6.2d, #4
	eor v6.16b, v16.16b, v6.16b
	shl v16.2d, v6.2d, #8
	eor v6.16b, v16.16b, v6.16b
	shl v16.2d, v6.2d, #16
	eor v6.16b, v16.16b, v6.16b
	shl v16.2d, v6.2d, #32
	eor v6.16b, v16.16b, v6.16b
	bic v7.16b, v7.16b, v6.16b
	add v16.2d, v7.2d, v7.2d
	eor v16.16b, v16.16b, v7.16b
	shl v17.2d, v16.2d, #2
	eor v16.16b, v17.16b, v16.16b
	shl v17.2d, v16.2d, #4
	eor v16.16b, v17.16b, v16.16b
	shl v17.2d, v16.2d, #8
	eor v16.16b, v17.16b, v16.16b
	shl v17.2d, v16.2d, #16
	eor v16.16b, v17.16b, v16.16b
	shl v17.2d, v16.2d, #32
	eor v16.16b, v17.16b, v16.16b
	bic v7.16b, v7.16b, v16.16b
	add v17.2d, v7.2d, v7.2d
	eor v17.16b, v17.16b, v7.16b
	shl v18.2d, v17.2d, #2
	eor v17.16b, v18.16b, v17.16b
	shl v18.2d, v17.2d, #4
	eor v17.16b, v18.16b, v17.16b
	shl v18.2d, v17.2d, #8
	eor v17.16b, v18.16b, v17.16b
	and v18.16b, v3.16b, v2.16b
	and v3.16b, v3.16b, v4.16b
	shl v19.2d, v17.2d, #16
	eor v20.16b, v18.16b, v2.16b
	ushr v18.2d, v18.2d, #1
	eor v4.16b, v3.16b, v4.16b
	ushr v3.2d, v3.2d, #1
	cnt v2.16b, v2.16b
	eor v17.16b, v19.16b, v17.16b
	orr v18.16b, v20.16b, v18.16b
	orr v3.16b, v4.16b, v3.16b
	uaddlp v2.8h, v2.16b
	shl v19.2d, v17.2d, #32
	and v5.16b, v5.16b, v18.16b
	uaddlp v2.4s, v2.8h
	eor v4.16b, v19.16b, v17.16b
	eor v17.16b, v5.16b, v18.16b
	ushr v18.2d, v5.2d, #2
	and v5.16b, v5.16b, v3.16b
	bic v7.16b, v7.16b, v4.16b
	orr v17.16b, v17.16b, v18.16b
	eor v3.16b, v5.16b, v3.16b
	ushr v5.2d, v5.2d, #2
	add v18.2d, v7.2d, v7.2d
	and v6.16b, v6.16b, v17.16b
	orr v3.16b, v3.16b, v5.16b
	eor v5.16b, v18.16b, v7.16b
	eor v7.16b, v6.16b, v17.16b
	ushr v17.2d, v6.2d, #4
	and v6.16b, v6.16b, v3.16b
	shl v18.2d, v5.2d, #2
	orr v7.16b, v7.16b, v17.16b
	eor v3.16b, v6.16b, v3.16b
	ushr v6.2d, v6.2d, #4
	eor v5.16b, v18.16b, v5.16b
	and v16.16b, v16.16b, v7.16b
	orr v3.16b, v3.16b, v6.16b
	shl v6.2d, v5.2d, #4
	eor v7.16b, v16.16b, v7.16b
	ushr v17.2d, v16.2d, #8
	eor v5.16b, v6.16b, v5.16b
	and v6.16b, v16.16b, v3.16b
	orr v7.16b, v7.16b, v17.16b
	eor v3.16b, v6.16b, v3.16b
	ushr v6.2d, v6.2d, #8
	shl v16.2d, v5.2d, #8
	and v4.16b, v4.16b, v7.16b
	orr v3.16b, v3.16b, v6.16b
	eor v5.16b, v16.16b, v5.16b
	eor v7.16b, v4.16b, v7.16b
	and v6.16b, v4.16b, v3.16b
	shl v16.2d, v5.2d, #16
	ushr v4.2d, v4.2d, #16
	eor v3.16b, v6.16b, v3.16b
	ushr v6.2d, v6.2d, #16
	eor v5.16b, v16.16b, v5.16b
	orr v4.16b, v7.16b, v4.16b
	orr v3.16b, v3.16b, v6.16b
	shl v6.2d, v5.2d, #32
	eor v5.16b, v6.16b, v5.16b
	and v4.16b, v4.16b, v3.16b
	and v4.16b, v4.16b, v5.16b
	eor v5.16b, v4.16b, v3.16b
	ushr v4.2d, v4.2d, #32
	uaddlp v3.2d, v2.4s
	orr v2.16b, v5.16b, v4.16b
	fmov w15, s3
	add w16, w14, w15
	fmov x15, d2
	lsr w18, w16, #6
	lsl x12, x15, x12
	orr x13, x12, x13
	str x13, [x4, x0, lsl #3]
	add x0, x0, x18
	csel x12, xzr, x17, ne
	cmp x0, x5
	b.hs .LBB32_24
	lsr x15, x15, #1
	mov w17, v3.s[2]
	eor x18, x14, #0x3f
	mov x14, v2.d[1]
	and w3, w16, #0x40
	lsr x18, x15, x18
	and w15, w16, #0x3f
	tst x3, #0x40
	orr x18, x18, x12
	add w12, w15, w17
	lsl x16, x14, x16
	lsr w17, w12, #6
	csel x13, x18, x13, ne
	orr x13, x16, x13
	str x13, [x4, x0, lsl #3]
	add x0, x0, x17
	csel x16, xzr, x18, ne
	cmp x0, x5
	b.hs .LBB32_24
	mvn v2.16b, v0.16b
	and v1.16b, v1.16b, v0.16b
	lsr x14, x14, #1
	eor x15, x15, #0x3f
	and w18, w12, #0x40
	lsr x14, x14, x15
	and w15, w12, #0x3f
	tst x18, #0x40
	shl v3.2d, v2.2d, #2
	add v4.2d, v2.2d, v2.2d
	orr x17, x14, x16
	csel x13, x17, x13, ne
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
	uaddlp v0.8h, v0.16b
	shl v17.2d, v7.2d, #32
	and v3.16b, v3.16b, v16.16b
	uaddlp v0.4s, v0.8h
	eor v2.16b, v17.16b, v7.16b
	eor v7.16b, v3.16b, v16.16b
	ushr v16.2d, v3.2d, #2
	and v3.16b, v3.16b, v1.16b
	uaddlp v0.2d, v0.4s
	bic v5.16b, v5.16b, v2.16b
	orr v7.16b, v7.16b, v16.16b
	eor v1.16b, v3.16b, v1.16b
	ushr v3.2d, v3.2d, #2
	fmov w14, s0
	add v16.2d, v5.2d, v5.2d
	and v4.16b, v4.16b, v7.16b
	orr v1.16b, v1.16b, v3.16b
	add w14, w15, w14
	eor v3.16b, v16.16b, v5.16b
	eor v5.16b, v4.16b, v7.16b
	ushr v7.2d, v4.2d, #4
	and v4.16b, v4.16b, v1.16b
	lsr w18, w14, #6
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
	eor v1.16b, v2.16b, v1.16b
	ushr v2.2d, v2.2d, #32
	orr v1.16b, v1.16b, v2.16b
	fmov x16, d1
	lsl x12, x16, x12
	orr x12, x12, x13
	str x12, [x4, x0, lsl #3]
	add x0, x0, x18
	csel x13, xzr, x17, ne
	cmp x0, x5
	b.hs .LBB32_24
	mov x17, v1.d[1]
	lsr x16, x16, #1
	eor x15, x15, #0x3f
	mov w18, v0.s[2]
	and w3, w14, #0x40
	add x11, x11, #64
	lsr x15, x16, x15
	and w16, w14, #0x3f
	tst x3, #0x40
	add x10, x10, #64
	lsr x6, x17, #1
	orr x13, x15, x13
	eor x15, x16, #0x3f
	lsl x14, x17, x14
	add w16, w16, w18
	csel x12, x13, x12, ne
	lsr x15, x6, x15
	csel x13, xzr, x13, ne
	lsr w17, w16, #6
	orr x12, x14, x12
	and w14, w16, #0x40
	str x12, [x4, x0, lsl #3]
	orr x15, x15, x13
	tst x14, #0x40
	add x0, x0, x17
	csel x13, x15, x12, ne
	csel x12, xzr, x15, ne
	subs x9, x9, #1
	and w14, w16, #0x3f
	b.ne .LBB32_3
	and x9, x1, #0x7
	cbnz x9, .LBB32_14
	b .LBB32_19
.LBB32_13:
	mov x0, xzr
	mov x13, xzr
	mov x12, xzr
	mov w14, wzr
	and x9, x1, #0x7
	cbz x9, .LBB32_19
.LBB32_14:
	lsl x10, x1, #3
	and x10, x10, #0x7fffffffffffffc0
	add x8, x8, x10
	add x10, x2, x10
	b .LBB32_16
.LBB32_15:
	subs x9, x9, #1
	b.eq .LBB32_19
.LBB32_16:
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
	mvn w17, w14
	eor x16, x16, x16, lsl #8
	eor x16, x16, x16, lsl #16
	eor x16, x16, x16, lsl #32
	and x11, x16, x11
	mov w16, w14
	add w14, w14, w18
	eor x15, x11, x15
	tst x16, #0x40
	orr x11, x15, x11, lsr #32
	lsr x15, x11, #1
	lsl x11, x11, x16
	lsr x15, x15, x17
	csel x15, x11, x15, ne
	csel x11, xzr, x11, ne
	cmp w14, #63
	orr x12, x15, x12
	orr x13, x11, x13
	b.ls .LBB32_15
	cmp x0, x5
	b.hs .LBB32_25
	str x13, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w14, w14, #64
	mov x13, x12
	mov x12, xzr
	b .LBB32_15
.LBB32_19:
	cbz w14, .LBB32_22
	cmp x0, x5
	b.hs .LBB32_26
	str x13, [x4, x0, lsl #3]
.LBB32_22:
	lsl x8, x0, #6
	add x0, x8, w14, uxtw
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB32_23:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.10
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.10
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB32_24:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.11
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.11
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB32_25:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB32_26:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
