bitpacking::select::select_scan8_broadword:
	stp x24, x23, [sp, #-48]!
	stp x22, x21, [sp, #16]
	stp x20, x19, [sp, #32]
	lsr x10, x1, #3
	cbz x10, .LBB41_5
	add x11, x0, x10, lsl #6
	ptrue p0.d
	mov x8, xzr
	mov x12, x0
.LBB41_2:
	ldp x15, x16, [x12, #16]
	ldp x17, x18, [x12, #32]
	ldp x9, x14, [x12]
	fmov d3, x16
	ldp x3, x4, [x12, #48]
	fmov d4, x17
	fmov d5, x18
	fmov d2, x15
	fmov d0, x9
	fmov d1, x14
	cnt z3.d, p0/m, z3.d
	fmov d6, x3
	fmov d7, x4
	cnt z4.d, p0/m, z4.d
	cnt z5.d, p0/m, z5.d
	cnt z2.d, p0/m, z2.d
	cnt z0.d, p0/m, z0.d
	cnt z1.d, p0/m, z1.d
	cnt z6.d, p0/m, z6.d
	cnt z7.d, p0/m, z7.d
	fmov x20, d3
	fmov x19, d4
	fmov x6, d5
	fmov x21, d2
	fmov x23, d0
	fmov x22, d1
	fmov x5, d6
	add x7, x19, x20
	add x24, x6, x7
	fmov x7, d7
	add x13, x22, x23
	add x13, x21, x13
	add x13, x24, x13
	add x24, x7, x5
	add x13, x24, x13
	subs x13, x2, x13
	b.lo .LBB41_10
	add x12, x12, #64
	add x8, x8, #512
	mov x2, x13
	cmp x12, x11
	b.ne .LBB41_2
	ubfiz x11, x1, #3, #3
	cbnz x11, .LBB41_6
	b .LBB41_9
.LBB41_5:
	mov x13, x2
	ubfiz x11, x1, #3, #3
	cbz x11, .LBB41_9
.LBB41_6:
	and x8, x1, #0xffffffffffffff8
	ptrue p0.d
	add x12, x0, x8, lsl #3
	neg x8, x10, lsl #9
.LBB41_7:
	ldr x9, [x12], #8
	fmov d0, x9
	cnt z0.d, p0/m, z0.d
	fmov x10, d0
	subs x10, x13, x10
	b.lo .LBB41_12
	subs x11, x11, #8
	sub x8, x8, #64
	mov x13, x10
	b.ne .LBB41_7
.LBB41_9:
	mov x0, xzr
	ldp x20, x19, [sp, #32]
	ldp x22, x21, [sp, #16]
	ldp x24, x23, [sp], #48
	ret
.LBB41_10:
	subs x11, x2, x23
	b.hs .LBB41_13
	mov x10, xzr
	b .LBB41_27
.LBB41_12:
	lsr x10, x9, #1
	mov x12, #72340172838076673
	mul x12, x13, x12
	and x10, x10, #0x5555555555555555
	sub x10, x9, x10
	lsr x11, x10, #2
	and x10, x10, #0x3333333333333333
	and x11, x11, #0x3333333333333333
	orr x12, x12, #0x8080808080808080
	add x10, x11, x10
	mov x11, #-72340172838076674
	add x10, x10, x10, lsr #4
	movk x11, #65279
	and x10, x10, #0xf0f0f0f0f0f0f0f
	madd x11, x10, x11, x12
	and x11, x11, #0x8080808080808080
	fmov d0, x11
	mov x11, #72340172838076673
	movk x11, #256
	mul x10, x10, x11
	cnt z0.d, p0/m, z0.d
	fmov w11, s0
	lsl w11, w11, #3
	and w12, w11, #0x38
	lsr x10, x10, x12
	lsr x9, x9, x12
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	sub w10, w13, w10
	and x9, x9, #0xff
	ubfiz x10, x10, #8, #3
	add x10, x12, x10
	ldrb w9, [x10, x9]
	add w9, w11, w9
	sub x1, x9, x8
	mov w0, #1
	ldp x20, x19, [sp, #32]
	ldp x22, x21, [sp, #16]
	ldp x24, x23, [sp], #48
	ret
.LBB41_13:
	subs x2, x11, x22
	b.hs .LBB41_15
	mov w10, #64
	mov x2, x11
	mov x9, x14
	b .LBB41_27
.LBB41_15:
	subs x9, x2, x21
	b.hs .LBB41_17
	mov w10, #128
	mov x9, x15
	b .LBB41_27
.LBB41_17:
	subs x2, x9, x20
	b.hs .LBB41_19
	mov w10, #192
	mov x2, x9
	mov x9, x16
	b .LBB41_27
.LBB41_19:
	subs x9, x2, x19
	b.hs .LBB41_21
	mov w10, #256
	mov x9, x17
	b .LBB41_27
.LBB41_21:
	subs x2, x9, x6
	b.hs .LBB41_23
	mov w10, #320
	mov x2, x9
	mov x9, x18
	b .LBB41_27
.LBB41_23:
	subs x9, x2, x5
	b.hs .LBB41_25
	mov w10, #384
	mov x9, x3
	b .LBB41_27
.LBB41_25:
	cmp x9, x7
	b.hs .LBB41_9
	mov w10, #448
	mov x2, x9
	mov x9, x4
.LBB41_27:
	lsr x11, x9, #1
	mov x13, #72340172838076673
	add x8, x10, x8
	mul x13, x2, x13
	and x11, x11, #0x5555555555555555
	sub x11, x9, x11
	lsr x12, x11, #2
	and x11, x11, #0x3333333333333333
	and x12, x12, #0x3333333333333333
	orr x13, x13, #0x8080808080808080
	add x11, x12, x11
	mov x12, #-72340172838076674
	add x11, x11, x11, lsr #4
	movk x12, #65279
	and x11, x11, #0xf0f0f0f0f0f0f0f
	madd x12, x11, x12, x13
	and x12, x12, #0x8080808080808080
	fmov d0, x12
	mov x12, #72340172838076673
	movk x12, #256
	mul x11, x11, x12
	cnt z0.d, p0/m, z0.d
	fmov w12, s0
	lsl w12, w12, #3
	and w13, w12, #0x38
	lsr x11, x11, x13
	lsr x9, x9, x13
	adrp x13, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x13, [x13, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	sub w11, w2, w11
	and x9, x9, #0xff
	ubfiz x11, x11, #8, #3
	add x11, x13, x11
	ldrb w9, [x11, x9]
	add w9, w12, w9
	add x1, x8, x9
	mov w0, #1
	ldp x20, x19, [sp, #32]
	ldp x22, x21, [sp, #16]
	ldp x24, x23, [sp], #48
	ret
