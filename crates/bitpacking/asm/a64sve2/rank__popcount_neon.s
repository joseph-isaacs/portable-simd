bitpacking::rank::popcount_neon:
	lsr x8, x1, #1
	cbz x8, .LBB16_6
	movi v0.2d, #0000000000000000
	mov w9, #1024
	mov x10, x0
.LBB16_2:
	cmp x8, #1024
	movi v1.2d, #0000000000000000
	mov x12, x10
	csel x13, x8, x9, lo
	lsl x11, x13, #4
	sub x8, x8, x13
	add x10, x10, x11
.LBB16_3:
	ldr q2, [x12], #16
	subs x11, x11, #16
	cnt v2.16b, v2.16b
	uadalp v1.8h, v2.16b
	b.ne .LBB16_3
	uaddlp v1.4s, v1.8h
	uadalp v0.2d, v1.4s
	cbnz x8, .LBB16_2
	addp d0, v0.2d
	fmov x8, d0
.LBB16_6:
	tbnz w1, #0, .LBB16_8
	add x0, xzr, x8
	ret
.LBB16_8:
	and x9, x1, #0xffffffffffffffe
	ptrue p0.d
	ldr d0, [x0, x9, lsl #3]
	cnt z0.d, p0/m, z0.d
	fmov x9, d0
	add x0, x9, x8
	ret
