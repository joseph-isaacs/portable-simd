	.file	"mask_to_bitmask_wide.ll"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m8_i64
	.type	.LCPI0_0,@object
.LCPI0_0:
	.hword	1                               // 0x1
	.hword	2                               // 0x2
	.hword	4                               // 0x4
	.hword	8                               // 0x8
	.hword	16                              // 0x10
	.hword	32                              // 0x20
	.hword	64                              // 0x40
	.hword	128                             // 0x80
	.size	.LCPI0_0, 16
	.text
	.globl	m8_i64
	.p2align	2
	.type	m8_i64,@function
m8_i64:                                 // @m8_i64
	.cfi_startproc
// %bb.0:
	cmeq	v3.2d, v3.2d, #0
	cmeq	v2.2d, v2.2d, #0
	adrp	x8, .LCPI0_0
	cmeq	v1.2d, v1.2d, #0
	cmeq	v0.2d, v0.2d, #0
	uzp1	v2.4s, v2.4s, v3.4s
	uzp1	v0.4s, v0.4s, v1.4s
	ldr	q1, [x8, :lo12:.LCPI0_0]
	uzp1	v0.8h, v0.8h, v2.8h
	bic	v0.16b, v1.16b, v0.16b
	addv	h0, v0.8h
	fmov	w0, s0
	ret
.Lfunc_end0:
	.size	m8_i64, .Lfunc_end0-m8_i64
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m8_i32
	.type	.LCPI1_0,@object
.LCPI1_0:
	.hword	1                               // 0x1
	.hword	2                               // 0x2
	.hword	4                               // 0x4
	.hword	8                               // 0x8
	.hword	16                              // 0x10
	.hword	32                              // 0x20
	.hword	64                              // 0x40
	.hword	128                             // 0x80
	.size	.LCPI1_0, 16
	.text
	.globl	m8_i32
	.p2align	2
	.type	m8_i32,@function
m8_i32:                                 // @m8_i32
	.cfi_startproc
// %bb.0:
	cmeq	v1.4s, v1.4s, #0
	cmeq	v0.4s, v0.4s, #0
	adrp	x8, .LCPI1_0
	uzp1	v0.8h, v0.8h, v1.8h
	ldr	q1, [x8, :lo12:.LCPI1_0]
	bic	v0.16b, v1.16b, v0.16b
	addv	h0, v0.8h
	fmov	w0, s0
	ret
.Lfunc_end1:
	.size	m8_i32, .Lfunc_end1-m8_i32
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m16_i32
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
	.globl	m16_i32
	.p2align	2
	.type	m16_i32,@function
m16_i32:                                // @m16_i32
	.cfi_startproc
// %bb.0:
	cmeq	v3.4s, v3.4s, #0
	cmeq	v2.4s, v2.4s, #0
	adrp	x8, .LCPI2_0
	cmeq	v1.4s, v1.4s, #0
	cmeq	v0.4s, v0.4s, #0
	uzp1	v2.8h, v2.8h, v3.8h
	uzp1	v0.8h, v0.8h, v1.8h
	ldr	q1, [x8, :lo12:.LCPI2_0]
	uzp1	v0.16b, v0.16b, v2.16b
	bic	v0.16b, v1.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w0, v0.h[0]
	ret
.Lfunc_end2:
	.size	m16_i32, .Lfunc_end2-m16_i32
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m16_i16
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
	.globl	m16_i16
	.p2align	2
	.type	m16_i16,@function
m16_i16:                                // @m16_i16
	.cfi_startproc
// %bb.0:
	cmeq	v1.8h, v1.8h, #0
	cmeq	v0.8h, v0.8h, #0
	adrp	x8, .LCPI3_0
	uzp1	v0.16b, v0.16b, v1.16b
	ldr	q1, [x8, :lo12:.LCPI3_0]
	bic	v0.16b, v1.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w0, v0.h[0]
	ret
.Lfunc_end3:
	.size	m16_i16, .Lfunc_end3-m16_i16
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function m32_i16
	.type	.LCPI4_0,@object
.LCPI4_0:
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
	.size	.LCPI4_0, 16
	.text
	.globl	m32_i16
	.p2align	2
	.type	m32_i16,@function
m32_i16:                                // @m32_i16
	.cfi_startproc
// %bb.0:
	cmeq	v3.8h, v3.8h, #0
	cmeq	v2.8h, v2.8h, #0
	adrp	x8, .LCPI4_0
	cmeq	v1.8h, v1.8h, #0
	cmeq	v0.8h, v0.8h, #0
	uzp1	v2.16b, v2.16b, v3.16b
	uzp1	v0.16b, v0.16b, v1.16b
	ldr	q1, [x8, :lo12:.LCPI4_0]
	bic	v2.16b, v1.16b, v2.16b
	bic	v0.16b, v1.16b, v0.16b
	addp	v1.16b, v2.16b, v2.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v0.16b, v0.16b, v0.16b
	umov	w8, v1.h[0]
	umov	w0, v0.h[0]
	bfi	w0, w8, #16, #16
	ret
.Lfunc_end4:
	.size	m32_i16, .Lfunc_end4-m32_i16
	.cfi_endproc
                                        // -- End function
	.globl	first_set32                     // -- Begin function first_set32
	.p2align	2
	.type	first_set32,@function
first_set32:                            // @first_set32
	.cfi_startproc
// %bb.0:
	cmtst	v0.16b, v0.16b, v0.16b
	cmtst	v1.16b, v1.16b, v1.16b
	shrn	v0.8b, v0.8h, #4
	shrn2	v0.16b, v1.8h, #4
	mov	x8, v0.d[1]
	fmov	x9, d0
	rbit	x10, x9
	cmp	x9, #0
	rbit	x8, x8
	clz	x10, x10
	clz	x8, x8
	add	x8, x8, #64
	csel	x8, x10, x8, ne
	lsr	x0, x8, #2
                                        // kill: def $w0 killed $w0 killed $x0
	ret
.Lfunc_end5:
	.size	first_set32, .Lfunc_end5-first_set32
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function first_set64
	.type	.LCPI6_0,@object
.LCPI6_0:
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
	.size	.LCPI6_0, 16
	.text
	.globl	first_set64
	.p2align	2
	.type	first_set64,@function
first_set64:                            // @first_set64
	.cfi_startproc
// %bb.0:
	adrp	x8, .LCPI6_0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v0.16b, v0.16b, #0
	ldr	q4, [x8, :lo12:.LCPI6_0]
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
	orr	x8, x11, x9, lsl #32
	rbit	x8, x8
	clz	x0, x8
	ret
.Lfunc_end6:
	.size	first_set64, .Lfunc_end6-first_set64
	.cfi_endproc
                                        // -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0                          // -- Begin function store64
	.type	.LCPI7_0,@object
.LCPI7_0:
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
	.size	.LCPI7_0, 16
	.text
	.globl	store64
	.p2align	2
	.type	store64,@function
store64:                                // @store64
	.cfi_startproc
// %bb.0:
	cmeq	v3.16b, v3.16b, #0
	adrp	x8, .LCPI7_0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v0.16b, v0.16b, #0
	ldr	q4, [x8, :lo12:.LCPI7_0]
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
	str	h3, [x0, #6]
	str	h2, [x0, #4]
	str	h1, [x0, #2]
	str	h0, [x0]
	ret
.Lfunc_end7:
	.size	store64, .Lfunc_end7-store64
	.cfi_endproc
                                        // -- End function
	.section	".note.GNU-stack","",@progbits
