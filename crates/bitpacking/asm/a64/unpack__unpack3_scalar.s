bitpacking::unpack::unpack3_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	add x8, x3, x3, lsl #1
	lsr x9, x8, #3
	tst x8, #0x7
	cinc x8, x9, ne
	add x8, x8, #64
	cmp x1, x8
	b.lo .LBB40_17
	cbz x3, .LBB40_15
	mov x10, #-6148914691236517206
	sub x8, x1, #5
	mov x9, xzr
	movk x10, #43691
	mov w11, #8
	umulh x8, x8, x10
	lsr x10, x8, #1
	b .LBB40_4
.LBB40_3:
	sub x3, x3, x12
	add x9, x9, #1
	mov x2, x8
	cbz x3, .LBB40_15
.LBB40_4:
	cmp x3, #8
	add x8, x9, x9, lsl #1
	csel x12, x3, x11, lo
	cmp x9, x10
	b.eq .LBB40_16
	ldr x13, [x0, x8]
	cmp x3, #2
	add x8, x2, x12
	b.hs .LBB40_7
	mov x14, xzr
	b .LBB40_13
.LBB40_7:
	and x14, x12, #0xe
	ubfx w16, w13, #3, #3
	and w15, w13, #0x7
	cmp x14, #2
	strb w15, [x2]
	strb w16, [x2, #1]
	b.eq .LBB40_11
	ubfx w15, w13, #6, #3
	ubfx w16, w13, #9, #3
	cmp x14, #4
	strb w15, [x2, #2]
	strb w16, [x2, #3]
	b.eq .LBB40_11
	ubfx w15, w13, #12, #3
	ubfx w16, w13, #15, #3
	cmp x14, #6
	strb w15, [x2, #4]
	strb w16, [x2, #5]
	b.eq .LBB40_11
	ubfx w15, w13, #18, #3
	ubfx w16, w13, #21, #3
	strb w15, [x2, #6]
	strb w16, [x2, #7]
.LBB40_11:
	cmp x12, x14
	b.eq .LBB40_3
	add x2, x2, x14
.LBB40_13:
	add x14, x14, x14, lsl #1
.LBB40_14:
	lsr x15, x13, x14
	add x14, x14, #3
	and w15, w15, #0x7
	strb w15, [x2], #1
	cmp x2, x8
	b.ne .LBB40_14
	b .LBB40_3
.LBB40_15:
	ldp x29, x30, [sp], #16
	ret
.LBB40_16:
	adrp x3, .Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	add x3, x3, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.14
	mov x2, x1
	add x1, x8, #8
	mov x0, x8
	bl core::slice::index::slice_index_fail
.LBB40_17:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.21
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.22
	mov w1, #55
	bl core::panicking::panic_fmt
