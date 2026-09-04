bitpacking::indices::bitmap_to_indices_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cbz x1, .LBB43_10
	mov x8, x0
	mov x0, xzr
	mov w10, wzr
	add x9, x8, x1, lsl #3
	b .LBB43_4
.LBB43_2:
	mov x12, xzr
.LBB43_3:
	add x8, x8, #8
	add w10, w10, #1
	add x0, x12, x0
	cmp x8, x9
	b.eq .LBB43_9
.LBB43_4:
	subs x11, x3, x0
	b.lo .LBB43_11
	cmp x11, #64
	b.lo .LBB43_12
	ldr x11, [x8]
	cbz x11, .LBB43_2
	fmov d0, x11
	lsl w14, w10, #6
	add x15, x2, x0, lsl #2
	mov x13, xzr
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x12, d0
.LBB43_8:
	rbit x16, x11
	clz x16, x16
	orr w16, w14, w16
	str w16, [x15, x13, lsl #2]
	add x13, x13, #1
	sub x16, x11, #1
	cmp x12, x13
	and x11, x16, x11
	b.ne .LBB43_8
	b .LBB43_3
.LBB43_9:
	ldp x29, x30, [sp], #16
	ret
.LBB43_10:
	mov x0, xzr
	ldp x29, x30, [sp], #16
	ret
.LBB43_11:
	adrp x8, .Lanon.bba673b6abbf1555a5789e1a894d50b2.24
	add x8, x8, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.24
	mov x1, x3
	mov x2, x3
	mov x3, x8
	bl core::slice::index::slice_index_fail
.LBB43_12:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.51
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.51
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.52
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.52
	mov w1, #33
	bl core::panicking::panic
