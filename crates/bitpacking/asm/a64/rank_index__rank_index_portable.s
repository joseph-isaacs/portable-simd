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
.LBB4_3:
	ldp q5, q16, [x10]
	subs x9, x9, #1
	ldp q6, q7, [x10, #32]
	add x10, x10, #64
	cnt v5.16b, v5.16b
	cnt v16.16b, v16.16b
	cnt v7.16b, v7.16b
	cnt v6.16b, v6.16b
	uaddlp v5.8h, v5.16b
	uaddlp v16.8h, v16.16b
	uaddlp v7.8h, v7.16b
	uaddlp v6.8h, v6.16b
	uaddlp v5.4s, v5.8h
	uaddlp v16.4s, v16.8h
	uaddlp v7.4s, v7.8h
	uaddlp v6.4s, v6.8h
	uaddlp v17.2d, v5.4s
	uaddlp v20.2d, v16.4s
	uaddlp v18.2d, v7.4s
	uaddlp v19.2d, v6.4s
	zip1 v21.2d, v1.2d, v17.2d
	ext v24.16b, v17.16b, v20.16b, #8
	sub v17.2d, v0.2d, v17.2d
	ext v22.16b, v19.16b, v18.16b, #8
	ext v23.16b, v20.16b, v19.16b, #8
	sub v18.2d, v4.2d, v18.2d
	uadalp v21.2d, v5.4s
	uadalp v22.2d, v7.4s
	sub v7.2d, v3.2d, v19.2d
	sub v19.2d, v2.2d, v20.2d
	uadalp v23.2d, v6.4s
	uadalp v24.2d, v16.4s
	add v7.2d, v7.2d, v21.2d
	add v17.2d, v17.2d, v21.2d
	add v5.2d, v23.2d, v22.2d
	add v6.2d, v21.2d, v24.2d
	add v16.2d, v24.2d, v23.2d
	add v5.2d, v6.2d, v5.2d
	add v6.2d, v19.2d, v6.2d
	add v7.2d, v7.2d, v16.2d
	add v18.2d, v18.2d, v5.2d
	dup v5.2d, v5.d[1]
	uzp1 v6.4s, v17.4s, v6.4s
	uzp1 v7.4s, v7.4s, v18.4s
	add v4.2d, v5.2d, v4.2d
	add v3.2d, v5.2d, v3.2d
	add v2.2d, v5.2d, v2.2d
	add v0.2d, v5.2d, v0.2d
	stp q6, q7, [x11], #32
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
	ldr x12, [x10]
	str s0, [x9]
	b.eq .LBB4_5
	fmov w11, s0
	fmov d0, x12
	cmp x8, #2
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #8]
	str w11, [x9, #4]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #3
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #16]
	str w11, [x9, #8]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #4
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #24]
	str w11, [x9, #12]
	b.eq .LBB4_5
	fmov d0, x12
	cmp x8, #5
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w12, s0
	add w11, w11, w12
	ldr x12, [x10, #32]
	str w11, [x9, #16]
	b.eq .LBB4_5
	fmov d0, x12
	ldr x10, [x10, #40]
	cmp x8, #6
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w12, s0
	add w11, w11, w12
	str w11, [x9, #20]
	b.eq .LBB4_5
	fmov d0, x10
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w8, s0
	add w8, w11, w8
	str w8, [x9, #24]
	ldp x29, x30, [sp], #16
	ret
.LBB4_14:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.28
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.28
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.31
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.31
	mov w1, #41
	bl core::panicking::panic
