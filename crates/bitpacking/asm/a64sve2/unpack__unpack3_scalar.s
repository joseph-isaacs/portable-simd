bitpacking::unpack::unpack3_scalar:
	str d10, [sp, #-48]!
	stp d9, d8, [sp, #16]
	stp x29, x30, [sp, #32]
	add x29, sp, #32
	add x8, x3, x3, lsl #1
	lsr x9, x8, #3
	tst x8, #0x7
	cinc x8, x9, ne
	add x8, x8, #64
	cmp x1, x8
	b.lo .LBB44_21
	cbz x3, .LBB44_19
	index z0.d, #0, #1
	mov x10, #-6148914691236517206
	sub x8, x1, #5
	movk x10, #43691
	rdvl x11, #1
	mov x9, xzr
	umulh x8, x8, x10
	cnth x10
	mov z4.d, x11
	ptrue p0.d
	mov z6.d, x10
	mov w13, #8
	mov z1.d, z0.d
	mov z2.d, z0.d
	mov z5.d, z0.d
	ptrue p1.h
	ptrue p2.b
	incd z1.d
	incd z2.d, all, mul #2
	incd z5.d, all, mul #4
	lsr x12, x8, #1
	mov z3.d, z1.d
	mov z7.d, z2.d
	mov z16.d, z1.d
	incd z3.d, all, mul #2
	incd z7.d, all, mul #4
	incd z16.d, all, mul #4
	mov z17.d, z3.d
	incd z17.d, all, mul #4
	b .LBB44_4
.LBB44_3:
	sub x3, x3, x14
	add x9, x9, #1
	mov x2, x8
	cbz x3, .LBB44_19
.LBB44_4:
	cmp x3, #8
	add x8, x9, x9, lsl #1
	csel x14, x3, x13, lo
	cmp x9, x12
	b.eq .LBB44_20
	ldr x15, [x0, x8]
	cmp x14, x10
	add x8, x2, x14
	b.hs .LBB44_7
	mov x16, xzr
	mov x17, x2
	b .LBB44_17
.LBB44_7:
	mov z18.d, x15
	cmp x14, x11
	b.hs .LBB44_9
	mov x16, xzr
	b .LBB44_14
.LBB44_9:
	udiv x16, x14, x11
	mov z19.d, z0.d
	mov z20.d, z1.d
	mov z21.d, z2.d
	mov z22.d, z3.d
	mov z23.d, z5.d
	mov z24.d, z16.d
	mov z25.d, z7.d
	mov z26.d, z17.d
	mov x17, xzr
	mul x16, x16, x11
	sub x18, x14, x16
.LBB44_10:
	mov z27.d, z25.d
	mov z28.d, z26.d
	mov z29.d, z23.d
	mov z30.d, z24.d
	mov z31.d, z21.d
	mov z8.d, z19.d
	mov z9.d, z20.d
	mov z10.d, z22.d
	add z19.d, z19.d, z4.d
	mul z27.d, z27.d, #3
	mul z28.d, z28.d, #3
	add z20.d, z20.d, z4.d
	mul z29.d, z29.d, #3
	mul z30.d, z30.d, #3
	add z21.d, z21.d, z4.d
	mul z8.d, z8.d, #3
	mul z9.d, z9.d, #3
	add z22.d, z22.d, z4.d
	mul z31.d, z31.d, #3
	mul z10.d, z10.d, #3
	add z23.d, z23.d, z4.d
	and z28.d, z28.d, #0x3f
	and z27.d, z27.d, #0x3f
	add z24.d, z24.d, z4.d
	and z29.d, z29.d, #0x3f
	and z30.d, z30.d, #0x3f
	add z25.d, z25.d, z4.d
	and z9.d, z9.d, #0x3f
	and z8.d, z8.d, #0x3f
	add z26.d, z26.d, z4.d
	and z10.d, z10.d, #0x3f
	and z31.d, z31.d, #0x3f
	lsrr z27.d, p0/m, z27.d, z18.d
	lsrr z28.d, p0/m, z28.d, z18.d
	lsrr z29.d, p0/m, z29.d, z18.d
	lsrr z30.d, p0/m, z30.d, z18.d
	lsrr z8.d, p0/m, z8.d, z18.d
	lsrr z9.d, p0/m, z9.d, z18.d
	lsrr z31.d, p0/m, z31.d, z18.d
	lsrr z10.d, p0/m, z10.d, z18.d
	uzp1 z29.s, z29.s, z30.s
	uzp1 z27.s, z27.s, z28.s
	uzp1 z8.s, z8.s, z9.s
	uzp1 z31.s, z31.s, z10.s
	uzp1 z27.h, z29.h, z27.h
	uzp1 z28.h, z8.h, z31.h
	uzp1 z27.b, z28.b, z27.b
	and z27.b, z27.b, #0x7
	st1b { z27.b }, p2, [x2, x17]
	incb x17
	cmp x16, x17
	b.ne .LBB44_10
	cbz x18, .LBB44_3
	cmp x18, x10
	b.hs .LBB44_14
	add x17, x2, x16
	b .LBB44_17
.LBB44_14:
	udiv x17, x14, x10
	index z19.d, x16, #1
	mov x18, x16
	mov z20.d, z19.d
	mov z21.d, z19.d
	incd z20.d
	incd z21.d, all, mul #2
	mov z22.d, z20.d
	incd z22.d, all, mul #2
	mul x16, x17, x10
	sub x4, x14, x16
	add x17, x2, x16
.LBB44_15:
	mov z23.d, z21.d
	mov z24.d, z22.d
	mov z25.d, z19.d
	mov z26.d, z20.d
	add z19.d, z19.d, z6.d
	add z20.d, z20.d, z6.d
	add z21.d, z21.d, z6.d
	add z22.d, z22.d, z6.d
	mul z23.d, z23.d, #3
	mul z24.d, z24.d, #3
	mul z25.d, z25.d, #3
	mul z26.d, z26.d, #3
	and z23.d, z23.d, #0x3f
	and z24.d, z24.d, #0x3f
	and z26.d, z26.d, #0x3f
	and z25.d, z25.d, #0x3f
	lsrr z23.d, p0/m, z23.d, z18.d
	lsrr z24.d, p0/m, z24.d, z18.d
	lsrr z25.d, p0/m, z25.d, z18.d
	lsrr z26.d, p0/m, z26.d, z18.d
	uzp1 z23.s, z23.s, z24.s
	uzp1 z25.s, z25.s, z26.s
	uzp1 z23.h, z25.h, z23.h
	and z23.h, z23.h, #0x7
	st1b { z23.h }, p1, [x2, x18]
	inch x18
	cmp x16, x18
	b.ne .LBB44_15
	cbz x4, .LBB44_3
.LBB44_17:
	add x16, x16, x16, lsl #1
.LBB44_18:
	lsr x18, x15, x16
	add x16, x16, #3
	and w18, w18, #0x7
	strb w18, [x17], #1
	cmp x17, x8
	b.ne .LBB44_18
	b .LBB44_3
.LBB44_19:
	ldp x29, x30, [sp, #32]
	ldp d9, d8, [sp, #16]
	ldr d10, [sp], #48
	ret
.LBB44_20:
	adrp x3, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.16
	add x3, x3, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.16
	mov x2, x1
	add x1, x8, #8
	mov x0, x8
	bl core::slice::index::slice_index_fail
.LBB44_21:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.23
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.23
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.24
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.24
	mov w1, #55
	bl core::panicking::panic_fmt
