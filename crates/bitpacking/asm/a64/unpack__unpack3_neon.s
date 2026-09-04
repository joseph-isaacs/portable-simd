bitpacking::unpack::unpack3_neon:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	add x9, x3, x3, lsl #1
	lsr x10, x9, #3
	tst x9, #0x7
	cinc x9, x10, ne
	add x9, x9, #64
	cmp x1, x9
	b.lo .LBB39_22
	mov x8, x2
	ands x13, x3, #0x7ffffffffffffff0
	and x10, x3, #0xf
	b.eq .LBB39_4
	movi v0.16b, #7
	adrp x9, .LCPI39_0
	adrp x11, .LCPI39_1
	ldr q1, [x9, :lo12:.LCPI39_0]
	ldr q2, [x11, :lo12:.LCPI39_1]
	mov x9, x13
	mov x11, x0
	mov x12, x8
.LBB39_3:
	ldr s3, [x11]
	ldur s4, [x11, #3]
	subs x9, x9, #16
	add x11, x11, #6
	tbl v3.16b, { v3.16b }, v1.16b
	tbl v4.16b, { v4.16b }, v1.16b
	ushl v3.8h, v3.8h, v2.8h
	ushl v4.8h, v4.8h, v2.8h
	uzp1 v3.16b, v3.16b, v4.16b
	and v3.16b, v3.16b, v0.16b
	str q3, [x12], #16
	b.ne .LBB39_3
.LBB39_4:
	cbz x10, .LBB39_20
	lsr x9, x3, #4
	add x9, x9, x9, lsl #1
	lsl x9, x9, #1
	subs x2, x1, x9
	b.lo .LBB39_23
	add x11, x10, x10, lsl #1
	lsr x12, x11, #3
	tst x11, #0x7
	cinc x11, x12, ne
	orr x11, x11, #0x40
	cmp x2, x11
	b.lo .LBB39_22
	mov x14, #-6148914691236517206
	sub x12, x2, #5
	mov x11, xzr
	movk x14, #43691
	add x13, x8, x13
	add x8, x0, x9
	umulh x12, x12, x14
	mov w9, #8
	lsr x12, x12, #1
	b .LBB39_9
.LBB39_8:
	sub x10, x10, x14
	add x11, x11, #1
	mov x13, x15
	cbz x10, .LBB39_20
.LBB39_9:
	cmp x10, #8
	add x0, x11, x11, lsl #1
	csel x14, x10, x9, lo
	cmp x11, x12
	b.eq .LBB39_21
	ldr x16, [x8, x0]
	cmp x10, #2
	add x15, x13, x14
	b.hs .LBB39_12
	mov x17, xzr
	b .LBB39_18
.LBB39_12:
	and x17, x14, #0xe
	ubfx w0, w16, #3, #3
	and w18, w16, #0x7
	cmp x17, #2
	strb w18, [x13]
	strb w0, [x13, #1]
	b.eq .LBB39_16
	ubfx w18, w16, #6, #3
	ubfx w0, w16, #9, #3
	cmp x17, #4
	strb w18, [x13, #2]
	strb w0, [x13, #3]
	b.eq .LBB39_16
	ubfx w18, w16, #12, #3
	ubfx w0, w16, #15, #3
	cmp x17, #6
	strb w18, [x13, #4]
	strb w0, [x13, #5]
	b.eq .LBB39_16
	ubfx w18, w16, #18, #3
	ubfx w0, w16, #21, #3
	strb w18, [x13, #6]
	strb w0, [x13, #7]
.LBB39_16:
	cmp x14, x17
	b.eq .LBB39_8
	add x13, x13, x17
.LBB39_18:
	add x17, x17, x17, lsl #1
.LBB39_19:
	lsr x18, x16, x17
	add x17, x17, #3
	and w18, w18, #0x7
	strb w18, [x13], #1
	cmp x13, x15
	b.ne .LBB39_19
	b .LBB39_8
.LBB39_20:
	ldp x29, x30, [sp], #16
	ret
.LBB39_21:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	add x1, x0, #8
	bl core::slice::index::slice_index_fail
.LBB39_22:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	mov w1, #55
	bl core::panicking::panic_fmt
.LBB39_23:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.13
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.13
	mov x0, x9
	mov x2, x1
	bl core::slice::index::slice_index_fail
