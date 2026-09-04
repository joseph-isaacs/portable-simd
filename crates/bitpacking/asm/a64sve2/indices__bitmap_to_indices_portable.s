bitpacking::indices::bitmap_to_indices_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cbz x1, .LBB48_6
	adrp x10, :got:bitpacking::indices::POS_LUT
	lsl x9, x1, #3
	ptrue p0.s
	ldr x10, [x10, :got_lo12:bitpacking::indices::POS_LUT]
	mov x8, x0
	mov x0, xzr
	mov w11, #56
.LBB48_2:
	subs x12, x3, x0
	b.lo .LBB48_7
	cmp x12, #63
	b.ls .LBB48_8
	ldr x13, [x8], #8
	sub w14, w11, #56
	sub w15, w11, #48
	dup v0.4s, w14
	dup v5.4s, w15
	sub w17, w11, #40
	and w14, w13, #0xff
	ubfx x16, x13, #8, #8
	lsr w15, w13, #24
	fmov s1, w14
	and x14, x13, #0xff
	add x12, x2, x0, lsl #2
	fmov s3, w16
	ldr d2, [x10, x16, lsl #3]
	ubfx x16, x13, #16, #8
	ldr d4, [x10, x14, lsl #3]
	fmov s17, w15
	ldr d16, [x10, x15, lsl #3]
	cnt z1.s, p0/m, z1.s
	fmov s7, w16
	ldr d6, [x10, x16, lsl #3]
	cnt z3.s, p0/m, z3.s
	ushll v4.8h, v4.8b, #0
	ushll v2.8h, v2.8b, #0
	cnt z17.s, p0/m, z17.s
	dup v18.4s, w17
	ushll v6.8h, v6.8b, #0
	cnt z7.s, p0/m, z7.s
	sub w14, w11, #32
	ushll v16.8h, v16.8b, #0
	uaddw v19.4s, v0.4s, v4.4h
	uaddw2 v0.4s, v0.4s, v4.8h
	uaddw v4.4s, v5.4s, v2.4h
	uaddw2 v2.4s, v5.4s, v2.8h
	dup v5.4s, w14
	ubfx x14, x13, #32, #8
	subs x9, x9, #8
	stp q19, q0, [x12]
	fmov w15, s1
	uaddw2 v1.4s, v18.4s, v6.8h
	uaddw v0.4s, v5.4s, v16.4h
	fmov w17, s3
	uaddw v3.4s, v18.4s, v6.4h
	add x16, x12, w15, uxtw #2
	add w15, w17, w15
	stp q4, q2, [x16]
	add x17, x12, w15, uxtw #2
	fmov w16, s7
	ldr d2, [x10, x14, lsl #3]
	uaddw2 v4.4s, v5.4s, v16.8h
	stp q3, q1, [x17]
	sub w17, w11, #24
	fmov s1, w14
	add w15, w15, w16
	fmov w16, s17
	dup v3.4s, w17
	ubfx x17, x13, #40, #8
	add x18, x12, w15, uxtw #2
	ushll v2.8h, v2.8b, #0
	cnt z1.s, p0/m, z1.s
	fmov s6, w17
	add w14, w15, w16
	ubfx x15, x13, #48, #8
	lsr x13, x13, #56
	uaddw v7.4s, v3.4s, v2.4h
	uaddw2 v2.4s, v3.4s, v2.8h
	fmov s16, w15
	ldr d3, [x10, x15, lsl #3]
	sub w15, w11, #16
	cnt z6.s, p0/m, z6.s
	fmov s18, w13
	dup v19.4s, w15
	ldr d5, [x10, x17, lsl #3]
	ldr d17, [x10, x13, lsl #3]
	add x13, x12, w14, uxtw #2
	cnt z16.s, p0/m, z16.s
	sub w16, w11, #8
	stp q0, q4, [x18]
	cnt z18.s, p0/m, z18.s
	ushll v5.8h, v5.8b, #0
	ushll v0.8h, v3.8b, #0
	fmov w15, s1
	dup v1.4s, w16
	stp q7, q2, [x13]
	uaddw v2.4s, v19.4s, v5.4h
	uaddw2 v3.4s, v19.4s, v5.8h
	ushll v5.8h, v17.8b, #0
	add w13, w14, w15
	uaddw v4.4s, v1.4s, v0.4h
	uaddw2 v0.4s, v1.4s, v0.8h
	fmov w15, s6
	add x14, x12, w13, uxtw #2
	dup v6.4s, w11
	add w11, w11, #64
	fmov w16, s16
	stp q2, q3, [x14]
	add w13, w13, w15
	fmov w15, s18
	uaddw2 v1.4s, v6.4s, v5.8h
	add x17, x12, w13, uxtb #2
	add w13, w13, w16
	stp q4, q0, [x17]
	uaddw v0.4s, v6.4s, v5.4h
	add x14, x0, x15
	add x12, x12, w13, uxtb #2
	add x0, x14, w13, uxtb
	stp q0, q1, [x12]
	b.ne .LBB48_2
	ldp x29, x30, [sp], #16
	ret
.LBB48_6:
	mov x0, xzr
	ldp x29, x30, [sp], #16
	ret
.LBB48_7:
	adrp x8, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.26
	add x8, x8, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.26
	mov x1, x3
	mov x2, x3
	mov x3, x8
	bl core::slice::index::slice_index_fail
.LBB48_8:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.53
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.53
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.55
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.55
	mov w1, #33
	bl core::panicking::panic
