bitpacking::byte_to_bit::bytes_to_bits_swar:
	str d8, [sp, #-32]!
	stp x29, x30, [sp, #16]
	add x29, sp, #16
	mov x8, x0
	lsr x0, x1, #6
	and x9, x1, #0x3f
	cmp x3, x0
	csel x11, x3, x0, lo
	cbz x11, .LBB11_8
	mov x10, #16513
	cmp x11, #1
	movk x10, #4128, lsl #16
	movk x10, #1032, lsl #32
	movk x10, #2, lsl #48
	b.ne .LBB11_3
	mov x12, xzr
	b .LBB11_6
.LBB11_3:
	movi v0.16b, #127
	movi v1.16b, #128
	and x12, x11, #0x1fffffffffffffe
	movi v2.2d, #0x0000000000ff00
	movi v3.2d, #0x00000000ff0000
	mov x13, x8
	movi v4.2d, #0x000000ff000000
	movi v5.2d, #0x0000ff00000000
	mov x14, x2
	movi v6.2d, #0x00ff0000000000
	movi v7.2d, #0xff000000000000
	and x15, x11, #0x1fffffffffffffe
	movi v16.2d, #0xff00000000000000
	dup v17.2d, x10
.LBB11_4:
	ldp q26, q20, [x13]
	subs x15, x15, #2
	ldp q27, q19, [x13, #64]
	ldp q28, q18, [x13, #96]
	zip1 v24.2d, v20.2d, v19.2d
	zip2 v25.2d, v20.2d, v19.2d
	zip2 v21.2d, v26.2d, v27.2d
	ldp q23, q20, [x13, #32]
	zip1 v26.2d, v26.2d, v27.2d
	add x13, x13, #128
	zip1 v22.2d, v23.2d, v28.2d
	zip2 v23.2d, v23.2d, v28.2d
	zip1 v19.2d, v20.2d, v18.2d
	and v28.16b, v21.16b, v0.16b
	and v29.16b, v24.16b, v0.16b
	and v30.16b, v25.16b, v0.16b
	zip2 v18.2d, v20.2d, v18.2d
	and v27.16b, v22.16b, v0.16b
	and v31.16b, v23.16b, v0.16b
	add v28.2d, v28.2d, v0.2d
	and v8.16b, v19.16b, v0.16b
	add v29.2d, v29.2d, v0.2d
	add v30.2d, v30.2d, v0.2d
	add v27.2d, v27.2d, v0.2d
	add v31.2d, v31.2d, v0.2d
	orr v21.16b, v28.16b, v21.16b
	and v28.16b, v26.16b, v0.16b
	orr v24.16b, v29.16b, v24.16b
	orr v25.16b, v30.16b, v25.16b
	add v29.2d, v8.2d, v0.2d
	orr v20.16b, v27.16b, v22.16b
	orr v22.16b, v31.16b, v23.16b
	and v21.16b, v21.16b, v1.16b
	add v23.2d, v28.2d, v0.2d
	and v24.16b, v24.16b, v1.16b
	and v25.16b, v25.16b, v1.16b
	orr v19.16b, v29.16b, v19.16b
	and v20.16b, v20.16b, v1.16b
	and v22.16b, v22.16b, v1.16b
	mul z21.d, z21.d, z17.d
	orr v23.16b, v23.16b, v26.16b
	and v26.16b, v18.16b, v0.16b
	mul z24.d, z24.d, z17.d
	and v19.16b, v19.16b, v1.16b
	mul z25.d, z25.d, z17.d
	mul z20.d, z20.d, z17.d
	mul z22.d, z22.d, z17.d
	add v26.2d, v26.2d, v0.2d
	and v23.16b, v23.16b, v1.16b
	ushr v21.2d, v21.2d, #48
	mul z19.d, z19.d, z17.d
	ushr v24.2d, v24.2d, #40
	ushr v25.2d, v25.2d, #32
	ushr v20.2d, v20.2d, #24
	ushr v22.2d, v22.2d, #16
	orr v18.16b, v26.16b, v18.16b
	mul z23.d, z23.d, z17.d
	and v21.16b, v21.16b, v2.16b
	and v24.16b, v24.16b, v3.16b
	ushr v19.2d, v19.2d, #8
	and v25.16b, v25.16b, v4.16b
	and v20.16b, v20.16b, v5.16b
	and v22.16b, v22.16b, v6.16b
	and v18.16b, v18.16b, v1.16b
	usra v21.2d, v23.2d, #56
	orr v23.16b, v25.16b, v24.16b
	and v19.16b, v19.16b, v7.16b
	orr v20.16b, v22.16b, v20.16b
	mul z18.d, z18.d, z17.d
	orr v21.16b, v23.16b, v21.16b
	orr v19.16b, v19.16b, v20.16b
	and v18.16b, v18.16b, v16.16b
	orr v19.16b, v19.16b, v21.16b
	orr v18.16b, v18.16b, v19.16b
	str q18, [x14], #16
	b.ne .LBB11_4
	cmp x11, x12
	b.eq .LBB11_8
.LBB11_6:
	index z0.d, #0, #8
	mov x13, #1099511627776
	mov x14, #280375465082880
	movk x13, #254, lsl #48
	mov x15, #16777216
	mov w16, #-16777216
	index z4.d, x14, x13
	mov w13, #256
	movk x15, #254, lsl #32
	movk w13, #254, lsl #16
	mov w14, #65280
	movi v1.16b, #127
	mov z5.d, z0.d
	mov z6.d, z0.d
	movi v2.16b, #128
	index z7.d, x16, x15
	index z16.d, x14, x13
	dup v3.2d, x10
	sub z0.d, z0.d, #48
	add x13, x2, x12, lsl #3
	add x14, x8, x12, lsl #6
	sub z5.d, z5.d, #32
	sub z6.d, z6.d, #16
	sub x11, x11, x12
	mov x12, #9187201950435737471
.LBB11_7:
	ldur q17, [x14, #24]
	ldur q18, [x14, #40]
	subs x11, x11, #1
	ldr x15, [x14, #56]
	and v19.16b, v18.16b, v1.16b
	and v20.16b, v17.16b, v1.16b
	and x16, x15, #0x7f7f7f7f7f7f7f7f
	add x16, x16, x12
	add v20.2d, v20.2d, v1.2d
	add v19.2d, v19.2d, v1.2d
	orr x15, x16, x15
	and x15, x15, #0x8080808080808080
	mul x15, x15, x10
	orr v18.16b, v19.16b, v18.16b
	orr v17.16b, v20.16b, v17.16b
	ldur q19, [x14, #8]
	and v20.16b, v19.16b, v1.16b
	and v17.16b, v17.16b, v2.16b
	and v18.16b, v18.16b, v2.16b
	and x15, x15, #0xff00000000000000
	add v20.2d, v20.2d, v1.2d
	mul z18.d, z18.d, z3.d
	mul z17.d, z17.d, z3.d
	orr v19.16b, v20.16b, v19.16b
	ushl v17.2d, v17.2d, v5.2d
	ushl v18.2d, v18.2d, v6.2d
	and v18.16b, v18.16b, v4.16b
	and v17.16b, v17.16b, v7.16b
	orr v17.16b, v17.16b, v18.16b
	and v18.16b, v19.16b, v2.16b
	ext v19.16b, v17.16b, v17.16b, #8
	mul z18.d, z18.d, z3.d
	orr v17.8b, v17.8b, v19.8b
	ushl v18.2d, v18.2d, v0.2d
	mov v17.d[1], x15
	and v18.16b, v18.16b, v16.16b
	ldr x15, [x14], #64
	and x16, x15, #0x7f7f7f7f7f7f7f7f
	orr v17.16b, v17.16b, v18.16b
	add x16, x16, x12
	orr x15, x16, x15
	and x15, x15, #0x8080808080808080
	dup v18.2d, v17.d[1]
	mul x15, x15, x10
	orr v17.16b, v17.16b, v18.16b
	fmov x16, d17
	orr x15, x16, x15, lsr #56
	str x15, [x13], #8
	b.ne .LBB11_7
.LBB11_8:
	cbz x9, .LBB11_18
	cnth x10
	and x11, x1, #0x7fffffffffffffc0
	mov x12, xzr
	cmp x9, x10
	add x8, x8, x11
	b.hs .LBB11_11
	mov x11, xzr
	mov x10, x8
	b .LBB11_14
.LBB11_11:
	index z0.d, #0, #1
	mov x11, #-1
	cntw x13
	inch x11
	movi v1.2d, #0000000000000000
	movi v4.2d, #0000000000000000
	movi v5.2d, #0000000000000000
	movi v6.2d, #0000000000000000
	mov z2.d, x13
	mov z7.d, x10
	ptrue p1.s
	mov z3.d, z0.d
	and x13, x9, x11
	ptrue p0.d
	sub x11, x9, x13
	add x10, x8, x11
	incd z3.d
.LBB11_12:
	add x14, x8, x12
	ld1b { z16.s }, p1/z, [x8, x12]
	add z20.d, z0.d, z2.d
	ld1b { z17.s }, p1/z, [x14, #1, mul vl]
	inch x12
	cmpne p2.s, p1/z, z16.s, #0
	cmpne p3.s, p1/z, z17.s, #0
	add z17.d, z3.d, z2.d
	cmp x11, x12
	punpkhi p4.h, p2.b
	punpklo p2.h, p2.b
	punpkhi p5.h, p3.b
	mov z16.d, p4/z, #1
	punpklo p3.h, p3.b
	mov z18.d, p2/z, #1
	mov z19.d, p5/z, #1
	mov z21.d, p3/z, #1
	lsl z16.d, p0/m, z16.d, z3.d
	add z3.d, z3.d, z7.d
	lsl z18.d, p0/m, z18.d, z0.d
	add z0.d, z0.d, z7.d
	lslr z17.d, p0/m, z17.d, z19.d
	lslr z20.d, p0/m, z20.d, z21.d
	orr z5.d, z16.d, z5.d
	orr z4.d, z18.d, z4.d
	orr z1.d, z17.d, z1.d
	orr z6.d, z20.d, z6.d
	b.ne .LBB11_12
	orr z0.d, z6.d, z4.d
	orr z1.d, z1.d, z5.d
	orr z0.d, z0.d, z1.d
	orv d0, p0, z0.d
	fmov x12, d0
	cbz x13, .LBB11_16
.LBB11_14:
	add x8, x8, x9
.LBB11_15:
	ldrb w9, [x10], #1
	cmp w9, #0
	cset w9, ne
	cmp x10, x8
	lsl x9, x9, x11
	add x11, x11, #1
	orr x12, x9, x12
	b.ne .LBB11_15
.LBB11_16:
	cmp x0, x3
	b.hs .LBB11_19
	str x12, [x2, x0, lsl #3]
.LBB11_18:
	ldp x29, x30, [sp, #16]
	ldr d8, [sp], #32
	ret
.LBB11_19:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.43
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.43
	mov x1, x3
	bl core::panicking::panic_bounds_check
