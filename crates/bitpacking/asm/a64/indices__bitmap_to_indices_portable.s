bitpacking::indices::bitmap_to_indices_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cbz x1, .LBB44_6
	adrp x10, :got:bitpacking::indices::POS_LUT
	lsl x9, x1, #3
	mov x8, x0
	ldr x10, [x10, :got_lo12:bitpacking::indices::POS_LUT]
	mov x0, xzr
	mov w11, #56
.LBB44_2:
	subs x12, x3, x0
	b.lo .LBB44_7
	cmp x12, #63
	b.ls .LBB44_8
	ldr x12, [x8], #8
	sub w13, w11, #56
	sub w14, w11, #48
	dup v0.4s, w13
	sub w18, w11, #40
	dup v6.4s, w14
	ubfx x16, x12, #8, #8
	and w13, w12, #0xff
	ubfx x17, x12, #16, #8
	fmov s2, w13
	and x15, x12, #0xff
	dup v7.4s, w18
	fmov s4, w16
	ldr d1, [x10, x15, lsl #3]
	ldr d3, [x10, x16, lsl #3]
	ldr d5, [x10, x17, lsl #3]
	fmov s16, w17
	lsr w14, w12, #24
	cnt v2.8b, v2.8b
	ushll v1.8h, v1.8b, #0
	ushll v3.8h, v3.8b, #0
	cnt v4.8b, v4.8b
	ushll v5.8h, v5.8b, #0
	add x13, x2, x0, lsl #2
	sub w18, w11, #32
	subs x9, x9, #8
	uaddw v17.4s, v0.4s, v1.4h
	uaddw2 v0.4s, v0.4s, v1.8h
	uaddw v1.4s, v6.4s, v3.4h
	fmov w15, s2
	uaddw2 v3.4s, v6.4s, v3.8h
	uaddw v6.4s, v7.4s, v5.4h
	fmov w16, s4
	uaddw2 v5.4s, v7.4s, v5.8h
	cnt v7.8b, v16.8b
	ldr d2, [x10, x14, lsl #3]
	fmov s4, w14
	stp q17, q0, [x13]
	add x14, x13, w15, uxtw #2
	dup v0.4s, w18
	add w15, w16, w15
	ubfx x16, x12, #32, #8
	ushll v2.8h, v2.8b, #0
	add x17, x13, w15, uxtw #2
	stp q1, q3, [x14]
	cnt v3.8b, v4.8b
	ldr d1, [x10, x16, lsl #3]
	sub w14, w11, #24
	stp q6, q5, [x17]
	fmov w17, s7
	dup v4.4s, w14
	ushll v1.8h, v1.8b, #0
	uaddw v5.4s, v0.4s, v2.4h
	uaddw2 v0.4s, v0.4s, v2.8h
	fmov s2, w16
	ubfx x16, x12, #40, #8
	add w14, w15, w17
	fmov w17, s3
	add x15, x13, w14, uxtw #2
	uaddw2 v3.4s, v4.4s, v1.8h
	uaddw v1.4s, v4.4s, v1.4h
	fmov s4, w16
	stp q5, q0, [x15]
	ubfx x15, x12, #48, #8
	lsr x12, x12, #56
	add w14, w14, w17
	cnt v0.8b, v2.8b
	ldr d2, [x10, x16, lsl #3]
	add x17, x13, w14, uxtw #2
	fmov s5, w15
	cnt v4.8b, v4.8b
	fmov d7, x12
	sub w16, w11, #16
	ldr d6, [x10, x12, lsl #3]
	stp q1, q3, [x17]
	ldr d3, [x10, x15, lsl #3]
	ushll v1.8h, v2.8b, #0
	dup v2.4s, w16
	sub w15, w11, #8
	fmov w16, s0
	cnt v5.8b, v5.8b
	cnt v7.8b, v7.8b
	ushll v0.8h, v3.8b, #0
	dup v3.4s, w15
	fmov w15, s4
	ushll v4.8h, v6.8b, #0
	add w12, w14, w16
	uaddw v16.4s, v2.4s, v1.4h
	uaddw2 v1.4s, v2.4s, v1.8h
	add x14, x13, w12, uxtw #2
	dup v6.4s, w11
	add w11, w11, #64
	uaddw v2.4s, v3.4s, v0.4h
	uaddw2 v0.4s, v3.4s, v0.8h
	fmov w16, s5
	add w12, w12, w15
	fmov w15, s7
	stp q16, q1, [x14]
	add x17, x13, w12, uxtb #2
	uaddw2 v1.4s, v6.4s, v4.8h
	add w12, w12, w16
	stp q2, q0, [x17]
	uaddw v0.4s, v6.4s, v4.4h
	add x14, x0, x15
	add x13, x13, w12, uxtb #2
	add x0, x14, w12, uxtb
	stp q0, q1, [x13]
	b.ne .LBB44_2
	ldp x29, x30, [sp], #16
	ret
.LBB44_6:
	mov x0, xzr
	ldp x29, x30, [sp], #16
	ret
.LBB44_7:
	adrp x8, .Lanon.bba673b6abbf1555a5789e1a894d50b2.24
	add x8, x8, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.24
	mov x1, x3
	mov x2, x3
	mov x3, x8
	bl core::slice::index::slice_index_fail
.LBB44_8:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.51
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.51
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.53
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.53
	mov w1, #33
	bl core::panicking::panic
