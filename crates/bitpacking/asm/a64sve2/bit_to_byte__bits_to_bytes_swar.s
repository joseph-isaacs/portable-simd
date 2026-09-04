bitpacking::bit_to_byte::bits_to_bytes_swar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1, lsl #6
	b.lo .LBB6_10
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB6_9
	mov x9, #513
	cmp x8, #1
	movk x9, #2052, lsl #16
	movk x9, #8208, lsl #32
	movk x9, #32832, lsl #48
	b.ne .LBB6_4
	mov x10, xzr
	b .LBB6_7
.LBB6_4:
	movi v0.2d, #0x000000000000ff
	movi v1.16b, #1
	and x10, x8, #0x1fffffffffffffe
	movi v2.16b, #127
	dup v3.2d, x9
	mov x11, x0
	mov x12, x2
	and x13, x8, #0x1fffffffffffffe
.LBB6_5:
	ldr q4, [x11], #16
	subs x13, x13, #2
	ushr v5.2d, v4.2d, #48
	ushr v6.2d, v4.2d, #32
	ushr v7.2d, v4.2d, #40
	ushr v16.2d, v4.2d, #16
	ushr v17.2d, v4.2d, #24
	ushr v19.2d, v4.2d, #8
	and v18.16b, v4.16b, v0.16b
	ushr v4.2d, v4.2d, #56
	and v5.16b, v5.16b, v0.16b
	and v6.16b, v6.16b, v0.16b
	and v7.16b, v7.16b, v0.16b
	and v16.16b, v16.16b, v0.16b
	and v17.16b, v17.16b, v0.16b
	and v19.16b, v19.16b, v0.16b
	mul z18.d, z18.d, z1.d
	mul z4.d, z4.d, z1.d
	mul z5.d, z5.d, z1.d
	mul z7.d, z7.d, z1.d
	mul z6.d, z6.d, z1.d
	mul z17.d, z17.d, z1.d
	mul z16.d, z16.d, z1.d
	mul z19.d, z19.d, z1.d
	and v4.16b, v4.16b, v3.16b
	and v18.16b, v18.16b, v3.16b
	and v5.16b, v5.16b, v3.16b
	and v7.16b, v7.16b, v3.16b
	and v6.16b, v6.16b, v3.16b
	and v17.16b, v17.16b, v3.16b
	and v16.16b, v16.16b, v3.16b
	and v19.16b, v19.16b, v3.16b
	add v4.2d, v4.2d, v2.2d
	add v5.2d, v5.2d, v2.2d
	add v7.2d, v7.2d, v2.2d
	add v18.2d, v18.2d, v2.2d
	add v6.2d, v6.2d, v2.2d
	add v17.2d, v17.2d, v2.2d
	add v16.2d, v16.2d, v2.2d
	add v19.2d, v19.2d, v2.2d
	ushr v4.2d, v4.2d, #7
	ushr v5.2d, v5.2d, #7
	ushr v7.2d, v7.2d, #7
	ushr v18.2d, v18.2d, #7
	ushr v6.2d, v6.2d, #7
	ushr v17.2d, v17.2d, #7
	ushr v16.2d, v16.2d, #7
	ushr v19.2d, v19.2d, #7
	and v4.16b, v4.16b, v1.16b
	and v5.16b, v5.16b, v1.16b
	and v7.16b, v7.16b, v1.16b
	and v18.16b, v18.16b, v1.16b
	and v6.16b, v6.16b, v1.16b
	and v17.16b, v17.16b, v1.16b
	and v16.16b, v16.16b, v1.16b
	and v19.16b, v19.16b, v1.16b
	zip2 v20.2d, v5.2d, v4.2d
	zip1 v4.2d, v5.2d, v4.2d
	zip2 v21.2d, v6.2d, v7.2d
	zip1 v5.2d, v6.2d, v7.2d
	zip2 v22.2d, v16.2d, v17.2d
	zip2 v23.2d, v18.2d, v19.2d
	zip1 v6.2d, v16.2d, v17.2d
	zip1 v7.2d, v18.2d, v19.2d
	stp q5, q4, [x12, #32]
	stp q23, q22, [x12, #64]
	stp q21, q20, [x12, #96]
	stp q7, q6, [x12], #128
	b.ne .LBB6_5
	cmp x8, x10
	b.eq .LBB6_9
.LBB6_7:
	index z0.d, #0, #-8
	movi v1.2d, #0x000000000000ff
	movi v3.16b, #1
	movi v4.16b, #127
	add x11, x2, x10, lsl #6
	dup v6.2d, x9
	add x9, x0, x10, lsl #3
	sub x8, x8, x10
	add x10, x11, #32
	mov z5.d, z0.d
	mov v2.16b, v0.16b
	sub z0.d, z0.d, #32
	sub z5.d, z5.d, #16
.LBB6_8:
	ldr x11, [x9], #8
	subs x8, x8, #1
	dup v7.2d, x11
	ubfx x12, x11, #48, #8
	lsr x11, x11, #56
	fmov d18, x12
	ushl v16.2d, v7.2d, v2.2d
	ushl v17.2d, v7.2d, v5.2d
	ushl v7.2d, v7.2d, v0.2d
	mov v18.d[1], x11
	and v16.16b, v16.16b, v1.16b
	and v17.16b, v17.16b, v1.16b
	and v7.16b, v7.16b, v1.16b
	mul z16.d, z16.d, z3.d
	mul z17.d, z17.d, z3.d
	mul z7.d, z7.d, z3.d
	mul z18.d, z18.d, z3.d
	and v16.16b, v16.16b, v6.16b
	and v17.16b, v17.16b, v6.16b
	and v7.16b, v7.16b, v6.16b
	and v18.16b, v18.16b, v6.16b
	add v16.2d, v16.2d, v4.2d
	add v17.2d, v17.2d, v4.2d
	add v7.2d, v7.2d, v4.2d
	add v18.2d, v18.2d, v4.2d
	ushr v16.2d, v16.2d, #7
	ushr v17.2d, v17.2d, #7
	ushr v7.2d, v7.2d, #7
	ushr v18.2d, v18.2d, #7
	and v16.16b, v16.16b, v3.16b
	and v17.16b, v17.16b, v3.16b
	and v7.16b, v7.16b, v3.16b
	and v18.16b, v18.16b, v3.16b
	stp q16, q17, [x10, #-32]
	stp q7, q18, [x10], #64
	b.ne .LBB6_8
.LBB6_9:
	ldp x29, x30, [sp], #16
	ret
.LBB6_10:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.37
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.37
	mov w1, #46
	bl core::panicking::panic
