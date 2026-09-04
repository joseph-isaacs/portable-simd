bitpacking::bit_to_byte::bits_to_bytes_scalar:
	stp d15, d14, [sp, #-96]!
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	stp x29, x30, [sp, #64]
	str x28, [sp, #80]
	add x29, sp, #64
	addvl x9, sp, #-23
	sub sp, sp, #1, lsl #12
	cmp sp, x9
	b.le .LBB7_2
.LBB7_1:
	str xzr, [sp]
	sub sp, sp, #1, lsl #12
	cmp sp, x9
	b.gt .LBB7_1
.LBB7_2:
	mov sp, x9
	ldr xzr, [sp]
	cmp x3, x1, lsl #6
	b.lo .LBB7_7
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB7_6
	index z14.d, #0, #-1
	sub x9, x29, #64
	index z30.b, #0, #8
	movi v21.16b, #1
	mov z0.d, z14.d
	mov z1.d, z14.d
	mov z2.d, z14.d
	mov z3.d, z14.d
	mov z4.d, z14.d
	mov z5.d, z14.d
	mov z6.d, z14.d
	mov z12.d, z14.d
	mov z13.d, z14.d
	sub z0.d, z0.d, #21
	sub z1.d, z1.d, #19
	sub z2.d, z2.d, #17
	sub z3.d, z3.d, #15
	sub z4.d, z4.d, #13
	sub z5.d, z5.d, #11
	sub z6.d, z6.d, #9
	sub z12.d, z12.d, #61
	sub z13.d, z13.d, #59
	str z0, [x9, #-1, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-2, mul vl]
	mov z1.d, z14.d
	str z2, [x9, #-3, mul vl]
	mov z2.d, z14.d
	sub z0.d, z0.d, #37
	str z3, [x9, #-4, mul vl]
	sub z1.d, z1.d, #35
	str z4, [x9, #-5, mul vl]
	sub z2.d, z2.d, #29
	str z5, [x9, #-6, mul vl]
	str z0, [x9, #-8, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-9, mul vl]
	mov z1.d, z14.d
	str z2, [x9, #-12, mul vl]
	mov z2.d, z14.d
	sub z0.d, z0.d, #33
	str z6, [x9, #-7, mul vl]
	sub z1.d, z1.d, #31
	sub z2.d, z2.d, #23
	str z0, [x9, #-10, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-11, mul vl]
	mov z1.d, z14.d
	str z2, [x9, #-15, mul vl]
	mov z2.d, z14.d
	sub z0.d, z0.d, #27
	sub z1.d, z1.d, #25
	sub z2.d, z2.d, #49
	str z0, [x9, #-13, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-14, mul vl]
	mov z1.d, z14.d
	str z2, [x9, #-18, mul vl]
	mov z2.d, z14.d
	sub z0.d, z0.d, #53
	sub z1.d, z1.d, #51
	sub z2.d, z2.d, #43
	str z0, [x9, #-16, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-17, mul vl]
	mov z1.d, z14.d
	str z2, [x9, #-21, mul vl]
	sub z0.d, z0.d, #47
	sub z1.d, z1.d, #45
	str z0, [x9, #-19, mul vl]
	mov z0.d, z14.d
	str z1, [x9, #-20, mul vl]
	mov z1.d, z14.d
	sub z14.d, z14.d, #57
	sub z0.d, z0.d, #41
	sub z1.d, z1.d, #39
	str z0, [x9, #-22, mul vl]
	str z1, [x9, #-23, mul vl]
	adrp x9, .LCPI7_0
	ldr q1, [x9, :lo12:.LCPI7_0]
.LBB7_5:
	ldr x9, [x0], #8
	sub x10, x29, #64
	ldr z0, [x10, #-5, mul vl]
	index z3.d, #0, #-8
	ldr z20, [x10, #-3, mul vl]
	dup v2.2d, x9
	ldr z31, [x10, #-19, mul vl]
	dup v15.4h, w9
	ubfx w11, w9, #5, #1
	subs x8, x8, #1
	ushl v7.2d, v2.2d, v0.2d
	ldr z0, [x10, #-6, mul vl]
	strb w11, [x2, #5]
	bic v15.4h, #255, lsl #8
	ushl v6.2d, v2.2d, v0.2d
	ldr z0, [x10, #-7, mul vl]
	ushl v5.2d, v2.2d, v0.2d
	index z0.d, #0, #-1
	ushl v4.2d, v2.2d, v3.2d
	ldr z3, [x10, #-1, mul vl]
	ushl v19.2d, v2.2d, v3.2d
	ldr z3, [x10, #-8, mul vl]
	tbl v7.16b, { v4.16b, v5.16b, v6.16b, v7.16b }, v30.16b
	sub z0.d, z0.d, #55
	ushl v25.2d, v2.2d, v3.2d
	ldr z3, [x10, #-12, mul vl]
	ushl v29.2d, v2.2d, v3.2d
	ldr z3, [x10, #-16, mul vl]
	ushl v11.2d, v2.2d, v3.2d
	ldr z3, [x10, #-2, mul vl]
	ushl v18.2d, v2.2d, v3.2d
	ldr z3, [x10, #-20, mul vl]
	ushl v17.2d, v2.2d, v20.2d
	ldr z20, [x10, #-9, mul vl]
	ushl v6.2d, v2.2d, v3.2d
	ushl v24.2d, v2.2d, v20.2d
	ldr z20, [x10, #-13, mul vl]
	ushl v28.2d, v2.2d, v20.2d
	ldr z20, [x10, #-4, mul vl]
	ushl v16.2d, v2.2d, v20.2d
	ldr z20, [x10, #-10, mul vl]
	ushl v23.2d, v2.2d, v20.2d
	ldr z20, [x10, #-14, mul vl]
	tbl v16.16b, { v16.16b, v17.16b, v18.16b, v19.16b }, v30.16b
	ldr z17, [x10, #-18, mul vl]
	ushl v27.2d, v2.2d, v20.2d
	ldr z20, [x10, #-17, mul vl]
	ushl v10.2d, v2.2d, v20.2d
	ldr z20, [x10, #-11, mul vl]
	ushl v9.2d, v2.2d, v17.2d
	ldr z17, [x10, #-21, mul vl]
	ushl v8.2d, v2.2d, v31.2d
	ldr z31, [x10, #-23, mul vl]
	ushl v22.2d, v2.2d, v20.2d
	ldr z20, [x10, #-15, mul vl]
	ushl v5.2d, v2.2d, v17.2d
	ldr z17, [x10, #-22, mul vl]
	ubfx w10, w9, #4, #1
	ushl v26.2d, v2.2d, v20.2d
	tbl v22.16b, { v22.16b, v23.16b, v24.16b, v25.16b }, v30.16b
	strb w10, [x2, #4]
	ushl v4.2d, v2.2d, v17.2d
	ushl v20.2d, v2.2d, v12.2d
	ubfx w10, w9, #6, #1
	ushl v3.2d, v2.2d, v31.2d
	ushl v19.2d, v2.2d, v13.2d
	index z31.h, #0, #-1
	ushl v18.2d, v2.2d, v14.2d
	tbl v26.16b, { v26.16b, v27.16b, v28.16b, v29.16b }, v30.16b
	lsr x9, x9, #63
	ushl v17.2d, v2.2d, v0.2d
	tbl v2.16b, { v8.16b, v9.16b, v10.16b, v11.16b }, v30.16b
	strb w10, [x2, #6]
	tbl v0.16b, { v3.16b, v4.16b, v5.16b, v6.16b }, v30.16b
	mov v3.16b, v7.16b
	ushr v5.16b, v7.16b, #7
	ushl v15.4h, v15.4h, v31.4h
	movi v6.8b, #1
	strb w9, [x2, #63]
	tbl v4.16b, { v17.16b, v18.16b, v19.16b, v20.16b }, v1.16b
	mov v26.d[1], v22.d[0]
	mov v3.d[1], v16.d[0]
	mov v0.d[1], v2.d[0]
	bic v15.4h, #254
	and v4.8b, v4.8b, v6.8b
	and v6.16b, v26.16b, v21.16b
	and v3.16b, v3.16b, v21.16b
	uzp1 v2.8b, v15.8b, v0.8b
	and v0.16b, v0.16b, v21.16b
	stur d4, [x2, #55]
	mov v3.b[0], v5.b[0]
	stur q6, [x2, #23]
	stur q0, [x2, #39]
	str s2, [x2]
	stur q3, [x2, #7]
	add x2, x2, #64
	b.ne .LBB7_5
.LBB7_6:
	addvl sp, sp, #23
	ldp x29, x30, [sp, #64]
	ldr x28, [sp, #80]
	ldp d9, d8, [sp, #48]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #96
	ret
.LBB7_7:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.38
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.38
	mov w1, #46
	bl core::panicking::panic
