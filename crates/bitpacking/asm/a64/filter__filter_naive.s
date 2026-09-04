bitpacking::filter::filter_naive:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB25_17
	cbz x1, .LBB25_15
	mov x8, x0
	mov w9, wzr
	mov x0, xzr
	mov x10, xzr
	mov x12, xzr
	mov x11, xzr
	mov w13, #1
	b .LBB25_5
.LBB25_3:
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x12
	mov x12, xzr
.LBB25_4:
	add x11, x11, #1
	cmp x11, x1
	b.eq .LBB25_12
.LBB25_5:
	ldr x15, [x2, x11, lsl #3]
	cbz x15, .LBB25_8
	ldr x17, [x8, x11, lsl #3]
	mov x14, xzr
	mov w16, wzr
	mov x18, x15
.LBB25_7:
	neg x3, x18
	lsl x6, x13, x16
	add w16, w16, #1
	and x3, x17, x3
	tst x3, x18
	sub x3, x18, #1
	csel x6, xzr, x6, eq
	ands x18, x3, x18
	orr x14, x6, x14
	b.ne .LBB25_7
	b .LBB25_9
.LBB25_8:
	mov x14, xzr
.LBB25_9:
	fmov d0, x15
	lsr x15, x14, #1
	mvn w16, w9
	mov w17, w9
	lsr x15, x15, x16
	lsl x14, x14, x17
	tst x17, #0x40
	cnt v0.8b, v0.8b
	csel x15, x14, x15, ne
	csel x14, xzr, x14, ne
	orr x12, x15, x12
	orr x10, x14, x10
	addv b0, v0.8b
	fmov w16, s0
	add w9, w9, w16
	cmp w9, #63
	b.ls .LBB25_4
	cmp x0, x5
	b.lo .LBB25_3
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB25_12:
	cbz w9, .LBB25_16
	cmp x0, x5
	b.hs .LBB25_18
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	add x0, x8, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB25_15:
	add x0, xzr, xzr, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB25_16:
	add x0, xzr, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB25_17:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB25_18:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
