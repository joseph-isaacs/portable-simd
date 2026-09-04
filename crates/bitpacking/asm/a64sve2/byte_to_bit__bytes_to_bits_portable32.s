bitpacking::byte_to_bit::bytes_to_bits_portable32:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	mov x8, x0
	lsr x0, x1, #6
	and x9, x1, #0x3f
	cmp x3, x0
	csel x10, x3, x0, lo
	cbz x10, .LBB14_3
	adrp x11, .LCPI14_0
	mov x12, x2
	ldr q0, [x11, :lo12:.LCPI14_0]
	add x11, x8, #32
.LBB14_2:
	ldp q2, q1, [x11]
	subs x10, x10, #1
	ldp q4, q3, [x11, #-32]
	add x11, x11, #64
	cmeq v1.16b, v1.16b, #0
	cmeq v2.16b, v2.16b, #0
	cmeq v3.16b, v3.16b, #0
	cmeq v4.16b, v4.16b, #0
	bic v1.16b, v0.16b, v1.16b
	bic v2.16b, v0.16b, v2.16b
	bic v3.16b, v0.16b, v3.16b
	bic v4.16b, v0.16b, v4.16b
	ext v5.16b, v1.16b, v1.16b, #8
	ext v6.16b, v2.16b, v2.16b, #8
	ext v7.16b, v3.16b, v3.16b, #8
	ext v16.16b, v4.16b, v4.16b, #8
	zip1 v1.16b, v1.16b, v5.16b
	zip1 v2.16b, v2.16b, v6.16b
	zip1 v3.16b, v3.16b, v7.16b
	zip1 v4.16b, v4.16b, v16.16b
	addv h1, v1.8h
	addv h2, v2.8h
	addv h3, v3.8h
	addv h4, v4.8h
	str h1, [x12, #6]
	str h2, [x12, #4]
	str h3, [x12, #2]
	str h4, [x12]
	add x12, x12, #8
	b.ne .LBB14_2
.LBB14_3:
	cbz x9, .LBB14_13
	cnth x10
	and x11, x1, #0x7fffffffffffffc0
	mov x12, xzr
	cmp x9, x10
	add x8, x8, x11
	b.hs .LBB14_6
	mov x11, xzr
	mov x10, x8
	b .LBB14_9
.LBB14_6:
	index z0.d, #0, #1
	mov x11, #-1
	cntw x13
	inch x11
	movi v1.2d, #0000000000000000
	movi v4.2d, #0000000000000000
	movi v5.2d, #0000000000000000
	movi v6.2d, #0000000000000000
	mov z2.d, x13
	mov z7.d, x10
	ptrue p1.s
	mov z3.d, z0.d
	and x13, x9, x11
	ptrue p0.d
	sub x11, x9, x13
	add x10, x8, x11
	incd z3.d
.LBB14_7:
	add x14, x8, x12
	ld1b { z16.s }, p1/z, [x8, x12]
	add z20.d, z0.d, z2.d
	ld1b { z17.s }, p1/z, [x14, #1, mul vl]
	inch x12
	cmpne p2.s, p1/z, z16.s, #0
	cmpne p3.s, p1/z, z17.s, #0
	add z17.d, z3.d, z2.d
	cmp x11, x12
	punpkhi p4.h, p2.b
	punpklo p2.h, p2.b
	punpkhi p5.h, p3.b
	mov z16.d, p4/z, #1
	punpklo p3.h, p3.b
	mov z18.d, p2/z, #1
	mov z19.d, p5/z, #1
	mov z21.d, p3/z, #1
	lsl z16.d, p0/m, z16.d, z3.d
	add z3.d, z3.d, z7.d
	lsl z18.d, p0/m, z18.d, z0.d
	add z0.d, z0.d, z7.d
	lslr z17.d, p0/m, z17.d, z19.d
	lslr z20.d, p0/m, z20.d, z21.d
	orr z5.d, z16.d, z5.d
	orr z4.d, z18.d, z4.d
	orr z1.d, z17.d, z1.d
	orr z6.d, z20.d, z6.d
	b.ne .LBB14_7
	orr z0.d, z6.d, z4.d
	orr z1.d, z1.d, z5.d
	orr z0.d, z0.d, z1.d
	orv d0, p0, z0.d
	fmov x12, d0
	cbz x13, .LBB14_11
.LBB14_9:
	add x8, x8, x9
.LBB14_10:
	ldrb w9, [x10], #1
	cmp w9, #0
	cset w9, ne
	cmp x10, x8
	lsl x9, x9, x11
	add x11, x11, #1
	orr x12, x9, x12
	b.ne .LBB14_10
.LBB14_11:
	cmp x0, x3
	b.hs .LBB14_14
	str x12, [x2, x0, lsl #3]
.LBB14_13:
	ldp x29, x30, [sp], #16
	ret
.LBB14_14:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.45
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.45
	mov x1, x3
	bl core::panicking::panic_bounds_check
