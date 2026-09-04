bitpacking::filter::filter_byte_lut_branchless:
	sub sp, sp, #112
	stp x29, x30, [sp, #16]
	str x27, [sp, #32]
	stp x26, x25, [sp, #48]
	stp x24, x23, [sp, #64]
	stp x22, x21, [sp, #80]
	stp x20, x19, [sp, #96]
	add x29, sp, #16
	cmp x1, x3
	str x1, [sp, #8]
	str x3, [x29, #24]
	b.ne .LBB33_13
	cbz x1, .LBB33_10
	adrp x11, :got:bitpacking::filter::BYTE_PEXT_LUT
	ptrue p0.s
	mov x8, x0
	ldr x11, [x11, :got_lo12:bitpacking::filter::BYTE_PEXT_LUT]
	ptrue p1.d
	mov w9, wzr
	mov x0, xzr
	mov x10, xzr
	mov x12, xzr
	b .LBB33_4
.LBB33_3:
	subs x1, x1, #1
	b.eq .LBB33_7
.LBB33_4:
	ldr x13, [x2], #8
	and w14, w13, #0xff
	ubfx x15, x13, #8, #8
	ubfx x16, x13, #16, #8
	fmov s0, w14
	ubfx x24, x13, #48, #8
	lsr w17, w13, #24
	fmov s1, w15
	fmov s2, w16
	ubfx x14, x13, #32, #8
	fmov s3, w17
	ldr x15, [x8], #8
	cnt z0.s, p0/m, z0.s
	lsr x19, x13, #8
	ubfiz x25, x13, #8, #8
	cnt z1.s, p0/m, z1.s
	cnt z2.s, p0/m, z2.s
	and x17, x13, #0xff00
	ubfx x26, x15, #8, #8
	fmov s4, w14
	cnt z3.s, p0/m, z3.s
	ubfx x14, x13, #40, #8
	add x27, x11, x17
	and x19, x19, #0xff00
	add x19, x11, x19
	lsr x20, x13, #16
	lsr x21, x13, #24
	fmov s5, w14
	cnt z4.s, p0/m, z4.s
	lsr x22, x13, #32
	and x20, x20, #0xff00
	lsr x23, x13, #40
	lsr x14, x15, #56
	fmov w18, s0
	fmov s0, w24
	add x24, x11, x25
	fmov w3, s1
	ldrb w25, [x27, x26]
	ubfx x27, x15, #16, #8
	and x26, x15, #0xff
	cnt z5.s, p0/m, z5.s
	fmov w6, s2
	cnt z0.s, p0/m, z0.s
	ldrb w19, [x19, x27]
	ldrb w24, [x24, x26]
	lsl x25, x25, x18
	add w18, w3, w18
	lsr w26, w15, #24
	lsl x19, x19, x18
	add x3, x11, x20
	fmov w7, s3
	orr x20, x25, x24
	ldrb w3, [x3, x26]
	add w18, w18, w6
	orr x19, x20, x19
	and x6, x21, #0xff00
	ubfx x21, x15, #32, #8
	add x6, x11, x6
	lsl x3, x3, x18
	add w18, w18, w7
	ldrb w6, [x6, x21]
	fmov w16, s4
	lsr x27, x13, #48
	ubfx x7, x15, #40, #8
	fmov w17, s5
	ubfx x15, x15, #48, #8
	fmov w20, s0
	fmov d0, x13
	orr x13, x19, x3
	lsl x3, x6, x18
	and x6, x22, #0xff00
	and x19, x23, #0xff00
	add x6, x11, x6
	add w16, w18, w16
	cnt z0.d, p1/m, z0.d
	ldrb w6, [x6, x7]
	add x7, x11, x19
	and x19, x27, #0xff00
	ldrb w15, [x7, x15]
	orr x13, x13, x3
	add x18, x11, x19
	lsl x6, x6, x16
	add w16, w16, w17
	ldrb w14, [x18, x14]
	lsl x15, x15, x16
	add w16, w16, w20
	orr x13, x13, x6
	lsl x14, x14, x16
	orr x13, x13, x15
	mov w15, w9
	mvn w16, w9
	tst x15, #0x40
	orr x13, x13, x14
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
	b.ls .LBB33_3
	cmp x0, x5
	b.hs .LBB33_14
	str x10, [x4, x0, lsl #3]
	add x0, x0, #1
	sub w9, w9, #64
	mov x10, x12
	mov x12, xzr
	b .LBB33_3
.LBB33_7:
	cbz w9, .LBB33_11
	cmp x0, x5
	b.hs .LBB33_15
	mov w8, w9
	str x10, [x4, x0, lsl #3]
	b .LBB33_12
.LBB33_10:
	mov x8, xzr
	mov x0, xzr
	b .LBB33_12
.LBB33_11:
	mov x8, xzr
.LBB33_12:
	add x0, x8, x0, lsl #6
	ldp x20, x19, [sp, #96]
	ldr x27, [sp, #32]
	ldp x22, x21, [sp, #80]
	ldp x24, x23, [sp, #64]
	ldp x26, x25, [sp, #48]
	ldp x29, x30, [sp, #16]
	add sp, sp, #112
	ret
.LBB33_13:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	add x1, sp, #8
	add x2, x29, #24
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB33_14:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	mov x1, x5
	bl core::panicking::panic_bounds_check
.LBB33_15:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	mov x1, x5
	bl core::panicking::panic_bounds_check
