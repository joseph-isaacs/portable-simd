bitpacking::byte_to_bit::bytes_to_bits_swar:
	push rbx
	mov rax, rdi
	mov r8d, esi
	and r8d, 63
	mov rdi, rsi
	shr rdi, 6
	cmp rcx, rdi
	mov r9, rdi
	cmovb r9, rcx
	test r9, r9
	je .LBB4_8
	cmp r9, 4
	jae .LBB4_3
	xor r10d, r10d
	jmp .LBB4_6
.LBB4_3:
	movabs r10, 144115188075855868
	and r10, r9
	lea r11, [8*r9]
	and r11, -32
	xor ebx, ebx
	vbroadcasti32x4 ymm18, xmmword ptr [rip + .LCPI4_1]
	vmovdqa64 xmm19, xmmword ptr [rip + .LCPI4_1]
	vbroadcasti32x4 ymm20, xmmword ptr [rip + .LCPI4_3]
	vmovdqa64 xmm21, xmmword ptr [rip + .LCPI4_3]
	vbroadcasti32x4 ymm22, xmmword ptr [rip + .LCPI4_5]
	vmovdqa64 xmm23, xmmword ptr [rip + .LCPI4_5]
	vbroadcasti32x4 ymm24, xmmword ptr [rip + .LCPI4_7]
	vmovdqa64 xmm30, xmmword ptr [rip + .LCPI4_7]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI4_8]
	vpbroadcastq ymm9, qword ptr [rip + .LCPI4_9]
	vpbroadcastq ymm10, qword ptr [rip + .LCPI4_10]
	vmovdqa ymm11, ymmword ptr [rip + .LCPI4_11]
	vmovdqa ymm12, ymmword ptr [rip + .LCPI4_12]
	vmovdqa ymm13, ymmword ptr [rip + .LCPI4_13]
	vmovdqa ymm14, ymmword ptr [rip + .LCPI4_14]
	vmovdqa ymm15, ymmword ptr [rip + .LCPI4_15]
	vmovdqa64 ymm16, ymmword ptr [rip + .LCPI4_16]
	vpbroadcastq ymm17, qword ptr [rip + .LCPI4_25]
.LBB4_4:
	vmovdqu64 zmm25, zmmword ptr [rax + 8*rbx + 64]
	vmovdqu64 zmm7, zmmword ptr [rax + 8*rbx]
	vmovdqu64 zmm26, zmmword ptr [rax + 8*rbx + 192]
	vmovdqu64 zmm5, zmmword ptr [rax + 8*rbx + 128]
	vmovdqu xmm0, xmmword ptr [rax + 8*rbx]
	vmovdqu xmm1, xmmword ptr [rax + 8*rbx + 64]
	vinserti128 ymm1, ymm1, xmmword ptr [rax + 8*rbx + 192], 1
	vinserti128 ymm0, ymm0, xmmword ptr [rax + 8*rbx + 128], 1
	vpunpcklqdq ymm27, ymm0, ymm1
	vpunpckhqdq ymm28, ymm0, ymm1
	vmovdqu ymm0, ymmword ptr [rax + 8*rbx + 192]
	vmovdqu ymm1, ymmword ptr [rax + 8*rbx + 128]
	vpunpcklqdq ymm3, ymm1, ymm0
	vmovdqu ymm4, ymmword ptr [rax + 8*rbx + 64]
	vmovdqu64 ymm29, ymmword ptr [rax + 8*rbx]
	vpunpcklqdq ymm6, ymm29, ymm4
	vperm2i128 ymm6, ymm6, ymm3, 49
	vpunpckhqdq ymm0, ymm1, ymm0
	vpunpckhqdq ymm1, ymm29, ymm4
	vperm2i128 ymm4, ymm1, ymm0, 49
	vmovdqa64 zmm0, zmm5
	vpermt2q zmm0, zmm18, zmm26
	vmovdqa64 zmm1, zmm7
	vpermt2q zmm1, zmm19, zmm25
	vpblendd ymm3, ymm1, ymm0, 240
	vmovdqa64 zmm0, zmm5
	vpermt2q zmm0, zmm20, zmm26
	vmovdqa64 zmm1, zmm7
	vpermt2q zmm1, zmm21, zmm25
	vpblendd ymm1, ymm1, ymm0, 240
	vmovdqa64 zmm0, zmm5
	vpermt2q zmm0, zmm22, zmm26
	vmovdqa64 zmm2, zmm7
	vpermt2q zmm2, zmm23, zmm25
	vpblendd ymm0, ymm2, ymm0, 240
	vpermt2q zmm5, zmm24, zmm26
	vpandq ymm2, ymm27, ymm8
	vpaddq ymm2, ymm8, ymm2
	vpternlogq ymm2, ymm9, ymm27, 200
	vpxord xmm26, xmm26, xmm26
	vpmullq ymm26, ymm2, ymm10
	vpermt2q zmm7, zmm30, zmm25
	vpblendd ymm2, ymm7, ymm5, 240
	vpsrlq ymm5, ymm26, 56
	vpandq ymm7, ymm28, ymm8
	vpaddq ymm7, ymm8, ymm7
	vpternlogq ymm7, ymm9, ymm28, 200
	vpmullq ymm7, ymm7, ymm10
	vpshufb ymm7, ymm7, ymm11
	vpor ymm5, ymm7, ymm5
	vpand ymm7, ymm8, ymm6
	vpaddq ymm7, ymm8, ymm7
	vpternlogq ymm7, ymm9, ymm6, 200
	vxorps xmm6, xmm6, xmm6
	vpmullq ymm6, ymm7, ymm10
	vpshufb ymm6, ymm6, ymm12
	vpand ymm7, ymm8, ymm4
	vpaddq ymm7, ymm8, ymm7
	vpternlogq ymm7, ymm9, ymm4, 200
	vxorps xmm4, xmm4, xmm4
	vpmullq ymm4, ymm7, ymm10
	vpand ymm7, ymm8, ymm3
	vpaddq ymm7, ymm8, ymm7
	vpternlogq ymm7, ymm9, ymm3, 200
	vxorps xmm3, xmm3, xmm3
	vpmullq ymm3, ymm7, ymm10
	vpshufb ymm4, ymm4, ymm13
	vpternlogq ymm4, ymm6, ymm5, 254
	vpshufb ymm3, ymm3, ymm14
	vpand ymm5, ymm8, ymm1
	vpaddq ymm5, ymm8, ymm5
	vpternlogq ymm5, ymm9, ymm1, 200
	vxorps xmm1, xmm1, xmm1
	vpmullq ymm1, ymm5, ymm10
	vpshufb ymm1, ymm1, ymm15
	vpternlogq ymm1, ymm3, ymm4, 254
	vpand ymm3, ymm8, ymm0
	vpaddq ymm3, ymm8, ymm3
	vpternlogq ymm3, ymm9, ymm0, 200
	vxorps xmm0, xmm0, xmm0
	vpmullq ymm0, ymm3, ymm10
	vpshufb ymm0, ymm0, ymm16
	vpand ymm3, ymm8, ymm2
	vpaddq ymm3, ymm8, ymm3
	vpternlogq ymm3, ymm9, ymm2, 200
	vxorps xmm2, xmm2, xmm2
	vpmullq ymm2, ymm3, ymm10
	vpandq ymm2, ymm2, ymm17
	vpternlogq ymm2, ymm0, ymm1, 254
	vmovdqu ymmword ptr [rdx + rbx], ymm2
	add rbx, 32
	cmp r11, rbx
	jne .LBB4_4
	cmp r9, r10
	je .LBB4_8
.LBB4_6:
	mov r11, r10
	shl r11, 6
	add r11, rax
	vpbroadcastq zmm0, qword ptr [rip + .LCPI4_8]
	mov bl, -127
	kmovd k1, ebx
	vpbroadcastq zmm1, qword ptr [rip + .LCPI4_9]
	vpbroadcastq zmm2, qword ptr [rip + .LCPI4_10]
	vmovdqa64 zmm3, zmmword ptr [rip + .LCPI4_18]
	mov bl, -128
	kmovd k2, ebx
	vmovdqa64 zmm4, zmmword ptr [rip + .LCPI4_19]
	mov bl, 1
	kmovd k3, ebx
.LBB4_7:
	vmovdqu64 zmm5, zmmword ptr [r11]
	vpandq zmm6, zmm5, zmm0
	vpaddq zmm6, zmm6, zmm0
	vporq zmm5, zmm6, zmm5
	vpblendmq zmm6 {k1}, zmm5, zmm6
	vpandq zmm6, zmm6, zmm1
	vpmullq zmm6, zmm6, zmm2
	vpsrlvq zmm7, zmm6, zmm3
	vpandq zmm6 {k1}, zmm5, zmm1
	vpxor xmm5, xmm5, xmm5
	vpmullq zmm5, zmm6, zmm2
	vmovdqa64 zmm7 {k2}, zmm5
	vpandq zmm6, zmm7, zmm4
	vpsrlq xmm5, xmm5, 56
	vinserti64x2 zmm6 {k3}, zmm0, xmm5, 0
	vextracti64x4 ymm5, zmm6, 1
	vporq zmm5, zmm6, zmm5
	vextracti128 xmm6, ymm5, 1
	vpor xmm5, xmm5, xmm6
	vpshufd xmm6, xmm5, 238
	vpor xmm5, xmm5, xmm6
	vmovq qword ptr [rdx + 8*r10], xmm5
	inc r10
	add r11, 64
	cmp r9, r10
	jne .LBB4_7
.LBB4_8:
	test r8, r8
	je .LBB4_25
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp r8, 4
	jae .LBB4_11
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB4_21
.LBB4_11:
	cmp r8d, 16
	jae .LBB4_16
	xor r10d, r10d
	xor eax, eax
	jmp .LBB4_13
.LBB4_16:
	mov r10d, esi
	and r10d, 48
	lea rax, [r11 + rax + 12]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI4_20]
	vpxor xmm0, xmm0, xmm0
	xor r11d, r11d
	vpbroadcastq ymm2, qword ptr [rip + .LCPI4_21]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI4_22]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI4_23]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI4_24]
	vpxor xmm6, xmm6, xmm6
	vpxor xmm8, xmm8, xmm8
	vpxor xmm7, xmm7, xmm7
.LBB4_17:
	vpaddq ymm9, ymm1, ymm2
	vpaddq ymm10, ymm1, ymm3
	vpaddq ymm11, ymm1, ymm4
	vmovd xmm12, dword ptr [rax + r11 - 12]
	vmovd xmm13, dword ptr [rax + r11 - 8]
	vmovd xmm14, dword ptr [rax + r11 - 4]
	vmovd xmm15, dword ptr [rax + r11]
	vptestmb k0, xmm12, xmm12
	vptestmb k1, xmm13, xmm13
	vptestmb k2, xmm14, xmm14
	vptestmb k3, xmm15, xmm15
	vpmovm2q ymm12, k0
	vpsrlq ymm12, ymm12, 63
	vpmovm2q ymm13, k1
	vpsrlq ymm13, ymm13, 63
	vpsllvq ymm9, ymm13, ymm9
	vpor ymm8, ymm9, ymm8
	vpmovm2q ymm9, k2
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm10
	vpor ymm7, ymm9, ymm7
	vpmovm2q ymm9, k3
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm11
	vpor ymm0, ymm9, ymm0
	vpsllvq ymm9, ymm12, ymm1
	vpor ymm6, ymm9, ymm6
	add r11, 16
	vpaddq ymm1, ymm1, ymm5
	cmp r10, r11
	jne .LBB4_17
	vpor ymm1, ymm8, ymm6
	vpternlogq ymm0, ymm7, ymm1, 254
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB4_23
	test sil, 12
	je .LBB4_20
.LBB4_13:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vpbroadcastq ymm1, r11
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI4_20]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI4_21]
.LBB4_14:
	vmovd xmm3, dword ptr [r9 + r11]
	vptestmb k0, xmm3, xmm3
	vpmovm2q ymm3, k0
	vpsrlq ymm3, ymm3, 63
	vpsllvq ymm3, ymm3, ymm1
	vpor ymm0, ymm3, ymm0
	add r11, 4
	vpaddq ymm1, ymm1, ymm2
	cmp r10, r11
	jne .LBB4_14
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB4_23
.LBB4_21:
	add r9, r8
.LBB4_22:
	xor r8d, r8d
	cmp byte ptr [rsi], 0
	setne r8b
	shlx r8, r8, r10
	inc r10
	inc rsi
	or rax, r8
	cmp rsi, r9
	jne .LBB4_22
.LBB4_23:
	cmp rdi, rcx
	jae .LBB4_26
	mov qword ptr [rdx + 8*rdi], rax
.LBB4_25:
	pop rbx
	vzeroupper
	ret
.LBB4_20:
	lea rsi, [r9 + r10]
	jmp .LBB4_21
.LBB4_26:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.13]
	mov rsi, rcx
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
