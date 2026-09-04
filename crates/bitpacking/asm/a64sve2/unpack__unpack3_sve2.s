bitpacking::unpack::unpack3_sve2:
	str d10, [sp, #-48]!
	stp d9, d8, [sp, #16]
	stp x29, x30, [sp, #32]
	add x29, sp, #32
	add x9, x3, x3, lsl #1
	lsr x10, x9, #3
	tst x9, #0x7
	cinc x9, x10, ne
	add x9, x9, #64
	cmp x1, x9
	b.lo .LBB43_28
	mov x8, x2
	ands x15, x3, #0x7ffffffffffffff8
	b.eq .LBB43_5
	mov x11, #-6148914691236517206
	sub x10, x1, #5
	mov x9, xzr
	movk x11, #43691
	mov x12, x8
	umulh x10, x10, x11
	mov x11, #506381209866536711
	fmov d1, x11
	mov x11, x15
	lsr x10, x10, #1
.LBB43_3:
	cbz x10, .LBB43_26
	ldr d0, [x0, x9]
	sub x10, x10, #1
	add x9, x9, #3
	bdep z0.d, z0.d, z1.d
	str d0, [x12], #8
	subs x11, x11, #8
	b.ne .LBB43_3
.LBB43_5:
	and x10, x3, #0x7
	cbz x10, .LBB43_25
	lsr x9, x3, #3
	add x9, x9, x9, lsl #1
	subs x2, x1, x9
	b.lo .LBB43_29
	add x11, x10, x10, lsl #1
	lsr x12, x11, #3
	tst x11, #0x7
	cinc x11, x12, ne
	orr x11, x11, #0x40
	cmp x2, x11
	b.lo .LBB43_28
	index z0.d, #0, #1
	mov x13, #-6148914691236517206
	sub x12, x2, #5
	movk x13, #43691
	mov x11, xzr
	ptrue p0.d
	umulh x14, x12, x13
	cnth x12
	rdvl x13, #1
	mov z4.d, x13
	mov z6.d, x12
	ptrue p1.h
	mov z1.d, z0.d
	mov z2.d, z0.d
	mov z5.d, z0.d
	ptrue p2.b
	add x18, x8, x15
	add x8, x0, x9
	mov w9, #8
	incd z1.d
	incd z2.d, all, mul #2
	incd z5.d, all, mul #4
	lsr x14, x14, #1
	mov z3.d, z1.d
	mov z7.d, z2.d
	mov z16.d, z1.d
	incd z3.d, all, mul #2
	incd z7.d, all, mul #4
	incd z16.d, all, mul #4
	mov z17.d, z3.d
	incd z17.d, all, mul #4
	b .LBB43_10
.LBB43_9:
	sub x10, x10, x15
	add x11, x11, #1
	mov x18, x16
	cbz x10, .LBB43_25
.LBB43_10:
	cmp x10, #8
	add x0, x11, x11, lsl #1
	csel x15, x10, x9, lo
	cmp x11, x14
	b.eq .LBB43_27
	ldr x17, [x8, x0]
	cmp x15, x12
	add x16, x18, x15
	b.hs .LBB43_13
	mov x0, xzr
	mov x1, x18
	b .LBB43_23
.LBB43_13:
	mov z18.d, x17
	cmp x15, x13
	b.hs .LBB43_15
	mov x0, xzr
	b .LBB43_20
.LBB43_15:
	udiv x0, x15, x13
	mov z19.d, z0.d
	mov z20.d, z1.d
	mov z21.d, z2.d
	mov z22.d, z3.d
	mov z23.d, z5.d
	mov z24.d, z16.d
	mov z25.d, z7.d
	mov z26.d, z17.d
	mov x1, xzr
	mul x0, x0, x13
	sub x3, x15, x0
.LBB43_16:
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
	st1b { z27.b }, p2, [x18, x1]
	incb x1
	cmp x0, x1
	b.ne .LBB43_16
	cbz x3, .LBB43_9
	cmp x3, x12
	b.hs .LBB43_20
	add x1, x18, x0
	b .LBB43_23
.LBB43_20:
	udiv x1, x15, x12
	index z19.d, x0, #1
	mov x3, x0
	mov z20.d, z19.d
	mov z21.d, z19.d
	incd z20.d
	incd z21.d, all, mul #2
	mov z22.d, z20.d
	incd z22.d, all, mul #2
	mul x0, x1, x12
	sub x4, x15, x0
	add x1, x18, x0
.LBB43_21:
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
	st1b { z23.h }, p1, [x18, x3]
	inch x3
	cmp x0, x3
	b.ne .LBB43_21
	cbz x4, .LBB43_9
.LBB43_23:
	add x18, x0, x0, lsl #1
.LBB43_24:
	lsr x0, x17, x18
	add x18, x18, #3
	and w0, w0, #0x7
	strb w0, [x1], #1
	cmp x1, x16
	b.ne .LBB43_24
	b .LBB43_9
.LBB43_25:
	ldp x29, x30, [sp, #32]
	ldp d9, d8, [sp, #16]
	ldr d10, [sp], #48
	ret
.LBB43_26:
	adrp x3, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.15
	add x3, x3, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.15
	mov x2, x1
	add x1, x9, #8
	mov x0, x9
	bl core::slice::index::slice_index_fail
.LBB43_27:
	adrp x3, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.16
	add x3, x3, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.16
	add x1, x0, #8
	bl core::slice::index::slice_index_fail
.LBB43_28:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.23
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.23
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.24
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.24
	mov w1, #55
	bl core::panicking::panic_fmt
.LBB43_29:
	adrp x3, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.14
	add x3, x3, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.14
	mov x0, x9
	mov x2, x1
	bl core::slice::index::slice_index_fail
