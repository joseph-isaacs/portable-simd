bitpacking::rank::popcount_portable_u8:
	lsr x10, x1, #3
	and x9, x1, #0x7
	mov x8, xzr
	cbz x10, .LBB20_5
	mov w11, #31
	mov x12, x0
.LBB20_2:
	cmp x10, #31
	movi v0.2d, #0000000000000000
	movi v1.2d, #0000000000000000
	csel x15, x10, x11, lo
	movi v2.2d, #0000000000000000
	movi v3.2d, #0000000000000000
	lsl x13, x15, #6
	mov x14, x12
	sub x10, x10, x15
	add x12, x12, x13
.LBB20_3:
	ldp q5, q4, [x14, #16]
	subs x13, x13, #64
	ldr q6, [x14]
	ldr q7, [x14, #48]
	add x14, x14, #64
	cnt v4.16b, v4.16b
	cnt v7.16b, v7.16b
	cnt v6.16b, v6.16b
	cnt v5.16b, v5.16b
	add v2.16b, v4.16b, v2.16b
	add v0.16b, v6.16b, v0.16b
	add v3.16b, v7.16b, v3.16b
	add v1.16b, v5.16b, v1.16b
	b.ne .LBB20_3
	uaddl2 v4.8h, v0.16b, v2.16b
	uaddl2 v5.8h, v1.16b, v3.16b
	uaddl v0.8h, v0.8b, v2.8b
	uaddl v1.8h, v1.8b, v3.8b
	add v2.8h, v4.8h, v5.8h
	add v0.8h, v0.8h, v1.8h
	add v0.8h, v0.8h, v2.8h
	addv h0, v0.8h
	fmov w13, s0
	add x8, x8, w13, uxth
	cbnz x10, .LBB20_2
.LBB20_5:
	cbz x9, .LBB20_9
	sub x9, x9, #1
	cntd x10
	movi v0.2d, #0000000000000000
	and x9, x9, #0x1fffffffffffffff
	ptrue p1.d
	add x11, x9, #1
	cmp x9, x10
	sub x9, x11, x10
	and x10, x1, #0xffffffffffffff8
	csel x9, xzr, x9, lo
	whilelo p0.d, xzr, x11
	add x10, x0, x10, lsl #3
	mov x11, xzr
.LBB20_7:
	ld1d { z1.d }, p0/z, [x10, x11, lsl #3]
	cnt z1.d, p1/m, z1.d
	add z0.d, p0/m, z0.d, z1.d
	whilelo p0.d, x11, x9
	incd x11
	b.mi .LBB20_7
	uaddv d0, p1, z0.d
	fmov x9, d0
.LBB20_9:
	add x0, x9, x8
	ret
