bitpacking::byte_to_bit::bytes_to_bits_scalar:
	add x8, x1, #63
	lsr x8, x8, #6
	cmp x3, x8
	csel x8, x3, x8, lo
	cbz x1, .LBB12_23
	cbz x8, .LBB12_23
	stp d15, d14, [sp, #-80]!
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	str x30, [sp, #64]
	addvl sp, sp, #-4
	index z31.d, #0, #1
	rdvl x10, #1
	mov z24.d, #1
	mov z8.d, x10
	mov z25.d, #63
	mov z26.d, #8
	ptrue p0.b
	mov x9, xzr
	mov w11, #64
	ptrue p1.d
	mov x13, x1
	mov x12, x0
	mov z0.d, z31.d
	mov z1.d, z31.d
	mov z2.d, z31.d
	str z8, [sp, #3, mul vl]
	add z0.d, z0.d, #6
	add z1.d, z1.d, #4
	add z2.d, z2.d, #2
	str z0, [sp, #2, mul vl]
	str z1, [sp, #1, mul vl]
	str z2, [sp]
	b .LBB12_5
.LBB12_3:
	mov x4, xzr
.LBB12_4:
	add x14, x9, #1
	str x4, [x2, x9, lsl #3]
	add x12, x12, #64
	cmp x14, x8
	mov x9, x14
	b.eq .LBB12_22
.LBB12_5:
	lsl x15, x9, #6
	mov x14, x13
	subs x13, x13, #64
	csel x17, x14, x11, lo
	subs x14, x1, x15
	cmp x14, #64
	csel x14, x14, x11, lo
	subs x16, x1, x15
	b.eq .LBB12_3
	cmp x16, #8
	add x15, x0, x15
	b.hs .LBB12_8
	mov x4, xzr
	mov x16, xzr
	mov x17, x15
	b .LBB12_20
.LBB12_8:
	cmp x14, x10
	b.hs .LBB12_10
	mov x16, xzr
	mov x4, xzr
	b .LBB12_17
.LBB12_10:
	udiv x16, x14, x10
	mov z5.d, z31.d
	mov z3.d, z31.d
	mov z19.d, z31.d
	movi v25.2d, #0000000000000000
	movi v23.2d, #0000000000000000
	movi v26.2d, #0000000000000000
	movi v24.2d, #0000000000000000
	movi v29.2d, #0000000000000000
	incd z5.d
	incd z3.d, all, mul #2
	movi v27.2d, #0000000000000000
	movi v30.2d, #0000000000000000
	movi v28.2d, #0000000000000000
	incd z19.d, all, mul #4
	mov z0.d, z31.d
	mov x18, xzr
	mov z16.d, z5.d
	mov z17.d, z3.d
	mov z21.d, z5.d
	incd z16.d, all, mul #2
	incd z17.d, all, mul #4
	incd z21.d, all, mul #4
	mov z18.d, z16.d
	incd z18.d, all, mul #4
	mul x16, x16, x10
	sub x3, x14, x16
.LBB12_11:
	ld1b { z8.b }, p0/z, [x12, x18]
	mov z9.d, z21.d
	mov z10.d, z19.d
	mov z12.d, z16.d
	mov z13.d, z3.d
	incb x18
	mov z15.d, z5.d
	mov z31.d, z0.d
	mov z20.d, z17.d
	cmpne p2.b, p0/z, z8.b, #0
	and z9.d, z9.d, #0x3f
	mov z22.d, z18.d
	cmp x16, x18
	and z10.d, z10.d, #0x3f
	and z12.d, z12.d, #0x3f
	and z13.d, z13.d, #0x3f
	and z15.d, z15.d, #0x3f
	and z31.d, z31.d, #0x3f
	and z20.d, z20.d, #0x3f
	and z22.d, z22.d, #0x3f
	punpkhi p3.h, p2.b
	punpklo p2.h, p2.b
	punpklo p4.h, p3.b
	punpkhi p6.h, p2.b
	punpkhi p5.h, p4.b
	punpklo p4.h, p4.b
	mov z8.d, p5/z, #1
	punpklo p2.h, p2.b
	punpkhi p3.h, p3.b
	mov z11.d, p4/z, #1
	punpkhi p4.h, p6.b
	punpklo p5.h, p6.b
	lsl z8.d, p1/m, z8.d, z9.d
	mov z14.d, p4/z, #1
	punpkhi p4.h, p2.b
	lslr z10.d, p1/m, z10.d, z11.d
	punpklo p2.h, p2.b
	mov z4.d, p5/z, #1
	punpklo p5.h, p3.b
	mov z1.d, p4/z, #1
	orr z27.d, z8.d, z27.d
	punpkhi p3.h, p3.b
	mov z6.d, p2/z, #1
	lslr z12.d, p1/m, z12.d, z14.d
	mov z7.d, p5/z, #1
	lsl z4.d, p1/m, z4.d, z13.d
	ldr z8, [sp, #3, mul vl]
	mov z2.d, p3/z, #1
	lsl z1.d, p1/m, z1.d, z15.d
	orr z29.d, z10.d, z29.d
	lsl z6.d, p1/m, z6.d, z31.d
	orr z24.d, z12.d, z24.d
	lsl z7.d, p1/m, z7.d, z20.d
	orr z26.d, z4.d, z26.d
	add z0.d, z0.d, z8.d
	lsl z2.d, p1/m, z2.d, z22.d
	orr z23.d, z1.d, z23.d
	add z5.d, z5.d, z8.d
	orr z25.d, z6.d, z25.d
	add z3.d, z3.d, z8.d
	add z16.d, z16.d, z8.d
	orr z30.d, z7.d, z30.d
	add z19.d, z19.d, z8.d
	add z21.d, z21.d, z8.d
	orr z28.d, z2.d, z28.d
	add z17.d, z17.d, z8.d
	add z18.d, z18.d, z8.d
	b.ne .LBB12_11
	orr z0.d, z25.d, z29.d
	orr z1.d, z26.d, z30.d
	orr z2.d, z23.d, z27.d
	orr z3.d, z24.d, z28.d
	orr z0.d, z0.d, z1.d
	orr z1.d, z2.d, z3.d
	orr z0.d, z0.d, z1.d
	orv d0, p1, z0.d
	fmov x4, d0
	cbz x3, .LBB12_15
	mov z24.d, #1
	mov z25.d, #63
	cmp x3, #8
	mov z26.d, #8
	b.hs .LBB12_16
	add x17, x15, x16
	index z31.d, #0, #1
	b .LBB12_20
.LBB12_15:
	index z31.d, #0, #1
	mov z24.d, #1
	mov z25.d, #63
	mov z26.d, #8
	b .LBB12_4
.LBB12_16:
	index z31.d, #0, #1
.LBB12_17:
	dup v0.2d, x16
	ldr z1, [sp, #2, mul vl]
	movi v16.2d, #0000000000000000
	movi v17.2d, #0000000000000000
	movi v19.2d, #0000000000000000
	mov x18, x16
	movi v20.2d, #0000000000000000
	and x16, x14, #0x78
	and x3, x17, #0x78
	add v21.2d, v0.2d, v1.2d
	ldr z1, [sp, #1, mul vl]
	add v18.2d, v0.2d, v31.2d
	mov v16.d[0], x4
	add x17, x15, x16
	add v22.2d, v0.2d, v1.2d
	ldr z1, [sp]
	add v23.2d, v0.2d, v1.2d
.LBB12_18:
	ldr d0, [x12, x18]
	and v4.16b, v21.16b, v25.16b
	and v5.16b, v22.16b, v25.16b
	and v6.16b, v23.16b, v25.16b
	and v7.16b, v18.16b, v25.16b
	add x18, x18, #8
	cmtst v0.8b, v0.8b, v0.8b
	add v23.2d, v23.2d, v26.2d
	cmp x3, x18
	add v18.2d, v18.2d, v26.2d
	add v22.2d, v22.2d, v26.2d
	add v21.2d, v21.2d, v26.2d
	ushll v0.8h, v0.8b, #0
	ushll2 v1.4s, v0.8h, #0
	ushll v0.4s, v0.4h, #0
	ushll2 v2.2d, v1.4s, #0
	ushll v1.2d, v1.2s, #0
	ushll2 v3.2d, v0.4s, #0
	ushll v0.2d, v0.2s, #0
	and v2.16b, v2.16b, v24.16b
	and v1.16b, v1.16b, v24.16b
	and v3.16b, v3.16b, v24.16b
	and v0.16b, v0.16b, v24.16b
	ushl v2.2d, v2.2d, v4.2d
	ushl v3.2d, v3.2d, v6.2d
	ushl v1.2d, v1.2d, v5.2d
	ushl v0.2d, v0.2d, v7.2d
	orr v20.16b, v2.16b, v20.16b
	orr v17.16b, v1.16b, v17.16b
	orr v19.16b, v3.16b, v19.16b
	orr v16.16b, v0.16b, v16.16b
	b.ne .LBB12_18
	orr v0.16b, v16.16b, v17.16b
	orr v1.16b, v19.16b, v20.16b
	cmp x14, x16
	orr v0.16b, v0.16b, v1.16b
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x4, d0
	b.eq .LBB12_4
.LBB12_20:
	add x14, x15, x14
.LBB12_21:
	ldrb w15, [x17], #1
	cmp w15, #0
	cset w15, ne
	cmp x17, x14
	lsl x15, x15, x16
	add x16, x16, #1
	orr x4, x15, x4
	b.ne .LBB12_21
	b .LBB12_4
.LBB12_22:
	addvl sp, sp, #4
	ldp d9, d8, [sp, #48]
	ldr x30, [sp, #64]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #80
.LBB12_23:
	ret
