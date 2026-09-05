	.file	"lib.342725b26d02ed7a-cgu.0"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI0_0:
	.xword	64
	.xword	128
.LCPI0_1:
	.xword	16384
	.xword	32768
.LCPI0_2:
	.xword	4
	.xword	8
.LCPI0_3:
	.xword	1024
	.xword	2048
.LCPI0_4:
	.xword	16
	.xword	32
.LCPI0_5:
	.xword	4096
	.xword	8192
.LCPI0_6:
	.xword	1
	.xword	2
.LCPI0_7:
	.xword	256
	.xword	512
.LCPI0_8:
	.xword	4194304
	.xword	8388608
.LCPI0_9:
	.xword	1073741824
	.xword	2147483648
.LCPI0_10:
	.xword	262144
	.xword	524288
.LCPI0_11:
	.xword	67108864
	.xword	134217728
.LCPI0_12:
	.xword	1048576
	.xword	2097152
.LCPI0_13:
	.xword	268435456
	.xword	536870912
.LCPI0_14:
	.xword	65536
	.xword	131072
.LCPI0_15:
	.xword	16777216
	.xword	33554432
.LCPI0_16:
	.xword	1099511627776
	.xword	2199023255552
.LCPI0_17:
	.xword	4294967296
	.xword	8589934592
.LCPI0_18:
	.xword	17592186044416
	.xword	35184372088832
.LCPI0_19:
	.xword	68719476736
	.xword	137438953472
.LCPI0_20:
	.xword	4398046511104
	.xword	8796093022208
.LCPI0_21:
	.xword	17179869184
	.xword	34359738368
.LCPI0_22:
	.xword	70368744177664
	.xword	140737488355328
.LCPI0_23:
	.xword	274877906944
	.xword	549755813888
.LCPI0_24:
	.xword	18014398509481984
	.xword	36028797018963968
.LCPI0_25:
	.xword	4611686018427387904
	.xword	-9223372036854775808
.LCPI0_26:
	.xword	1125899906842624
	.xword	2251799813685248
.LCPI0_27:
	.xword	288230376151711744
	.xword	576460752303423488
.LCPI0_28:
	.xword	4503599627370496
	.xword	9007199254740992
.LCPI0_29:
	.xword	1152921504606846976
	.xword	2305843009213693952
.LCPI0_30:
	.xword	281474976710656
	.xword	562949953421312
.LCPI0_31:
	.xword	72057594037927936
	.xword	144115188075855872
	.section	.text._RNvCs4tBK5thUKo0_3lib11scalar_loop,"ax",@progbits
	.globl	_RNvCs4tBK5thUKo0_3lib11scalar_loop
	.p2align	2
	.type	_RNvCs4tBK5thUKo0_3lib11scalar_loop,@function
_RNvCs4tBK5thUKo0_3lib11scalar_loop:
	.cfi_startproc
	lsr	x8, x1, #6
	cmp	x8, x3
	csel	x8, x8, x3, lo
	cbz	x8, .LBB0_4
	sub	sp, sp, #496
	.cfi_def_cfa_offset 496
	stp	d15, d14, [sp, #416]
	stp	d13, d12, [sp, #432]
	stp	d11, d10, [sp, #448]
	stp	d9, d8, [sp, #464]
	str	x30, [sp, #480]
	.cfi_offset w30, -16
	.cfi_offset b8, -24
	.cfi_offset b9, -32
	.cfi_offset b10, -40
	.cfi_offset b11, -48
	.cfi_offset b12, -56
	.cfi_offset b13, -64
	.cfi_offset b14, -72
	.cfi_offset b15, -80
	adrp	x9, .LCPI0_0
	adrp	x10, .LCPI0_1
	adrp	x11, .LCPI0_2
	ldr	q0, [x9, :lo12:.LCPI0_0]
	adrp	x9, .LCPI0_3
	str	q0, [sp, #400]
	ldr	q0, [x10, :lo12:.LCPI0_1]
	adrp	x10, .LCPI0_4
	str	q0, [sp, #384]
	ldr	q0, [x11, :lo12:.LCPI0_2]
	adrp	x11, .LCPI0_7
	str	q0, [sp, #368]
	ldr	q0, [x9, :lo12:.LCPI0_3]
	adrp	x9, .LCPI0_5
	str	q0, [sp, #352]
	ldr	q0, [x10, :lo12:.LCPI0_4]
	adrp	x10, .LCPI0_6
	str	q0, [sp, #336]
	ldr	q0, [x9, :lo12:.LCPI0_5]
	adrp	x9, .LCPI0_8
	str	q0, [sp, #320]
	ldr	q0, [x10, :lo12:.LCPI0_6]
	adrp	x10, .LCPI0_9
	str	q0, [sp, #304]
	ldr	q0, [x11, :lo12:.LCPI0_7]
	adrp	x11, .LCPI0_10
	str	q0, [sp, #288]
	ldr	q0, [x9, :lo12:.LCPI0_8]
	adrp	x9, .LCPI0_11
	str	q0, [sp, #272]
	ldr	q0, [x10, :lo12:.LCPI0_9]
	adrp	x10, .LCPI0_12
	str	q0, [sp, #256]
	ldr	q0, [x11, :lo12:.LCPI0_10]
	adrp	x11, .LCPI0_13
	str	q0, [sp, #240]
	ldr	q0, [x9, :lo12:.LCPI0_11]
	adrp	x9, .LCPI0_14
	str	q0, [sp, #224]
	ldr	q0, [x10, :lo12:.LCPI0_12]
	adrp	x10, .LCPI0_15
	str	q0, [sp, #208]
	ldr	q0, [x11, :lo12:.LCPI0_13]
	adrp	x11, .LCPI0_16
	str	q0, [sp, #192]
	ldr	q0, [x9, :lo12:.LCPI0_14]
	adrp	x9, .LCPI0_17
	str	q0, [sp, #176]
	ldr	q0, [x10, :lo12:.LCPI0_15]
	adrp	x10, .LCPI0_18
	str	q0, [sp, #160]
	ldr	q0, [x11, :lo12:.LCPI0_16]
	adrp	x11, .LCPI0_19
	str	q0, [sp, #144]
	ldr	q0, [x9, :lo12:.LCPI0_17]
	adrp	x9, .LCPI0_20
	str	q0, [sp, #128]
	ldr	q0, [x10, :lo12:.LCPI0_18]
	adrp	x10, .LCPI0_21
	str	q0, [sp, #112]
	ldr	q0, [x11, :lo12:.LCPI0_19]
	adrp	x11, .LCPI0_22
	str	q0, [sp, #96]
	ldr	q0, [x9, :lo12:.LCPI0_20]
	adrp	x9, .LCPI0_23
	str	q0, [sp, #80]
	ldr	q0, [x10, :lo12:.LCPI0_21]
	adrp	x10, .LCPI0_24
	str	q0, [sp, #64]
	ldr	q0, [x11, :lo12:.LCPI0_22]
	adrp	x11, .LCPI0_25
	str	q0, [sp, #48]
	ldr	q0, [x9, :lo12:.LCPI0_23]
	adrp	x9, .LCPI0_26
	ldr	q10, [x9, :lo12:.LCPI0_26]
	adrp	x9, .LCPI0_29
	str	q0, [sp, #32]
	ldr	q0, [x10, :lo12:.LCPI0_24]
	adrp	x10, .LCPI0_27
	ldr	q11, [x10, :lo12:.LCPI0_27]
	adrp	x10, .LCPI0_30
	ldr	q13, [x9, :lo12:.LCPI0_29]
	str	q0, [sp, #16]
	ldr	q0, [x11, :lo12:.LCPI0_25]
	adrp	x11, .LCPI0_28
	ldr	q12, [x11, :lo12:.LCPI0_28]
	adrp	x11, .LCPI0_31
	ldr	q14, [x10, :lo12:.LCPI0_30]
	ldr	q15, [x11, :lo12:.LCPI0_31]
	add	x9, x0, #32
	str	q0, [sp]
.LBB0_2:
	ldp	q0, q1, [x9, #-32]
	subs	x8, x8, #1
	cmeq	v0.16b, v0.16b, #0
	cmeq	v1.16b, v1.16b, #0
	sshll	v2.8h, v0.8b, #0
	sshll2	v0.8h, v0.16b, #0
	sshll2	v4.8h, v1.16b, #0
	sshll	v1.8h, v1.8b, #0
	sshll2	v5.4s, v2.8h, #0
	sshll	v6.4s, v0.4h, #0
	sshll	v7.4s, v2.4h, #0
	sshll2	v0.4s, v0.8h, #0
	sshll	v3.4s, v1.4h, #0
	sshll2	v22.4s, v1.8h, #0
	sshll	v2.4s, v4.4h, #0
	sshll2	v4.4s, v4.8h, #0
	ushll2	v16.2d, v5.4s, #0
	ushll2	v17.2d, v6.4s, #0
	ushll2	v18.2d, v7.4s, #0
	ushll2	v19.2d, v0.4s, #0
	ushll	v20.2d, v7.2s, #0
	ushll	v21.2d, v0.2s, #0
	ushll	v23.2d, v6.2s, #0
	ldp	q1, q0, [sp, #384]
	ldp	q7, q6, [sp, #352]
	ushll	v5.2d, v5.2s, #0
	ushll2	v24.2d, v22.4s, #0
	ushll	v22.2d, v22.2s, #0
	bic	v0.16b, v0.16b, v16.16b
	bic	v1.16b, v1.16b, v19.16b
	bic	v7.16b, v7.16b, v17.16b
	ldp	q16, q17, [sp, #320]
	bic	v6.16b, v6.16b, v18.16b
	bic	v5.16b, v17.16b, v5.16b
	bic	v17.16b, v16.16b, v21.16b
	ushll	v21.2d, v3.2s, #0
	ldp	q16, q19, [sp, #288]
	ushll2	v3.2d, v3.4s, #0
	bic	v18.16b, v19.16b, v20.16b
	bic	v19.16b, v16.16b, v23.16b
	ushll	v20.2d, v2.2s, #0
	ldp	q16, q25, [x9], #64
	ushll	v23.2d, v4.2s, #0
	ushll2	v4.2d, v4.4s, #0
	ushll2	v2.2d, v2.4s, #0
	cmeq	v26.16b, v16.16b, #0
	ldp	q27, q16, [sp, #256]
	bic	v16.16b, v16.16b, v24.16b
	ldp	q24, q28, [sp, #160]
	bic	v27.16b, v27.16b, v4.16b
	ldr	q4, [sp, #240]
	bic	v20.16b, v24.16b, v20.16b
	ldr	q24, [sp, #192]
	bic	v21.16b, v28.16b, v21.16b
	bic	v28.16b, v4.16b, v3.16b
	ldp	q4, q3, [sp, #208]
	bic	v23.16b, v24.16b, v23.16b
	sshll	v24.8h, v26.8b, #0
	sshll2	v26.8h, v26.16b, #0
	orr	v1.16b, v27.16b, v1.16b
	orr	v0.16b, v16.16b, v0.16b
	bic	v22.16b, v4.16b, v22.16b
	bic	v29.16b, v3.16b, v2.16b
	orr	v3.16b, v21.16b, v18.16b
	orr	v4.16b, v23.16b, v17.16b
	sshll2	v17.4s, v24.8h, #0
	sshll2	v21.4s, v26.8h, #0
	orr	v2.16b, v20.16b, v19.16b
	sshll	v18.4s, v26.4h, #0
	cmeq	v20.16b, v25.16b, #0
	orr	v5.16b, v22.16b, v5.16b
	sshll	v19.4s, v24.4h, #0
	orr	v7.16b, v29.16b, v7.16b
	sshll2	v22.2d, v17.4s, #0
	sshll2	v26.2d, v21.4s, #0
	sshll	v21.2d, v21.2s, #0
	sshll	v17.2d, v17.2s, #0
	ldp	q29, q30, [sp, #96]
	orr	v6.16b, v28.16b, v6.16b
	sshll	v23.2d, v18.2s, #0
	sshll2	v25.8h, v20.16b, #0
	sshll	v20.8h, v20.8b, #0
	ldp	q27, q28, [sp, #128]
	sshll	v24.2d, v19.2s, #0
	sshll2	v19.2d, v19.4s, #0
	bic	v21.16b, v30.16b, v21.16b
	bic	v17.16b, v29.16b, v17.16b
	ldp	q29, q30, [sp, #64]
	bic	v23.16b, v28.16b, v23.16b
	sshll	v28.4s, v20.4h, #0
	sshll2	v20.4s, v20.8h, #0
	sshll2	v18.2d, v18.4s, #0
	bic	v24.16b, v27.16b, v24.16b
	sshll	v27.4s, v25.4h, #0
	bic	v19.16b, v29.16b, v19.16b
	ldp	q9, q29, [sp, #32]
	sshll2	v25.4s, v25.8h, #0
	sshll2	v8.2d, v20.4s, #0
	sshll	v20.2d, v20.2s, #0
	bic	v18.16b, v30.16b, v18.16b
	sshll	v30.2d, v28.2s, #0
	sshll2	v28.2d, v28.4s, #0
	bic	v22.16b, v9.16b, v22.16b
	ldr	q9, [sp, #16]
	bic	v26.16b, v29.16b, v26.16b
	sshll	v29.2d, v27.2s, #0
	sshll	v31.2d, v25.2s, #0
	sshll2	v25.2d, v25.4s, #0
	sshll2	v27.2d, v27.4s, #0
	bic	v8.16b, v9.16b, v8.16b
	ldr	q9, [sp]
	bic	v30.16b, v14.16b, v30.16b
	bic	v28.16b, v10.16b, v28.16b
	bic	v20.16b, v12.16b, v20.16b
	bic	v29.16b, v15.16b, v29.16b
	bic	v25.16b, v9.16b, v25.16b
	bic	v31.16b, v13.16b, v31.16b
	bic	v27.16b, v11.16b, v27.16b
	orr	v22.16b, v8.16b, v22.16b
	orr	v17.16b, v20.16b, v17.16b
	orr	v19.16b, v28.16b, v19.16b
	orr	v16.16b, v29.16b, v23.16b
	orr	v23.16b, v30.16b, v24.16b
	orr	v21.16b, v31.16b, v21.16b
	orr	v24.16b, v25.16b, v26.16b
	orr	v18.16b, v27.16b, v18.16b
	orr	v0.16b, v22.16b, v0.16b
	orr	v5.16b, v17.16b, v5.16b
	orr	v6.16b, v19.16b, v6.16b
	orr	v2.16b, v16.16b, v2.16b
	orr	v3.16b, v23.16b, v3.16b
	orr	v4.16b, v21.16b, v4.16b
	orr	v1.16b, v24.16b, v1.16b
	orr	v7.16b, v18.16b, v7.16b
	orr	v4.16b, v5.16b, v4.16b
	orr	v2.16b, v3.16b, v2.16b
	orr	v0.16b, v0.16b, v1.16b
	orr	v1.16b, v6.16b, v7.16b
	orr	v0.16b, v1.16b, v0.16b
	orr	v1.16b, v2.16b, v4.16b
	orr	v0.16b, v1.16b, v0.16b
	mov	d1, v0.d[1]
	orr	v0.8b, v0.8b, v1.8b
	str	d0, [x2], #8
	b.ne	.LBB0_2
	ldp	d9, d8, [sp, #464]
	ldr	x30, [sp, #480]
	ldp	d11, d10, [sp, #448]
	ldp	d13, d12, [sp, #432]
	ldp	d15, d14, [sp, #416]
	add	sp, sp, #496
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore b8
	.cfi_restore b9
	.cfi_restore b10
	.cfi_restore b11
	.cfi_restore b12
	.cfi_restore b13
	.cfi_restore b14
	.cfi_restore b15
.LBB0_4:
	ret
.Lfunc_end0:
	.size	_RNvCs4tBK5thUKo0_3lib11scalar_loop, .Lfunc_end0-_RNvCs4tBK5thUKo0_3lib11scalar_loop
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
	.section	.text._RNvCs4tBK5thUKo0_3lib15to_bitmask_loop,"ax",@progbits
	.globl	_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop
	.p2align	2
	.type	_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop,@function
_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop:
	.cfi_startproc
	lsr	x8, x1, #6
	cmp	x8, x3
	csel	x8, x8, x3, lo
	cbz	x8, .LBB1_3
	adrp	x9, .LCPI1_0
	ldr	q0, [x9, :lo12:.LCPI1_0]
.LBB1_2:
	ldp	q2, q1, [x0, #32]
	subs	x8, x8, #1
	ldp	q4, q3, [x0], #64
	cmeq	v1.16b, v1.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v4.16b, v4.16b, #0
	bic	v1.16b, v0.16b, v1.16b
	bic	v2.16b, v0.16b, v2.16b
	bic	v3.16b, v0.16b, v3.16b
	bic	v4.16b, v0.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	str	h1, [x2, #6]
	str	h2, [x2, #4]
	str	h3, [x2, #2]
	str	h4, [x2], #8
	b.ne	.LBB1_2
.LBB1_3:
	ret
.Lfunc_end1:
	.size	_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop, .Lfunc_end1-_RNvCs4tBK5thUKo0_3lib15to_bitmask_loop
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
	.section	.text._RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop,"ax",@progbits
	.globl	_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop
	.p2align	2
	.type	_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop,@function
_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop:
	.cfi_startproc
	lsr	x8, x1, #6
	cmp	x8, x3
	csel	x8, x8, x3, lo
	cbz	x8, .LBB2_3
	adrp	x9, .LCPI2_0
	ldr	q0, [x9, :lo12:.LCPI2_0]
	add	x9, x0, #32
.LBB2_2:
	ldp	q2, q1, [x9]
	subs	x8, x8, #1
	ldp	q4, q3, [x9, #-32]
	add	x9, x9, #64
	cmeq	v1.16b, v1.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v4.16b, v4.16b, #0
	bic	v1.16b, v0.16b, v1.16b
	bic	v2.16b, v0.16b, v2.16b
	bic	v3.16b, v0.16b, v3.16b
	bic	v4.16b, v0.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	addp	v1.16b, v1.16b, v1.16b
	addp	v2.16b, v2.16b, v2.16b
	addp	v3.16b, v3.16b, v3.16b
	addp	v4.16b, v4.16b, v4.16b
	str	h1, [x2, #6]
	str	h2, [x2, #4]
	str	h3, [x2, #2]
	str	h4, [x2], #8
	b.ne	.LBB2_2
.LBB2_3:
	ret
.Lfunc_end2:
	.size	_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop, .Lfunc_end2-_RNvCs4tBK5thUKo0_3lib17to_bitmask32_loop
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
	.section	.text._RNvCs4tBK5thUKo0_3lib9neon_loop,"ax",@progbits
	.globl	_RNvCs4tBK5thUKo0_3lib9neon_loop
	.p2align	2
	.type	_RNvCs4tBK5thUKo0_3lib9neon_loop,@function
_RNvCs4tBK5thUKo0_3lib9neon_loop:
	.cfi_startproc
	lsr	x8, x1, #6
	cmp	x8, x3
	csel	x8, x8, x3, lo
	cbz	x8, .LBB3_3
	adrp	x9, .LCPI3_0
	ldr	q0, [x9, :lo12:.LCPI3_0]
	add	x9, x0, #32
.LBB3_2:
	ldp	q1, q2, [x9, #-32]
	subs	x8, x8, #1
	ldp	q3, q4, [x9], #64
	cmeq	v1.16b, v1.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v3.16b, v3.16b, #0
	cmeq	v4.16b, v4.16b, #0
	bic	v1.16b, v0.16b, v1.16b
	bic	v2.16b, v0.16b, v2.16b
	bic	v3.16b, v0.16b, v3.16b
	bic	v4.16b, v0.16b, v4.16b
	addp	v1.16b, v1.16b, v2.16b
	addp	v2.16b, v3.16b, v4.16b
	addp	v1.16b, v1.16b, v2.16b
	addp	v1.16b, v1.16b, v1.16b
	st1	{ v1.d }[0], [x2], #8
	b.ne	.LBB3_2
.LBB3_3:
	ret
.Lfunc_end3:
	.size	_RNvCs4tBK5thUKo0_3lib9neon_loop, .Lfunc_end3-_RNvCs4tBK5thUKo0_3lib9neon_loop
	.cfi_endproc

	.ident	"rustc version 1.100.0-nightly (a69a63265 2026-09-03)"
	.section	".note.GNU-stack","",@progbits
