bitpacking::rank_index::rank_index_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1
	b.lo .LBB4_14
	lsr x9, x1, #3
	and x8, x1, #0x7
	cbz x9, .LBB4_6
	movi v1.2d, #0000000000000000
	movi v0.2d, #0000000000000000
	mov x10, x0
	movi v2.2d, #0000000000000000
	movi v3.2d, #0000000000000000
	mov x11, x2
	movi v4.2d, #0000000000000000
	ptrue p0.d, vl2
.LBB4_3:
	ldp q5, q6, [x10]
	subs x9, x9, #1
	ldp q7, q16, [x10, #32]
	add x10, x10, #64
	cnt z5.d, p0/m, z5.d
	cnt z6.d, p0/m, z6.d
	cnt z16.d, p0/m, z16.d
	cnt z7.d, p0/m, z7.d
	zip1 v17.2d, v1.2d, v5.2d
	ext v18.16b, v5.16b, v6.16b, #8
	ext v19.16b, v6.16b, v7.16b, #8
	ext v20.16b, v7.16b, v16.16b, #8
	add v17.2d, v17.2d, v5.2d
	add v18.2d, v18.2d, v6.2d
	sub v5.2d, v0.2d, v5.2d
	add v20.2d, v20.2d, v16.2d
	add v19.2d, v19.2d, v7.2d
	sub v7.2d, v3.2d, v7.2d
	sub v6.2d, v2.2d, v6.2d
	sub v16.2d, v4.2d, v16.2d
	add v21.2d, v17.2d, v18.2d
	add v5.2d, v5.2d, v17.2d
	add v20.2d, v19.2d, v20.2d
	add v18.2d, v18.2d, v19.2d
	add v7.2d, v7.2d, v17.2d
	add v6.2d, v6.2d, v21.2d
	add v19.2d, v21.2d, v20.2d
	add v7.2d, v7.2d, v18.2d
	uzp1 v5.4s, v5.4s, v6.4s
	add v16.2d, v16.2d, v19.2d
	dup v17.2d, v19.d[1]
	uzp1 v6.4s, v7.4s, v16.4s
	add v4.2d, v17.2d, v4.2d
	add v3.2d, v17.2d, v3.2d
	add v2.2d, v17.2d, v2.2d
	add v0.2d, v17.2d, v0.2d
	stp q5, q6, [x11], #32
	b.ne .LBB4_3
	cbnz x8, .LBB4_7
.LBB4_5:
	ldp x29, x30, [sp], #16
	ret
.LBB4_6:
	movi v0.2d, #0000000000000000
	cbz x8, .LBB4_5
.LBB4_7:
	and x9, x1, #0xffffffffffffff8
	cmp x8, #1
	add x10, x0, x9, lsl #3
	add x9, x2, x9, lsl #2
	ldr x11, [x10]
	str s0, [x9]
	b.eq .LBB4_5
	fmov w12, s0
	fmov d0, x11
	cmp x8, #2
	ptrue p0.d
	cnt z0.d, p0/m, z0.d
	fmov w11, s0
	add w11, w12, w11
	ldr x12, [x10, #8]
	str w11, [x9, #4]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #3
	cnt z0.d, p0/m, z0.d
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #16]
	str w11, [x9, #8]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #4
	cnt z0.d, p0/m, z0.d
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #24]
	str w11, [x9, #12]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #5
	cnt z0.d, p0/m, z0.d
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #32]
	str w11, [x9, #16]
	b.eq .LBB4_5
	fmov d0, x12
	ldr x10, [x10, #40]
	cmp x8, #6
	cnt z0.d, p0/m, z0.d
	fmov w12, s0
	add w11, w11, w12
	str w11, [x9, #20]
	b.eq .LBB4_5
	fmov d0, x10
	cnt z0.d, p0/m, z0.d
	fmov w8, s0
	add w8, w11, w8
	str w8, [x9, #24]
	ldp x29, x30, [sp], #16
	ret
.LBB4_14:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.30
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.30
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.33
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.33
	mov w1, #41
	bl core::panicking::panic
