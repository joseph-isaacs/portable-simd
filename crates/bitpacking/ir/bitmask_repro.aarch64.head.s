	.file	"bitmask_repro.186758fa66f080eb-cgu.0"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function bits_to_bytes
	.type	.LCPI0_0,@object
.LCPI0_0:
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.size	.LCPI0_0, 16
	.type	.LCPI0_1,@object
.LCPI0_1:
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.size	.LCPI0_1, 16
	.type	.LCPI0_2,@object
.LCPI0_2:
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	2                               // 0x2
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.byte	3                               // 0x3
	.size	.LCPI0_2, 16
	.type	.LCPI0_3,@object
.LCPI0_3:
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	4                               // 0x4
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.byte	5                               // 0x5
	.size	.LCPI0_3, 16
	.type	.LCPI0_4,@object
.LCPI0_4:
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	6                               // 0x6
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.byte	7                               // 0x7
	.size	.LCPI0_4, 16
	.text
	.globl	bits_to_bytes
	.p2align	2
	.type	bits_to_bytes,@function
bits_to_bytes:                          // @bits_to_bytes
	.cfi_startproc
// %bb.0:                               // %start
	adrp	x9, .LCPI0_4
	fmov	d1, x0
	ldr	q0, [x9, :lo12:.LCPI0_4]
	adrp	x9, .LCPI0_3
	ldr	q2, [x9, :lo12:.LCPI0_3]
	adrp	x9, .LCPI0_2
	ldr	q3, [x9, :lo12:.LCPI0_2]
	adrp	x9, .LCPI0_0
	tbl	v0.16b, { v1.16b }, v0.16b
	ldr	q4, [x9, :lo12:.LCPI0_0]
	tbl	v2.16b, { v1.16b }, v2.16b
	adrp	x9, .LCPI0_1
	tbl	v3.16b, { v1.16b }, v3.16b
	ldr	q5, [x9, :lo12:.LCPI0_1]
	tbl	v1.16b, { v1.16b }, v4.16b
	cmtst	v0.16b, v0.16b, v5.16b
	cmtst	v2.16b, v2.16b, v5.16b
	cmtst	v3.16b, v3.16b, v5.16b
	cmtst	v1.16b, v1.16b, v5.16b
	ushr	v0.16b, v0.16b, #7
	ushr	v2.16b, v2.16b, #7
	ushr	v3.16b, v3.16b, #7
	ushr	v1.16b, v1.16b, #7
	stp	q2, q0, [x8, #32]
	stp	q1, q3, [x8]
	ret
.Lfunc_end0:
	.size	bits_to_bytes, .Lfunc_end0-bits_to_bytes
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function bits_to_bytes16
	.type	.LCPI1_0,@object
.LCPI1_0:
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	0                               // 0x0
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.byte	1                               // 0x1
	.size	.LCPI1_0, 16
	.type	.LCPI1_1,@object
.LCPI1_1:
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.size	.LCPI1_1, 16
	.text
	.globl	bits_to_bytes16
	.p2align	2
	.type	bits_to_bytes16,@function
bits_to_bytes16:                        // @bits_to_bytes16
	.cfi_startproc
// %bb.0:                               // %start
	adrp	x9, .LCPI1_0
	fmov	s1, w0
	ldr	q0, [x9, :lo12:.LCPI1_0]
	adrp	x9, .LCPI1_1
	tbl	v0.16b, { v1.16b }, v0.16b
	ldr	q1, [x9, :lo12:.LCPI1_1]
	cmtst	v0.16b, v0.16b, v1.16b
	ushr	v0.16b, v0.16b, #7
	str	q0, [x8]
	ret
.Lfunc_end1:
	.size	bits_to_bytes16, .Lfunc_end1-bits_to_bytes16
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function bytes_to_bits
	.type	.LCPI2_0,@object
.LCPI2_0:
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.size	.LCPI2_0, 16
	.text
	.globl	bytes_to_bits
	.p2align	2
	.type	bytes_to_bits,@function
bytes_to_bits:                          // @bytes_to_bits
	.cfi_startproc
// %bb.0:                               // %start
	ldp	q1, q0, [x0, #32]
	adrp	x8, .LCPI2_0
	ldp	q2, q3, [x0]
	ldr	q4, [x8, :lo12:.LCPI2_0]
	cmeq	v0.16b, v0.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v2.16b, v2.16b, #0
	bic	v0.16b, v4.16b, v0.16b
	bic	v1.16b, v4.16b, v1.16b
	bic	v3.16b, v4.16b, v3.16b
	bic	v2.16b, v4.16b, v2.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	umov	w8, v0.h[0]
	umov	w9, v1.h[0]
	umov	w10, v3.h[0]
	umov	w11, v2.h[0]
	bfi	w9, w8, #16, #16
	bfi	w11, w10, #16, #16
	orr	x0, x11, x9, lsl #32
	ret
.Lfunc_end2:
	.size	bytes_to_bits, .Lfunc_end2-bytes_to_bits
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function bytes_to_bits16
	.type	.LCPI3_0,@object
.LCPI3_0:
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	4                               // 0x4
	.byte	8                               // 0x8
	.byte	16                              // 0x10
	.byte	32                              // 0x20
	.byte	64                              // 0x40
	.byte	128                             // 0x80
	.size	.LCPI3_0, 16
	.text
	.globl	bytes_to_bits16
	.p2align	2
	.type	bytes_to_bits16,@function
bytes_to_bits16:                        // @bytes_to_bits16
	.cfi_startproc
// %bb.0:                               // %start
	ldr	q0, [x0]
	adrp	x8, .LCPI3_0
	ldr	q1, [x8, :lo12:.LCPI3_0]
	cmeq	v0.16b, v0.16b, #0
	bic	v0.16b, v1.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w0, v0.h[0]
	ret
.Lfunc_end3:
	.size	bytes_to_bits16, .Lfunc_end3-bytes_to_bits16
	.cfi_endproc
                                        // -- End function
	.ident	"rustc version 1.97.0-nightly (52b6e2c20 2026-04-27)"
	.section	".note.GNU-stack","",@progbits
