bitpacking::bit_to_byte::bits_to_bytes_scalar:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB11_9
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB11_8
	cmp rcx, 1
	jne .LBB11_4
	xor eax, eax
	jmp .LBB11_7
.LBB11_4:
	movabs rsi, 144115188075855870
	and rsi, rcx
	lea r8, [rdx + 96]
	xor eax, eax
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI11_0]
	vmovdqa64 zmm1, zmmword ptr [rip + .LCPI11_1]
	vmovdqa64 zmm2, zmmword ptr [rip + .LCPI11_2]
	vmovdqa64 zmm3, zmmword ptr [rip + .LCPI11_3]
	vmovdqa64 zmm4, zmmword ptr [rip + .LCPI11_4]
	vmovdqa64 zmm5, zmmword ptr [rip + .LCPI11_5]
	vmovdqa64 zmm6, zmmword ptr [rip + .LCPI11_6]
	vmovdqa64 zmm7, zmmword ptr [rip + .LCPI11_7]
	vpbroadcastd ymm8, dword ptr [rip + .LCPI11_9]
.LBB11_5:
	vpbroadcastq zmm9, qword ptr [rdi + 8*rax]
	vpsrlvq zmm10, zmm9, zmm0
	vpsrlvq zmm11, zmm9, zmm1
	vpsrlvq zmm12, zmm9, zmm2
	vpsrlvq zmm13, zmm9, zmm3
	vpsrlvq zmm14, zmm9, zmm4
	vpsrlvq zmm15, zmm9, zmm5
	vpsrlvq zmm16, zmm9, zmm6
	vpsrlvq zmm9, zmm9, zmm7
	vpmovqb xmm13, zmm13
	vpmovqb xmm12, zmm12
	vpmovqb xmm11, zmm11
	vpmovqb xmm10, zmm10
	vinserti128 ymm12, ymm13, xmm12, 1
	vinserti128 ymm10, ymm11, xmm10, 1
	vpmovqb xmm9, zmm9
	vpmovqb xmm11, zmm16
	vpunpcklqdq ymm10, ymm10, ymm12
	vinserti128 ymm9, ymm9, xmm11, 1
	vpmovqb xmm11, zmm15
	vpmovqb xmm12, zmm14
	vinserti128 ymm11, ymm11, xmm12, 1
	vpunpcklqdq ymm9, ymm11, ymm9
	vpand ymm10, ymm10, ymm8
	vpand ymm9, ymm9, ymm8
	vmovdqu ymmword ptr [r8 - 96], ymm10
	vmovdqu ymmword ptr [r8 - 64], ymm9
	vpbroadcastq zmm9, qword ptr [rdi + 8*rax + 8]
	vpsrlvq zmm10, zmm9, zmm0
	vpsrlvq zmm11, zmm9, zmm1
	vpsrlvq zmm12, zmm9, zmm2
	vpsrlvq zmm13, zmm9, zmm3
	vpsrlvq zmm14, zmm9, zmm4
	vpsrlvq zmm15, zmm9, zmm5
	vpsrlvq zmm16, zmm9, zmm6
	vpmovqb xmm13, zmm13
	vpsrlvq zmm9, zmm9, zmm7
	vpmovqb xmm12, zmm12
	vinserti128 ymm12, ymm13, xmm12, 1
	vpmovqb xmm11, zmm11
	vpmovqb xmm10, zmm10
	vinserti128 ymm10, ymm11, xmm10, 1
	vpunpcklqdq ymm10, ymm10, ymm12
	vpmovqb xmm9, zmm9
	vpmovqb xmm11, zmm16
	vpmovqb xmm12, zmm15
	vpmovqb xmm13, zmm14
	vinserti128 ymm9, ymm9, xmm11, 1
	vinserti128 ymm11, ymm12, xmm13, 1
	vpunpcklqdq ymm9, ymm11, ymm9
	vpand ymm10, ymm10, ymm8
	vmovdqu ymmword ptr [r8 - 32], ymm10
	vpand ymm9, ymm9, ymm8
	vmovdqu ymmword ptr [r8], ymm9
	add rax, 2
	sub r8, -128
	cmp rsi, rax
	jne .LBB11_5
	test cl, 1
	je .LBB11_8
.LBB11_7:
	vpbroadcastq zmm0, qword ptr [rdi + 8*rax]
	vpsrlvq zmm1, zmm0, zmmword ptr [rip + .LCPI11_0]
	vpsrlvq zmm2, zmm0, zmmword ptr [rip + .LCPI11_1]
	vpsrlvq zmm3, zmm0, zmmword ptr [rip + .LCPI11_2]
	vpsrlvq zmm4, zmm0, zmmword ptr [rip + .LCPI11_3]
	vpsrlvq zmm5, zmm0, zmmword ptr [rip + .LCPI11_4]
	vpsrlvq zmm6, zmm0, zmmword ptr [rip + .LCPI11_5]
	vpsrlvq zmm7, zmm0, zmmword ptr [rip + .LCPI11_6]
	vpsrlvq zmm0, zmm0, zmmword ptr [rip + .LCPI11_7]
	shl rax, 6
	vpmovqb xmm4, zmm4
	vpmovqb xmm3, zmm3
	vinserti128 ymm3, ymm4, xmm3, 1
	vpmovqb xmm2, zmm2
	vpmovqb xmm1, zmm1
	vinserti128 ymm1, ymm2, xmm1, 1
	vpunpcklqdq ymm1, ymm1, ymm3
	vpmovqb xmm0, zmm0
	vpmovqb xmm2, zmm7
	vpmovqb xmm3, zmm6
	vinserti128 ymm0, ymm0, xmm2, 1
	vpmovqb xmm2, zmm5
	vinserti128 ymm2, ymm3, xmm2, 1
	vpunpcklqdq ymm0, ymm2, ymm0
	vpbroadcastd ymm2, dword ptr [rip + .LCPI11_9]
	vpand ymm1, ymm1, ymm2
	vpand ymm0, ymm0, ymm2
	vmovdqu ymmword ptr [rdx + rax], ymm1
	vmovdqu ymmword ptr [rdx + rax + 32], ymm0
.LBB11_8:
	pop rax
	vzeroupper
	ret
.LBB11_9:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.38]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.44]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
