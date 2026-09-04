bitpacking::expand::expand_portable:
	stp d15, d14, [sp, #-160]!
	stp d13, d12, [sp, #16]
	stp d11, d10, [sp, #32]
	stp d9, d8, [sp, #48]
	stp x29, x30, [sp, #64]
	stp x28, x27, [sp, #80]
	stp x26, x25, [sp, #96]
	stp x24, x23, [sp, #112]
	stp x22, x21, [sp, #128]
	stp x20, x19, [sp, #144]
	add x29, sp, #64
	sub x9, sp, #224
	addvl x9, x9, #-16
	sub sp, sp, #1, lsl #12
	cmp sp, x9
	b.le .LBB25_2
.LBB25_1:
	str xzr, [sp]
	sub sp, sp, #1, lsl #12
	cmp sp, x9
	b.gt .LBB25_1
.LBB25_2:
	mov sp, x9
	ldr xzr, [sp]
	cmp x5, x3
	b.lo .LBB25_56
	lsr x11, x3, #3
	mov x30, #-1
	and x9, x3, #0x7
	str x4, [sp, #8]
	cbz x11, .LBB25_46
	ptrue p0.d, vl2
	mov w14, wzr
	mov x10, xzr
	mov x16, xzr
	mov x17, xzr
	mov x12, x2
	mov x13, x4
	mov x4, x0
	b .LBB25_8
.LBB25_5:
	ldr x6, [x0, x10, lsl #3]
.LBB25_6:
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
.LBB25_7:
	sub x8, x29, #64
	tst x14, #0x40
	add x12, x12, #64
	str z1, [x8, #-6, mul vl]
	mvn v1.16b, v1.16b
	str z2, [x8, #-8, mul vl]
	mvn v2.16b, v2.16b
	str z4, [x8, #-7, mul vl]
	mvn v4.16b, v4.16b
	add v19.2d, v1.2d, v1.2d
	shl v3.2d, v1.2d, #2
	str z6, [x8, #-5, mul vl]
	add v0.2d, v2.2d, v2.2d
	shl v5.2d, v2.2d, #2
	mvn v6.16b, v6.16b
	add v21.2d, v4.2d, v4.2d
	eor3 z3.d, z3.d, z1.d, z19.d
	shl v1.2d, v4.2d, #2
	eor3 z5.d, z5.d, z2.d, z0.d
	add v20.2d, v6.2d, v6.2d
	shl v2.2d, v6.2d, #2
	eor3 z1.d, z1.d, z4.d, z21.d
	shl v3.2d, v3.2d, #2
	eor3 z2.d, z2.d, z6.d, z20.d
	shl v4.2d, v5.2d, #2
	eor v5.16b, v3.16b, v19.16b
	shl v1.2d, v1.2d, #2
	eor v6.16b, v4.16b, v0.16b
	shl v2.2d, v2.2d, #2
	shl v7.2d, v5.2d, #4
	eor v16.16b, v1.16b, v21.16b
	shl v17.2d, v6.2d, #4
	eor v18.16b, v2.16b, v20.16b
	mov z22.d, z7.d
	shl v23.2d, v16.2d, #4
	shl v24.2d, v18.2d, #4
	eor3 z22.d, z22.d, z3.d, z19.d
	mov z3.d, z17.d
	mov z26.d, z24.d
	eor3 z3.d, z3.d, z4.d, z0.d
	mov z4.d, z23.d
	shl v25.2d, v22.2d, #8
	eor3 z26.d, z26.d, z2.d, z20.d
	eor3 z4.d, z4.d, z1.d, z21.d
	shl v2.2d, v3.2d, #8
	mov z27.d, z25.d
	shl v28.2d, v4.2d, #8
	eor3 z27.d, z27.d, z7.d, z5.d
	mov z5.d, z2.d
	shl v7.2d, v26.2d, #8
	eor3 z5.d, z5.d, z17.d, z6.d
	mov z6.d, z28.d
	mov z1.d, z7.d
	eor3 z6.d, z6.d, z23.d, z16.d
	shl v16.2d, v27.2d, #16
	eor3 z1.d, z1.d, z24.d, z18.d
	shl v17.2d, v5.2d, #16
	mov z18.d, z16.d
	shl v23.2d, v6.2d, #16
	shl v24.2d, v1.2d, #16
	eor3 z18.d, z18.d, z25.d, z22.d
	mov z22.d, z17.d
	eor3 z22.d, z22.d, z2.d, z3.d
	mov z2.d, z23.d
	mov z3.d, z24.d
	eor3 z2.d, z2.d, z28.d, z4.d
	shl v4.2d, v18.2d, #32
	eor3 z3.d, z3.d, z7.d, z26.d
	shl v7.2d, v22.2d, #32
	eor3 z4.d, z4.d, z16.d, z27.d
	shl v2.2d, v2.2d, #32
	eor3 z7.d, z7.d, z17.d, z5.d
	shl v3.2d, v3.2d, #32
	mov z5.d, z4.d
	eor3 z2.d, z2.d, z23.d, z6.d
	eor3 z3.d, z3.d, z24.d, z1.d
	bic v25.16b, v0.16b, v7.16b
	mov z16.d, z7.d
	str z7, [x8, #-3, mul vl]
	str z4, [x8, #-1, mul vl]
	bic v26.16b, v19.16b, v5.16b
	mov z7.d, z2.d
	str z2, [x8, #-2, mul vl]
	add v2.2d, v25.2d, v25.2d
	bic v23.16b, v20.16b, v3.16b
	mov z17.d, z3.d
	str z3, [x8, #-4, mul vl]
	add v1.2d, v26.2d, v26.2d
	bic v24.16b, v21.16b, v7.16b
	add v6.2d, v23.2d, v23.2d
	mov z3.d, z1.d
	add v4.2d, v24.2d, v24.2d
	bcax z3.d, z3.d, z19.d, z5.d
	mov z5.d, z2.d
	bcax z5.d, z5.d, z0.d, z16.d
	mov z0.d, z4.d
	mov z16.d, z6.d
	bcax z0.d, z0.d, z21.d, z7.d
	shl v7.2d, v3.2d, #2
	bcax z16.d, z16.d, z20.d, z17.d
	shl v17.2d, v5.2d, #2
	mov z18.d, z7.d
	shl v19.2d, v0.2d, #2
	shl v20.2d, v16.2d, #2
	eor3 z18.d, z18.d, z1.d, z26.d
	mov z1.d, z17.d
	mov z21.d, z20.d
	eor3 z1.d, z1.d, z2.d, z25.d
	mov z2.d, z19.d
	eor3 z21.d, z21.d, z6.d, z23.d
	eor3 z2.d, z2.d, z4.d, z24.d
	shl v4.2d, v18.2d, #4
	shl v6.2d, v1.2d, #4
	mov z22.d, z4.d
	shl v27.2d, v2.2d, #4
	eor3 z22.d, z22.d, z7.d, z3.d
	mov z3.d, z6.d
	shl v7.2d, v21.2d, #4
	eor3 z3.d, z3.d, z17.d, z5.d
	mov z5.d, z27.d
	shl v17.2d, v22.2d, #8
	eor3 z5.d, z5.d, z19.d, z0.d
	mov z19.d, z7.d
	eor3 z19.d, z19.d, z20.d, z16.d
	shl v16.2d, v3.2d, #8
	mov z20.d, z17.d
	shl v28.2d, v5.2d, #8
	eor3 z20.d, z20.d, z4.d, z18.d
	mov z4.d, z16.d
	shl v18.2d, v19.2d, #8
	eor3 z4.d, z4.d, z6.d, z1.d
	mov z1.d, z28.d
	mov z0.d, z18.d
	eor3 z1.d, z1.d, z27.d, z2.d
	shl v2.2d, v20.2d, #16
	eor3 z0.d, z0.d, z7.d, z21.d
	shl v6.2d, v4.2d, #16
	mov z7.d, z2.d
	shl v27.2d, v1.2d, #16
	shl v30.2d, v0.2d, #16
	eor3 z7.d, z7.d, z17.d, z22.d
	mov z17.d, z6.d
	eor3 z17.d, z17.d, z16.d, z3.d
	mov z3.d, z27.d
	shl v7.2d, v7.2d, #32
	eor3 z3.d, z3.d, z28.d, z5.d
	mov z5.d, z30.d
	shl v16.2d, v17.2d, #32
	eor3 z7.d, z7.d, z2.d, z20.d
	eor3 z5.d, z5.d, z18.d, z19.d
	shl v3.2d, v3.2d, #32
	eor3 z16.d, z16.d, z6.d, z4.d
	bic v29.16b, v26.16b, v7.16b
	str z7, [x8, #-9, mul vl]
	shl v2.2d, v5.2d, #32
	eor3 z3.d, z3.d, z27.d, z1.d
	bic v27.16b, v25.16b, v16.16b
	mov z20.d, z16.d
	eor3 z2.d, z2.d, z30.d, z0.d
	add v0.2d, v29.2d, v29.2d
	mov z16.d, z3.d
	add v1.2d, v27.2d, v27.2d
	str z3, [x8, #-11, mul vl]
	bic v30.16b, v24.16b, v16.16b
	bic v28.16b, v23.16b, v2.16b
	mov z18.d, z2.d
	str z2, [x8, #-10, mul vl]
	mov z2.d, z0.d
	mov z4.d, z1.d
	add v3.2d, v30.2d, v30.2d
	add v5.2d, v28.2d, v28.2d
	bcax z2.d, z2.d, z26.d, z7.d
	bcax z4.d, z4.d, z25.d, z20.d
	mov z6.d, z3.d
	mov z17.d, z5.d
	shl v7.2d, v2.2d, #2
	bcax z6.d, z6.d, z24.d, z16.d
	bcax z17.d, z17.d, z23.d, z18.d
	shl v18.2d, v4.2d, #2
	mov z19.d, z7.d
	shl v23.2d, v6.2d, #2
	shl v24.2d, v17.2d, #2
	eor3 z19.d, z19.d, z0.d, z29.d
	mov z0.d, z18.d
	mov z25.d, z24.d
	eor3 z0.d, z0.d, z1.d, z27.d
	mov z1.d, z23.d
	eor3 z25.d, z25.d, z5.d, z28.d
	eor3 z1.d, z1.d, z3.d, z30.d
	shl v3.2d, v19.2d, #4
	shl v5.2d, v0.2d, #4
	mov z26.d, z3.d
	eor3 z26.d, z26.d, z7.d, z2.d
	shl v2.2d, v1.2d, #4
	mov z7.d, z5.d
	eor3 z7.d, z7.d, z18.d, z4.d
	shl v4.2d, v25.2d, #4
	mov z18.d, z2.d
	eor3 z18.d, z18.d, z23.d, z6.d
	shl v6.2d, v26.2d, #8
	mov z23.d, z4.d
	eor3 z23.d, z23.d, z24.d, z17.d
	shl v17.2d, v7.2d, #8
	mov z31.d, z6.d
	eor3 z31.d, z31.d, z3.d, z19.d
	shl v3.2d, v18.2d, #8
	mov z19.d, z17.d
	eor3 z19.d, z19.d, z5.d, z0.d
	shl v5.2d, v23.2d, #8
	mov z8.d, z3.d
	eor3 z8.d, z8.d, z2.d, z1.d
	shl v2.2d, v31.2d, #16
	mov z0.d, z5.d
	eor3 z0.d, z0.d, z4.d, z25.d
	shl v4.2d, v19.2d, #16
	mov z1.d, z2.d
	eor3 z1.d, z1.d, z6.d, z26.d
	shl v6.2d, v8.2d, #16
	mov z25.d, z4.d
	eor3 z25.d, z25.d, z17.d, z7.d
	mov z17.d, z6.d
	shl v7.2d, v0.2d, #16
	shl v1.2d, v1.2d, #32
	eor3 z17.d, z17.d, z3.d, z18.d
	mov z3.d, z7.d
	eor3 z1.d, z1.d, z2.d, z31.d
	shl v16.2d, v25.2d, #32
	eor3 z3.d, z3.d, z5.d, z23.d
	shl v5.2d, v17.2d, #32
	eor3 z16.d, z16.d, z4.d, z19.d
	mov z2.d, z1.d
	eor3 z5.d, z5.d, z6.d, z8.d
	shl v1.2d, v3.2d, #32
	bic v11.16b, v27.16b, v16.16b
	str z2, [x8, #-13, mul vl]
	str z16, [x8, #-15, mul vl]
	eor3 z1.d, z1.d, z7.d, z0.d
	mov z3.d, z5.d
	mov z5.d, z2.d
	add v2.2d, v11.2d, v11.2d
	bic v12.16b, v29.16b, v5.16b
	bic v8.16b, v30.16b, v3.16b
	mov z17.d, z3.d
	str z3, [x8, #-14, mul vl]
	bic v31.16b, v28.16b, v1.16b
	str z1, [x8, #-12, mul vl]
	add v0.2d, v12.2d, v12.2d
	add v4.2d, v8.2d, v8.2d
	add v6.2d, v31.2d, v31.2d
	mov z3.d, z0.d
	mov z7.d, z4.d
	mov z18.d, z6.d
	bcax z3.d, z3.d, z29.d, z5.d
	mov z5.d, z2.d
	bcax z7.d, z7.d, z30.d, z17.d
	bcax z18.d, z18.d, z28.d, z1.d
	bcax z5.d, z5.d, z27.d, z16.d
	shl v17.2d, v3.2d, #2
	shl v19.2d, v5.2d, #2
	mov z26.d, z17.d
	eor3 z26.d, z26.d, z0.d, z12.d
	shl v0.2d, v7.2d, #2
	mov z27.d, z19.d
	eor3 z27.d, z27.d, z2.d, z11.d
	shl v2.2d, v18.2d, #2
	mov z28.d, z0.d
	eor3 z28.d, z28.d, z4.d, z8.d
	shl v4.2d, v26.2d, #4
	mov z29.d, z2.d
	eor3 z29.d, z29.d, z6.d, z31.d
	shl v6.2d, v27.2d, #4
	mov z30.d, z4.d
	eor3 z30.d, z30.d, z17.d, z3.d
	shl v3.2d, v28.2d, #4
	mov z17.d, z6.d
	eor3 z17.d, z17.d, z19.d, z5.d
	shl v5.2d, v29.2d, #4
	mov z19.d, z3.d
	eor3 z19.d, z19.d, z0.d, z7.d
	shl v0.2d, v30.2d, #8
	mov z7.d, z5.d
	eor3 z7.d, z7.d, z2.d, z18.d
	shl v18.2d, v17.2d, #8
	mov z9.d, z0.d
	eor3 z9.d, z9.d, z4.d, z26.d
	shl v4.2d, v19.2d, #8
	mov z26.d, z18.d
	eor3 z26.d, z26.d, z6.d, z27.d
	shl v6.2d, v7.2d, #8
	mov z10.d, z4.d
	eor3 z10.d, z10.d, z3.d, z28.d
	shl v3.2d, v9.2d, #16
	mov z2.d, z6.d
	eor3 z2.d, z2.d, z5.d, z29.d
	shl v5.2d, v26.2d, #16
	mov z27.d, z3.d
	eor3 z27.d, z27.d, z0.d, z30.d
	shl v0.2d, v10.2d, #16
	mov z29.d, z5.d
	eor3 z29.d, z29.d, z18.d, z17.d
	shl v17.2d, v2.2d, #16
	mov z18.d, z0.d
	shl v28.2d, v27.2d, #32
	eor3 z18.d, z18.d, z4.d, z19.d
	mov z4.d, z17.d
	shl v30.2d, v29.2d, #32
	eor3 z28.d, z28.d, z3.d, z9.d
	eor3 z4.d, z4.d, z6.d, z7.d
	shl v29.2d, v18.2d, #32
	eor3 z30.d, z30.d, z5.d, z26.d
	bic v1.16b, v12.16b, v28.16b
	shl v4.2d, v4.2d, #32
	eor3 z29.d, z29.d, z0.d, z10.d
	bic v0.16b, v11.16b, v30.16b
	eor3 z4.d, z4.d, z17.d, z2.d
	add v2.2d, v1.2d, v1.2d
	bic v15.16b, v8.16b, v29.16b
	add v3.2d, v0.2d, v0.2d
	bic v10.16b, v31.16b, v4.16b
	mov z16.d, z4.d
	str z4, [x8, #-16, mul vl]
	mov z4.d, z2.d
	add v5.2d, v15.2d, v15.2d
	mov z6.d, z3.d
	add v7.2d, v10.2d, v10.2d
	bcax z4.d, z4.d, z12.d, z28.d
	bcax z6.d, z6.d, z11.d, z30.d
	mov z17.d, z5.d
	mov z19.d, z7.d
	bcax z17.d, z17.d, z8.d, z29.d
	shl v18.2d, v4.2d, #2
	shl v26.2d, v6.2d, #2
	bcax z19.d, z19.d, z31.d, z16.d
	mov z31.d, z18.d
	mov z8.d, z26.d
	eor3 z31.d, z31.d, z2.d, z1.d
	shl v2.2d, v17.2d, #2
	eor3 z8.d, z8.d, z3.d, z0.d
	shl v3.2d, v19.2d, #2
	mov z11.d, z2.d
	mov z12.d, z3.d
	eor3 z11.d, z11.d, z5.d, z15.d
	shl v5.2d, v31.2d, #4
	eor3 z12.d, z12.d, z7.d, z10.d
	shl v7.2d, v8.2d, #4
	mov z13.d, z5.d
	eor3 z13.d, z13.d, z18.d, z4.d
	shl v4.2d, v11.2d, #4
	mov z18.d, z7.d
	eor3 z18.d, z18.d, z26.d, z6.d
	shl v6.2d, v12.2d, #4
	mov z26.d, z4.d
	eor3 z26.d, z26.d, z2.d, z17.d
	shl v17.2d, v13.2d, #8
	mov z14.d, z6.d
	eor3 z14.d, z14.d, z3.d, z19.d
	shl v3.2d, v18.2d, #8
	mov z19.d, z17.d
	eor3 z19.d, z19.d, z5.d, z31.d
	shl v5.2d, v26.2d, #8
	mov z31.d, z3.d
	eor3 z31.d, z31.d, z7.d, z8.d
	shl v7.2d, v14.2d, #8
	mov z8.d, z5.d
	eor3 z8.d, z8.d, z4.d, z11.d
	shl v4.2d, v19.2d, #16
	mov z2.d, z7.d
	eor3 z2.d, z2.d, z6.d, z12.d
	shl v6.2d, v31.2d, #16
	mov z11.d, z4.d
	eor3 z11.d, z11.d, z17.d, z13.d
	shl v17.2d, v8.2d, #16
	mov z12.d, z6.d
	eor3 z12.d, z12.d, z3.d, z18.d
	shl v3.2d, v2.2d, #16
	mov z18.d, z17.d
	shl v13.2d, v11.2d, #32
	eor3 z18.d, z18.d, z5.d, z26.d
	mov z5.d, z3.d
	eor3 z13.d, z13.d, z4.d, z19.d
	eor3 z5.d, z5.d, z7.d, z14.d
	shl v14.2d, v12.2d, #32
	shl v11.2d, v18.2d, #32
	eor3 z14.d, z14.d, z6.d, z31.d
	bic v31.16b, v1.16b, v13.16b
	ldr z6, [x8, #-2, mul vl]
	shl v12.2d, v5.2d, #32
	eor3 z11.d, z11.d, z17.d, z8.d
	add v4.2d, v31.2d, v31.2d
	eor3 z12.d, z12.d, z3.d, z2.d
	bic v3.16b, v0.16b, v14.16b
	ldr z2, [x8, #-8, mul vl]
	bic v22.16b, v15.16b, v11.16b
	mov z9.d, z4.d
	add v17.2d, v3.2d, v3.2d
	add v18.2d, v22.2d, v22.2d
	bic v23.16b, v10.16b, v12.16b
	bcax z9.d, z9.d, z1.d, z13.d
	ldr z1, [x8, #-3, mul vl]
	mov z7.d, z17.d
	add v16.2d, v23.2d, v23.2d
	and v5.16b, v1.16b, v2.16b
	ldr z1, [x8, #-6, mul vl]
	bcax z7.d, z7.d, z0.d, z14.d
	ldr z0, [x8, #-1, mul vl]
	shl v27.2d, v9.2d, #2
	mov z26.d, z16.d
	str q5, [sp, #160]
	eor v19.16b, v5.16b, v2.16b
	ldr z2, [x8, #-7, mul vl]
	and v21.16b, v0.16b, v1.16b
	ushr v0.2d, v5.2d, #1
	mov z5.d, z18.d
	bcax z26.d, z26.d, z10.d, z12.d
	and v24.16b, v6.16b, v2.16b
	bcax z5.d, z5.d, z15.d, z11.d
	mov z15.d, z27.d
	eor v8.16b, v21.16b, v1.16b
	ushr v1.2d, v21.2d, #1
	orr v6.16b, v19.16b, v0.16b
	ldr z19, [x8, #-4, mul vl]
	stp q24, q21, [sp, #128]
	shl v21.2d, v7.2d, #2
	eor v0.16b, v24.16b, v2.16b
	eor3 z15.d, z15.d, z4.d, z31.d
	ldr z4, [x8, #-5, mul vl]
	ushr v2.2d, v24.2d, #1
	and v25.16b, v20.16b, v6.16b
	shl v31.2d, v5.2d, #2
	orr v1.16b, v8.16b, v1.16b
	shl v20.2d, v26.2d, #2
	and v24.16b, v19.16b, v4.16b
	mov z19.d, z21.d
	str q25, [sp, #96]
	eor3 z19.d, z19.d, z17.d, z3.d
	orr v17.16b, v0.16b, v2.16b
	eor v2.16b, v24.16b, v4.16b
	eor v4.16b, v25.16b, v6.16b
	mov z6.d, z31.d
	ldr z0, [x8, #-9, mul vl]
	ushr v3.2d, v25.2d, #2
	str q24, [sp, #112]
	eor3 z6.d, z6.d, z18.d, z22.d
	ldr z18, [x8, #-11, mul vl]
	and v8.16b, v0.16b, v1.16b
	shl v25.2d, v19.2d, #4
	ushr v0.2d, v24.2d, #1
	orr v4.16b, v4.16b, v3.16b
	ldr z3, [x8, #-10, mul vl]
	and v22.16b, v18.16b, v17.16b
	mov z18.d, z20.d
	eor v1.16b, v8.16b, v1.16b
	mov z24.d, z25.d
	orr v2.16b, v2.16b, v0.16b
	eor3 z18.d, z18.d, z16.d, z23.d
	ushr v16.2d, v8.2d, #2
	eor v23.16b, v22.16b, v17.16b
	eor3 z24.d, z24.d, z21.d, z7.d
	ushr v0.2d, v22.2d, #2
	stp q22, q8, [sp, #64]
	shl v22.2d, v15.2d, #4
	and v3.16b, v3.16b, v2.16b
	orr v7.16b, v1.16b, v16.16b
	ldr z1, [x8, #-15, mul vl]
	orr v0.16b, v23.16b, v0.16b
	shl v23.2d, v6.2d, #4
	mov z17.d, z22.d
	and v21.16b, v1.16b, v4.16b
	mov v1.16b, v3.16b
	eor3 z17.d, z17.d, z27.d, z9.d
	shl v9.2d, v18.2d, #4
	eor v16.16b, v21.16b, v4.16b
	ldr z4, [x8, #-14, mul vl]
	stp q21, q3, [sp, #32]
	eor v3.16b, v3.16b, v2.16b
	ushr v1.2d, v1.2d, #2
	ushr v2.2d, v21.2d, #4
	and v8.16b, v4.16b, v0.16b
	ldr z4, [x8, #-13, mul vl]
	shl v21.2d, v17.2d, #8
	orr v1.16b, v3.16b, v1.16b
	ldr z3, [x8, #-12, mul vl]
	orr v2.16b, v16.16b, v2.16b
	and v10.16b, v4.16b, v7.16b
	mov z4.d, z23.d
	str q8, [sp, #16]
	mov z16.d, z21.d
	eor3 z4.d, z4.d, z31.d, z5.d
	mov z5.d, z9.d
	shl v31.2d, v24.2d, #8
	eor v7.16b, v10.16b, v7.16b
	ushr v27.2d, v10.2d, #4
	eor3 z16.d, z16.d, z22.d, z15.d
	eor3 z5.d, z5.d, z20.d, z26.d
	mov z26.d, z31.d
	eor v20.16b, v8.16b, v0.16b
	ushr v0.2d, v8.2d, #4
	and v8.16b, v3.16b, v1.16b
	shl v3.2d, v4.2d, #8
	orr v7.16b, v7.16b, v27.16b
	shl v15.2d, v16.2d, #16
	eor3 z26.d, z26.d, z25.d, z19.d
	and v25.16b, v30.16b, v2.16b
	shl v27.2d, v5.2d, #8
	mov z30.d, z3.d
	orr v0.16b, v20.16b, v0.16b
	eor v1.16b, v8.16b, v1.16b
	ushr v22.2d, v8.2d, #4
	and v28.16b, v28.16b, v7.16b
	eor v2.16b, v25.16b, v2.16b
	ushr v20.2d, v25.2d, #8
	eor3 z30.d, z30.d, z23.d, z6.d
	shl v23.2d, v26.2d, #16
	mov z6.d, z27.d
	orr v1.16b, v1.16b, v22.16b
	ushr v22.2d, v28.2d, #8
	and v29.16b, v29.16b, v0.16b
	eor3 z6.d, z6.d, z9.d, z18.d
	orr v18.16b, v2.16b, v20.16b
	mov z9.d, z23.d
	ldr z2, [x8, #-16, mul vl]
	eor v20.16b, v28.16b, v7.16b
	eor v0.16b, v29.16b, v0.16b
	bic x8, x18, x5
	lsl x18, x30, x14
	eor3 z9.d, z9.d, z31.d, z24.d
	mov z24.d, z15.d
	and v7.16b, v14.16b, v18.16b
	and v19.16b, v2.16b, v1.16b
	shl v2.2d, v30.2d, #16
	eor3 z24.d, z24.d, z21.d, z17.d
	orr v17.16b, v20.16b, v22.16b
	shl v22.2d, v6.2d, #16
	mov z20.d, z2.d
	eor v1.16b, v19.16b, v1.16b
	ushr v21.2d, v19.2d, #8
	shl v31.2d, v9.2d, #32
	ushr v9.2d, v29.2d, #8
	eor v18.16b, v7.16b, v18.16b
	ushr v14.2d, v7.2d, #16
	eor3 z20.d, z20.d, z3.d, z4.d
	mov z4.d, z22.d
	shl v24.2d, v24.2d, #32
	orr v3.16b, v1.16b, v21.16b
	and v1.16b, v13.16b, v17.16b
	orr v0.16b, v0.16b, v9.16b
	eor3 z31.d, z31.d, z23.d, z26.d
	mov v21.d[0], x8
	csel x8, xzr, x18, ne
	eor3 z4.d, z4.d, z27.d, z5.d
	eor3 z24.d, z24.d, z15.d, z16.d
	orr v5.16b, v18.16b, v14.16b
	and v16.16b, v12.16b, v3.16b
	eor v17.16b, v1.16b, v17.16b
	ushr v23.2d, v1.2d, #16
	shl v20.2d, v20.2d, #32
	and v18.16b, v11.16b, v0.16b
	bic x8, x17, x8
	mov v21.d[1], x8
	sub x8, x29, #64
	sub x18, x29, #64
	shl v4.2d, v4.2d, #32
	eor v3.16b, v16.16b, v3.16b
	ushr v26.2d, v16.2d, #16
	eor3 z20.d, z20.d, z2.d, z30.d
	eor v0.16b, v18.16b, v0.16b
	ushr v27.2d, v18.2d, #16
	lsr x17, x17, x14
	eor3 z4.d, z4.d, z22.d, z6.d
	orr v6.16b, v17.16b, v23.16b
	orr v2.16b, v3.16b, v26.16b
	ldp q26, q23, [sp, #176]
	and v3.16b, v31.16b, v5.16b
	ldr q22, [sp, #208]
	orr v0.16b, v0.16b, v27.16b
	and v6.16b, v24.16b, v6.16b
	shl v5.2d, v26.2d, #32
	shl v17.2d, v22.2d, #32
	and v2.16b, v4.16b, v2.16b
	shl v4.2d, v23.2d, #32
	and v0.16b, v20.16b, v0.16b
	bsl v3.16b, v5.16b, v26.16b
	shl v5.2d, v21.2d, #32
	bsl v6.16b, v17.16b, v22.16b
	bsl v2.16b, v4.16b, v23.16b
	bsl v0.16b, v5.16b, v21.16b
	shl v4.2d, v3.2d, #16
	shl v5.2d, v6.2d, #16
	shl v17.2d, v2.2d, #16
	bit v3.16b, v4.16b, v7.16b
	shl v4.2d, v0.2d, #16
	bsl v1.16b, v5.16b, v6.16b
	bit v2.16b, v17.16b, v16.16b
	ldr q7, [sp, #32]
	bit v0.16b, v4.16b, v18.16b
	shl v4.2d, v3.2d, #8
	shl v5.2d, v1.2d, #8
	shl v6.2d, v2.2d, #8
	bit v3.16b, v4.16b, v25.16b
	shl v4.2d, v0.2d, #8
	bit v1.16b, v5.16b, v28.16b
	bit v2.16b, v6.16b, v19.16b
	bit v0.16b, v4.16b, v29.16b
	shl v4.2d, v3.2d, #4
	shl v5.2d, v1.2d, #4
	shl v6.2d, v2.2d, #4
	bit v3.16b, v4.16b, v7.16b
	shl v4.2d, v0.2d, #4
	bit v1.16b, v5.16b, v10.16b
	ldr q5, [sp, #16]
	bit v2.16b, v6.16b, v8.16b
	ldr q7, [sp, #96]
	bit v0.16b, v4.16b, v5.16b
	shl v4.2d, v3.2d, #2
	shl v5.2d, v1.2d, #2
	shl v6.2d, v2.2d, #2
	bit v3.16b, v4.16b, v7.16b
	ldr q7, [sp, #80]
	shl v4.2d, v0.2d, #2
	bit v1.16b, v5.16b, v7.16b
	ldp q7, q5, [sp, #48]
	bit v2.16b, v6.16b, v7.16b
	ldp q16, q7, [sp, #144]
	bit v0.16b, v4.16b, v5.16b
	add v5.2d, v1.2d, v1.2d
	add v4.2d, v3.2d, v3.2d
	bic v1.16b, v1.16b, v16.16b
	ldr z16, [x8, #-1, mul vl]
	bic v3.16b, v3.16b, v7.16b
	ldr z7, [x8, #-3, mul vl]
	add v6.2d, v2.2d, v2.2d
	and v5.16b, v5.16b, v16.16b
	ldr q16, [sp, #112]
	and v4.16b, v4.16b, v7.16b
	add v7.2d, v0.2d, v0.2d
	bic v2.16b, v2.16b, v16.16b
	ldr z16, [x8, #-4, mul vl]
	orr v1.16b, v5.16b, v1.16b
	orr v3.16b, v4.16b, v3.16b
	ldr z4, [x8, #-8, mul vl]
	and v6.16b, v6.16b, v16.16b
	ldr q16, [sp, #128]
	bic v0.16b, v0.16b, v16.16b
	ldr z16, [x8, #-2, mul vl]
	and v3.16b, v3.16b, v4.16b
	ldr z4, [x8, #-6, mul vl]
	orr v2.16b, v6.16b, v2.16b
	and v7.16b, v7.16b, v16.16b
	and v1.16b, v1.16b, v4.16b
	ldr z4, [x8, #-5, mul vl]
	lsl x8, x16, #1
	lsr x16, x16, x14
	orr v0.16b, v7.16b, v0.16b
	and v2.16b, v2.16b, v4.16b
	ldr z4, [x18, #-7, mul vl]
	mvn w18, w14
	lsl x8, x8, x18
	stp q3, q1, [x13]
	sub w14, w15, w14
	and v0.16b, v0.16b, v4.16b
	orr x8, x8, x17
	csel x17, xzr, x16, ne
	csel x16, x16, x8, ne
	subs x11, x11, #1
	stp q2, q0, [x13, #32]
	add x13, x13, #64
	b.eq .LBB25_47
.LBB25_8:
	ldr q2, [x12]
	movprfx z0, z2
	cnt z0.d, p0/m, z2.d
	fmov w5, s0
	cmp w14, w5
	b.hs .LBB25_13
	cmp x10, x1
	b.hs .LBB25_11
	ldr x15, [x0, x10, lsl #3]
	b .LBB25_12
.LBB25_11:
	mov x15, xzr
.LBB25_12:
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
.LBB25_13:
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
	b.hs .LBB25_18
	cmp x10, x1
	b.hs .LBB25_16
	ldr x6, [x0, x10, lsl #3]
	b .LBB25_17
.LBB25_16:
	mov x6, xzr
.LBB25_17:
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
.LBB25_18:
	ldr q1, [x12, #16]
	lsl x6, x17, #1
	mvn w19, w18
	lsl x7, x30, x18
	lsr x20, x14, x18
	tst x18, #0x40
	lsl x19, x6, x19
	lsr x21, x17, x18
	movprfx z0, z1
	cnt z0.d, p0/m, z1.d
	csel x17, xzr, x7, ne
	orr x7, x19, x20
	sub w19, w5, w18
	csel x5, x21, x7, ne
	csel x7, xzr, x21, ne
	fmov w6, s0
	cmp w19, w6
	b.hs .LBB25_23
	cmp x10, x1
	b.hs .LBB25_21
	ldr x18, [x0, x10, lsl #3]
	b .LBB25_22
.LBB25_21:
	mov x18, xzr
.LBB25_22:
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
.LBB25_23:
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
	b.hs .LBB25_28
	cmp x10, x1
	b.hs .LBB25_26
	ldr x21, [x0, x10, lsl #3]
	b .LBB25_27
.LBB25_26:
	mov x21, xzr
.LBB25_27:
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
.LBB25_28:
	ldr q6, [x12, #32]
	lsl x21, x19, #1
	mvn w23, w18
	lsl x22, x30, x18
	lsr x24, x6, x18
	tst x18, #0x40
	lsl x23, x21, x23
	lsr x25, x19, x18
	movprfx z0, z6
	cnt z0.d, p0/m, z6.d
	csel x19, xzr, x22, ne
	orr x22, x23, x24
	sub w23, w20, w18
	csel x20, x25, x22, ne
	csel x22, xzr, x25, ne
	fmov w21, s0
	cmp w23, w21
	b.hs .LBB25_33
	cmp x10, x1
	b.hs .LBB25_31
	ldr x18, [x0, x10, lsl #3]
	b .LBB25_32
.LBB25_31:
	mov x18, xzr
.LBB25_32:
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
.LBB25_33:
	lsl x24, x22, #1
	mvn w25, w21
	mov w18, v0.s[2]
	lsl x26, x30, x21
	lsr x27, x20, x21
	tst x21, #0x40
	lsl x24, x24, x25
	lsr x25, x22, x21
	ldr q4, [x12, #48]
	csel x22, xzr, x26, ne
	orr x26, x24, x27
	sub w24, w23, w21
	csel x21, x25, x26, ne
	csel x25, xzr, x25, ne
	cmp w24, w18
	b.hs .LBB25_38
	cmp x10, x1
	b.hs .LBB25_36
	ldr x23, [x0, x10, lsl #3]
	b .LBB25_37
.LBB25_36:
	mov x23, xzr
.LBB25_37:
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
.LBB25_38:
	movprfx z0, z4
	cnt z0.d, p0/m, z4.d
	lsl x23, x25, #1
	mvn w27, w18
	lsr x28, x21, x18
	lsl x26, x30, x18
	lsr x25, x25, x18
	lsl x27, x23, x27
	tst x18, #0x40
	sub w24, w24, w18
	csel x26, xzr, x26, ne
	orr x27, x27, x28
	csel x18, x25, x27, ne
	csel x25, xzr, x25, ne
	fmov w23, s0
	cmp w24, w23
	b.hs .LBB25_43
	cmp x10, x1
	b.hs .LBB25_41
	ldr x27, [x0, x10, lsl #3]
	b .LBB25_42
.LBB25_41:
	mov x27, xzr
.LBB25_42:
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
.LBB25_43:
	bic x8, x16, x15
	bic x15, x5, x7
	bic x16, x14, x17
	bic x14, x20, x22
	mov v3.d[0], x15
	lsl x7, x25, #1
	mov v5.d[0], x14
	mov w14, v0.s[2]
	fmov d0, x8
	bic x15, x6, x19
	bic x17, x21, x26
	mvn w19, w23
	lsr x6, x18, x23
	lsl x8, x7, x19
	lsl x5, x30, x23
	mov v0.d[1], x16
	mov v3.d[1], x15
	lsr x16, x25, x23
	mov v5.d[1], x17
	tst x23, #0x40
	orr x8, x8, x6
	sub w15, w24, w23
	csel x5, xzr, x5, ne
	csel x17, x16, x8, ne
	csel x16, xzr, x16, ne
	cmp w15, w14
	str q3, [sp, #208]
	stp q0, q5, [sp, #176]
	b.hs .LBB25_7
	cmp x10, x1
	b.lo .LBB25_5
	mov x6, xzr
	b .LBB25_6
.LBB25_46:
	mov x16, xzr
	mov x17, xzr
	mov x10, xzr
	mov w14, wzr
.LBB25_47:
	cbz x9, .LBB25_55
	lsl x11, x3, #3
	ldr x8, [sp, #8]
	ptrue p0.d
	and x12, x11, #0x7fffffffffffffc0
	add x11, x2, x12
	add x12, x8, x12
	b .LBB25_52
.LBB25_49:
	ldr x18, [x0, x10, lsl #3]
.LBB25_50:
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
.LBB25_51:
	mvn x18, x15
	lsl x20, x30, x13
	tst x13, #0x40
	lsl x2, x18, #1
	sub w14, w14, w13
	csel x20, xzr, x20, ne
	eor x18, x2, x18, lsl #2
	eon x18, x15, x18
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
	and x2, x18, x15
	eor x19, x2, x15
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
	lsr x16, x16, x13
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
	lsr x17, x17, x13
	and x5, x3, x4, lsl #2
	bic x3, x4, x3
	mvn w4, w13
	lsl x4, x6, x4
	orr x3, x3, x5
	and x18, x18, x3, lsl #1
	bic x2, x3, x2
	orr x16, x4, x16
	csel x16, x17, x16, ne
	csel x17, xzr, x17, ne
	subs x9, x9, #1
	orr x18, x2, x18
	and x15, x18, x15
	str x15, [x12], #8
	b.eq .LBB25_55
.LBB25_52:
	ldr x15, [x11], #8
	fmov d0, x15
	cnt z0.d, p0/m, z0.d
	fmov x13, d0
	cmp w14, w13
	b.hs .LBB25_51
	cmp x10, x1
	b.lo .LBB25_49
	mov x18, xzr
	b .LBB25_50
.LBB25_55:
	addvl sp, sp, #16
	add sp, sp, #224
	ldp x20, x19, [sp, #144]
	ldp x22, x21, [sp, #128]
	ldp x24, x23, [sp, #112]
	ldp x26, x25, [sp, #96]
	ldp x28, x27, [sp, #80]
	ldp x29, x30, [sp, #64]
	ldp d9, d8, [sp, #48]
	ldp d11, d10, [sp, #32]
	ldp d13, d12, [sp, #16]
	ldp d15, d14, [sp], #160
	ret
.LBB25_56:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.0
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.51
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.51
	mov w1, #41
	bl core::panicking::panic
