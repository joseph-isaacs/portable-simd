bitpacking::filter::filter_naive:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB27_17
	cbz x1, .LBB27_15
	ptrue p0.d
	mov x8, x0
	mov w9, wzr
	mov x0, xzr
	mov x10, xzr
	mov x12, xzr
	mov x11, xzr
	mov w13, #1
	b .LBB27_5
.LBB27_3:
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x12
	mov x12, xzr
.LBB27_4:
	add x11, x11, #1
	cmp x11, x1
	b.eq .LBB27_12
.LBB27_5:
	ldr x15, [x2, x11, lsl #3]
	cbz x15, .LBB27_8
	ldr x17, [x8, x11, lsl #3]
	mov x14, xzr
	mov w16, wzr
	mov x18, x15
.LBB27_7:
	neg x3, x18
	lsl x6, x13, x16
	add w16, w16, #1
	and x3, x17, x3
	tst x3, x18
	sub x3, x18, #1
	csel x6, xzr, x6, eq
	ands x18, x3, x18
	orr x14, x6, x14
	b.ne .LBB27_7
	b .LBB27_9
.LBB27_8:
	mov x14, xzr
.LBB27_9:
	fmov d0, x15
	lsr x15, x14, #1
	mvn w16, w9
	mov w17, w9
	lsr x15, x15, x16
	lsl x14, x14, x17
	tst x17, #0x40
	cnt z0.d, p0/m, z0.d
	csel x15, x14, x15, ne
	csel x14, xzr, x14, ne
	orr x12, x15, x12
	orr x10, x14, x10
	fmov w18, s0
	add w9, w9, w18
	cmp w9, #63
	b.ls .LBB27_4
	cmp x0, x5
	b.lo .LBB27_3
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB27_12:
	cbz w9, .LBB27_16
	cmp x0, x5
	b.hs .LBB27_18
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	add x0, x8, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB27_15:
	add x0, xzr, xzr, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB27_16:
	add x0, xzr, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB27_17:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB27_18:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
