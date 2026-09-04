bitpacking::unpack::unpack3_portable_shift:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	add x9, x3, x3, lsl #1
	lsr x10, x9, #3
	tst x9, #0x7
	cinc x9, x10, ne
	add x9, x9, #64
	cmp x1, x9
	b.lo .LBB42_26
	mov x8, x2
	ands x13, x3, #0x7ffffffffffffff0
	b.eq .LBB42_6
	mov x10, #-6148914691236517206
	sub x12, x1, #26
	movi v0.16b, #7
	movk x10, #43691
	adrp x14, .LCPI42_2
	mov x9, xzr
	umulh x11, x1, x10
	ldr q3, [x14, :lo12:.LCPI42_2]
	mov x14, x8
	umulh x10, x12, x10
	adrp x12, .LCPI42_0
	ldr q1, [x12, :lo12:.LCPI42_0]
	adrp x12, .LCPI42_1
	ldr q2, [x12, :lo12:.LCPI42_1]
	mov x12, x13
	lsr x11, x11, #2
	lsr x10, x10, #2
	add x11, x11, #1
.LBB42_3:
	cbz x11, .LBB42_24
	cbz x10, .LBB42_25
	ldr q4, [x0, x9]
	sub x10, x10, #1
	subs x12, x12, #16
	sub x11, x11, #1
	add x9, x9, #6
	tbl v5.16b, { v4.16b }, v1.16b
	tbl v4.16b, { v4.16b }, v2.16b
	ushl v4.8h, v4.8h, v3.8h
	ushl v5.8h, v5.8h, v3.8h
	uzp1 v4.16b, v5.16b, v4.16b
	and v4.16b, v4.16b, v0.16b
	str q4, [x14], #16
	b.ne .LBB42_3
.LBB42_6:
	and x10, x3, #0xf
	cbz x10, .LBB42_22
	lsr x9, x3, #4
	add x9, x9, x9, lsl #1
	lsl x9, x9, #1
	subs x2, x1, x9
	b.lo .LBB42_27
	add x11, x10, x10, lsl #1
	lsr x12, x11, #3
	tst x11, #0x7
	cinc x11, x12, ne
	orr x11, x11, #0x40
	cmp x2, x11
	b.lo .LBB42_26
	mov x14, #-6148914691236517206
	sub x12, x2, #5
	mov x11, xzr
	movk x14, #43691
	add x13, x8, x13
	add x8, x0, x9
	umulh x12, x12, x14
	mov w9, #8
	lsr x12, x12, #1
	b .LBB42_11
.LBB42_10:
	sub x10, x10, x14
	add x11, x11, #1
	mov x13, x15
	cbz x10, .LBB42_22
.LBB42_11:
	cmp x10, #8
	add x0, x11, x11, lsl #1
	csel x14, x10, x9, lo
	cmp x11, x12
	b.eq .LBB42_23
	ldr x16, [x8, x0]
	cmp x10, #2
	add x15, x13, x14
	b.hs .LBB42_14
	mov x17, xzr
	b .LBB42_20
.LBB42_14:
	and x17, x14, #0xe
	ubfx w0, w16, #3, #3
	and w18, w16, #0x7
	cmp x17, #2
	strb w18, [x13]
	strb w0, [x13, #1]
	b.eq .LBB42_18
	ubfx w18, w16, #6, #3
	ubfx w0, w16, #9, #3
	cmp x17, #4
	strb w18, [x13, #2]
	strb w0, [x13, #3]
	b.eq .LBB42_18
	ubfx w18, w16, #12, #3
	ubfx w0, w16, #15, #3
	cmp x17, #6
	strb w18, [x13, #4]
	strb w0, [x13, #5]
	b.eq .LBB42_18
	ubfx w18, w16, #18, #3
	ubfx w0, w16, #21, #3
	strb w18, [x13, #6]
	strb w0, [x13, #7]
.LBB42_18:
	cmp x14, x17
	b.eq .LBB42_10
	add x13, x13, x17
.LBB42_20:
	add x17, x17, x17, lsl #1
.LBB42_21:
	lsr x18, x16, x17
	add x17, x17, #3
	and w18, w18, #0x7
	strb w18, [x13], #1
	cmp x13, x15
	b.ne .LBB42_21
	b .LBB42_10
.LBB42_22:
	ldp x29, x30, [sp], #16
	ret
.LBB42_23:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	add x1, x0, #8
	bl core::slice::index::slice_index_fail
.LBB42_24:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.20
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.20
	mov x0, x9
	mov x2, x1
	bl core::slice::index::slice_index_fail
.LBB42_25:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.27
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.27
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.19
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.19
	mov w1, #105
	bl core::panicking::panic_fmt
.LBB42_26:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	mov w1, #55
	bl core::panicking::panic_fmt
.LBB42_27:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.18
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.18
	mov x0, x9
	mov x2, x1
	bl core::slice::index::slice_index_fail
