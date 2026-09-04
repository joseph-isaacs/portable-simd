bitpacking::bit_to_byte::bits_to_bytes_swar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1, lsl #6
	b.lo .LBB6_5
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB6_4
	mov x9, #513
	movi v0.16b, #127
	movi v1.16b, #1
	movk x9, #2052, lsl #16
	mov x10, #72340172838076673
	movk x9, #8208, lsl #32
	movk x9, #32832, lsl #48
	dup v2.2d, x9
	add x9, x2, #32
.LBB6_3:
	ldr x11, [x0], #8
	subs x8, x8, #1
	ubfx x15, x11, #16, #8
	ubfx x17, x11, #32, #8
	ubfx x18, x11, #48, #8
	and x12, x11, #0xff
	ubfx x13, x11, #8, #8
	lsr w14, w11, #24
	mul x12, x12, x10
	ubfx x16, x11, #40, #8
	lsr x11, x11, #56
	mul x15, x15, x10
	mul x17, x17, x10
	fmov d3, x12
	mul x18, x18, x10
	fmov d4, x15
	mul x13, x13, x10
	fmov d5, x17
	mul x14, x14, x10
	fmov d6, x18
	mul x16, x16, x10
	mov v3.d[1], x13
	mul x11, x11, x10
	mov v4.d[1], x14
	mov v5.d[1], x16
	and v3.16b, v3.16b, v2.16b
	mov v6.d[1], x11
	and v4.16b, v4.16b, v2.16b
	add v3.2d, v3.2d, v0.2d
	and v5.16b, v5.16b, v2.16b
	add v4.2d, v4.2d, v0.2d
	and v6.16b, v6.16b, v2.16b
	ushr v3.2d, v3.2d, #7
	add v5.2d, v5.2d, v0.2d
	ushr v4.2d, v4.2d, #7
	add v6.2d, v6.2d, v0.2d
	and v3.16b, v3.16b, v1.16b
	ushr v5.2d, v5.2d, #7
	and v4.16b, v4.16b, v1.16b
	ushr v6.2d, v6.2d, #7
	and v5.16b, v5.16b, v1.16b
	stp q3, q4, [x9, #-32]
	and v6.16b, v6.16b, v1.16b
	stp q5, q6, [x9], #64
	b.ne .LBB6_3
.LBB6_4:
	ldp x29, x30, [sp], #16
	ret
.LBB6_5:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.32
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.32
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.35
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.35
	mov w1, #46
	bl core::panicking::panic
