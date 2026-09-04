bitpacking::expand::expand_portable:
	sub sp, sp, #448
	stp d15, d14, [sp, #288]
	stp d13, d12, [sp, #304]
	stp d11, d10, [sp, #320]
	stp d9, d8, [sp, #336]
	stp x29, x30, [sp, #352]
	stp x28, x27, [sp, #368]
	stp x26, x25, [sp, #384]
	stp x24, x23, [sp, #400]
	stp x22, x21, [sp, #416]
	stp x20, x19, [sp, #432]
	add x29, sp, #352
	cmp x5, x3
	b.lo .LBB24_54
	lsr x11, x3, #3
	mov x30, #-1
	and x9, x3, #0x7
	str x4, [sp, #8]
	cbz x11, .LBB24_44
	mov w14, wzr
	mov x10, xzr
	mov x16, xzr
	mov x17, xzr
	mov x12, x2
	mov x13, x4
	mov x4, x0
	b .LBB24_6
.LBB24_3:
	ldr x6, [x0, x10, lsl #3]
.LBB24_4:
	lsr x8, x6, #1
	and w7, w15, #0x7f
	mvn w19, w15
	lsl x6, x6, x7
	tst x7, #0x40
	add x10, x10, #1
	lsr x8, x8, x19
	add w15, w15, #64
	csel x8, x6, x8, ne
	csel x6, xzr, x6, ne
	orr x16, x8, x16
	orr x17, x6, x17
.LBB24_5:
	mvn v0.16b, v1.16b
	mov v5.16b, v1.16b
	bic x8, x18, x5
	mvn v7.16b, v2.16b
	mvn v17.16b, v4.16b
	lsl x18, x30, x14
	mvn v18.16b, v3.16b
	tst x14, #0x40
	add x12, x12, #64
	shl v1.2d, v0.2d, #2
	add v16.2d, v0.2d, v0.2d
	str q5, [sp, #160]
	shl v19.2d, v7.2d, #2
	shl v21.2d, v17.2d, #2
	add v20.2d, v7.2d, v7.2d
	shl v22.2d, v18.2d, #2
	eor v1.16b, v1.16b, v0.16b
	add v0.2d, v17.2d, v17.2d
	eor v17.16b, v21.16b, v17.16b
	eor v7.16b, v19.16b, v7.16b
	eor v23.16b, v1.16b, v16.16b
	add v1.2d, v18.2d, v18.2d
	eor v18.16b, v22.16b, v18.16b
	eor v7.16b, v7.16b, v20.16b
	eor v17.16b, v17.16b, v0.16b
	shl v19.2d, v23.2d, #2
	eor v18.16b, v18.16b, v1.16b
	shl v17.2d, v17.2d, #2
	shl v7.2d, v7.2d, #2
	eor v19.16b, v19.16b, v16.16b
	shl v18.2d, v18.2d, #2
	eor v7.16b, v7.16b, v20.16b
	eor v17.16b, v17.16b, v0.16b
	shl v21.2d, v19.2d, #4
	eor v18.16b, v18.16b, v1.16b
	shl v22.2d, v7.2d, #4
	eor v19.16b, v21.16b, v19.16b
	shl v21.2d, v17.2d, #4
	shl v23.2d, v18.2d, #4
	eor v7.16b, v22.16b, v7.16b
	shl v24.2d, v19.2d, #8
	eor v17.16b, v21.16b, v17.16b
	eor v18.16b, v23.16b, v18.16b
	shl v22.2d, v7.2d, #8
	eor v19.16b, v24.16b, v19.16b
	shl v21.2d, v17.2d, #8
	shl v23.2d, v18.2d, #8
	eor v7.16b, v22.16b, v7.16b
	shl v24.2d, v19.2d, #16
	eor v17.16b, v21.16b, v17.16b
	eor v18.16b, v23.16b, v18.16b
	shl v22.2d, v7.2d, #16
	eor v19.16b, v24.16b, v19.16b
	shl v21.2d, v17.2d, #16
	shl v23.2d, v18.2d, #16
	eor v22.16b, v22.16b, v7.16b
	shl v24.2d, v19.2d, #32
	eor v17.16b, v21.16b, v17.16b
	eor v21.16b, v23.16b, v18.16b
	shl v18.2d, v22.2d, #32
	eor v6.16b, v24.16b, v19.16b
	shl v23.2d, v17.2d, #32
	shl v24.2d, v21.2d, #32
	eor v18.16b, v18.16b, v22.16b
	bic v19.16b, v16.16b, v6.16b
	eor v7.16b, v23.16b, v17.16b
	eor v16.16b, v24.16b, v21.16b
	stp q18, q6, [sp, #128]
	add v21.2d, v19.2d, v19.2d
	bic v23.16b, v0.16b, v7.16b
	bic v0.16b, v20.16b, v18.16b
	bic v24.16b, v1.16b, v16.16b
	stur q7, [x29, #-96]
	str q16, [sp, #64]
	eor v1.16b, v21.16b, v19.16b
	add v20.2d, v0.2d, v0.2d
	add v21.2d, v23.2d, v23.2d
	add v22.2d, v24.2d, v24.2d
	shl v25.2d, v1.2d, #2
	eor v21.16b, v21.16b, v23.16b
	eor v20.16b, v20.16b, v0.16b
	eor v22.16b, v22.16b, v24.16b
	eor v1.16b, v25.16b, v1.16b
	shl v25.2d, v20.2d, #2
	shl v26.2d, v21.2d, #2
	shl v27.2d, v22.2d, #2
	shl v28.2d, v1.2d, #4
	eor v21.16b, v26.16b, v21.16b
	eor v20.16b, v25.16b, v20.16b
	eor v22.16b, v27.16b, v22.16b
	eor v1.16b, v28.16b, v1.16b
	shl v25.2d, v20.2d, #4
	shl v26.2d, v21.2d, #4
	shl v27.2d, v22.2d, #4
	shl v28.2d, v1.2d, #8
	eor v21.16b, v26.16b, v21.16b
	eor v20.16b, v25.16b, v20.16b
	eor v22.16b, v27.16b, v22.16b
	eor v1.16b, v28.16b, v1.16b
	shl v25.2d, v20.2d, #8
	shl v26.2d, v21.2d, #8
	shl v27.2d, v22.2d, #8
	shl v28.2d, v1.2d, #16
	eor v21.16b, v26.16b, v21.16b
	eor v20.16b, v25.16b, v20.16b
	eor v22.16b, v27.16b, v22.16b
	eor v1.16b, v28.16b, v1.16b
	shl v25.2d, v20.2d, #16
	shl v26.2d, v21.2d, #16
	shl v27.2d, v22.2d, #16
	shl v28.2d, v1.2d, #32
	eor v26.16b, v26.16b, v21.16b
	eor v20.16b, v25.16b, v20.16b
	eor v27.16b, v27.16b, v22.16b
	eor v21.16b, v28.16b, v1.16b
	shl v1.2d, v20.2d, #32
	shl v22.2d, v26.2d, #32
	shl v28.2d, v27.2d, #32
	bic v25.16b, v19.16b, v21.16b
	eor v7.16b, v22.16b, v26.16b
	eor v22.16b, v1.16b, v20.16b
	eor v17.16b, v28.16b, v27.16b
	and v20.16b, v6.16b, v5.16b
	mov v19.16b, v4.16b
	add v1.2d, v25.2d, v25.2d
	bic v0.16b, v0.16b, v22.16b
	bic v26.16b, v23.16b, v7.16b
	bic v23.16b, v24.16b, v17.16b
	stur q7, [x29, #-160]
	mov v7.16b, v2.16b
	str q17, [sp, #176]
	mov v17.16b, v3.16b
	eor v1.16b, v1.16b, v25.16b
	add v24.2d, v26.2d, v26.2d
	add v27.2d, v0.2d, v0.2d
	add v28.2d, v23.2d, v23.2d
	mov v6.16b, v7.16b
	and v18.16b, v18.16b, v7.16b
	stp q20, q7, [sp, #96]
	eor v7.16b, v20.16b, v5.16b
	shl v29.2d, v1.2d, #2
	eor v27.16b, v27.16b, v0.16b
	eor v24.16b, v24.16b, v26.16b
	eor v28.16b, v28.16b, v23.16b
	str q17, [sp, #80]
	ushr v5.2d, v18.2d, #1
	str q19, [sp, #16]
	eor v1.16b, v29.16b, v1.16b
	shl v29.2d, v24.2d, #2
	shl v30.2d, v27.2d, #2
	shl v31.2d, v28.2d, #2
	shl v8.2d, v1.2d, #4
	eor v27.16b, v30.16b, v27.16b
	eor v24.16b, v29.16b, v24.16b
	eor v28.16b, v31.16b, v28.16b
	eor v1.16b, v8.16b, v1.16b
	shl v29.2d, v24.2d, #4
	shl v30.2d, v27.2d, #4
	shl v31.2d, v28.2d, #4
	shl v8.2d, v1.2d, #8
	eor v27.16b, v30.16b, v27.16b
	eor v24.16b, v29.16b, v24.16b
	eor v28.16b, v31.16b, v28.16b
	eor v1.16b, v8.16b, v1.16b
	shl v29.2d, v24.2d, #8
	shl v30.2d, v27.2d, #8
	shl v31.2d, v28.2d, #8
	shl v8.2d, v1.2d, #16
	eor v27.16b, v30.16b, v27.16b
	eor v24.16b, v29.16b, v24.16b
	eor v28.16b, v31.16b, v28.16b
	eor v1.16b, v8.16b, v1.16b
	shl v29.2d, v24.2d, #16
	shl v30.2d, v27.2d, #16
	shl v31.2d, v28.2d, #16
	shl v8.2d, v1.2d, #32
	eor v30.16b, v30.16b, v27.16b
	eor v24.16b, v29.16b, v24.16b
	eor v28.16b, v31.16b, v28.16b
	eor v27.16b, v8.16b, v1.16b
	shl v1.2d, v24.2d, #32
	shl v29.2d, v30.2d, #32
	shl v31.2d, v28.2d, #32
	bic v25.16b, v25.16b, v27.16b
	eor v29.16b, v29.16b, v30.16b
	eor v24.16b, v1.16b, v24.16b
	eor v28.16b, v31.16b, v28.16b
	add v1.2d, v25.2d, v25.2d
	bic v26.16b, v26.16b, v24.16b
	bic v30.16b, v0.16b, v29.16b
	bic v0.16b, v23.16b, v28.16b
	eor v1.16b, v1.16b, v25.16b
	add v23.2d, v30.2d, v30.2d
	add v31.2d, v26.2d, v26.2d
	add v8.2d, v0.2d, v0.2d
	shl v9.2d, v1.2d, #2
	eor v31.16b, v31.16b, v26.16b
	eor v23.16b, v23.16b, v30.16b
	eor v8.16b, v8.16b, v0.16b
	eor v1.16b, v9.16b, v1.16b
	shl v9.2d, v23.2d, #2
	shl v10.2d, v31.2d, #2
	shl v11.2d, v8.2d, #2
	shl v12.2d, v1.2d, #4
	eor v31.16b, v10.16b, v31.16b
	eor v23.16b, v9.16b, v23.16b
	eor v8.16b, v11.16b, v8.16b
	eor v1.16b, v12.16b, v1.16b
	shl v9.2d, v23.2d, #4
	shl v10.2d, v31.2d, #4
	shl v11.2d, v8.2d, #4
	shl v12.2d, v1.2d, #8
	eor v31.16b, v10.16b, v31.16b
	eor v23.16b, v9.16b, v23.16b
	eor v8.16b, v11.16b, v8.16b
	eor v1.16b, v12.16b, v1.16b
	shl v9.2d, v23.2d, #8
	shl v10.2d, v31.2d, #8
	shl v11.2d, v8.2d, #8
	shl v12.2d, v1.2d, #16
	eor v31.16b, v10.16b, v31.16b
	eor v23.16b, v9.16b, v23.16b
	eor v8.16b, v11.16b, v8.16b
	eor v1.16b, v12.16b, v1.16b
	shl v9.2d, v23.2d, #16
	shl v10.2d, v31.2d, #16
	shl v11.2d, v8.2d, #16
	shl v12.2d, v1.2d, #32
	eor v10.16b, v10.16b, v31.16b
	eor v23.16b, v9.16b, v23.16b
	eor v9.16b, v11.16b, v8.16b
	eor v31.16b, v12.16b, v1.16b
	shl v1.2d, v23.2d, #32
	shl v8.2d, v10.2d, #32
	shl v11.2d, v9.2d, #32
	bic v14.16b, v25.16b, v31.16b
	eor v8.16b, v8.16b, v10.16b
	eor v10.16b, v1.16b, v23.16b
	eor v9.16b, v11.16b, v9.16b
	add v1.2d, v14.2d, v14.2d
	bic v12.16b, v30.16b, v10.16b
	bic v13.16b, v26.16b, v8.16b
	bic v11.16b, v0.16b, v9.16b
	eor v0.16b, v1.16b, v14.16b
	add v23.2d, v12.2d, v12.2d
	add v1.2d, v13.2d, v13.2d
	add v25.2d, v11.2d, v11.2d
	shl v26.2d, v0.2d, #2
	eor v23.16b, v23.16b, v12.16b
	eor v1.16b, v1.16b, v13.16b
	eor v25.16b, v25.16b, v11.16b
	eor v0.16b, v26.16b, v0.16b
	shl v30.2d, v23.2d, #2
	shl v26.2d, v1.2d, #2
	shl v15.2d, v25.2d, #2
	shl v2.2d, v0.2d, #4
	eor v23.16b, v30.16b, v23.16b
	eor v1.16b, v26.16b, v1.16b
	eor v25.16b, v15.16b, v25.16b
	eor v0.16b, v2.16b, v0.16b
	shl v26.2d, v23.2d, #4
	shl v2.2d, v1.2d, #4
	shl v30.2d, v25.2d, #4
	shl v15.2d, v0.2d, #8
	eor v26.16b, v26.16b, v23.16b
	eor v1.16b, v2.16b, v1.16b
	eor v2.16b, v30.16b, v25.16b
	eor v0.16b, v15.16b, v0.16b
	shl v15.2d, v26.2d, #8
	shl v30.2d, v1.2d, #8
	shl v3.2d, v2.2d, #8
	shl v4.2d, v0.2d, #16
	eor v15.16b, v15.16b, v26.16b
	eor v1.16b, v30.16b, v1.16b
	eor v2.16b, v3.16b, v2.16b
	ushr v30.2d, v20.2d, #1
	and v20.16b, v16.16b, v17.16b
	eor v16.16b, v18.16b, v6.16b
	eor v0.16b, v4.16b, v0.16b
	shl v3.2d, v15.2d, #16
	mov v4.16b, v17.16b
	shl v17.2d, v1.2d, #16
	orr v7.16b, v7.16b, v30.16b
	shl v30.2d, v2.2d, #16
	stp q20, q18, [sp, #32]
	orr v5.16b, v16.16b, v5.16b
	shl v18.2d, v0.2d, #32
	eor v3.16b, v3.16b, v15.16b
	eor v6.16b, v20.16b, v4.16b
	eor v16.16b, v17.16b, v1.16b
	ldur q1, [x29, #-96]
	ushr v4.2d, v20.2d, #1
	eor v2.16b, v30.16b, v2.16b
	mov v17.16b, v19.16b
	and v26.16b, v21.16b, v7.16b
	and v30.16b, v1.16b, v19.16b
	eor v15.16b, v18.16b, v0.16b
	shl v1.2d, v3.2d, #32
	orr v19.16b, v6.16b, v4.16b
	shl v4.2d, v16.2d, #32
	and v25.16b, v22.16b, v5.16b
	shl v18.2d, v2.2d, #32
	eor v7.16b, v26.16b, v7.16b
	ushr v0.2d, v26.2d, #2
	eor v6.16b, v30.16b, v17.16b
	ushr v17.2d, v30.2d, #1
	bic v14.16b, v14.16b, v15.16b
	eor v3.16b, v1.16b, v3.16b
	ldr q1, [sp, #176]
	eor v21.16b, v4.16b, v16.16b
	eor v20.16b, v18.16b, v2.16b
	eor v5.16b, v25.16b, v5.16b
	and v23.16b, v1.16b, v19.16b
	orr v4.16b, v6.16b, v17.16b
	add v6.2d, v14.2d, v14.2d
	bic v16.16b, v12.16b, v3.16b
	ushr v17.2d, v25.2d, #2
	orr v1.16b, v7.16b, v0.16b
	ldur q0, [x29, #-160]
	bic v7.16b, v13.16b, v21.16b
	bic v11.16b, v11.16b, v20.16b
	eor v18.16b, v23.16b, v19.16b
	ushr v12.2d, v23.2d, #2
	eor v6.16b, v6.16b, v14.16b
	and v22.16b, v0.16b, v4.16b
	orr v5.16b, v5.16b, v17.16b
	add v17.2d, v16.2d, v16.2d
	add v13.2d, v7.2d, v7.2d
	and v27.16b, v27.16b, v1.16b
	orr v18.16b, v18.16b, v12.16b
	add v12.2d, v11.2d, v11.2d
	shl v0.2d, v6.2d, #2
	eor v4.16b, v22.16b, v4.16b
	ushr v14.2d, v22.2d, #2
	eor v16.16b, v17.16b, v16.16b
	and v29.16b, v29.16b, v5.16b
	eor v7.16b, v13.16b, v7.16b
	eor v1.16b, v27.16b, v1.16b
	eor v17.16b, v12.16b, v11.16b
	ushr v11.2d, v27.2d, #4
	eor v0.16b, v0.16b, v6.16b
	orr v4.16b, v4.16b, v14.16b
	shl v12.2d, v16.2d, #2
	and v28.16b, v28.16b, v18.16b
	eor v5.16b, v29.16b, v5.16b
	ushr v6.2d, v29.2d, #4
	shl v13.2d, v7.2d, #2
	orr v2.16b, v1.16b, v11.16b
	shl v11.2d, v17.2d, #2
	shl v1.2d, v0.2d, #4
	and v24.16b, v24.16b, v4.16b
	eor v18.16b, v28.16b, v18.16b
	ushr v14.2d, v28.2d, #4
	orr v5.16b, v5.16b, v6.16b
	eor v6.16b, v12.16b, v16.16b
	eor v7.16b, v13.16b, v7.16b
	eor v16.16b, v11.16b, v17.16b
	eor v0.16b, v1.16b, v0.16b
	and v31.16b, v31.16b, v2.16b
	eor v1.16b, v24.16b, v4.16b
	orr v17.16b, v18.16b, v14.16b
	ushr v18.2d, v24.2d, #4
	and v10.16b, v10.16b, v5.16b
	shl v4.2d, v6.2d, #4
	shl v12.2d, v7.2d, #4
	shl v11.2d, v16.2d, #4
	eor v2.16b, v31.16b, v2.16b
	ushr v13.2d, v31.2d, #8
	orr v18.16b, v1.16b, v18.16b
	and v9.16b, v9.16b, v17.16b
	eor v4.16b, v4.16b, v6.16b
	eor v5.16b, v10.16b, v5.16b
	ushr v6.2d, v10.2d, #8
	eor v7.16b, v12.16b, v7.16b
	eor v16.16b, v11.16b, v16.16b
	orr v2.16b, v2.16b, v13.16b
	shl v12.2d, v0.2d, #8
	and v8.16b, v8.16b, v18.16b
	eor v1.16b, v9.16b, v17.16b
	orr v5.16b, v5.16b, v6.16b
	shl v6.2d, v4.2d, #8
	ushr v17.2d, v9.2d, #8
	shl v13.2d, v16.2d, #8
	shl v14.2d, v7.2d, #8
	and v11.16b, v15.16b, v2.16b
	eor v0.16b, v12.16b, v0.16b
	eor v4.16b, v6.16b, v4.16b
	and v19.16b, v3.16b, v5.16b
	orr v17.16b, v1.16b, v17.16b
	eor v3.16b, v14.16b, v7.16b
	eor v6.16b, v13.16b, v16.16b
	eor v7.16b, v8.16b, v18.16b
	ushr v16.2d, v8.2d, #8
	shl v1.2d, v0.2d, #16
	eor v2.16b, v11.16b, v2.16b
	shl v13.2d, v4.2d, #16
	ushr v18.2d, v11.2d, #16
	eor v5.16b, v19.16b, v5.16b
	shl v14.2d, v6.2d, #16
	shl v15.2d, v3.2d, #16
	ushr v12.2d, v19.2d, #16
	orr v7.16b, v7.16b, v16.16b
	and v16.16b, v20.16b, v17.16b
	eor v0.16b, v1.16b, v0.16b
	eor v4.16b, v13.16b, v4.16b
	orr v2.16b, v2.16b, v18.16b
	mov v20.d[0], x8
	eor v1.16b, v15.16b, v3.16b
	eor v3.16b, v14.16b, v6.16b
	orr v5.16b, v5.16b, v12.16b
	and v6.16b, v21.16b, v7.16b
	eor v17.16b, v16.16b, v17.16b
	ushr v21.2d, v16.2d, #16
	shl v18.2d, v4.2d, #32
	csel x8, xzr, x18, ne
	mvn w18, w14
	shl v12.2d, v3.2d, #32
	shl v14.2d, v1.2d, #32
	bic x8, x17, x8
	eor v7.16b, v6.16b, v7.16b
	ushr v13.2d, v6.2d, #16
	orr v17.16b, v17.16b, v21.16b
	eor v4.16b, v18.16b, v4.16b
	shl v18.2d, v0.2d, #32
	mov v20.d[1], x8
	eor v3.16b, v12.16b, v3.16b
	ldp q12, q21, [x29, #-144]
	orr v7.16b, v7.16b, v13.16b
	eor v1.16b, v14.16b, v1.16b
	lsl x8, x16, #1
	eor v0.16b, v18.16b, v0.16b
	ldur q18, [x29, #-112]
	and v4.16b, v4.16b, v5.16b
	shl v5.2d, v12.2d, #32
	and v3.16b, v3.16b, v17.16b
	lsr x17, x17, x14
	shl v17.2d, v18.2d, #32
	and v1.16b, v1.16b, v7.16b
	shl v7.2d, v21.2d, #32
	and v0.16b, v0.16b, v2.16b
	shl v2.2d, v20.2d, #32
	lsl x8, x8, x18
	bsl v4.16b, v5.16b, v12.16b
	lsr x16, x16, x14
	sub w14, w15, w14
	bsl v3.16b, v17.16b, v18.16b
	bsl v1.16b, v7.16b, v21.16b
	orr x8, x8, x17
	bsl v0.16b, v2.16b, v20.16b
	csel x17, xzr, x16, ne
	csel x16, x16, x8, ne
	subs x11, x11, #1
	shl v2.2d, v4.2d, #16
	shl v5.2d, v3.2d, #16
	shl v7.2d, v1.2d, #16
	bif v2.16b, v4.16b, v19.16b
	shl v4.2d, v0.2d, #16
	bit v3.16b, v5.16b, v16.16b
	bit v1.16b, v7.16b, v6.16b
	ldp q16, q7, [sp, #32]
	bit v0.16b, v4.16b, v11.16b
	shl v4.2d, v2.2d, #8
	shl v5.2d, v3.2d, #8
	shl v6.2d, v1.2d, #8
	bit v2.16b, v4.16b, v10.16b
	shl v4.2d, v0.2d, #8
	bit v3.16b, v5.16b, v9.16b
	bit v1.16b, v6.16b, v8.16b
	bit v0.16b, v4.16b, v31.16b
	shl v4.2d, v2.2d, #4
	shl v5.2d, v3.2d, #4
	shl v6.2d, v1.2d, #4
	bit v2.16b, v4.16b, v29.16b
	shl v4.2d, v0.2d, #4
	bit v3.16b, v5.16b, v28.16b
	bit v1.16b, v6.16b, v24.16b
	bit v0.16b, v4.16b, v27.16b
	shl v4.2d, v2.2d, #2
	shl v5.2d, v3.2d, #2
	shl v6.2d, v1.2d, #2
	bit v2.16b, v4.16b, v25.16b
	shl v4.2d, v0.2d, #2
	bit v3.16b, v5.16b, v23.16b
	bit v1.16b, v6.16b, v22.16b
	bit v0.16b, v4.16b, v26.16b
	add v4.2d, v2.2d, v2.2d
	bic v2.16b, v2.16b, v7.16b
	ldr q7, [sp, #128]
	add v5.2d, v3.2d, v3.2d
	bic v3.16b, v3.16b, v16.16b
	ldr q16, [sp, #64]
	add v6.2d, v1.2d, v1.2d
	bic v1.16b, v1.16b, v30.16b
	and v4.16b, v4.16b, v7.16b
	add v7.2d, v0.2d, v0.2d
	and v5.16b, v5.16b, v16.16b
	ldur q16, [x29, #-96]
	and v6.16b, v6.16b, v16.16b
	orr v2.16b, v4.16b, v2.16b
	ldp q16, q4, [sp, #96]
	orr v3.16b, v5.16b, v3.16b
	bic v0.16b, v0.16b, v16.16b
	ldr q16, [sp, #144]
	and v2.16b, v2.16b, v4.16b
	ldr q4, [sp, #80]
	orr v1.16b, v6.16b, v1.16b
	and v7.16b, v7.16b, v16.16b
	and v3.16b, v3.16b, v4.16b
	ldr q4, [sp, #16]
	orr v0.16b, v7.16b, v0.16b
	and v1.16b, v1.16b, v4.16b
	ldr q4, [sp, #160]
	stp q2, q3, [x13]
	and v0.16b, v0.16b, v4.16b
	stp q1, q0, [x13, #32]
	add x13, x13, #64
	b.eq .LBB24_45
.LBB24_6:
	ldr q2, [x12]
	cnt v0.16b, v2.16b
	uaddlp v0.8h, v0.16b
	uaddlp v0.4s, v0.8h
	uaddlp v0.2d, v0.4s
	fmov w5, s0
	cmp w14, w5
	b.hs .LBB24_11
	cmp x10, x1
	b.hs .LBB24_9
	ldr x15, [x0, x10, lsl #3]
	b .LBB24_10
.LBB24_9:
	mov x15, xzr
.LBB24_10:
	lsr x18, x15, #1
	and w6, w14, #0x7f
	mvn w7, w14
	lsl x15, x15, x6
	tst x6, #0x40
	add x10, x10, #1
	lsr x18, x18, x7
	add w14, w14, #64
	csel x18, x15, x18, ne
	csel x15, xzr, x15, ne
	orr x17, x18, x17
	orr x16, x15, x16
.LBB24_11:
	lsl x15, x17, #1
	mvn w6, w5
	mov w18, v0.s[2]
	lsr x19, x16, x5
	lsl x7, x30, x5
	lsr x17, x17, x5
	lsl x6, x15, x6
	tst x5, #0x40
	sub w5, w14, w5
	csel x15, xzr, x7, ne
	orr x6, x6, x19
	csel x14, x17, x6, ne
	csel x17, xzr, x17, ne
	cmp w5, w18
	b.hs .LBB24_16
	cmp x10, x1
	b.hs .LBB24_14
	ldr x6, [x0, x10, lsl #3]
	b .LBB24_15
.LBB24_14:
	mov x6, xzr
.LBB24_15:
	lsr x7, x6, #1
	and w19, w5, #0x7f
	mvn w20, w5
	lsl x6, x6, x19
	tst x19, #0x40
	add x10, x10, #1
	lsr x7, x7, x20
	add w5, w5, #64
	csel x7, x6, x7, ne
	csel x6, xzr, x6, ne
	orr x17, x7, x17
	orr x14, x6, x14
.LBB24_16:
	ldr q3, [x12, #16]
	lsl x6, x17, #1
	mvn w19, w18
	lsl x7, x30, x18
	lsr x20, x14, x18
	tst x18, #0x40
	cnt v0.16b, v3.16b
	lsl x19, x6, x19
	lsr x21, x17, x18
	csel x17, xzr, x7, ne
	orr x7, x19, x20
	sub w19, w5, w18
	csel x5, x21, x7, ne
	csel x7, xzr, x21, ne
	uaddlp v0.8h, v0.16b
	uaddlp v0.4s, v0.8h
	uaddlp v0.2d, v0.4s
	fmov w6, s0
	cmp w19, w6
	b.hs .LBB24_21
	cmp x10, x1
	b.hs .LBB24_19
	ldr x18, [x0, x10, lsl #3]
	b .LBB24_20
.LBB24_19:
	mov x18, xzr
.LBB24_20:
	lsr x20, x18, #1
	and w21, w19, #0x7f
	mvn w22, w19
	lsl x18, x18, x21
	tst x21, #0x40
	add x10, x10, #1
	lsr x20, x20, x22
	add w19, w19, #64
	csel x20, x18, x20, ne
	csel x18, xzr, x18, ne
	orr x7, x20, x7
	orr x5, x18, x5
.LBB24_21:
	lsl x20, x7, #1
	mvn w21, w6
	mov w18, v0.s[2]
	lsl x22, x30, x6
	lsr x23, x5, x6
	tst x6, #0x40
	lsl x20, x20, x21
	lsr x21, x7, x6
	csel x7, xzr, x22, ne
	orr x22, x20, x23
	sub w20, w19, w6
	csel x19, xzr, x21, ne
	csel x6, x21, x22, ne
	cmp w20, w18
	b.hs .LBB24_26
	cmp x10, x1
	b.hs .LBB24_24
	ldr x21, [x0, x10, lsl #3]
	b .LBB24_25
.LBB24_24:
	mov x21, xzr
.LBB24_25:
	lsr x22, x21, #1
	and w23, w20, #0x7f
	mvn w24, w20
	lsl x21, x21, x23
	tst x23, #0x40
	add x10, x10, #1
	lsr x22, x22, x24
	add w20, w20, #64
	csel x22, x21, x22, ne
	csel x21, xzr, x21, ne
	orr x19, x22, x19
	orr x6, x21, x6
.LBB24_26:
	ldr q4, [x12, #32]
	lsl x21, x19, #1
	mvn w23, w18
	lsl x22, x30, x18
	lsr x24, x6, x18
	tst x18, #0x40
	cnt v0.16b, v4.16b
	lsl x23, x21, x23
	lsr x25, x19, x18
	csel x19, xzr, x22, ne
	orr x22, x23, x24
	sub w23, w20, w18
	csel x20, x25, x22, ne
	csel x22, xzr, x25, ne
	uaddlp v0.8h, v0.16b
	uaddlp v0.4s, v0.8h
	uaddlp v0.2d, v0.4s
	fmov w21, s0
	cmp w23, w21
	b.hs .LBB24_31
	cmp x10, x1
	b.hs .LBB24_29
	ldr x18, [x0, x10, lsl #3]
	b .LBB24_30
.LBB24_29:
	mov x18, xzr
.LBB24_30:
	lsr x24, x18, #1
	and w25, w23, #0x7f
	mvn w26, w23
	lsl x18, x18, x25
	tst x25, #0x40
	add x10, x10, #1
	lsr x24, x24, x26
	add w23, w23, #64
	csel x24, x18, x24, ne
	csel x18, xzr, x18, ne
	orr x22, x24, x22
	orr x20, x18, x20
.LBB24_31:
	lsl x24, x22, #1
	mvn w25, w21
	mov w18, v0.s[2]
	lsl x26, x30, x21
	lsr x27, x20, x21
	tst x21, #0x40
	lsl x24, x24, x25
	lsr x25, x22, x21
	ldr q1, [x12, #48]
	csel x22, xzr, x26, ne
	orr x26, x24, x27
	sub w24, w23, w21
	csel x21, x25, x26, ne
	csel x25, xzr, x25, ne
	cmp w24, w18
	b.hs .LBB24_36
	cmp x10, x1
	b.hs .LBB24_34
	ldr x23, [x0, x10, lsl #3]
	b .LBB24_35
.LBB24_34:
	mov x23, xzr
.LBB24_35:
	lsr x26, x23, #1
	and w27, w24, #0x7f
	mvn w28, w24
	lsl x23, x23, x27
	tst x27, #0x40
	add x10, x10, #1
	lsr x26, x26, x28
	add w24, w24, #64
	csel x26, x23, x26, ne
	csel x23, xzr, x23, ne
	orr x25, x26, x25
	orr x21, x23, x21
.LBB24_36:
	cnt v0.16b, v1.16b
	lsl x23, x25, #1
	mvn w27, w18
	lsr x28, x21, x18
	lsl x26, x30, x18
	lsr x25, x25, x18
	lsl x27, x23, x27
	tst x18, #0x40
	sub w24, w24, w18
	csel x26, xzr, x26, ne
	uaddlp v0.8h, v0.16b
	orr x27, x27, x28
	csel x18, x25, x27, ne
	csel x25, xzr, x25, ne
	uaddlp v0.4s, v0.8h
	uaddlp v0.2d, v0.4s
	fmov w23, s0
	cmp w24, w23
	b.hs .LBB24_41
	cmp x10, x1
	b.hs .LBB24_39
	ldr x27, [x0, x10, lsl #3]
	b .LBB24_40
.LBB24_39:
	mov x27, xzr
.LBB24_40:
	lsr x28, x27, #1
	and w30, w24, #0x7f
	mvn w8, w24
	lsl x27, x27, x30
	tst x30, #0x40
	add x10, x10, #1
	lsr x8, x28, x8
	add w24, w24, #64
	mov x0, x4
	mov x30, #-1
	csel x8, x27, x8, ne
	csel x27, xzr, x27, ne
	orr x25, x8, x25
	orr x18, x27, x18
.LBB24_41:
	bic x8, x16, x15
	bic x15, x5, x7
	bic x16, x14, x17
	bic x14, x20, x22
	mov v5.d[0], x15
	lsl x7, x25, #1
	mov v6.d[0], x14
	mov w14, v0.s[2]
	fmov d0, x8
	bic x15, x6, x19
	bic x17, x21, x26
	mvn w19, w23
	lsr x6, x18, x23
	lsl x8, x7, x19
	lsl x5, x30, x23
	mov v0.d[1], x16
	mov v5.d[1], x15
	lsr x16, x25, x23
	mov v6.d[1], x17
	tst x23, #0x40
	orr x8, x8, x6
	sub w15, w24, w23
	csel x5, xzr, x5, ne
	csel x17, x16, x8, ne
	csel x16, xzr, x16, ne
	cmp w15, w14
	stur q5, [x29, #-112]
	stp q0, q6, [x29, #-144]
	b.hs .LBB24_5
	cmp x10, x1
	b.lo .LBB24_3
	mov x6, xzr
	b .LBB24_4
.LBB24_44:
	mov x16, xzr
	mov x17, xzr
	mov x10, xzr
	mov w14, wzr
.LBB24_45:
	cbz x9, .LBB24_53
	lsl x11, x3, #3
	ldr x8, [sp, #8]
	and x12, x11, #0x7fffffffffffffc0
	add x11, x2, x12
	add x12, x8, x12
	b .LBB24_50
.LBB24_47:
	ldr x18, [x0, x10, lsl #3]
.LBB24_48:
	lsr x2, x18, #1
	mvn w3, w14
	mov w4, w14
	lsl x18, x18, x4
	tst x4, #0x40
	add x10, x10, #1
	lsr x2, x2, x3
	add w14, w14, #64
	csel x2, x18, x2, ne
	csel x18, xzr, x18, ne
	orr x17, x2, x17
	orr x16, x18, x16
.LBB24_49:
	mvn x18, x13
	lsl x20, x30, x15
	tst x15, #0x40
	lsl x2, x18, #1
	sub w14, w14, w15
	csel x20, xzr, x20, ne
	eor x18, x2, x18, lsl #2
	eon x18, x13, x18
	eor x18, x2, x18, lsl #2
	eor x18, x18, x18, lsl #4
	eor x18, x18, x18, lsl #8
	eor x18, x18, x18, lsl #16
	eor x18, x18, x18, lsl #32
	bic x2, x2, x18
	eor x3, x2, x2, lsl #1
	eor x3, x3, x3, lsl #2
	eor x3, x3, x3, lsl #4
	eor x3, x3, x3, lsl #8
	eor x3, x3, x3, lsl #16
	eor x3, x3, x3, lsl #32
	bic x2, x2, x3
	eor x4, x2, x2, lsl #1
	eor x4, x4, x4, lsl #2
	eor x4, x4, x4, lsl #4
	eor x4, x4, x4, lsl #8
	eor x4, x4, x4, lsl #16
	eor x4, x4, x4, lsl #32
	bic x2, x2, x4
	eor x5, x2, x2, lsl #1
	eor x5, x5, x5, lsl #2
	eor x5, x5, x5, lsl #4
	eor x5, x5, x5, lsl #8
	eor x5, x5, x5, lsl #16
	eor x5, x5, x5, lsl #32
	bic x6, x2, x5
	eor x2, x6, x6, lsl #1
	eor x2, x2, x2, lsl #2
	eor x7, x2, x2, lsl #4
	and x2, x18, x13
	eor x19, x2, x13
	eor x7, x7, x7, lsl #8
	orr x19, x19, x2, lsr #1
	eor x7, x7, x7, lsl #16
	and x3, x3, x19
	eor x19, x3, x19
	eor x7, x7, x7, lsl #32
	orr x19, x19, x3, lsr #2
	bic x6, x6, x7
	and x4, x4, x19
	eor x6, x6, x6, lsl #1
	eor x19, x4, x19
	orr x19, x19, x4, lsr #4
	eor x6, x6, x6, lsl #2
	and x5, x5, x19
	eor x6, x6, x6, lsl #4
	eor x19, x5, x19
	orr x19, x19, x5, lsr #8
	eor x6, x6, x6, lsl #8
	and x7, x7, x19
	eor x6, x6, x6, lsl #16
	eor x19, x7, x19
	orr x19, x19, x7, lsr #16
	eor x6, x6, x6, lsl #32
	and x6, x6, x19
	bic x19, x16, x20
	lsr x16, x16, x15
	and x20, x6, x19, lsl #32
	bic x6, x19, x6
	orr x6, x6, x20
	and x19, x7, x6, lsl #16
	bic x6, x6, x7
	orr x6, x6, x19
	and x7, x5, x6, lsl #8
	bic x5, x6, x5
	orr x5, x5, x7
	and x6, x4, x5, lsl #4
	bic x4, x5, x4
	orr x4, x4, x6
	lsl x6, x17, #1
	lsr x17, x17, x15
	and x5, x3, x4, lsl #2
	bic x3, x4, x3
	mvn w4, w15
	lsl x4, x6, x4
	orr x3, x3, x5
	and x18, x18, x3, lsl #1
	bic x2, x3, x2
	orr x16, x4, x16
	csel x16, x17, x16, ne
	csel x17, xzr, x17, ne
	subs x9, x9, #1
	orr x18, x2, x18
	and x13, x18, x13
	str x13, [x12], #8
	b.eq .LBB24_53
.LBB24_50:
	ldr x13, [x11], #8
	fmov d0, x13
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x15, d0
	cmp w14, w15
	b.hs .LBB24_49
	cmp x10, x1
	b.lo .LBB24_47
	mov x18, xzr
	b .LBB24_48
.LBB24_53:
	ldp x20, x19, [sp, #432]
	ldp x22, x21, [sp, #416]
	ldp x24, x23, [sp, #400]
	ldp x26, x25, [sp, #384]
	ldp x28, x27, [sp, #368]
	ldp x29, x30, [sp, #352]
	ldp d9, d8, [sp, #336]
	ldp d11, d10, [sp, #320]
	ldp d13, d12, [sp, #304]
	ldp d15, d14, [sp, #288]
	add sp, sp, #448
	ret
.LBB24_54:
	adrp x0, .Lanon.bba673b6abbf1555a5789e1a894d50b2.0
	add x0, x0, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.0
	adrp x2, .Lanon.bba673b6abbf1555a5789e1a894d50b2.49
	add x2, x2, :lo12:.Lanon.bba673b6abbf1555a5789e1a894d50b2.49
	mov w1, #41
	bl core::panicking::panic
