bitpacking::rank_index::rank_index_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1
	b.lo .LBB3_5
	cbz x1, .LBB3_4
	ptrue p0.d
	mov w8, wzr
.LBB3_3:
	ldr x9, [x0], #8
	subs x1, x1, #1
	str w8, [x2], #4
	fmov d0, x9
	cnt z0.d, p0/m, z0.d
	fmov w9, s0
	add w8, w8, w9
	b.ne .LBB3_3
.LBB3_4:
	ldp x29, x30, [sp], #16
	ret
.LBB3_5:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.30
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.30
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.32
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.32
	mov w1, #41
	bl core::panicking::panic
