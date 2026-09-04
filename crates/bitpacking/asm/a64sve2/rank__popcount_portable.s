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
	ptrue p0.d, vl2
.LBB19_2:
	ldp q5, q4, [x10, #32]
	subs x9, x9, #64
	ldp q7, q6, [x10], #64
	cnt z4.d, p0/m, z4.d
	cnt z5.d, p0/m, z5.d
	cnt z7.d, p0/m, z7.d
	cnt z6.d, p0/m, z6.d
	add v3.2d, v4.2d, v3.2d
	add v2.2d, v5.2d, v2.2d
	add v0.2d, v6.2d, v0.2d
	add v1.2d, v7.2d, v1.2d
	b.ne .LBB19_2
	add v1.2d, v1.2d, v2.2d
	add v0.2d, v0.2d, v3.2d
	add v0.2d, v1.2d, v0.2d
	addp d0, v0.2d
	fmov x9, d0
.LBB19_4:
	cbz x8, .LBB19_8
	sub x8, x8, #1
	cntd x10
	movi v0.2d, #0000000000000000
	and x8, x8, #0x1fffffffffffffff
	ptrue p1.d
	add x11, x8, #1
	cmp x8, x10
	sub x8, x11, x10
	and x10, x1, #0xffffffffffffff8
	csel x8, xzr, x8, lo
	whilelo p0.d, xzr, x11
	add x10, x0, x10, lsl #3
	mov x11, xzr
.LBB19_6:
	ld1d { z1.d }, p0/z, [x10, x11, lsl #3]
	cnt z1.d, p1/m, z1.d
	add z0.d, p0/m, z0.d, z1.d
	whilelo p0.d, x11, x8
	incd x11
	b.mi .LBB19_6
	uaddv d0, p1, z0.d
	fmov x8, d0
.LBB19_8:
	add x0, x8, x9
	ret
