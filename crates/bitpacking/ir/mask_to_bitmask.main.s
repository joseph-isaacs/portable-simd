	.file	"mask_to_bitmask.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m16
	.type	.LCPI0_0,@object
.LCPI0_0:
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
	.size	.LCPI0_0, 16
	.text
	.globl	m16
	.p2align	2
	.type	m16,@function
m16:                                    // @m16
	.cfi_startproc
// %bb.0:
	adrp	x8, .LCPI0_0
	cmeq	v0.16b, v0.16b, #0
	ldr	q1, [x8, :lo12:.LCPI0_0]
	bic	v0.16b, v1.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w0, v0.h[0]
	ret
.Lfunc_end0:
	.size	m16, .Lfunc_end0-m16
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m32
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
	.globl	m32
	.p2align	2
	.type	m32,@function
m32:                                    // @m32
	.cfi_startproc
// %bb.0:
	adrp	x8, .LCPI1_0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v0.16b, v0.16b, #0
	ldr	q2, [x8, :lo12:.LCPI1_0]
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
	.size	m32, .Lfunc_end1-m32
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m64
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
	.globl	m64
	.p2align	2
	.type	m64,@function
m64:                                    // @m64
	.cfi_startproc
// %bb.0:
	adrp	x8, .LCPI2_0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v0.16b, v0.16b, #0
	ldr	q4, [x8, :lo12:.LCPI2_0]
	bic	v3.16b, v4.16b, v3.16b
	bic	v2.16b, v4.16b, v2.16b
	bic	v1.16b, v4.16b, v1.16b
	bic	v0.16b, v4.16b, v0.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w8, v3.h[0]
	umov	w9, v2.h[0]
	umov	w10, v1.h[0]
	umov	w11, v0.h[0]
	bfi	w9, w8, #16, #16
	bfi	w11, w10, #16, #16
	orr	x0, x11, x9, lsl #32
	ret
.Lfunc_end2:
	.size	m64, .Lfunc_end2-m64
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
