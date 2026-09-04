bitpacking::rank_index::rank_index_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1
	b.lo .LBB3_5
	cbz x1, .LBB3_4
	mov w8, wzr
.LBB3_3:
	ldr d0, [x0], #8
	subs x1, x1, #1
	str w8, [x2], #4
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w9, s0
	add w8, w8, w9
	b.ne .LBB3_3
.LBB3_4:
	ldp x29, x30, [sp], #16
	ret
.LBB3_5:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.28
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.28
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.30
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.30
	mov w1, #41
	bl core::panicking::panic
