bitpacking::filter::filter_byte_lut_branchless:
	sub sp, sp, #80
	stp x29, x30, [sp, #16]
	stp x24, x23, [sp, #32]
	stp x22, x21, [sp, #48]
	stp x20, x19, [sp, #64]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB31_13
	cbz x1, .LBB31_10
	adrp x11, :got:bitpacking::filter::BYTE_PEXT_LUT
	mov x8, x0
	mov w9, wzr
	ldr x11, [x11, :got_lo12:bitpacking::filter::BYTE_PEXT_LUT]
	mov x0, xzr
	mov x10, xzr
	mov x12, xzr
	b .LBB31_4
.LBB31_3:
	subs x1, x1, #1
	b.eq .LBB31_7
.LBB31_4:
	ldr x13, [x2], #8
	and w14, w13, #0xff
	ubfx x15, x13, #8, #8
	lsr w17, w13, #24
	fmov s0, w14
	ubfx x14, x13, #32, #8
	ubfx x16, x13, #16, #8
	fmov s1, w15
	fmov s3, w17
	ubfiz x20, x13, #8, #8
	fmov s2, w16
	ldr x15, [x8], #8
	cnt v0.8b, v0.8b
	lsr x6, x13, #8
	ubfx x21, x13, #40, #8
	cnt v1.8b, v1.8b
	and x22, x13, #0xff00
	ubfx x23, x15, #8, #8
	cnt v2.8b, v2.8b
	lsr x7, x13, #16
	and x24, x15, #0xff
	add x22, x11, x22
	add x20, x11, x20
	and x6, x6, #0xff00
	fmov w17, s0
	fmov s0, w14
	ldrb w22, [x22, x23]
	fmov w18, s1
	ldrb w20, [x20, x24]
	ubfx x23, x15, #16, #8
	fmov w3, s2
	add x6, x11, x6
	and x7, x7, #0xff00
	cnt v0.8b, v0.8b
	ldrb w6, [x6, x23]
	add x7, x11, x7
	lsl x22, x22, x17
	add w17, w18, w17
	cnt v3.8b, v3.8b
	lsl x6, x6, x17
	add w17, w17, w3
	ubfx x3, x13, #48, #8
	orr x20, x22, x20
	lsr x19, x13, #24
	lsr x14, x15, #56
	fmov w24, s0
	fmov s0, w21
	lsr w21, w15, #24
	orr x6, x20, x6
	fmov w16, s3
	lsr x22, x13, #48
	ldrb w18, [x7, x21]
	lsr x7, x13, #32
	lsr x21, x13, #40
	cnt v0.8b, v0.8b
	lsl x18, x18, x17
	add w16, w17, w16
	and x17, x19, #0xff00
	add x17, x11, x17
	and x7, x7, #0xff00
	ubfx x19, x15, #40, #8
	orr x18, x6, x18
	fmov w6, s0
	fmov s0, w3
	ubfx x3, x15, #32, #8
	ubfx x15, x15, #48, #8
	ldrb w17, [x17, x3]
	add x3, x11, x7
	and x7, x21, #0xff00
	cnt v0.8b, v0.8b
	ldrb w3, [x3, x19]
	add x7, x11, x7
	ldrb w15, [x7, x15]
	and x7, x22, #0xff00
	lsl x17, x17, x16
	add w16, w16, w24
	add x7, x11, x7
	lsl x3, x3, x16
	ldrb w14, [x7, x14]
	fmov w19, s0
	fmov d0, x13
	add w13, w16, w6
	orr x16, x18, x17
	lsl x15, x15, x13
	orr x16, x16, x3
	cnt v0.8b, v0.8b
	add w13, w13, w19
	lsl x13, x14, x13
	orr x14, x16, x15
	mov w15, w9
	mvn w16, w9
	tst x15, #0x40
	orr x13, x14, x13
	addv b0, v0.8b
	lsr x14, x13, #1
	lsl x13, x13, x15
	lsr x14, x14, x16
	fmov w17, s0
	csel x14, x13, x14, ne
	csel x13, xzr, x13, ne
	orr x12, x14, x12
	orr x10, x13, x10
	add w9, w9, w17
	cmp w9, #63
	b.ls .LBB31_3
	cmp x0, x5
	b.hs .LBB31_14
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x12
	mov x12, xzr
	b .LBB31_3
.LBB31_7:
	cbz w9, .LBB31_11
	cmp x0, x5
	b.hs .LBB31_15
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	b .LBB31_12
.LBB31_10:
	mov x8, xzr
	mov x0, xzr
	b .LBB31_12
.LBB31_11:
	mov x8, xzr
.LBB31_12:
	add x0, x8, x0, lsl #6
	ldp x20, x19, [sp, #64]
	ldp x22, x21, [sp, #48]
	ldp x24, x23, [sp, #32]
	ldp x29, x30, [sp, #16]
	add sp, sp, #80
	ret
.LBB31_13:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB31_14:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB31_15:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
