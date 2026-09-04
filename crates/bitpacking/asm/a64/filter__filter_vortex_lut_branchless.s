bitpacking::filter::filter_vortex_lut_branchless:
	sub sp, sp, #112
	stp x29, x30, [sp, #16]
	stp x28, x27, [sp, #32]
	stp x26, x25, [sp, #48]
	stp x24, x23, [sp, #64]
	stp x22, x21, [sp, #80]
	stp x20, x19, [sp, #96]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB33_16
	cmp x5, x1
	b.ls .LBB33_17
	mov x8, xzr
	cbz x1, .LBB33_14
	adrp x11, :got:bitpacking::filter::BYTE_PEXT_LUT
	mov x10, xzr
	mov x12, xzr
	ldr x11, [x11, :got_lo12:bitpacking::filter::BYTE_PEXT_LUT]
	mov w9, wzr
	mov x13, xzr
.LBB33_4:
	mov w14, w9
	b .LBB33_7
.LBB33_5:
	lsr x16, x15, #1
	mvn w17, w9
	lsl x15, x15, x14
	tst x14, #0x40
	lsr x16, x16, x17
	csel x16, x15, x16, ne
	csel x15, xzr, x15, ne
	orr x10, x15, x10
	orr x12, x16, x12
	str x10, [x4, x8, lsl #3]
	add x8, x8, #1
	mov x10, x12
	mov x12, xzr
.LBB33_6:
	add x13, x13, #1
	cmp x13, x1
	b.hs .LBB33_12
.LBB33_7:
	ldr x16, [x2, x13, lsl #3]
	ldr x15, [x0, x13, lsl #3]
	cmn x16, #1
	b.eq .LBB33_5
	cbz x16, .LBB33_6
	ubfx x6, x16, #8, #8
	and w5, w16, #0xff
	ubfx x7, x16, #16, #8
	fmov s0, w5
	lsr w19, w16, #24
	ubfx x3, x16, #32, #8
	fmov s1, w6
	fmov s2, w7
	ubfx x18, x16, #40, #8
	fmov s3, w19
	ubfx x17, x16, #48, #8
	lsr x21, x16, #8
	cnt v0.8b, v0.8b
	fmov s4, w3
	lsr x23, x16, #16
	cnt v1.8b, v1.8b
	cnt v2.8b, v2.8b
	and x26, x16, #0xff00
	cnt v3.8b, v3.8b
	ubfx x27, x15, #8, #8
	fmov s5, w18
	fmov s6, w17
	ubfiz x22, x16, #8, #8
	add x26, x11, x26
	fmov w17, s0
	and x21, x21, #0xff00
	ubfx x28, x15, #16, #8
	fmov w18, s1
	fmov w3, s2
	ldrb w26, [x26, x27]
	add x21, x11, x21
	and x23, x23, #0xff00
	lsr w27, w15, #24
	cnt v4.8b, v4.8b
	add x22, x11, x22
	and x30, x15, #0xff
	ldrb w21, [x21, x28]
	add x23, x11, x23
	cnt v5.8b, v5.8b
	fmov w5, s3
	lsr x24, x16, #24
	ldrb w22, [x22, x30]
	add w18, w18, w17
	lsl x17, x26, x17
	ldrb w23, [x23, x27]
	cnt v6.8b, v6.8b
	lsr x25, x16, #32
	lsl x21, x21, x18
	add w18, w18, w3
	and x3, x24, #0xff00
	ubfx x24, x15, #32, #8
	orr x17, x17, x22
	lsl x22, x23, x18
	lsr x23, x16, #40
	fmov w6, s4
	fmov d0, x16
	add x3, x11, x3
	orr x17, x17, x21
	lsr x16, x16, #48
	add w18, w18, w5
	and x5, x25, #0xff00
	ubfx x21, x15, #40, #8
	fmov w7, s5
	lsr x20, x15, #56
	ldrb w3, [x3, x24]
	orr x17, x17, x22
	add x5, x11, x5
	and x22, x23, #0xff00
	ubfx x15, x15, #48, #8
	fmov w19, s6
	ldrb w5, [x5, x21]
	add x21, x11, x22
	and x16, x16, #0xff00
	cnt v0.8b, v0.8b
	lsl x3, x3, x18
	add w18, w18, w6
	ldrb w15, [x21, x15]
	add x16, x11, x16
	lsl x5, x5, x18
	add w18, w18, w7
	ldrb w16, [x16, x20]
	orr x17, x17, x3
	lsl x15, x15, x18
	add w18, w18, w19
	orr x17, x17, x5
	lsl x16, x16, x18
	addv b0, v0.8b
	orr x15, x17, x15
	mvn w17, w9
	tst x14, #0x40
	orr x15, x15, x16
	lsr x16, x15, #1
	fmov w18, s0
	lsl x15, x15, x14
	lsr x16, x16, x17
	add w9, w9, w18
	csel x16, x15, x16, ne
	csel x15, xzr, x15, ne
	subs w14, w9, #64
	orr x12, x16, x12
	orr x10, x15, x10
	b.lo .LBB33_11
	str x10, [x4, x8, lsl #3]
	add x8, x8, #1
	mov w9, w14
	mov x10, x12
	mov x12, xzr
.LBB33_11:
	add x13, x13, #1
	cmp x13, x1
	b.lo .LBB33_4
.LBB33_12:
	cbz w9, .LBB33_14
	mov w9, w9
	str x10, [x4, x8, lsl #3]
	b .LBB33_15
.LBB33_14:
	mov x9, xzr
.LBB33_15:
	add x0, x9, x8, lsl #6
	ldp x20, x19, [sp, #96]
	ldp x22, x21, [sp, #80]
	ldp x24, x23, [sp, #64]
	ldp x26, x25, [sp, #48]
	ldp x28, x27, [sp, #32]
	ldp x29, x30, [sp, #16]
	add sp, sp, #112
	ret
.LBB33_16:
	adrp x5, .Lanon.bba673b6abbf1555a5789e1a894d50b2.7
	add x5, x5, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.7
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB33_17:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.8
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.8
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.9
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.9
	mov w1, #95
	bl core::panicking::panic_fmt
