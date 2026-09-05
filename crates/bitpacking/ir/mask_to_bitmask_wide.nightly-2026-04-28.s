	.file	"mask_to_bitmask_wide.e15b5a0ad99d25a1-cgu.0"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_0:
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
	.section	.text.m16_i16,"ax",@progbits
	.globl	m16_i16
	.p2align	2
	.type	m16_i16,@function
m16_i16:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldp	q0, q1, [x0]
	adrp	x8, .LCPI0_0
	cmeq	v1.8h, v1.8h, #0
	cmeq	v0.8h, v0.8h, #0
	uzp1	v0.16b, v0.16b, v1.16b
	ldr	q1, [x8, :lo12:.LCPI0_0]
	bic	v0.16b, v1.16b, v0.16b
	ext	v1.16b, v0.16b, v0.16b, #8
	zip1	v0.16b, v0.16b, v1.16b
	addv	h0, v0.8h
	str	h0, [sp, #12]
	ldrh	w0, [sp, #12]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	m16_i16, .Lfunc_end0-m16_i16
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
	.section	.text.m16_i32,"ax",@progbits
	.globl	m16_i32
	.p2align	2
	.type	m16_i32,@function
m16_i32:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldp	q1, q0, [x0, #32]
	adrp	x8, .LCPI1_0
	ldp	q2, q3, [x0]
	cmeq	v0.4s, v0.4s, #0
	cmeq	v1.4s, v1.4s, #0
	cmeq	v3.4s, v3.4s, #0
	cmeq	v2.4s, v2.4s, #0
	uzp1	v0.8h, v1.8h, v0.8h
	uzp1	v1.8h, v2.8h, v3.8h
	uzp1	v0.16b, v1.16b, v0.16b
	ldr	q1, [x8, :lo12:.LCPI1_0]
	bic	v0.16b, v1.16b, v0.16b
	ext	v1.16b, v0.16b, v0.16b, #8
	zip1	v0.16b, v0.16b, v1.16b
	addv	h0, v0.8h
	str	h0, [sp, #12]
	ldrh	w0, [sp, #12]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	m16_i32, .Lfunc_end1-m16_i32
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
	.section	.text.m32_i16,"ax",@progbits
	.globl	m32_i16
	.p2align	2
	.type	m32_i16,@function
m32_i16:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldp	q1, q0, [x0, #32]
	adrp	x8, .LCPI2_0
	ldp	q2, q3, [x0]
	cmeq	v0.8h, v0.8h, #0
	cmeq	v1.8h, v1.8h, #0
	cmeq	v3.8h, v3.8h, #0
	cmeq	v2.8h, v2.8h, #0
	uzp1	v0.16b, v1.16b, v0.16b
	uzp1	v1.16b, v2.16b, v3.16b
	ldr	q2, [x8, :lo12:.LCPI2_0]
	bic	v0.16b, v2.16b, v0.16b
	bic	v1.16b, v2.16b, v1.16b
	ext	v2.16b, v0.16b, v0.16b, #8
	ext	v3.16b, v1.16b, v1.16b, #8
	zip1	v0.16b, v0.16b, v2.16b
	zip1	v1.16b, v1.16b, v3.16b
	addv	h0, v0.8h
	addv	h1, v1.8h
	fmov	w8, s0
	fmov	w0, s1
	bfi	w0, w8, #16, #16
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	m32_i16, .Lfunc_end2-m32_i16
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI3_0:
	.hword	1
	.hword	2
	.hword	4
	.hword	8
	.hword	16
	.hword	32
	.hword	64
	.hword	128
	.section	.text.m8_i32,"ax",@progbits
	.globl	m8_i32
	.p2align	2
	.type	m8_i32,@function
m8_i32:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldp	q0, q1, [x0]
	adrp	x8, .LCPI3_0
	cmeq	v1.4s, v1.4s, #0
	cmeq	v0.4s, v0.4s, #0
	uzp1	v0.8h, v0.8h, v1.8h
	ldr	q1, [x8, :lo12:.LCPI3_0]
	bic	v0.16b, v1.16b, v0.16b
	addv	h0, v0.8h
	str	b0, [sp, #12]
	ldrb	w0, [sp, #12]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end3:
	.size	m8_i32, .Lfunc_end3-m8_i32
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI4_0:
	.hword	1
	.hword	2
	.hword	4
	.hword	8
	.hword	16
	.hword	32
	.hword	64
	.hword	128
	.section	.text.m8_i64,"ax",@progbits
	.globl	m8_i64
	.p2align	2
	.type	m8_i64,@function
m8_i64:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ldp	q1, q0, [x0, #32]
	adrp	x8, .LCPI4_0
	ldp	q2, q3, [x0]
	cmeq	v0.2d, v0.2d, #0
	cmeq	v1.2d, v1.2d, #0
	cmeq	v3.2d, v3.2d, #0
	cmeq	v2.2d, v2.2d, #0
	uzp1	v0.4s, v1.4s, v0.4s
	uzp1	v1.4s, v2.4s, v3.4s
	uzp1	v0.8h, v1.8h, v0.8h
	ldr	q1, [x8, :lo12:.LCPI4_0]
	bic	v0.16b, v1.16b, v0.16b
	addv	h0, v0.8h
	str	b0, [sp, #12]
	ldrb	w0, [sp, #12]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end4:
	.size	m8_i64, .Lfunc_end4-m8_i64
	.cfi_endproc

	.ident	"rustc version 1.97.0-nightly (52b6e2c20 2026-04-27)"
	.section	".note.GNU-stack","",@progbits
