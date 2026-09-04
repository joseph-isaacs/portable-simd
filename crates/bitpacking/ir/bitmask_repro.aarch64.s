	.file	"bitmask_repro.186758fa66f080eb-cgu.0"
	.section	.text.bits_to_bytes,"ax",@progbits
	.globl	bits_to_bytes
	.p2align	2
	.type	bits_to_bytes,@function
bits_to_bytes:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	ubfx	w11, w0, #16, #1
	lsr	x9, x0, #48
	and	w10, w0, #0x1
	fmov	s0, w10
	ubfx	w12, w0, #1, #1
	ubfx	w10, w0, #17, #1
	fmov	s1, w11
	ubfx	x11, x0, #32, #1
	strh	w9, [sp, #12]
	and	w9, w9, #0xffff
	fmov	s2, w11
	and	w11, w9, #0x1
	mov	v0.b[1], w12
	fmov	s3, w11
	mov	v1.b[1], w10
	ubfx	x10, x0, #33, #1
	ubfx	w12, w9, #1, #1
	ubfx	w11, w0, #18, #1
	mov	v2.b[1], w10
	ubfx	w10, w0, #2, #1
	mov	v3.b[1], w12
	ubfx	w12, w9, #2, #1
	mov	v1.b[2], w11
	ubfx	x11, x0, #34, #1
	mov	v0.b[2], w10
	ubfx	w10, w0, #19, #1
	mov	v2.b[2], w11
	ubfx	w11, w0, #3, #1
	mov	v3.b[2], w12
	ubfx	w12, w9, #3, #1
	mov	v1.b[3], w10
	ubfx	x10, x0, #35, #1
	mov	v0.b[3], w11
	ubfx	w11, w0, #20, #1
	mov	v2.b[3], w10
	ubfx	w10, w0, #4, #1
	mov	v3.b[3], w12
	ubfx	w12, w9, #4, #1
	mov	v1.b[4], w11
	ubfx	x11, x0, #36, #1
	mov	v0.b[4], w10
	ubfx	w10, w0, #21, #1
	mov	v2.b[4], w11
	ubfx	w11, w0, #5, #1
	mov	v3.b[4], w12
	ubfx	w12, w9, #5, #1
	mov	v1.b[5], w10
	ubfx	x10, x0, #37, #1
	mov	v0.b[5], w11
	ubfx	w11, w0, #22, #1
	mov	v2.b[5], w10
	ubfx	w10, w0, #6, #1
	mov	v3.b[5], w12
	ubfx	w12, w9, #6, #1
	mov	v1.b[6], w11
	ubfx	x11, x0, #38, #1
	mov	v0.b[6], w10
	ubfx	w10, w0, #23, #1
	mov	v2.b[6], w11
	ubfx	w11, w0, #7, #1
	mov	v3.b[6], w12
	ubfx	w12, w9, #7, #1
	mov	v1.b[7], w10
	ubfx	x10, x0, #39, #1
	mov	v0.b[7], w11
	ubfx	w11, w0, #24, #1
	mov	v2.b[7], w10
	ubfx	w10, w0, #8, #1
	mov	v3.b[7], w12
	ubfx	w12, w9, #8, #1
	mov	v1.b[8], w11
	ubfx	x11, x0, #40, #1
	mov	v0.b[8], w10
	ubfx	w10, w0, #25, #1
	mov	v2.b[8], w11
	ubfx	w11, w0, #9, #1
	mov	v3.b[8], w12
	ubfx	w12, w9, #9, #1
	mov	v1.b[9], w10
	ubfx	x10, x0, #41, #1
	mov	v0.b[9], w11
	ubfx	w11, w0, #26, #1
	mov	v2.b[9], w10
	ubfx	w10, w0, #10, #1
	mov	v3.b[9], w12
	ubfx	w12, w9, #10, #1
	mov	v1.b[10], w11
	ubfx	x11, x0, #42, #1
	mov	v0.b[10], w10
	ubfx	w10, w0, #27, #1
	mov	v2.b[10], w11
	ubfx	w11, w0, #11, #1
	mov	v3.b[10], w12
	ubfx	w12, w9, #11, #1
	mov	v1.b[11], w10
	ubfx	x10, x0, #43, #1
	mov	v0.b[11], w11
	ubfx	w11, w0, #28, #1
	mov	v2.b[11], w10
	ubfx	w10, w0, #12, #1
	mov	v3.b[11], w12
	ubfx	w12, w9, #12, #1
	mov	v1.b[12], w11
	ubfx	x11, x0, #44, #1
	mov	v0.b[12], w10
	ubfx	w10, w0, #29, #1
	mov	v2.b[12], w11
	ubfx	w11, w0, #13, #1
	mov	v3.b[12], w12
	ubfx	w12, w9, #13, #1
	mov	v1.b[13], w10
	ubfx	x10, x0, #45, #1
	mov	v0.b[13], w11
	ubfx	w11, w0, #30, #1
	mov	v2.b[13], w10
	ubfx	w10, w0, #14, #1
	mov	v3.b[13], w12
	ubfx	w12, w9, #14, #1
	lsr	w9, w9, #15
	mov	v1.b[14], w11
	ubfx	x11, x0, #46, #1
	mov	v0.b[14], w10
	lsr	w10, w0, #31
	mov	v2.b[14], w11
	lsr	x11, x0, #32
	mov	v3.b[14], w12
	ubfx	w12, w0, #15, #1
	mov	v1.b[15], w10
	ubfx	w10, w11, #15, #1
	mov	v0.b[15], w12
	mov	v2.b[15], w10
	mov	v3.b[15], w9
	stp	q0, q1, [x8]
	stp	q2, q3, [x8, #32]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	bits_to_bytes, .Lfunc_end0-bits_to_bytes
	.cfi_endproc

	.section	.text.bits_to_bytes16,"ax",@progbits
	.globl	bits_to_bytes16
	.p2align	2
	.type	bits_to_bytes16,@function
bits_to_bytes16:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	and	w9, w0, #0xffff
	strh	w0, [sp, #12]
	and	w11, w9, #0x1
	ubfx	w10, w9, #1, #1
	fmov	s0, w11
	mov	v0.b[1], w10
	ubfx	w10, w9, #2, #1
	mov	v0.b[2], w10
	ubfx	w10, w9, #3, #1
	mov	v0.b[3], w10
	ubfx	w10, w9, #4, #1
	mov	v0.b[4], w10
	ubfx	w10, w9, #5, #1
	mov	v0.b[5], w10
	ubfx	w10, w9, #6, #1
	mov	v0.b[6], w10
	ubfx	w10, w9, #7, #1
	mov	v0.b[7], w10
	ubfx	w10, w9, #8, #1
	mov	v0.b[8], w10
	ubfx	w10, w9, #9, #1
	mov	v0.b[9], w10
	ubfx	w10, w9, #10, #1
	mov	v0.b[10], w10
	ubfx	w10, w9, #11, #1
	mov	v0.b[11], w10
	ubfx	w10, w9, #12, #1
	mov	v0.b[12], w10
	ubfx	w10, w9, #13, #1
	mov	v0.b[13], w10
	ubfx	w10, w9, #14, #1
	lsr	w9, w9, #15
	mov	v0.b[14], w10
	mov	v0.b[15], w9
	str	q0, [x8]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	bits_to_bytes16, .Lfunc_end1-bits_to_bytes16
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
	.section	.text.bytes_to_bits,"ax",@progbits
	.globl	bytes_to_bits
	.p2align	2
	.type	bytes_to_bits,@function
bytes_to_bits:
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
	ext	v4.16b, v0.16b, v0.16b, #8
	ext	v5.16b, v1.16b, v1.16b, #8
	ext	v6.16b, v3.16b, v3.16b, #8
	ext	v7.16b, v2.16b, v2.16b, #8
	zip1	v0.16b, v0.16b, v4.16b
	zip1	v1.16b, v1.16b, v5.16b
	zip1	v3.16b, v3.16b, v6.16b
	zip1	v2.16b, v2.16b, v7.16b
	addv	h0, v0.8h
	addv	h1, v1.8h
	addv	h3, v3.8h
	addv	h2, v2.8h
	fmov	w8, s0
	fmov	w9, s1
	fmov	w10, s3
	fmov	w11, s2
	bfi	w9, w8, #16, #16
	bfi	w11, w10, #16, #16
	orr	x0, x11, x9, lsl #32
	ret
.Lfunc_end2:
	.size	bytes_to_bits, .Lfunc_end2-bytes_to_bits
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
	.section	.text.bytes_to_bits16,"ax",@progbits
	.globl	bytes_to_bits16
	.p2align	2
	.type	bytes_to_bits16,@function
bytes_to_bits16:
	.cfi_startproc
	ldr	q0, [x0]
	adrp	x8, .LCPI3_0
	ldr	q1, [x8, :lo12:.LCPI3_0]
	cmeq	v0.16b, v0.16b, #0
	bic	v0.16b, v1.16b, v0.16b
	ext	v1.16b, v0.16b, v0.16b, #8
	zip1	v0.16b, v0.16b, v1.16b
	addv	h0, v0.8h
	umov	w0, v0.h[0]
	ret
.Lfunc_end3:
	.size	bytes_to_bits16, .Lfunc_end3-bytes_to_bits16
	.cfi_endproc

	.ident	"rustc version 1.97.0-nightly (52b6e2c20 2026-04-27)"
	.section	".note.GNU-stack","",@progbits
