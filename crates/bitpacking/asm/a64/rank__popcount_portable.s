bitpacking::rank::popcount_portable:
	lsl x8, x1, #3
	ands x9, x8, #0x7fffffffffffffc0
	and x8, x1, #0x7
	b.eq .LBB19_4
	movi v0.2d, #0000000000000000
	movi v1.2d, #0000000000000000
	mov x10, x0
	movi v2.2d, #0000000000000000
	movi v3.2d, #0000000000000000
.LBB19_2:
	ldp q5, q4, [x10, #32]
	subs x9, x9, #64
	ldp q7, q6, [x10], #64
	cnt v4.16b, v4.16b
	cnt v5.16b, v5.16b
	cnt v7.16b, v7.16b
	cnt v6.16b, v6.16b
	uaddlp v4.8h, v4.16b
	uaddlp v5.8h, v5.16b
	uaddlp v7.8h, v7.16b
	uaddlp v6.8h, v6.16b
	uaddlp v4.4s, v4.8h
	uaddlp v5.4s, v5.8h
	uaddlp v7.4s, v7.8h
	uaddlp v6.4s, v6.8h
	uadalp v3.2d, v4.4s
	uadalp v2.2d, v5.4s
	uadalp v0.2d, v6.4s
	uadalp v1.2d, v7.4s
	b.ne .LBB19_2
	add v1.2d, v1.2d, v2.2d
	add v0.2d, v0.2d, v3.2d
	add v0.2d, v1.2d, v0.2d
	addp d0, v0.2d
	fmov x9, d0
.LBB19_4:
	cbz x8, .LBB19_13
	and x10, x1, #0xffffffffffffff8
	cmp x8, #1
	add x11, x0, x10, lsl #3
	ldr d0, [x11]
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x10, d0
	b.eq .LBB19_12
	ldr d0, [x11, #8]
	cmp x8, #2
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x10, x12, x10
	b.eq .LBB19_12
	ldr d0, [x11, #16]
	cmp x8, #3
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x10, x12, x10
	b.eq .LBB19_12
	ldr d0, [x11, #24]
	cmp x8, #4
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x10, x12, x10
	b.eq .LBB19_12
	ldr d0, [x11, #32]
	cmp x8, #5
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x10, x12, x10
	b.eq .LBB19_12
	ldr d0, [x11, #40]
	cmp x8, #6
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
	add x10, x12, x10
	b.eq .LBB19_12
	ldr d0, [x11, #48]
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x8, d0
	add x10, x8, x10
.LBB19_12:
	add x0, x10, x9
	ret
.LBB19_13:
	add x0, xzr, x9
	ret
