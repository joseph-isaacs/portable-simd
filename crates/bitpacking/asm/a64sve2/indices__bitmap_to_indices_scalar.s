bitpacking::indices::bitmap_to_indices_scalar:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cbz x1, .LBB47_10
	mov x8, x0
	ptrue p0.d
	mov x0, xzr
	add x9, x8, x1, lsl #3
	mov w10, wzr
	b .LBB47_4
.LBB47_2:
	mov x11, xzr
.LBB47_3:
	add x8, x8, #8
	add w10, w10, #1
	add x0, x11, x0
	cmp x8, x9
	b.eq .LBB47_9
.LBB47_4:
	subs x11, x3, x0
	b.lo .LBB47_11
	cmp x11, #64
	b.lo .LBB47_12
	ldr x12, [x8]
	cbz x12, .LBB47_2
	fmov d0, x12
	lsl w14, w10, #6
	add x15, x2, x0, lsl #2
	mov x13, xzr
	cnt z0.d, p0/m, z0.d
	fmov x11, d0
.LBB47_8:
	rbit x16, x12
	clz x16, x16
	orr w16, w14, w16
	str w16, [x15, x13, lsl #2]
	add x13, x13, #1
	sub x16, x12, #1
	cmp x11, x13
	and x12, x16, x12
	b.ne .LBB47_8
	b .LBB47_3
.LBB47_9:
	ldp x29, x30, [sp], #16
	ret
.LBB47_10:
	mov x0, xzr
	ldp x29, x30, [sp], #16
	ret
.LBB47_11:
	adrp x8, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.26
	add x8, x8, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.26
	mov x1, x3
	mov x2, x3
	mov x3, x8
	bl core::slice::index::slice_index_fail
.LBB47_12:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.53
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.53
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.54
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.54
	mov w1, #33
	bl core::panicking::panic
