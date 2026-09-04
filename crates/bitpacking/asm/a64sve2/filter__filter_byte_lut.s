bitpacking::filter::filter_byte_lut:
	sub sp, sp, #112
	stp x29, x30, [sp, #16]
	stp x28, x27, [sp, #32]
	stp x26, x25, [sp, #48]
	stp x24, x23, [sp, #64]
	stp x22, x21, [sp, #80]
	stp x20, x19, [sp, #96]
	add x29, sp, #16
	cmp x1, x3
	stp x1, x3, [sp]
	b.ne .LBB29_13
	mov x22, x1
	cbz x1, .LBB29_10
	mov x20, x5
	mov x21, x4
	mov x23, x2
	mov x24, x0
	mov w26, wzr
	mov x19, xzr
	mov x27, xzr
	mov x28, xzr
	b .LBB29_4
.LBB29_3:
	subs x22, x22, #1
	b.eq .LBB29_7
.LBB29_4:
	ldr x25, [x23], #8
	ldr x0, [x24], #8
	mov x1, x25
	bl <bitpacking::filter::pext_byte_lut as core::ops::function::Fn<(u64, u64)>>::call
	fmov d0, x25
	ptrue p0.d
	lsr x8, x0, #1
	mvn w9, w26
	mov w10, w26
	lsr x8, x8, x9
	lsl x11, x0, x10
	tst x10, #0x40
	cnt z0.d, p0/m, z0.d
	csel x8, x11, x8, ne
	orr x28, x8, x28
	fmov w9, s0
	add w26, w26, w9
	csel x9, xzr, x11, ne
	cmp w26, #63
	orr x27, x9, x27
	b.ls .LBB29_3
	cmp x19, x20
	b.hs .LBB29_14
	str x27, [x21, x19, lsl #3]
	add x19, x19, #1
	sub w26, w26, #64
	mov x27, x28
	mov x28, xzr
	b .LBB29_3
.LBB29_7:
	cbz w26, .LBB29_11
	cmp x19, x20
	b.hs .LBB29_15
	mov w8, w26
	str x27, [x21, x19, lsl #3]
	b .LBB29_12
.LBB29_10:
	mov x8, xzr
	mov x19, xzr
	b .LBB29_12
.LBB29_11:
	mov x8, xzr
.LBB29_12:
	add x0, x8, x19, lsl #6
	ldp x20, x19, [sp, #96]
	ldp x22, x21, [sp, #80]
	ldp x24, x23, [sp, #64]
	ldp x26, x25, [sp, #48]
	ldp x28, x27, [sp, #32]
	ldp x29, x30, [sp, #16]
	add sp, sp, #112
	ret
.LBB29_13:
	adrp x5, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	add x5, x5, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.4
	mov x1, sp
	add x2, sp, #8
	mov w0, wzr
	mov x3, xzr
	bl core::panicking::assert_failed::<usize, usize>
.LBB29_14:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.6
	mov x0, x19
	mov x1, x20
	bl core::panicking::panic_bounds_check
.LBB29_15:
	adrp x2, .Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	add x2, x2, :lo12:.Lanon.b051d2d6b7fd47aab34a8cc0381edb43.5
	mov x0, x19
	mov x1, x20
	bl core::panicking::panic_bounds_check
