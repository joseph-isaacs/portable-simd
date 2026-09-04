bitpacking::select::select_sve2:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	sub x9, sp, #176
	and sp, x9, #0xffffffffffffffc0
	lsr x10, x1, #3
	cbz x10, .LBB37_5
	lsl x11, x10, #6
	ptrue p0.d, vl2
	mov x8, xzr
	mov x9, x0
.LBB37_2:
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
	fmov x12, d4
	subs x12, x2, x12
	b.lo .LBB37_10
	subs x11, x11, #64
	add x9, x9, #64
	sub x8, x8, #512
	mov x2, x12
	b.ne .LBB37_2
	ubfiz x9, x1, #3, #3
	cbnz x9, .LBB37_6
	b .LBB37_9
.LBB37_5:
	mov x12, x2
	ubfiz x9, x1, #3, #3
	cbz x9, .LBB37_9
.LBB37_6:
	and x8, x1, #0xffffffffffffff8
	ptrue p0.d
	add x11, x0, x8, lsl #3
	neg x8, x10, lsl #9
.LBB37_7:
	ldr x13, [x11], #8
	fmov d0, x13
	cnt z0.d, p0/m, z0.d
	fmov x10, d0
	subs x10, x12, x10
	b.lo .LBB37_11
	subs x9, x9, #8
	sub x8, x8, #64
	mov x12, x10
	b.ne .LBB37_7
.LBB37_9:
	mov x0, xzr
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB37_10:
	movi v4.2d, #0000000000000000
	ext v5.16b, v0.16b, v2.16b, #8
	adrp x10, .LCPI37_0
	ext v6.16b, v3.16b, v0.16b, #8
	ext v7.16b, v1.16b, v3.16b, #8
	add x11, sp, #64
	ptrue p0.s
	mov w0, #1
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
	ldr q6, [x10, :lo12:.LCPI37_0]
	and v3.16b, v3.16b, v6.16b
	addv h3, v3.8h
	fmov w10, s3
	and w10, w10, #0xff
	fmov s3, w10
	cnt z3.s, p0/m, z3.s
	fmov w10, s3
	and w10, w10, #0x7
	orr x11, x11, x10, lsl #3
	ldr d1, [x9, w10, uxtw #3]
	ldr w11, [x11]
	sub w11, w2, w11
	lsl x11, x0, x11
	fmov d0, x11
	bdep z0.d, z0.d, z1.d
	fmov x9, d0
	rbit x9, x9
	clz x9, x9
	add x9, x9, x10, lsl #6
	sub x1, x9, x8
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
.LBB37_11:
	mov w0, #1
	fmov d1, x13
	lsl x9, x0, x12
	fmov d0, x9
	bdep z0.d, z0.d, z1.d
	fmov x9, d0
	rbit x9, x9
	clz x9, x9
	sub x1, x9, x8
	mov sp, x29
	ldp x29, x30, [sp], #16
	ret
