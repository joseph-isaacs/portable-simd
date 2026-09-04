bitpacking::byte_to_bit::bytes_to_bits_swar:
	str d10, [sp, #-48]!
	stp d9, d8, [sp, #16]
	stp x29, x30, [sp, #32]
	add x29, sp, #32
	mov x8, x0
	lsr x0, x1, #6
	and x9, x1, #0x3f
	cmp x3, x0
	csel x10, x3, x0, lo
	cbz x10, .LBB11_3
	mov x11, #16513
	add x12, x8, #32
	mov x13, #9187201950435737471
	movk x11, #4128, lsl #16
	mov x14, x2
	movk x11, #1032, lsl #32
	movk x11, #2, lsl #48
.LBB11_2:
	ldp x16, x15, [x12, #-32]
	subs x10, x10, #1
	ldp x18, x4, [x12, #-16]
	and x17, x15, #0x7f7f7f7f7f7f7f7f
	and x5, x16, #0x7f7f7f7f7f7f7f7f
	add x17, x17, x13
	add x5, x5, x13
	and x7, x4, #0x7f7f7f7f7f7f7f7f
	orr x15, x17, x15
	and x17, x18, #0x7f7f7f7f7f7f7f7f
	orr x16, x5, x16
	and x15, x15, #0x8080808080808080
	ldp x5, x6, [x12]
	mul x15, x15, x11
	add x17, x17, x13
	and x16, x16, #0x8080808080808080
	orr x17, x17, x18
	add x7, x7, x13
	mul x16, x16, x11
	and x18, x5, #0x7f7f7f7f7f7f7f7f
	and x17, x17, #0x8080808080808080
	orr x4, x7, x4
	and x7, x6, #0x7f7f7f7f7f7f7f7f
	add x18, x18, x13
	mul x17, x17, x11
	add x7, x7, x13
	orr x18, x18, x5
	lsr x15, x15, #48
	orr x5, x7, x6
	and x4, x4, #0x8080808080808080
	ldp x6, x7, [x12, #16]
	mul x4, x4, x11
	and x15, x15, #0xff00
	and x18, x18, #0x8080808080808080
	and x5, x5, #0x8080808080808080
	bfxil x15, x16, #56, #8
	mul x18, x18, x11
	add x12, x12, #64
	and x16, x6, #0x7f7f7f7f7f7f7f7f
	lsr x17, x17, #56
	add x16, x16, x13
	mul x5, x5, x11
	orr x16, x16, x6
	orr x15, x15, x17, lsl #16
	lsr x17, x4, #56
	and x16, x16, #0x8080808080808080
	and x4, x7, #0x7f7f7f7f7f7f7f7f
	mul x16, x16, x11
	add x4, x4, x13
	orr x15, x15, x17, lsl #24
	orr x17, x4, x7
	lsr x18, x18, #56
	and x17, x17, #0x8080808080808080
	orr x15, x15, x18, lsl #32
	lsr x18, x5, #56
	mul x17, x17, x11
	orr x15, x15, x18, lsl #40
	lsr x16, x16, #56
	orr x15, x15, x16, lsl #48
	and x16, x17, #0xff00000000000000
	orr x15, x16, x15
	str x15, [x14], #8
	b.ne .LBB11_2
.LBB11_3:
	cbz x9, .LBB11_19
	and x12, x1, #0x7fffffffffffffc0
	cmp x9, #4
	add x10, x8, x12
	b.hs .LBB11_6
	mov x16, xzr
	mov x11, xzr
	mov x8, x10
	b .LBB11_15
.LBB11_6:
	cmp x9, #16
	adrp x14, .LCPI11_2
	adrp x13, .LCPI11_3
	b.hs .LBB11_8
	mov x11, xzr
	mov x16, xzr
	b .LBB11_12
.LBB11_8:
	adrp x11, .LCPI11_0
	mov w17, #8
	movi v0.2d, #0000000000000000
	ldr q1, [x11, :lo12:.LCPI11_0]
	dup v2.2d, x17
	mov w11, #1
	mov w17, #16
	movi v3.2d, #0000000000000000
	movi v5.2d, #0000000000000000
	movi v4.2d, #0000000000000000
	movi v6.2d, #0000000000000000
	movi v7.2d, #0000000000000000
	movi v16.2d, #0000000000000000
	movi v17.2d, #0000000000000000
	dup v18.2d, x11
	adrp x11, .LCPI11_1
	dup v19.2d, x17
	add x16, x12, x8
	ldr q20, [x11, :lo12:.LCPI11_1]
	ldr q21, [x14, :lo12:.LCPI11_2]
	ldr q22, [x13, :lo12:.LCPI11_3]
	and x15, x1, #0xc
	and x11, x1, #0x30
	add x16, x16, #8
	and x17, x1, #0x30
.LBB11_9:
	ldp d23, d24, [x16, #-8]
	add v27.2d, v1.2d, v2.2d
	add v28.2d, v20.2d, v2.2d
	add v8.2d, v21.2d, v2.2d
	add v10.2d, v22.2d, v2.2d
	subs x17, x17, #16
	add x16, x16, #16
	cmtst v23.8b, v23.8b, v23.8b
	cmtst v24.8b, v24.8b, v24.8b
	ushll v23.8h, v23.8b, #0
	ushll v24.8h, v24.8b, #0
	ushll2 v25.4s, v23.8h, #0
	ushll v23.4s, v23.4h, #0
	ushll2 v26.4s, v24.8h, #0
	ushll v24.4s, v24.4h, #0
	ushll2 v29.2d, v25.4s, #0
	ushll v25.2d, v25.2s, #0
	ushll2 v30.2d, v23.4s, #0
	ushll v23.2d, v23.2s, #0
	ushll2 v31.2d, v26.4s, #0
	ushll v26.2d, v26.2s, #0
	ushll2 v9.2d, v24.4s, #0
	ushll v24.2d, v24.2s, #0
	and v29.16b, v29.16b, v18.16b
	and v25.16b, v25.16b, v18.16b
	and v30.16b, v30.16b, v18.16b
	and v23.16b, v23.16b, v18.16b
	and v31.16b, v31.16b, v18.16b
	and v26.16b, v26.16b, v18.16b
	and v9.16b, v9.16b, v18.16b
	and v24.16b, v24.16b, v18.16b
	ushl v30.2d, v30.2d, v21.2d
	ushl v25.2d, v25.2d, v20.2d
	ushl v29.2d, v29.2d, v1.2d
	ushl v23.2d, v23.2d, v22.2d
	ushl v26.2d, v26.2d, v28.2d
	ushl v27.2d, v31.2d, v27.2d
	ushl v24.2d, v24.2d, v10.2d
	ushl v28.2d, v9.2d, v8.2d
	add v20.2d, v20.2d, v19.2d
	orr v6.16b, v29.16b, v6.16b
	orr v4.16b, v25.16b, v4.16b
	orr v5.16b, v30.16b, v5.16b
	orr v3.16b, v23.16b, v3.16b
	orr v17.16b, v27.16b, v17.16b
	orr v16.16b, v26.16b, v16.16b
	orr v0.16b, v28.16b, v0.16b
	orr v7.16b, v24.16b, v7.16b
	add v21.2d, v21.2d, v19.2d
	add v22.2d, v22.2d, v19.2d
	add v1.2d, v1.2d, v19.2d
	b.ne .LBB11_9
	orr v0.16b, v0.16b, v5.16b
	orr v1.16b, v17.16b, v6.16b
	cmp x9, x11
	orr v2.16b, v7.16b, v3.16b
	orr v3.16b, v16.16b, v4.16b
	orr v0.16b, v0.16b, v1.16b
	orr v2.16b, v2.16b, v3.16b
	orr v0.16b, v2.16b, v0.16b
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x16, d0
	b.eq .LBB11_17
	cbz x15, .LBB11_20
.LBB11_12:
	movi v0.2d, #0000000000000000
	dup v3.2d, x11
	ldr q2, [x14, :lo12:.LCPI11_2]
	ldr q4, [x13, :lo12:.LCPI11_3]
	mov x15, x11
	movi v1.2d, #0000000000000000
	mov w11, #1
	mov w13, #4
	add x14, x8, x15
	orr v2.16b, v3.16b, v2.16b
	orr v3.16b, v3.16b, v4.16b
	dup v4.2d, x11
	mov v0.d[0], x16
	dup v5.2d, x13
	and x11, x1, #0x3c
	add x8, x10, x11
	sub x13, x15, x11
	add x12, x14, x12
.LBB11_13:
	ldr s6, [x12], #4
	adds x13, x13, #4
	ushll v6.8h, v6.8b, #0
	cmtst v6.4h, v6.4h, v6.4h
	ushll v6.4s, v6.4h, #0
	ushll2 v7.2d, v6.4s, #0
	ushll v6.2d, v6.2s, #0
	and v7.16b, v7.16b, v4.16b
	and v6.16b, v6.16b, v4.16b
	ushl v7.2d, v7.2d, v2.2d
	ushl v6.2d, v6.2d, v3.2d
	add v2.2d, v2.2d, v5.2d
	add v3.2d, v3.2d, v5.2d
	orr v1.16b, v7.16b, v1.16b
	orr v0.16b, v6.16b, v0.16b
	b.ne .LBB11_13
	orr v0.16b, v0.16b, v1.16b
	cmp x9, x11
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x16, d0
	b.eq .LBB11_17
.LBB11_15:
	add x9, x10, x9
.LBB11_16:
	ldrb w10, [x8], #1
	cmp w10, #0
	cset w10, ne
	cmp x8, x9
	lsl x10, x10, x11
	add x11, x11, #1
	orr x16, x10, x16
	b.ne .LBB11_16
.LBB11_17:
	cmp x0, x3
	b.hs .LBB11_21
	str x16, [x2, x0, lsl #3]
.LBB11_19:
	ldp x29, x30, [sp, #32]
	ldp d9, d8, [sp, #16]
	ldr d10, [sp], #48
	ret
.LBB11_20:
	add x8, x10, x11
	b .LBB11_15
.LBB11_21:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.41
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.41
	mov x1, x3
	bl core::panicking::panic_bounds_check
