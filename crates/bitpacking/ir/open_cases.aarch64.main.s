	.file	"open_cases.36a71362e04c2977-cgu.0"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function first_set64
	.type	.LCPI0_0,@object
.LCPI0_0:
	.byte	32                              // 0x20
	.byte	33                              // 0x21
	.byte	34                              // 0x22
	.byte	35                              // 0x23
	.byte	36                              // 0x24
	.byte	37                              // 0x25
	.byte	38                              // 0x26
	.byte	39                              // 0x27
	.byte	40                              // 0x28
	.byte	41                              // 0x29
	.byte	42                              // 0x2a
	.byte	43                              // 0x2b
	.byte	44                              // 0x2c
	.byte	45                              // 0x2d
	.byte	46                              // 0x2e
	.byte	47                              // 0x2f
	.size	.LCPI0_0, 16
	.type	.LCPI0_1,@object
.LCPI0_1:
	.byte	0                               // 0x0
	.byte	1                               // 0x1
	.byte	2                               // 0x2
	.byte	3                               // 0x3
	.byte	4                               // 0x4
	.byte	5                               // 0x5
	.byte	6                               // 0x6
	.byte	7                               // 0x7
	.byte	8                               // 0x8
	.byte	9                               // 0x9
	.byte	10                              // 0xa
	.byte	11                              // 0xb
	.byte	12                              // 0xc
	.byte	13                              // 0xd
	.byte	14                              // 0xe
	.byte	15                              // 0xf
	.size	.LCPI0_1, 16
	.type	.LCPI0_2,@object
.LCPI0_2:
	.byte	48                              // 0x30
	.byte	49                              // 0x31
	.byte	50                              // 0x32
	.byte	51                              // 0x33
	.byte	52                              // 0x34
	.byte	53                              // 0x35
	.byte	54                              // 0x36
	.byte	55                              // 0x37
	.byte	56                              // 0x38
	.byte	57                              // 0x39
	.byte	58                              // 0x3a
	.byte	59                              // 0x3b
	.byte	60                              // 0x3c
	.byte	61                              // 0x3d
	.byte	62                              // 0x3e
	.byte	63                              // 0x3f
	.size	.LCPI0_2, 16
	.type	.LCPI0_3,@object
.LCPI0_3:
	.byte	16                              // 0x10
	.byte	17                              // 0x11
	.byte	18                              // 0x12
	.byte	19                              // 0x13
	.byte	20                              // 0x14
	.byte	21                              // 0x15
	.byte	22                              // 0x16
	.byte	23                              // 0x17
	.byte	24                              // 0x18
	.byte	25                              // 0x19
	.byte	26                              // 0x1a
	.byte	27                              // 0x1b
	.byte	28                              // 0x1c
	.byte	29                              // 0x1d
	.byte	30                              // 0x1e
	.byte	31                              // 0x1f
	.size	.LCPI0_3, 16
	.text
	.globl	first_set64
	.p2align	2
	.type	first_set64,@function
first_set64:                            // @first_set64
	.cfi_startproc
// %bb.0:                               // %start
	ldp	q0, q1, [x0, #32]
	adrp	x8, .LCPI0_0
	ldp	q2, q3, [x0]
	adrp	x9, .LCPI0_1
	adrp	x10, .LCPI0_2
	ldr	q4, [x8, :lo12:.LCPI0_0]
	adrp	x8, .LCPI0_3
	cmeq	v0.16b, v0.16b, #0
	cmeq	v1.16b, v1.16b, #0
	ldr	q5, [x9, :lo12:.LCPI0_1]
	cmeq	v3.16b, v3.16b, #0
	cmeq	v2.16b, v2.16b, #0
	ldr	q6, [x10, :lo12:.LCPI0_2]
	ldr	q7, [x8, :lo12:.LCPI0_3]
	mov	w9, #255                        // =0xff
	orr	v0.16b, v0.16b, v4.16b
	orr	v1.16b, v1.16b, v6.16b
	orr	v2.16b, v2.16b, v5.16b
	orr	v3.16b, v3.16b, v7.16b
	umin	v1.16b, v3.16b, v1.16b
	umin	v0.16b, v2.16b, v0.16b
	umin	v0.16b, v0.16b, v1.16b
	uminv	b0, v0.16b
	fmov	w8, s0
	smov	x1, v0.b[0]
	bics	wzr, w9, w8
	cset	w0, ne
	ret
.Lfunc_end0:
	.size	first_set64, .Lfunc_end0-first_set64
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function to_bitmask32
	.type	.LCPI1_0,@object
.LCPI1_0:
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
	.size	.LCPI1_0, 16
	.text
	.globl	to_bitmask32
	.p2align	2
	.type	to_bitmask32,@function
to_bitmask32:                           // @to_bitmask32
	.cfi_startproc
// %bb.0:                               // %start
	ldp	q0, q1, [x0]
	adrp	x8, .LCPI1_0
	ldr	q2, [x8, :lo12:.LCPI1_0]
	cmeq	v1.16b, v1.16b, #0
	cmeq	v0.16b, v0.16b, #0
	bic	v1.16b, v2.16b, v1.16b
	bic	v0.16b, v2.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w8, v1.h[0]
	umov	w0, v0.h[0]
	bfi	w0, w8, #16, #16
	ret
.Lfunc_end1:
	.size	to_bitmask32, .Lfunc_end1-to_bitmask32
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function to_bitmask64
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
	.globl	to_bitmask64
	.p2align	2
	.type	to_bitmask64,@function
to_bitmask64:                           // @to_bitmask64
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
	.size	to_bitmask64, .Lfunc_end2-to_bitmask64
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function to_bitmask64_store
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
	.globl	to_bitmask64_store
	.p2align	2
	.type	to_bitmask64_store,@function
to_bitmask64_store:                     // @to_bitmask64_store
	.cfi_startproc
// %bb.0:                               // %start
	ldp	q1, q0, [x0, #32]
	adrp	x8, .LCPI3_0
	ldp	q3, q2, [x0]
	ldr	q4, [x8, :lo12:.LCPI3_0]
	cmeq	v0.16b, v0.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v3.16b, v3.16b, #0
	bic	v0.16b, v4.16b, v0.16b
	bic	v1.16b, v4.16b, v1.16b
	bic	v2.16b, v4.16b, v2.16b
	bic	v3.16b, v4.16b, v3.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	str	h0, [x1, #6]
	str	h1, [x1, #4]
	str	h2, [x1, #2]
	str	h3, [x1]
	ret
.Lfunc_end3:
	.size	to_bitmask64_store, .Lfunc_end3-to_bitmask64_store
	.cfi_endproc
                                        // -- End function
	.ident	"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"
	.section	".note.GNU-stack","",@progbits
