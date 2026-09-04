bitpacking::select::select_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	sub x9, sp, #176
	and sp, x9, #0xffffffffffffffc0
	lsr x11, x1, #3
	cbz x11, .LBB36_5
	lsl x12, x11, #6
	mov x8, xzr
	mov x9, x0
.LBB36_2:
	ldp q1, q0, [x9]
	ldp q3, q2, [x9, #32]
	cnt v1.16b, v1.16b
	cnt v0.16b, v0.16b
	cnt v2.16b, v2.16b
	cnt v3.16b, v3.16b
	uaddlp v1.8h, v1.16b
	uaddlp v0.8h, v0.16b
	uaddlp v4.8h, v2.16b
	uaddlp v5.8h, v3.16b
	uaddlp v1.4s, v1.8h
	uaddlp v0.4s, v0.8h
	uaddlp v3.4s, v4.8h
	uaddlp v4.4s, v5.8h
	uaddlp v1.2d, v1.4s
	uaddlp v2.2d, v0.4s
	mov v0.16b, v2.16b
	mov v5.16b, v1.16b
	uadalp v0.2d, v3.4s
	uadalp v5.2d, v4.4s
	add v0.2d, v5.2d, v0.2d
	addp d0, v0.2d
	fmov x10, d0
	subs x10, x2, x10
	b.lo .LBB36_10
	subs x12, x12, #64
	add x9, x9, #64
	sub x8, x8, #512
	mov x2, x10
	b.ne .LBB36_2
	ubfiz x12, x1, #3, #3
	cbnz x12, .LBB36_6
	b .LBB36_9
.LBB36_5:
	mov x10, x2
	ubfiz x12, x1, #3, #3
	cbz x12, .LBB36_9
.LBB36_6:
	and x8, x1, #0xffffffffffffff8
	add x13, x0, x8, lsl #3
	neg x8, x11, lsl #9
.LBB36_7:
	ldr x9, [x13], #8
	fmov d0, x9
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x11, d0
	subs x11, x10, x11
	b.lo .LBB36_11
	subs x12, x12, #8
	sub x8, x8, #64
	mov x10, x11
	b.ne .LBB36_7
.LBB36_9:
	mov x0, xzr
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB36_10:
	movi v0.2d, #0000000000000000
	uaddlp v3.2d, v3.4s
	adrp x10, .LCPI36_0
	uaddlp v4.2d, v4.4s
	ext v5.16b, v1.16b, v2.16b, #8
	adrp x11, .LCPI36_1
	adrp x12, .LCPI36_3
	ext v6.16b, v2.16b, v4.16b, #8
	ext v7.16b, v4.16b, v3.16b, #8
	zip1 v16.2d, v0.2d, v1.2d
	add v2.2d, v5.2d, v2.2d
	add v3.2d, v7.2d, v3.2d
	add v4.2d, v6.2d, v4.2d
	add v1.2d, v16.2d, v1.2d
	add v3.2d, v4.2d, v3.2d
	add v5.2d, v1.2d, v2.2d
	add v2.2d, v2.2d, v4.2d
	dup v4.2d, x2
	zip1 v0.2d, v0.2d, v1.2d
	add v3.2d, v5.2d, v3.2d
	add v2.2d, v1.2d, v2.2d
	cmhs v16.2d, v4.2d, v5.2d
	cmhs v6.2d, v4.2d, v3.2d
	cmhs v7.2d, v4.2d, v2.2d
	cmhs v4.2d, v4.2d, v1.2d
	ext v1.16b, v1.16b, v5.16b, #8
	ext v5.16b, v5.16b, v2.16b, #8
	ext v2.16b, v2.16b, v3.16b, #8
	uzp1 v6.4s, v7.4s, v6.4s
	uzp1 v4.4s, v4.4s, v16.4s
	ldr d7, [x11, :lo12:.LCPI36_1]
	adrp x11, .LCPI36_2
	ldr d16, [x11, :lo12:.LCPI36_2]
	add x11, sp, #64
	stp q0, q1, [sp, #64]
	ldr d0, [x12, :lo12:.LCPI36_3]
	stp q5, q2, [sp, #96]
	uzp1 v4.8h, v4.8h, v6.8h
	ldr q6, [x10, :lo12:.LCPI36_0]
	and v4.16b, v4.16b, v6.16b
	addv h4, v4.8h
	fmov w10, s4
	and w10, w10, #0xff
	fmov s4, w10
	cnt v4.8b, v4.8b
	fmov w10, s4
	and w10, w10, #0x7
	ldr x9, [x9, w10, uxtw #3]
	orr x13, x11, x10, lsl #3
	fmov d4, x9
	ldr w12, [x13]
	adrp x13, .LCPI36_4
	ldr d2, [x13, :lo12:.LCPI36_4]
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
	fmov w13, s1
	fmov s1, w13
	cnt v1.8b, v1.8b
	fmov w13, s1
	bfxil x11, x13, #0, #3
	and x14, x13, #0x7
	ubfiz w13, w13, #3, #3
	lsl x14, x14, #3
	ldrb w11, [x11]
	orr x10, x13, x10, lsl #6
	lsr x9, x9, x14
	sub w11, w12, w11
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	and w11, w11, #0x7
	and x9, x9, #0xff
	add x11, x12, x11, lsl #8
	ldrb w9, [x11, x9]
	add x9, x10, x9
	sub x1, x9, x8
	mov w0, #1
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB36_11:
	fmov d0, x9
	adrp x11, .LCPI36_1
	add x12, sp, #64
	ldr d2, [x11, :lo12:.LCPI36_1]
	adrp x11, .LCPI36_2
	ldr d3, [x11, :lo12:.LCPI36_2]
	adrp x11, .LCPI36_3
	cnt v0.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v2.8b
	add v0.8b, v1.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v3.8b
	ldr d3, [x11, :lo12:.LCPI36_3]
	adrp x11, .LCPI36_4
	add v0.8b, v1.8b, v0.8b
	mov v1.16b, v0.16b
	mov v1.d[1], v0.d[0]
	tbl v1.8b, { v1.16b }, v3.8b
	dup v3.8b, w10
	add v0.8b, v1.8b, v0.8b
	cmhs v1.8b, v3.8b, v0.8b
	ldr d3, [x11, :lo12:.LCPI36_4]
	mov v0.d[1], v0.d[0]
	and v1.8b, v1.8b, v3.8b
	tbl v0.8b, { v0.16b }, v2.8b
	addv b1, v1.8b
	str d0, [sp, #64]
	fmov w11, s1
	fmov s1, w11
	cnt v1.8b, v1.8b
	fmov w11, s1
	bfxil x12, x11, #0, #3
	and x13, x11, #0x7
	ubfiz w11, w11, #3, #3
	lsl x13, x13, #3
	ldrb w12, [x12]
	lsr x9, x9, x13
	sub w10, w10, w12
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	and w10, w10, #0x7
	and x9, x9, #0xff
	add x10, x12, x10, lsl #8
	ldrb w9, [x10, x9]
	add x9, x11, x9
	sub x1, x9, x8
	mov w0, #1
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
