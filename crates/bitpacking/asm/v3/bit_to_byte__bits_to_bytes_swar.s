bitpacking::bit_to_byte::bits_to_bytes_swar:
	sub rsp, 72
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB8_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB8_9
	cmp rcx, 4
	jae .LBB8_4
	xor eax, eax
	jmp .LBB8_7
.LBB8_4:
	movabs rax, 144115188075855868
	and rax, rcx
	lea rsi, [8*rcx]
	and rsi, -32
	xor r8d, r8d
	vpbroadcastq ymm0, qword ptr [rip + .LCPI8_3]
	vmovdqu ymmword ptr [rsp], ymm0
	vpbroadcastq ymm7, qword ptr [rip + .LCPI8_7]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI8_8]
	vpbroadcastq ymm9, qword ptr [rip + .LCPI8_9]
	vpbroadcastq ymm10, qword ptr [rip + .LCPI8_10]
.LBB8_5:
	vmovdqu ymm11, ymmword ptr [rdi + r8]
	vpshufb ymm0, ymm11, ymmword ptr [rip + .LCPI8_0]
	vpshufb ymm14, ymm11, ymmword ptr [rip + .LCPI8_1]
	vpshufb ymm2, ymm11, ymmword ptr [rip + .LCPI8_2]
	vpsrlq ymm1, ymm11, 56
	vpshufb ymm12, ymm11, ymmword ptr [rip + .LCPI8_4]
	vpand ymm13, ymm11, ymmword ptr [rsp]
	vpshufb ymm15, ymm11, ymmword ptr [rip + .LCPI8_5]
	vpshufb ymm11, ymm11, ymmword ptr [rip + .LCPI8_6]
	vpmuludq ymm4, ymm11, ymm7
	vpmuludq ymm11, ymm11, ymm8
	vpsllq ymm11, ymm11, 32
	vpor ymm4, ymm11, ymm4
	vpmuludq ymm11, ymm15, ymm7
	vpmuludq ymm15, ymm15, ymm8
	vpsllq ymm15, ymm15, 32
	vpor ymm11, ymm11, ymm15
	vpmuludq ymm15, ymm13, ymm7
	vpmuludq ymm13, ymm13, ymm8
	vpsllq ymm13, ymm13, 32
	vpor ymm13, ymm15, ymm13
	vpmuludq ymm15, ymm12, ymm7
	vpmuludq ymm12, ymm12, ymm8
	vpsllq ymm12, ymm12, 32
	vpor ymm12, ymm15, ymm12
	vpand ymm12, ymm12, ymm9
	vpand ymm13, ymm13, ymm9
	vpand ymm11, ymm11, ymm9
	vpand ymm4, ymm9, ymm4
	vpaddq ymm4, ymm10, ymm4
	vpaddq ymm15, ymm11, ymm10
	vpaddq ymm11, ymm13, ymm10
	vpaddq ymm12, ymm12, ymm10
	vpsrlq ymm13, ymm12, 7
	vpsrlq ymm11, ymm11, 7
	vpsrlq ymm15, ymm15, 7
	vpsrlq ymm12, ymm4, 7
	vpmuludq ymm4, ymm2, ymm7
	vpmuludq ymm2, ymm8, ymm2
	vpsllq ymm2, ymm2, 32
	vpor ymm2, ymm4, ymm2
	vpmuludq ymm4, ymm1, ymm7
	vpmuludq ymm1, ymm8, ymm1
	vpsllq ymm1, ymm1, 32
	vpor ymm1, ymm4, ymm1
	vpmuludq ymm4, ymm0, ymm7
	vpmuludq ymm0, ymm8, ymm0
	vpsllq ymm0, ymm0, 32
	vpor ymm0, ymm4, ymm0
	vpmuludq ymm4, ymm14, ymm7
	vpmuludq ymm14, ymm14, ymm8
	vpsllq ymm14, ymm14, 32
	vpor ymm4, ymm14, ymm4
	vpand ymm4, ymm9, ymm4
	vpand ymm0, ymm9, ymm0
	vpand ymm1, ymm9, ymm1
	vpand ymm2, ymm9, ymm2
	vpaddq ymm2, ymm10, ymm2
	vpaddq ymm1, ymm10, ymm1
	vpaddq ymm0, ymm10, ymm0
	vpaddq ymm4, ymm10, ymm4
	vpsrlq ymm4, ymm4, 7
	vpsrlq ymm0, ymm0, 7
	vpsrlq ymm1, ymm1, 7
	vpsrlq ymm2, ymm2, 7
	vpunpckhqdq ymm14, ymm2, ymm1
	vpunpckhqdq ymm5, ymm0, ymm4
	vperm2i128 ymm3, ymm5, ymm14, 49
	vmovdqu ymmword ptr [rsp + 32], ymm3
	vpunpckhqdq ymm14, ymm12, ymm15
	vpunpckhqdq ymm6, ymm11, ymm13
	vperm2i128 ymm6, ymm6, ymm14, 49
	vpunpcklqdq ymm14, ymm2, ymm1
	vpunpcklqdq ymm3, ymm0, ymm4
	vperm2i128 ymm3, ymm3, ymm14, 49
	vpunpcklqdq ymm14, ymm12, ymm15
	vpunpcklqdq ymm5, ymm11, ymm13
	vperm2i128 ymm5, ymm5, ymm14, 49
	vinserti128 ymm1, ymm4, xmm1, 1
	vinserti128 ymm0, ymm0, xmm2, 1
	vinserti128 ymm2, ymm13, xmm15, 1
	vpand ymm4, ymm7, ymmword ptr [rsp + 32]
	vmovdqu ymmword ptr [rdx + 8*r8 + 224], ymm4
	vinserti128 ymm4, ymm11, xmm12, 1
	vpand ymm6, ymm6, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 192], ymm6
	vpand ymm3, ymm3, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 160], ymm3
	vpunpckhqdq ymm3, ymm0, ymm1
	vpunpcklqdq ymm0, ymm0, ymm1
	vpand ymm1, ymm5, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 128], ymm1
	vpand ymm1, ymm3, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 96], ymm1
	vpunpckhqdq ymm1, ymm4, ymm2
	vpunpcklqdq ymm2, ymm4, ymm2
	vpand ymm1, ymm1, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 64], ymm1
	vpand ymm0, ymm0, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8 + 32], ymm0
	vpand ymm0, ymm2, ymm7
	vmovdqu ymmword ptr [rdx + 8*r8], ymm0
	add r8, 32
	cmp rsi, r8
	jne .LBB8_5
	cmp rcx, rax
	je .LBB8_9
.LBB8_7:
	mov rsi, rax
	shl rsi, 6
	add rdx, rsi
	add rdx, 32
	vmovdqa ymm0, ymmword ptr [rip + .LCPI8_11]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI8_7]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI8_8]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI8_9]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI8_10]
	vmovdqa ymm5, ymmword ptr [rip + .LCPI8_12]
.LBB8_8:
	vpbroadcastq ymm6, qword ptr [rdi + 8*rax]
	vpshufb ymm7, ymm6, ymm0
	vpmuludq ymm8, ymm7, ymm1
	vpmuludq ymm7, ymm7, ymm2
	vpsllq ymm7, ymm7, 32
	vpor ymm7, ymm8, ymm7
	vpand ymm7, ymm7, ymm3
	vpaddq ymm7, ymm7, ymm4
	vpsrlq ymm7, ymm7, 7
	vpand ymm7, ymm7, ymm1
	vmovdqu ymmword ptr [rdx - 32], ymm7
	vpshufb ymm6, ymm6, ymm5
	vpmuludq ymm7, ymm6, ymm1
	vpmuludq ymm6, ymm6, ymm2
	vpsllq ymm6, ymm6, 32
	vpor ymm6, ymm7, ymm6
	vpand ymm6, ymm6, ymm3
	vpaddq ymm6, ymm6, ymm4
	vpsrlq ymm6, ymm6, 7
	vpand ymm6, ymm6, ymm1
	vmovdqu ymmword ptr [rdx], ymm6
	inc rax
	add rdx, 64
	cmp rcx, rax
	jne .LBB8_8
.LBB8_9:
	add rsp, 72
	vzeroupper
	ret
.LBB8_10:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.35]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.39]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
