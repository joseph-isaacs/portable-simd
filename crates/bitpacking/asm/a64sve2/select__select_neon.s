bitpacking::select::select_neon:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	sub x9, sp, #176
	and sp, x9, #0xffffffffffffffc0
	lsr x11, x1, #3
	cbz x11, .LBB36_5
	lsl x12, x11, #6
	ptrue p0.d, vl2
	mov x8, xzr
	mov x9, x0
.LBB36_2:
	ldp q0, q2, [x9, #32]
	ldp q1, q3, [x9]
	cnt z0.d, p0/m, z0.d
	cnt z2.d, p0/m, z2.d
	cnt z1.d, p0/m, z1.d
	cnt z3.d, p0/m, z3.d
	add v4.2d, v3.2d, v2.2d
	add v5.2d, v1.2d, v0.2d
	add v4.2d, v5.2d, v4.2d
	addp d4, v4.2d
	fmov x10, d4
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
	ptrue p0.d
	add x13, x0, x8, lsl #3
	neg x8, x11, lsl #9
.LBB36_7:
	ldr x9, [x13], #8
	fmov d0, x9
	cnt z0.d, p0/m, z0.d
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
	movi v4.2d, #0000000000000000
	ext v5.16b, v0.16b, v2.16b, #8
	adrp x10, .LCPI36_0
	ext v6.16b, v3.16b, v0.16b, #8
	ext v7.16b, v1.16b, v3.16b, #8
	ptrue p0.s
	zip1 v16.2d, v4.2d, v1.2d
	add v2.2d, v5.2d, v2.2d
	add v3.2d, v7.2d, v3.2d
	add v0.2d, v6.2d, v0.2d
	add v1.2d, v16.2d, v1.2d
	add v2.2d, v0.2d, v2.2d
	add v0.2d, v3.2d, v0.2d
	add v5.2d, v1.2d, v3.2d
	dup v3.2d, x2
	add v0.2d, v1.2d, v0.2d
	zip1 v4.2d, v4.2d, v1.2d
	add v2.2d, v5.2d, v2.2d
	cmhs v7.2d, v3.2d, v0.2d
	cmhs v16.2d, v3.2d, v5.2d
	cmhs v6.2d, v3.2d, v2.2d
	cmhs v3.2d, v3.2d, v1.2d
	ext v1.16b, v1.16b, v5.16b, #8
	ext v5.16b, v5.16b, v0.16b, #8
	ext v0.16b, v0.16b, v2.16b, #8
	uzp1 v6.4s, v7.4s, v6.4s
	uzp1 v3.4s, v3.4s, v16.4s
	stp q4, q1, [sp, #64]
	stp q5, q0, [sp, #96]
	uzp1 v3.8h, v3.8h, v6.8h
	ldr q6, [x10, :lo12:.LCPI36_0]
	and v3.16b, v3.16b, v6.16b
	addv h3, v3.8h
	fmov w10, s3
	and w10, w10, #0xff
	fmov s3, w10
	cnt z3.s, p0/m, z3.s
	fmov w10, s3
	and w10, w10, #0x7
	ldr x9, [x9, w10, uxtw #3]
	fmov d3, x9
	cnt v3.8b, v3.8b
	fmov x11, d3
	lsl x11, x11, #8
	fmov d6, x11
	add v3.8b, v3.8b, v6.8b
	fmov x11, d3
	lsl x11, x11, #16
	fmov d2, x11
	add x11, sp, #64
	orr x12, x11, x10, lsl #3
	add v1.8b, v3.8b, v2.8b
	ldr w12, [x12]
	sub w12, w2, w12
	fmov x13, d1
	dup v2.8b, w12
	lsl x13, x13, #32
	fmov d0, x13
	add v0.8b, v1.8b, v0.8b
	cmhs v1.8b, v2.8b, v0.8b
	fmov x13, d0
	sshll v1.8h, v1.8b, #0
	lsl x13, x13, #8
	str x13, [sp, #64]
	saddlv s1, v1.8h
	fmov w14, s1
	neg w14, w14
	bfxil x11, x14, #0, #3
	and x13, x14, #0x7
	lsl x14, x13, #3
	lsl w13, w13, #3
	ldrb w11, [x11]
	lsr x9, x9, x14
	orr x10, x13, x10, lsl #6
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
	dup v2.8b, w10
	add x13, sp, #64
	cnt v0.8b, v0.8b
	fmov x11, d0
	lsl x11, x11, #8
	fmov d1, x11
	add v0.8b, v0.8b, v1.8b
	fmov x11, d0
	lsl x11, x11, #16
	fmov d1, x11
	add v0.8b, v0.8b, v1.8b
	fmov x11, d0
	lsl x11, x11, #32
	fmov d1, x11
	add v0.8b, v0.8b, v1.8b
	cmhs v1.8b, v2.8b, v0.8b
	fmov x11, d0
	sshll v1.8h, v1.8b, #0
	lsl x11, x11, #8
	str x11, [sp, #64]
	saddlv s1, v1.8h
	fmov w12, s1
	neg w12, w12
	bfxil x13, x12, #0, #3
	and x11, x12, #0x7
	ldrb w12, [x13]
	lsl x13, x11, #3
	lsl w11, w11, #3
	sub w10, w10, w12
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	lsr x9, x9, x13
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
