bitpacking::byte_to_bit::bytes_to_bits_scalar:
	add x8, x1, #63
	lsr x8, x8, #6
	cmp x3, x8
	csel x8, x3, x8, lo
	cbz x1, .LBB12_22
	cbz x8, .LBB12_22
	sub sp, sp, #272
	stp d15, d14, [sp, #192]
	stp d13, d12, [sp, #208]
	stp d11, d10, [sp, #224]
	stp d9, d8, [sp, #240]
	str x30, [sp, #256]
	mov w13, #4
	adrp x14, .LCPI12_1
	adrp x15, .LCPI12_2
	dup v6.2d, x13
	adrp x13, .LCPI12_0
	adrp x11, .LCPI12_6
	ldr q0, [x13, :lo12:.LCPI12_0]
	adrp x13, .LCPI12_3
	adrp x12, .LCPI12_7
	ldr q28, [x11, :lo12:.LCPI12_6]
	ldr q27, [x12, :lo12:.LCPI12_7]
	mov w11, #1
	str q0, [sp, #80]
	ldr q0, [x14, :lo12:.LCPI12_1]
	adrp x14, .LCPI12_4
	mov w12, #63
	dup v4.2d, x11
	mov x9, xzr
	str q0, [sp, #64]
	ldr q0, [x15, :lo12:.LCPI12_2]
	dup v5.2d, x12
	adrp x15, .LCPI12_5
	mov w10, #64
	stp q27, q28, [sp, #144]
	str q0, [sp, #48]
	ldr q0, [x13, :lo12:.LCPI12_3]
	mov w13, #16
	stp q5, q4, [sp, #112]
	str q0, [sp, #32]
	ldr q0, [x14, :lo12:.LCPI12_4]
	mov x14, x0
	str q6, [sp, #96]
	str q0, [sp, #16]
	ldr q0, [x15, :lo12:.LCPI12_5]
	mov x15, x1
	str q0, [sp]
	b .LBB12_5
.LBB12_3:
	mov x5, xzr
.LBB12_4:
	add x16, x9, #1
	str x5, [x2, x9, lsl #3]
	add x14, x14, #64
	cmp x16, x8
	mov x9, x16
	b.eq .LBB12_21
.LBB12_5:
	lsl x17, x9, #6
	mov x16, x15
	subs x15, x15, #64
	csel x3, x16, x10, lo
	subs x16, x1, x17
	cmp x16, #64
	csel x16, x16, x10, lo
	subs x18, x1, x17
	b.eq .LBB12_3
	cmp x18, #4
	add x17, x0, x17
	b.hs .LBB12_8
	mov x5, xzr
	mov x18, xzr
	mov x3, x17
	b .LBB12_18
.LBB12_8:
	cmp x18, #16
	b.hs .LBB12_10
	mov x18, xzr
	mov x5, xzr
	b .LBB12_15
.LBB12_10:
	movi v2.2d, #0000000000000000
	movi v21.2d, #0000000000000000
	and x5, x3, #0x70
	movi v22.2d, #0000000000000000
	movi v20.2d, #0000000000000000
	and x4, x16, #0xc
	movi v25.2d, #0000000000000000
	movi v23.2d, #0000000000000000
	and x18, x16, #0x70
	movi v26.2d, #0000000000000000
	movi v24.2d, #0000000000000000
	mov x6, x14
	ldp q29, q30, [sp]
	ldp q31, q8, [sp, #32]
	ldp q9, q10, [sp, #64]
.LBB12_11:
	ldr q11, [x6], #16
	str q2, [sp, #176]
	dup v12.2d, x12
	dup v14.2d, x11
	subs x5, x5, #16
	cmtst v11.16b, v11.16b, v11.16b
	and v6.16b, v8.16b, v12.16b
	and v15.16b, v9.16b, v12.16b
	and v16.16b, v30.16b, v12.16b
	and v17.16b, v10.16b, v12.16b
	and v18.16b, v31.16b, v12.16b
	and v0.16b, v29.16b, v12.16b
	ushll2 v13.8h, v11.16b, #0
	ushll v11.8h, v11.8b, #0
	and v19.16b, v28.16b, v12.16b
	and v12.16b, v27.16b, v12.16b
	ushll2 v5.4s, v13.8h, #0
	ushll v13.4s, v13.4h, #0
	ushll2 v7.4s, v11.8h, #0
	ushll v11.4s, v11.4h, #0
	ushll2 v2.2d, v13.4s, #0
	ushll v1.2d, v5.2s, #0
	ushll2 v3.2d, v7.4s, #0
	ushll2 v5.2d, v5.4s, #0
	ushll v13.2d, v13.2s, #0
	ushll v7.2d, v7.2s, #0
	ushll2 v4.2d, v11.4s, #0
	ushll v11.2d, v11.2s, #0
	and v2.16b, v2.16b, v14.16b
	and v1.16b, v1.16b, v14.16b
	and v3.16b, v3.16b, v14.16b
	and v5.16b, v5.16b, v14.16b
	and v13.16b, v13.16b, v14.16b
	and v7.16b, v7.16b, v14.16b
	and v4.16b, v4.16b, v14.16b
	and v11.16b, v11.16b, v14.16b
	ushl v2.2d, v2.2d, v6.2d
	ushl v1.2d, v1.2d, v15.2d
	ushl v3.2d, v3.2d, v16.2d
	ushl v5.2d, v5.2d, v17.2d
	ushl v0.2d, v7.2d, v0.2d
	ushl v6.2d, v13.2d, v18.2d
	ushl v4.2d, v4.2d, v19.2d
	dup v7.2d, x13
	ushl v16.2d, v11.2d, v12.2d
	orr v23.16b, v2.16b, v23.16b
	ldr q2, [sp, #176]
	orr v26.16b, v1.16b, v26.16b
	orr v20.16b, v3.16b, v20.16b
	orr v24.16b, v5.16b, v24.16b
	orr v25.16b, v6.16b, v25.16b
	orr v22.16b, v0.16b, v22.16b
	orr v2.16b, v4.16b, v2.16b
	orr v21.16b, v16.16b, v21.16b
	add v29.2d, v29.2d, v7.2d
	add v28.2d, v28.2d, v7.2d
	add v27.2d, v27.2d, v7.2d
	add v30.2d, v30.2d, v7.2d
	add v31.2d, v31.2d, v7.2d
	add v8.2d, v8.2d, v7.2d
	add v9.2d, v9.2d, v7.2d
	add v10.2d, v10.2d, v7.2d
	b.ne .LBB12_11
	orr v0.16b, v21.16b, v25.16b
	orr v1.16b, v22.16b, v26.16b
	cmp x16, x18
	orr v2.16b, v2.16b, v23.16b
	orr v3.16b, v20.16b, v24.16b
	orr v0.16b, v0.16b, v1.16b
	orr v1.16b, v2.16b, v3.16b
	orr v0.16b, v0.16b, v1.16b
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x5, d0
	b.ne .LBB12_14
	ldp q27, q28, [sp, #144]
	ldr q6, [sp, #96]
	ldp q5, q4, [sp, #112]
	b .LBB12_4
.LBB12_14:
	ldp q27, q28, [sp, #144]
	ldr q6, [sp, #96]
	ldp q5, q4, [sp, #112]
	cbz x4, .LBB12_20
.LBB12_15:
	movi v19.2d, #0000000000000000
	dup v0.2d, x18
	mov x4, x18
	movi v20.2d, #0000000000000000
	and x18, x16, #0x7c
	orr v21.16b, v0.16b, v28.16b
	orr v22.16b, v0.16b, v27.16b
	mov v19.d[0], x5
	and x5, x3, #0x7c
	add x3, x17, x18
.LBB12_16:
	ldr s0, [x14, x4]
	and v2.16b, v21.16b, v5.16b
	and v3.16b, v22.16b, v5.16b
	add v21.2d, v21.2d, v6.2d
	add v22.2d, v22.2d, v6.2d
	add x4, x4, #4
	ushll v0.8h, v0.8b, #0
	cmp x5, x4
	cmtst v0.4h, v0.4h, v0.4h
	ushll v0.4s, v0.4h, #0
	ushll2 v1.2d, v0.4s, #0
	ushll v0.2d, v0.2s, #0
	and v1.16b, v1.16b, v4.16b
	and v0.16b, v0.16b, v4.16b
	ushl v0.2d, v0.2d, v3.2d
	ushl v1.2d, v1.2d, v2.2d
	orr v20.16b, v1.16b, v20.16b
	orr v19.16b, v0.16b, v19.16b
	b.ne .LBB12_16
	orr v0.16b, v19.16b, v20.16b
	cmp x16, x18
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x5, d0
	b.eq .LBB12_4
.LBB12_18:
	add x16, x17, x16
.LBB12_19:
	ldrb w17, [x3], #1
	cmp w17, #0
	cset w17, ne
	cmp x3, x16
	lsl x17, x17, x18
	add x18, x18, #1
	orr x5, x17, x5
	b.ne .LBB12_19
	b .LBB12_4
.LBB12_20:
	add x3, x17, x18
	b .LBB12_18
.LBB12_21:
	ldp d9, d8, [sp, #240]
	ldr x30, [sp, #256]
	ldp d11, d10, [sp, #224]
	ldp d13, d12, [sp, #208]
	ldp d15, d14, [sp, #192]
	add sp, sp, #272
.LBB12_22:
	ret
