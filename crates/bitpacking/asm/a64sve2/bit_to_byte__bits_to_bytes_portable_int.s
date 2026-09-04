bitpacking::bit_to_byte::bits_to_bytes_portable_int:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1, lsl #6
	b.lo .LBB9_4
	lsr x8, x3, #6
	cmp x8, x1
	csel x8, x8, x1, lo
	cbz x8, .LBB9_3
.LBB9_2:
	ldrh w12, [x0, #6]
	ldrh w11, [x0, #4]
	subs x8, x8, #1
	ldrh w9, [x0, #2]
	ldrh w10, [x0], #8
	and w15, w12, #0x1
	ubfx w14, w12, #1, #1
	fmov s2, w15
	and w15, w11, #0x1
	and w13, w9, #0x1
	fmov s3, w15
	fmov s0, w13
	ubfx w13, w11, #1, #1
	ubfx w15, w9, #1, #1
	mov v2.b[1], w14
	ubfx w14, w10, #1, #1
	mov v3.b[1], w13
	and w13, w10, #0x1
	mov v0.b[1], w15
	fmov s1, w13
	ubfx w13, w12, #2, #1
	mov v2.b[2], w13
	ubfx w13, w9, #2, #1
	mov v1.b[1], w14
	ubfx w14, w11, #2, #1
	mov v0.b[2], w13
	ubfx w13, w12, #3, #1
	mov v3.b[2], w14
	ubfx w14, w10, #2, #1
	mov v2.b[3], w13
	ubfx w13, w9, #3, #1
	mov v1.b[2], w14
	ubfx w14, w11, #3, #1
	mov v0.b[3], w13
	ubfx w13, w12, #4, #1
	mov v3.b[3], w14
	ubfx w14, w10, #3, #1
	mov v2.b[4], w13
	ubfx w13, w9, #4, #1
	mov v1.b[3], w14
	ubfx w14, w11, #4, #1
	mov v0.b[4], w13
	ubfx w13, w12, #5, #1
	mov v3.b[4], w14
	ubfx w14, w10, #4, #1
	mov v2.b[5], w13
	ubfx w13, w9, #5, #1
	mov v1.b[4], w14
	ubfx w14, w11, #5, #1
	mov v0.b[5], w13
	ubfx w13, w12, #6, #1
	mov v3.b[5], w14
	ubfx w14, w10, #5, #1
	mov v2.b[6], w13
	ubfx w13, w9, #6, #1
	mov v1.b[5], w14
	ubfx w14, w11, #6, #1
	mov v0.b[6], w13
	ubfx w13, w12, #7, #1
	mov v3.b[6], w14
	ubfx w14, w10, #6, #1
	mov v2.b[7], w13
	ubfx w13, w9, #7, #1
	mov v1.b[6], w14
	ubfx w14, w11, #7, #1
	mov v0.b[7], w13
	ubfx w13, w12, #8, #1
	mov v3.b[7], w14
	ubfx w14, w10, #7, #1
	mov v2.b[8], w13
	ubfx w13, w9, #8, #1
	mov v1.b[7], w14
	ubfx w14, w11, #8, #1
	mov v0.b[8], w13
	ubfx w13, w12, #9, #1
	mov v3.b[8], w14
	ubfx w14, w10, #8, #1
	mov v2.b[9], w13
	ubfx w13, w9, #9, #1
	mov v1.b[8], w14
	ubfx w14, w11, #9, #1
	mov v0.b[9], w13
	ubfx w13, w12, #10, #1
	mov v3.b[9], w14
	ubfx w14, w10, #9, #1
	mov v2.b[10], w13
	ubfx w13, w9, #10, #1
	mov v1.b[9], w14
	ubfx w14, w11, #10, #1
	mov v0.b[10], w13
	ubfx w13, w12, #11, #1
	mov v3.b[10], w14
	ubfx w14, w10, #10, #1
	mov v2.b[11], w13
	ubfx w13, w9, #11, #1
	mov v1.b[10], w14
	ubfx w14, w11, #11, #1
	mov v0.b[11], w13
	ubfx w13, w12, #12, #1
	mov v3.b[11], w14
	ubfx w14, w10, #11, #1
	mov v2.b[12], w13
	ubfx w13, w9, #12, #1
	mov v1.b[11], w14
	ubfx w14, w11, #12, #1
	mov v0.b[12], w13
	ubfx w13, w12, #13, #1
	mov v3.b[12], w14
	ubfx w14, w10, #12, #1
	mov v2.b[13], w13
	ubfx w13, w9, #13, #1
	mov v1.b[12], w14
	ubfx w14, w11, #13, #1
	mov v0.b[13], w13
	ubfx w13, w12, #14, #1
	lsr w12, w12, #15
	mov v3.b[13], w14
	ubfx w14, w10, #13, #1
	mov v2.b[14], w13
	ubfx w13, w9, #14, #1
	lsr w9, w9, #15
	mov v1.b[13], w14
	ubfx w14, w11, #14, #1
	lsr w11, w11, #15
	mov v0.b[14], w13
	mov v3.b[14], w14
	ubfx w14, w10, #14, #1
	lsr w10, w10, #15
	mov v2.b[15], w12
	mov v1.b[14], w14
	mov v0.b[15], w9
	mov v3.b[15], w11
	mov v1.b[15], w10
	stp q3, q2, [x2, #32]
	stp q1, q0, [x2], #64
	b.ne .LBB9_2
.LBB9_3:
	ldp x29, x30, [sp], #16
	ret
.LBB9_4:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.34
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.40
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.40
	mov w1, #46
	bl core::panicking::panic
