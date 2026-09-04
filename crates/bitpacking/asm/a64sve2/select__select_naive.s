bitpacking::select::select_naive:
	cbz x1, .LBB38_4
	lsl x9, x1, #3
	ptrue p0.d
	mov x8, xzr
.LBB38_2:
	ldr x10, [x0], #8
	fmov d0, x10
	cnt z0.d, p0/m, z0.d
	fmov x11, d0
	subs x11, x2, x11
	b.lo .LBB38_5
	sub x9, x9, #8
	sub x8, x8, #64
	mov x2, x11
	cbnz x9, .LBB38_2
.LBB38_4:
	mov x0, xzr
	ret
.LBB38_5:
	cbz x2, .LBB38_7
.LBB38_6:
	sub x9, x10, #1
	subs w2, w2, #1
	and x10, x9, x10
	b.ne .LBB38_6
.LBB38_7:
	rbit x9, x10
	mov w0, #1
	clz x9, x9
	sub x1, x9, x8
	ret
