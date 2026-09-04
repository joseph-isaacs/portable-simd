bitpacking::select::select_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	sub x9, sp, #176
	and sp, x9, #0xffffffffffffffc0
	lsr x11, x1, #3
	cbz x11, .LBB39_5
	lsl x12, x11, #6
	ptrue p0.d, vl2
	mov x8, xzr
	mov x10, x0
.LBB39_2:
	ldp q0, q3, [x10, #32]
	ldp q2, q4, [x10]
	movprfx z1, z0
	cnt z1.d, p0/m, z0.d
	cnt z3.d, p0/m, z3.d
	cnt z2.d, p0/m, z2.d
	cnt z4.d, p0/m, z4.d
	add v0.2d, v4.2d, v3.2d
	add v5.2d, v2.2d, v1.2d
	add v0.2d, v5.2d, v0.2d
	addp d0, v0.2d
	fmov x9, d0
	subs x9, x2, x9
	b.lo .LBB39_10
	subs x12, x12, #64
	add x10, x10, #64
	sub x8, x8, #512
	mov x2, x9
	b.ne .LBB39_2
	ubfiz x12, x1, #3, #3
	cbnz x12, .LBB39_6
	b .LBB39_9
.LBB39_5:
	mov x9, x2
	ubfiz x12, x1, #3, #3
	cbz x12, .LBB39_9
.LBB39_6:
	and x8, x1, #0xffffffffffffff8
	ptrue p0.d
	add x13, x0, x8, lsl #3
	neg x8, x11, lsl #9
.LBB39_7:
	ldr x10, [x13], #8
	fmov d0, x10
	cnt z0.d, p0/m, z0.d
	fmov x11, d0
	subs x11, x9, x11
	b.lo .LBB39_11
	subs x12, x12, #8
	sub x8, x8, #64
	mov x9, x11
	b.ne .LBB39_7
.LBB39_9:
	mov x0, xzr
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB39_10:
	movi v0.2d, #0000000000000000
	ext v5.16b, v1.16b, v3.16b, #8
	adrp x9, .LCPI39_0
	ext v6.16b, v4.16b, v1.16b, #8
	ext v7.16b, v2.16b, v4.16b, #8
	adrp x11, .LCPI39_1
	ptrue p0.s
	adrp x12, .LCPI39_2
	zip1 v16.2d, v0.2d, v2.2d
	add v3.2d, v5.2d, v3.2d
	add v4.2d, v7.2d, v4.2d
	add v1.2d, v6.2d, v1.2d
	add v2.2d, v16.2d, v2.2d
	add v3.2d, v1.2d, v3.2d
	add v1.2d, v4.2d, v1.2d
	add v5.2d, v2.2d, v4.2d
	dup v4.2d, x2
	add v1.2d, v2.2d, v1.2d
	zip1 v0.2d, v0.2d, v2.2d
	add v3.2d, v5.2d, v3.2d
	cmhs v7.2d, v4.2d, v1.2d
	cmhs v16.2d, v4.2d, v5.2d
	cmhs v6.2d, v4.2d, v3.2d
	cmhs v4.2d, v4.2d, v2.2d
	ext v2.16b, v2.16b, v5.16b, #8
	ext v5.16b, v5.16b, v1.16b, #8
	ext v1.16b, v1.16b, v3.16b, #8
	uzp1 v6.4s, v7.4s, v6.4s
	uzp1 v4.4s, v4.4s, v16.4s
	index z7.b, #-1, #1
	ldr d16, [x11, :lo12:.LCPI39_1]
	add x11, sp, #64
	stp q0, q2, [sp, #64]
	ldr d0, [x12, :lo12:.LCPI39_2]
	stp q5, q1, [sp, #96]
	uzp1 v4.8h, v4.8h, v6.8h
	ldr q6, [x9, :lo12:.LCPI39_0]
	and v4.16b, v4.16b, v6.16b
	addv h4, v4.8h
	fmov w9, s4
	and w9, w9, #0xff
	fmov s4, w9
	cnt z4.s, p0/m, z4.s
	fmov w9, s4
	and w9, w9, #0x7
	ldr x10, [x10, w9, uxtw #3]
	orr x13, x11, x9, lsl #3
	fmov d4, x10
	ldr w12, [x13]
	adrp x13, .LCPI39_3
	ldr d2, [x13, :lo12:.LCPI39_3]
	sub w12, w2, w12
	cnt v4.8b, v4.8b
	dup v1.8b, w12
	mov v6.16b, v4.16b
	mov v6.d[1], v4.d[0]
	tbl v6.8b, { v6.16b }, v7.8b
	add v4.8b, v6.8b, v4.8b
	mov v6.16b, v4.16b
	mov v6.d[1], v4.d[0]
	tbl v6.8b, { v6.16b }, v16.8b
	add v4.8b, v6.8b, v4.8b
	mov v3.16b, v4.16b
	mov v3.d[1], v4.d[0]
	tbl v0.8b, { v3.16b }, v0.8b
	add v0.8b, v0.8b, v4.8b
	cmhs v1.8b, v1.8b, v0.8b
	mov v0.d[1], v0.d[0]
	and v1.8b, v1.8b, v2.8b
	tbl v0.8b, { v0.16b }, v7.8b
	addv b1, v1.8b
	str d0, [sp, #64]
	cnt z1.s, p0/m, z1.s
	fmov w13, s1
	bfxil x11, x13, #0, #3
	and x14, x13, #0x7
	ubfiz w13, w13, #3, #3
	lsl x14, x14, #3
	ldrb w11, [x11]
	orr x9, x13, x9, lsl #6
	lsr x10, x10, x14
	sub w11, w12, w11
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	and w11, w11, #0x7
	and x10, x10, #0xff
	add x11, x12, x11, lsl #8
	ldrb w10, [x11, x10]
	add x9, x9, x10
	sub x1, x9, x8
	mov w0, #1
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB39_11:
	fmov d0, x10
	index z2.b, #-1, #1
	adrp x11, .LCPI39_1
	ldr d3, [x11, :lo12:.LCPI39_1]
	adrp x11, .LCPI39_2
	ptrue p0.s
	add x12, sp, #64
	cnt v0.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v2.8b
	add v0.8b, v1.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v3.8b
	ldr d3, [x11, :lo12:.LCPI39_2]
	adrp x11, .LCPI39_3
	add v0.8b, v1.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v3.8b
	dup v3.8b, w9
	add v0.8b, v1.8b, v0.8b
	cmhs v1.8b, v3.8b, v0.8b
	ldr d3, [x11, :lo12:.LCPI39_3]
	mov v0.d[1], v0.d[0]
	and v1.8b, v1.8b, v3.8b
	tbl v0.8b, { v0.16b }, v2.8b
	addv b1, v1.8b
	str d0, [sp, #64]
	cnt z1.s, p0/m, z1.s
	fmov w11, s1
	bfxil x12, x11, #0, #3
	and x13, x11, #0x7
	ubfiz w11, w11, #3, #3
	lsl x13, x13, #3
	ldrb w12, [x12]
	lsr x10, x10, x13
	sub w9, w9, w12
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	and w9, w9, #0x7
	and x10, x10, #0xff
	add x9, x12, x9, lsl #8
	ldrb w9, [x9, x10]
	add x9, x11, x9
	sub x1, x9, x8
	mov w0, #1
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
