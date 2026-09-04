bitpacking::filter::filter_sve2:
	sub sp, sp, #32
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB26_12
	cbz x1, .LBB26_10
	ptrue p0.d
	mov x8, x0
	mov w9, wzr
	mov x0, xzr
	mov x10, xzr
	mov x11, xzr
	b .LBB26_4
.LBB26_3:
	subs x1, x1, #1
	b.eq .LBB26_7
.LBB26_4:
	ldr x12, [x2], #8
	mvn w14, w9
	mov w15, w9
	fmov d0, x12
	fmov d1, x12
	movprfx z2, z0
	cnt z2.d, p0/m, z0.d
	ldr d0, [x8], #8
	bext z0.d, z0.d, z1.d
	fmov x12, d0
	tst x15, #0x40
	lsr x13, x12, #1
	lsl x12, x12, x15
	lsr x13, x13, x14
	csel x13, x12, x13, ne
	csel x12, xzr, x12, ne
	orr x11, x13, x11
	orr x10, x12, x10
	fmov w14, s2
	add w9, w9, w14
	cmp w9, #63
	b.ls .LBB26_3
	cmp x0, x5
	b.hs .LBB26_13
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x11
	mov x11, xzr
	b .LBB26_3
.LBB26_7:
	cbz w9, .LBB26_11
	cmp x0, x5
	b.hs .LBB26_14
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	add x0, x8, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_10:
	add x0, xzr, xzr, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_11:
	add x0, xzr, x0, lsl #6
	ldp x29, x30, [sp, #16]
	add sp, sp, #32
	ret
.LBB26_12:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB26_13:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB26_14:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
