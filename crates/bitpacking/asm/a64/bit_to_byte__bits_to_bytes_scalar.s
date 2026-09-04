bitpacking::bit_to_byte::bits_to_bytes_scalar:
	sub sp, sp, #496
	stp d15, d14, [sp, #400]
	stp d13, d12, [sp, #416]
	stp d11, d10, [sp, #432]
	stp d9, d8, [sp, #448]
	stp x29, x30, [sp, #464]
	str x28, [sp, #480]
	add x29, sp, #464
	cmp x3, x1, lsl #6
	b.lo .LBB7_5
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB7_4
	adrp x9, .LCPI7_0
	adrp x10, .LCPI7_1
	adrp x11, .LCPI7_2
	ldr d0, [x9, :lo12:.LCPI7_0]
	adrp x9, .LCPI7_3
	movi v18.16b, #1
	str d0, [x29, #24]
	ldr q0, [x10, :lo12:.LCPI7_1]
	adrp x10, .LCPI7_5
	stur q0, [x29, #-80]
	ldr q0, [x11, :lo12:.LCPI7_2]
	adrp x11, .LCPI7_30
	ldr q14, [x11, :lo12:.LCPI7_30]
	stur q0, [x29, #-96]
	ldr q0, [x9, :lo12:.LCPI7_3]
	adrp x9, .LCPI7_4
	stur q0, [x29, #-112]
	ldr q0, [x9, :lo12:.LCPI7_4]
	adrp x9, .LCPI7_6
	stur q0, [x29, #-128]
	ldr q0, [x10, :lo12:.LCPI7_5]
	adrp x10, .LCPI7_8
	stur q0, [x29, #-144]
	ldr q0, [x9, :lo12:.LCPI7_6]
	adrp x9, .LCPI7_7
	stur q0, [x29, #-160]
	ldr q0, [x9, :lo12:.LCPI7_7]
	adrp x9, .LCPI7_9
	ldr q17, [x9, :lo12:.LCPI7_9]
	adrp x9, .LCPI7_10
	stur q0, [x29, #-176]
	ldr q0, [x10, :lo12:.LCPI7_8]
	adrp x10, .LCPI7_12
	stur q0, [x29, #-192]
	ldr q0, [x9, :lo12:.LCPI7_10]
	adrp x9, .LCPI7_11
	stur q0, [x29, #-208]
	ldr q0, [x9, :lo12:.LCPI7_11]
	adrp x9, .LCPI7_13
	stur q0, [x29, #-224]
	ldr q0, [x10, :lo12:.LCPI7_12]
	adrp x10, .LCPI7_15
	str q0, [sp, #224]
	ldr q0, [x9, :lo12:.LCPI7_13]
	adrp x9, .LCPI7_14
	str q0, [sp, #208]
	ldr q0, [x9, :lo12:.LCPI7_14]
	adrp x9, .LCPI7_16
	str q0, [sp, #192]
	ldr q0, [x10, :lo12:.LCPI7_15]
	adrp x10, .LCPI7_18
	str q0, [sp, #176]
	ldr q0, [x9, :lo12:.LCPI7_16]
	adrp x9, .LCPI7_17
	str q0, [sp, #160]
	ldr q0, [x9, :lo12:.LCPI7_17]
	adrp x9, .LCPI7_19
	str q0, [sp, #144]
	ldr q0, [x10, :lo12:.LCPI7_18]
	adrp x10, .LCPI7_21
	str q0, [sp, #128]
	ldr q0, [x9, :lo12:.LCPI7_19]
	adrp x9, .LCPI7_20
	str q0, [sp, #112]
	ldr q0, [x9, :lo12:.LCPI7_20]
	adrp x9, .LCPI7_22
	str q0, [sp, #96]
	ldr q0, [x10, :lo12:.LCPI7_21]
	adrp x10, .LCPI7_24
	str q0, [sp, #80]
	ldr q0, [x9, :lo12:.LCPI7_22]
	adrp x9, .LCPI7_23
	str q0, [sp, #64]
	ldr q0, [x9, :lo12:.LCPI7_23]
	adrp x9, .LCPI7_25
	ldr q16, [x9, :lo12:.LCPI7_25]
	adrp x9, .LCPI7_26
	str q0, [sp, #48]
	ldr q0, [x10, :lo12:.LCPI7_24]
	adrp x10, .LCPI7_27
	ldr q31, [x9, :lo12:.LCPI7_26]
	adrp x9, .LCPI7_28
	str q0, [sp, #32]
	ldr q0, [x10, :lo12:.LCPI7_27]
	adrp x10, .LCPI7_29
	ldr q15, [x10, :lo12:.LCPI7_29]
	str q0, [sp, #16]
	ldr q0, [x9, :lo12:.LCPI7_28]
	str q0, [sp]
.LBB7_3:
	ldr x9, [x0], #8
	ldr q6, [sp, #192]
	ldp q1, q2, [x29, #-160]
	subs x8, x8, #1
	dup v0.2d, x9
	ubfx w10, w9, #4, #1
	ubfx w11, w9, #5, #1
	strb w10, [x2, #4]
	ubfx w10, w9, #6, #1
	ushl v26.2d, v0.2d, v2.2d
	ushl v22.2d, v0.2d, v6.2d
	ldr q6, [sp, #128]
	ushl v25.2d, v0.2d, v1.2d
	ldp q1, q2, [x29, #-192]
	ushl v9.2d, v0.2d, v6.2d
	strb w11, [x2, #5]
	strb w10, [x2, #6]
	ushl v24.2d, v0.2d, v2.2d
	ldp q10, q2, [x29, #-96]
	ushl v23.2d, v0.2d, v1.2d
	dup v1.4h, w9
	lsr x9, x9, #63
	ushl v30.2d, v0.2d, v2.2d
	ldur q2, [x29, #-208]
	strb w9, [x2, #63]
	tbl v23.16b, { v23.16b, v24.16b, v25.16b, v26.16b }, v17.16b
	ldp q25, q24, [sp, #48]
	ushl v29.2d, v0.2d, v10.2d
	ushl v5.2d, v0.2d, v2.2d
	bic v1.4h, #255, lsl #8
	ushl v13.2d, v0.2d, v24.2d
	ldur q24, [x29, #-112]
	ushl v12.2d, v0.2d, v25.2d
	ushl v28.2d, v0.2d, v24.2d
	ldur q24, [x29, #-224]
	ushl v4.2d, v0.2d, v24.2d
	ldr q24, [sp, #176]
	ushl v21.2d, v0.2d, v24.2d
	ldur q24, [x29, #-128]
	ushl v27.2d, v0.2d, v24.2d
	ldr q24, [sp, #224]
	ushl v3.2d, v0.2d, v24.2d
	ldr q24, [sp, #160]
	ushl v20.2d, v0.2d, v24.2d
	ldr q24, [sp, #112]
	ushl v8.2d, v0.2d, v24.2d
	ldr q24, [sp, #208]
	ushl v2.2d, v0.2d, v24.2d
	ldr q24, [sp, #144]
	ushl v19.2d, v0.2d, v24.2d
	tbl v24.16b, { v27.16b, v28.16b, v29.16b, v30.16b }, v17.16b
	ldr q29, [sp, #96]
	ushl v28.2d, v0.2d, v31.2d
	tbl v2.16b, { v2.16b, v3.16b, v4.16b, v5.16b }, v17.16b
	mov v5.16b, v23.16b
	ushl v7.2d, v0.2d, v29.2d
	ldp q29, q30, [sp, #16]
	ldr d3, [x29, #24]
	mov v5.d[1], v24.d[0]
	ushl v27.2d, v0.2d, v29.2d
	ldr q29, [sp, #80]
	ushl v11.2d, v0.2d, v30.2d
	ushl v10.2d, v0.2d, v16.2d
	ushl v1.4h, v1.4h, v3.4h
	ushl v6.2d, v0.2d, v29.2d
	ldr q29, [sp]
	ushl v26.2d, v0.2d, v29.2d
	tbl v3.16b, { v10.16b, v11.16b, v12.16b, v13.16b }, v17.16b
	bic v1.4h, #254
	ushl v25.2d, v0.2d, v15.2d
	tbl v0.16b, { v19.16b, v20.16b, v21.16b, v22.16b }, v17.16b
	tbl v4.16b, { v6.16b, v7.16b, v8.16b, v9.16b }, v17.16b
	tbl v6.16b, { v25.16b, v26.16b, v27.16b, v28.16b }, v14.16b
	mov v0.d[1], v2.d[0]
	mov v3.d[1], v4.d[0]
	ushr v2.16b, v23.16b, #7
	and v4.16b, v5.16b, v18.16b
	movi v5.8b, #1
	uzp1 v1.8b, v1.8b, v0.8b
	mov v4.b[0], v2.b[0]
	and v0.16b, v0.16b, v18.16b
	and v5.8b, v6.8b, v5.8b
	and v2.16b, v3.16b, v18.16b
	stur q0, [x2, #23]
	stur d5, [x2, #55]
	str s1, [x2]
	stur q2, [x2, #39]
	stur q4, [x2, #7]
	add x2, x2, #64
	b.ne .LBB7_3
.LBB7_4:
	ldp x29, x30, [sp, #464]
	ldr x28, [sp, #480]
	ldp d9, d8, [sp, #448]
	ldp d11, d10, [sp, #432]
	ldp d13, d12, [sp, #416]
	ldp d15, d14, [sp, #400]
	add sp, sp, #496
	ret
.LBB7_5:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.32
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.32
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.36
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.36
	mov w1, #46
	bl core::panicking::panic
