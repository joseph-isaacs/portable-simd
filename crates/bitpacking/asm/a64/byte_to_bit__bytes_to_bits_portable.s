bitpacking::byte_to_bit::bytes_to_bits_portable:
	str d10, [sp, #-48]!
	stp d9, d8, [sp, #16]
	stp x29, x30, [sp, #32]
	add x29, sp, #32
	mov x8, x0
	lsr x0, x1, #6
	and x9, x1, #0x3f
	cmp x3, x0
	csel x10, x3, x0, lo
	cbz x10, .LBB13_3
	adrp x11, .LCPI13_0
	mov x12, x2
	ldr q0, [x11, :lo12:.LCPI13_0]
	mov x11, x8
.LBB13_2:
	ldp q2, q1, [x11, #32]
	subs x10, x10, #1
	ldp q4, q3, [x11], #64
	cmeq v1.16b, v1.16b, #0
	cmeq v2.16b, v2.16b, #0
	cmeq v3.16b, v3.16b, #0
	cmeq v4.16b, v4.16b, #0
	bic v1.16b, v0.16b, v1.16b
	bic v2.16b, v0.16b, v2.16b
	bic v3.16b, v0.16b, v3.16b
	bic v4.16b, v0.16b, v4.16b
	ext v5.16b, v1.16b, v1.16b, #8
	ext v6.16b, v2.16b, v2.16b, #8
	ext v7.16b, v3.16b, v3.16b, #8
	ext v16.16b, v4.16b, v4.16b, #8
	zip1 v1.16b, v1.16b, v5.16b
	zip1 v2.16b, v2.16b, v6.16b
	zip1 v3.16b, v3.16b, v7.16b
	zip1 v4.16b, v4.16b, v16.16b
	addv h1, v1.8h
	addv h2, v2.8h
	addv h3, v3.8h
	addv h4, v4.8h
	str h1, [x12, #6]
	str h2, [x12, #4]
	str h3, [x12, #2]
	str h4, [x12]
	add x12, x12, #8
	b.ne .LBB13_2
.LBB13_3:
	cbz x9, .LBB13_19
	and x12, x1, #0x7fffffffffffffc0
	cmp x9, #4
	add x10, x8, x12
	b.hs .LBB13_6
	mov x16, xzr
	mov x11, xzr
	mov x8, x10
	b .LBB13_15
.LBB13_6:
	cmp x9, #16
	adrp x14, .LCPI13_3
	adrp x13, .LCPI13_4
	b.hs .LBB13_8
	mov x11, xzr
	mov x16, xzr
	b .LBB13_12
.LBB13_8:
	adrp x11, .LCPI13_1
	mov w17, #8
	movi v0.2d, #0000000000000000
	ldr q1, [x11, :lo12:.LCPI13_1]
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
	adrp x11, .LCPI13_2
	dup v19.2d, x17
	add x16, x12, x8
	ldr q20, [x11, :lo12:.LCPI13_2]
	ldr q21, [x14, :lo12:.LCPI13_3]
	ldr q22, [x13, :lo12:.LCPI13_4]
	and x15, x1, #0xc
	and x11, x1, #0x30
	add x16, x16, #8
	and x17, x1, #0x30
.LBB13_9:
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
	b.ne .LBB13_9
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
	b.eq .LBB13_17
	cbz x15, .LBB13_20
.LBB13_12:
	movi v0.2d, #0000000000000000
	dup v3.2d, x11
	ldr q2, [x14, :lo12:.LCPI13_3]
	ldr q4, [x13, :lo12:.LCPI13_4]
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
.LBB13_13:
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
	b.ne .LBB13_13
	orr v0.16b, v0.16b, v1.16b
	cmp x9, x11
	ext v1.16b, v0.16b, v0.16b, #8
	orr v0.8b, v0.8b, v1.8b
	fmov x16, d0
	b.eq .LBB13_17
.LBB13_15:
	add x9, x10, x9
.LBB13_16:
	ldrb w10, [x8], #1
	cmp w10, #0
	cset w10, ne
	cmp x8, x9
	lsl x10, x10, x11
	add x11, x11, #1
	orr x16, x10, x16
	b.ne .LBB13_16
.LBB13_17:
	cmp x0, x3
	b.hs .LBB13_21
	str x16, [x2, x0, lsl #3]
.LBB13_19:
	ldp x29, x30, [sp, #32]
	ldp d9, d8, [sp, #16]
	ldr d10, [sp], #48
	ret
.LBB13_20:
	add x8, x10, x11
	b .LBB13_15
.LBB13_21:
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.42
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.42
	mov x1, x3
	bl core::panicking::panic_bounds_check
