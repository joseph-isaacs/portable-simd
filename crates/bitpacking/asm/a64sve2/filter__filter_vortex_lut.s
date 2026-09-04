bitpacking::filter::filter_vortex_lut:
	sub sp, sp, #128
	stp x29, x30, [sp, #32]
	stp x28, x27, [sp, #48]
	stp x26, x25, [sp, #64]
	stp x24, x23, [sp, #80]
	stp x22, x21, [sp, #96]
	stp x20, x19, [sp, #112]
	add x29, sp, #32
	cmp x1, x3
	str x1, [sp, #16]
	stur x3, [x29, #-8]
	b.ne .LBB32_17
	cmp x5, x1
	b.ls .LBB32_18
	mov x19, xzr
	cbz x1, .LBB32_15
	ptrue p0.d
	mov x21, xzr
	mov x22, xzr
	mov w20, wzr
	mov x23, xzr
.LBB32_4:
	mov w24, w20
	b .LBB32_7
.LBB32_5:
	lsr x9, x8, #1
	mvn w10, w20
	lsl x8, x8, x24
	tst x24, #0x40
	lsr x9, x9, x10
	csel x9, x8, x9, ne
	csel x8, xzr, x8, ne
	orr x8, x8, x21
	orr x21, x9, x22
	str x8, [x4, x19, lsl #3]
	add x19, x19, #1
	mov x22, xzr
.LBB32_6:
	add x23, x23, #1
	cmp x23, x1
	b.hs .LBB32_13
.LBB32_7:
	ldr x9, [x2, x23, lsl #3]
	ldr x8, [x0, x23, lsl #3]
	cmn x9, #1
	b.eq .LBB32_5
	cbz x9, .LBB32_6
	fmov d0, x9
	str x0, [sp, #8]
	mov x27, x1
	mov x0, x8
	mov x1, x9
	mov x26, x2
	mov x28, x4
	cnt z0.d, p0/m, z0.d
	fmov w25, s0
	bl <bitpacking::filter::pext_byte_lut as core::ops::function::Fn<(u64, u64)>>::call
	lsr x9, x0, #1
	mvn w8, w20
	tst x24, #0x40
	add w20, w20, w25
	lsr x8, x9, x8
	lsl x9, x0, x24
	csel x10, x9, x8, ne
	csel x9, xzr, x9, ne
	subs w8, w20, #64
	orr x22, x10, x22
	orr x21, x9, x21
	b.lo .LBB32_11
	mov x4, x28
	str x21, [x28, x19, lsl #3]
	add x19, x19, #1
	mov w20, w8
	mov x21, x22
	mov x22, xzr
	b .LBB32_12
.LBB32_11:
	mov x4, x28
.LBB32_12:
	add x23, x23, #1
	ldr x0, [sp, #8]
	ptrue p0.d
	mov x1, x27
	cmp x23, x27
	mov x2, x26
	b.lo .LBB32_4
.LBB32_13:
	cbz w20, .LBB32_15
	mov w8, w20
	str x21, [x4, x19, lsl #3]
	b .LBB32_16
.LBB32_15:
	mov x8, xzr
.LBB32_16:
	add x0, x8, x19, lsl #6
	ldp x20, x19, [sp, #112]
	ldp x22, x21, [sp, #96]
	ldp x24, x23, [sp, #80]
	ldp x26, x25, [sp, #64]
	ldp x28, x27, [sp, #48]
	ldp x29, x30, [sp, #32]
	add sp, sp, #128
	ret
.LBB32_17:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.7
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.7
	add x1, sp, #16
	sub x2, x29, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB32_18:
	adrp x0, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.8
	add x0, x0, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.8
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.9
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.9
	mov w1, #95
	bl core::panicking::panic_fmt
