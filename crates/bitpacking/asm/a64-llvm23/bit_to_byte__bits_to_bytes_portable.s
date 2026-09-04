bitpacking::bit_to_byte::bits_to_bytes_portable:
	stp x29, x30, [sp, #-16]!
	mov x29, sp
	cmp x3, x1, lsl #6
	b.lo .LBB8_5
	lsr x8, x3, #6
	cmp x1, x8
	csel x8, x1, x8, lo
	cbz x8, .LBB8_4
	adrp x9, .LCPI8_0
	adrp x10, .LCPI8_1
	adrp x11, .LCPI8_2
	adrp x12, .LCPI8_3
	ldr q0, [x9, :lo12:.LCPI8_0]
	adrp x9, .LCPI8_4
	ldr q1, [x10, :lo12:.LCPI8_1]
	ldr q2, [x11, :lo12:.LCPI8_2]
	ldr q3, [x12, :lo12:.LCPI8_3]
	ldr q4, [x9, :lo12:.LCPI8_4]
.LBB8_3:
	ldr x9, [x0], #8
	subs x8, x8, #1
	fmov d5, x9
	tbl v6.16b, { v5.16b }, v4.16b
	tbl v7.16b, { v5.16b }, v3.16b
	tbl v16.16b, { v5.16b }, v2.16b
	tbl v5.16b, { v5.16b }, v0.16b
	cmtst v6.16b, v6.16b, v1.16b
	cmtst v7.16b, v7.16b, v1.16b
	cmtst v16.16b, v16.16b, v1.16b
	cmtst v5.16b, v5.16b, v1.16b
	ushr v6.16b, v6.16b, #7
	ushr v7.16b, v7.16b, #7
	ushr v16.16b, v16.16b, #7
	ushr v5.16b, v5.16b, #7
	stp q7, q6, [x2, #32]
	stp q5, q16, [x2], #64
	b.ne .LBB8_3
.LBB8_4:
	ldp x29, x30, [sp], #16
	ret
.LBB8_5:
	adrp x0, .Lanon.5a51297bb77c56467177fe203ad88db7.32
	add x0, x0, :lo12:.Lanon.5a51297bb77c56467177fe203ad88db7.32
	adrp x2, .Lanon.5a51297bb77c56467177fe203ad88db7.37
	add x2, x2, :lo12:.Lanon.5a51297bb77c56467177fe203ad88db7.37
	mov w1, #46
	bl core::panicking::panic
