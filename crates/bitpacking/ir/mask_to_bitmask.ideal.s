// Hand-written target for m64 in mask_to_bitmask.ll (what bytes_to_bits_neon compiles to).
// The per-vector `addp v, v, v` in LLVM's output halves the same data twice; pairing
// *different* vectors keeps every lane useful, so the tree finishes in 4 addp for 4 vectors.
m64:
	adrp	x8, .LCPI2_0
	ldr	q4, [x8, :lo12:.LCPI2_0]      // 0x8040201008040201 x2 (bit weights)
	cmeq	v0.16b, v0.16b, #0
	cmeq	v1.16b, v1.16b, #0
	cmeq	v2.16b, v2.16b, #0
	cmeq	v3.16b, v3.16b, #0
	bic	v0.16b, v4.16b, v0.16b       // weight where lane != 0
	bic	v1.16b, v4.16b, v1.16b
	bic	v2.16b, v4.16b, v2.16b
	bic	v3.16b, v4.16b, v3.16b
	addp	v0.16b, v0.16b, v1.16b       // [v0 pairs | v1 pairs]
	addp	v2.16b, v2.16b, v3.16b       // [v2 pairs | v3 pairs]
	addp	v0.16b, v0.16b, v2.16b       // [v0 quads v1 quads | v2 quads v3 quads]
	addp	v0.16b, v0.16b, v0.16b       // low 8 bytes = 16-bit masks of v0,v1,v2,v3 in order
	fmov	x0, d0
	ret
// 15 instructions vs 30 from LLVM HEAD; m32 analogously is 9 (2 cmeq, 2 bic, 3 addp, fmov + consts) vs 16.
