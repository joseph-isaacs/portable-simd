	.file	"open_cases.36a71362e04c2977-cgu.0"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_0:
	.byte	32
	.byte	33
	.byte	34
	.byte	35
	.byte	36
	.byte	37
	.byte	38
	.byte	39
	.byte	40
	.byte	41
	.byte	42
	.byte	43
	.byte	44
	.byte	45
	.byte	46
	.byte	47
.LCPI0_1:
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
.LCPI0_2:
	.byte	48
	.byte	49
	.byte	50
	.byte	51
	.byte	52
	.byte	53
	.byte	54
	.byte	55
	.byte	56
	.byte	57
	.byte	58
	.byte	59
	.byte	60
	.byte	61
	.byte	62
	.byte	63
.LCPI0_3:
	.byte	16
	.byte	17
	.byte	18
	.byte	19
	.byte	20
	.byte	21
	.byte	22
	.byte	23
	.byte	24
	.byte	25
	.byte	26
	.byte	27
	.byte	28
	.byte	29
	.byte	30
	.byte	31
	.section	.text.first_set64,"ax",@progbits
	.globl	first_set64
	.p2align	2
	.type	first_set64,@function
first_set64:
	.cfi_startproc
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
	mov	w9, #255
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI1_0:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.section	.text.to_bitmask32,"ax",@progbits
	.globl	to_bitmask32
	.p2align	2
	.type	to_bitmask32,@function
to_bitmask32:
	.cfi_startproc
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI2_0:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.section	.text.to_bitmask64,"ax",@progbits
	.globl	to_bitmask64
	.p2align	2
	.type	to_bitmask64,@function
to_bitmask64:
	.cfi_startproc
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

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI3_0:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.section	.text.to_bitmask64_store,"ax",@progbits
	.globl	to_bitmask64_store
	.p2align	2
	.type	to_bitmask64_store,@function
to_bitmask64_store:
	.cfi_startproc
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

	.ident	"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"
	.section	".note.GNU-stack","",@progbits
