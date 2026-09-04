bitpacking::select::select_broadword:
	cbz x1, .LBB37_4
	lsl x10, x1, #3
	mov x8, xzr
.LBB37_2:
	ldr x9, [x0], #8
	fmov d0, x9
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov x11, d0
	subs x11, x2, x11
	b.lo .LBB37_5
	sub x10, x10, #8
	sub x8, x8, #64
	mov x2, x11
	cbnz x10, .LBB37_2
.LBB37_4:
	mov x0, xzr
	ret
.LBB37_5:
	lsr x10, x9, #1
	mov x12, #72340172838076673
	mov w0, #1
	mul x12, x2, x12
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
	cnt v0.8b, v0.8b
	addv b0, v0.8b
	fmov w11, s0
	lsl w11, w11, #3
	and w12, w11, #0x38
	lsr x10, x10, x12
	lsr x9, x9, x12
	adrp x12, :got:bitpacking::select::SELECT_IN_BYTE
	ldr x12, [x12, :got_lo12:bitpacking::select::SELECT_IN_BYTE]
	sub w10, w2, w10
	and x9, x9, #0xff
	ubfiz x10, x10, #8, #3
	add x10, x12, x10
	ldrb w9, [x10, x9]
	add w9, w11, w9
	sub x1, x9, x8
	ret
