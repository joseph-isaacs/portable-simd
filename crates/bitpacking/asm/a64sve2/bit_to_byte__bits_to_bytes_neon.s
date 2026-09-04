bitpacking::bit_to_byte::bits_to_bytes_neon:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1, lsl #6
	b.lo .LBB5_5
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB5_4
	movi v0.16b, #1
	adrp x9, .LCPI5_0
	ldr q1, [x9, :lo12:.LCPI5_0]
	add x9, x2, #32
.LBB5_3:
	ldr d2, [x0], #8
	subs x8, x8, #1
	dup v3.8b, v2.b[0]
	dup v4.8b, v2.b[1]
	dup v5.8b, v2.b[2]
	dup v6.8b, v2.b[3]
	dup v7.8b, v2.b[4]
	dup v16.8b, v2.b[5]
	dup v17.8b, v2.b[6]
	dup v2.8b, v2.b[7]
	mov v3.d[1], v4.d[0]
	mov v5.d[1], v6.d[0]
	mov v7.d[1], v16.d[0]
	mov v17.d[1], v2.d[0]
	and v2.16b, v3.16b, v1.16b
	and v3.16b, v5.16b, v1.16b
	and v4.16b, v7.16b, v1.16b
	and v5.16b, v17.16b, v1.16b
	cmeq v2.16b, v2.16b, #0
	cmeq v3.16b, v3.16b, #0
	cmeq v4.16b, v4.16b, #0
	cmeq v5.16b, v5.16b, #0
	bic v2.16b, v0.16b, v2.16b
	bic v3.16b, v0.16b, v3.16b
	bic v4.16b, v0.16b, v4.16b
	bic v5.16b, v0.16b, v5.16b
	stp q2, q3, [x9, #-32]
	stp q4, q5, [x9], #64
	b.ne .LBB5_3
.LBB5_4:
	ldp x29, x30, [sp], #16
	ret
.LBB5_5:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.36
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.36
	mov w1, #46
	bl core::panicking::panic
