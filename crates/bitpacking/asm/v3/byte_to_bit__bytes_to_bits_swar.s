bitpacking::byte_to_bit::bytes_to_bits_swar:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov rax, rdi
	mov edi, esi
	and edi, 63
	mov qword ptr [rsp + 16], rdi
	mov rdi, rsi
	shr rdi, 6
	cmp rcx, rdi
	mov r9, rdi
	mov qword ptr [rsp + 8], rcx
	cmovb r9, rcx
	test r9, r9
	je .LBB13_8
	cmp r9, 4
	jae .LBB13_3
	xor r10d, r10d
	jmp .LBB13_6
.LBB13_3:
	movabs r10, 144115188075855868
	and r10, r9
	lea r11, [8*r9]
	and r11, -32
	xor ebx, ebx
	vpbroadcastq ymm0, qword ptr [rip + .LCPI13_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI13_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI13_2]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI13_3]
	vmovdqa ymm4, ymmword ptr [rip + .LCPI13_4]
	vmovdqa ymm5, ymmword ptr [rip + .LCPI13_5]
	vmovdqa ymm6, ymmword ptr [rip + .LCPI13_6]
	vmovdqa ymm7, ymmword ptr [rip + .LCPI13_7]
	vmovdqa ymm8, ymmword ptr [rip + .LCPI13_8]
	vmovdqa ymm9, ymmword ptr [rip + .LCPI13_9]
	vpbroadcastq ymm10, qword ptr [rip + .LCPI13_19]
.LBB13_4:
	vmovq xmm11, qword ptr [rax + 8*rbx + 192]
	vmovq xmm12, qword ptr [rax + 8*rbx + 128]
	vpunpcklqdq xmm11, xmm12, xmm11
	vmovq xmm12, qword ptr [rax + 8*rbx + 64]
	vmovq xmm13, qword ptr [rax + 8*rbx]
	vpunpcklqdq xmm12, xmm13, xmm12
	vinserti128 ymm11, ymm12, xmm11, 1
	vpand ymm12, ymm11, ymm0
	vpaddq ymm12, ymm12, ymm0
	vpor ymm11, ymm12, ymm11
	vpand ymm11, ymm11, ymm1
	vpmuludq ymm12, ymm11, ymm2
	vpsrlq ymm13, ymm11, 32
	vpmuludq ymm13, ymm13, ymm3
	vpaddq ymm12, ymm12, ymm13
	vpsllq ymm12, ymm12, 32
	vpmuludq ymm11, ymm11, ymm3
	vpaddq ymm11, ymm11, ymm12
	vpsrlq ymm11, ymm11, 56
	vmovq xmm12, qword ptr [rax + 8*rbx + 200]
	vmovq xmm13, qword ptr [rax + 8*rbx + 136]
	vpunpcklqdq xmm12, xmm13, xmm12
	vmovq xmm13, qword ptr [rax + 8*rbx + 72]
	vmovq xmm14, qword ptr [rax + 8*rbx + 8]
	vpunpcklqdq xmm13, xmm14, xmm13
	vinserti128 ymm12, ymm13, xmm12, 1
	vpand ymm13, ymm12, ymm0
	vpaddq ymm13, ymm13, ymm0
	vpor ymm12, ymm13, ymm12
	vpand ymm12, ymm12, ymm1
	vpmuludq ymm13, ymm12, ymm2
	vpsrlq ymm14, ymm12, 32
	vpmuludq ymm14, ymm14, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpsllq ymm13, ymm13, 32
	vpmuludq ymm12, ymm12, ymm3
	vpaddq ymm12, ymm12, ymm13
	vpshufb ymm12, ymm12, ymm4
	vpor ymm11, ymm12, ymm11
	vmovq xmm12, qword ptr [rax + 8*rbx + 208]
	vmovq xmm13, qword ptr [rax + 8*rbx + 144]
	vpunpcklqdq xmm12, xmm13, xmm12
	vmovq xmm13, qword ptr [rax + 8*rbx + 80]
	vmovq xmm14, qword ptr [rax + 8*rbx + 16]
	vpunpcklqdq xmm13, xmm14, xmm13
	vinserti128 ymm12, ymm13, xmm12, 1
	vpand ymm13, ymm12, ymm0
	vpaddq ymm13, ymm13, ymm0
	vpor ymm12, ymm13, ymm12
	vpand ymm12, ymm12, ymm1
	vpmuludq ymm13, ymm12, ymm2
	vpsrlq ymm14, ymm12, 32
	vpmuludq ymm14, ymm14, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpsllq ymm13, ymm13, 32
	vpmuludq ymm12, ymm12, ymm3
	vpaddq ymm12, ymm12, ymm13
	vpshufb ymm12, ymm12, ymm5
	vmovq xmm13, qword ptr [rax + 8*rbx + 216]
	vmovq xmm14, qword ptr [rax + 8*rbx + 152]
	vpunpcklqdq xmm13, xmm14, xmm13
	vmovq xmm14, qword ptr [rax + 8*rbx + 88]
	vmovq xmm15, qword ptr [rax + 8*rbx + 24]
	vpunpcklqdq xmm14, xmm15, xmm14
	vinserti128 ymm13, ymm14, xmm13, 1
	vpand ymm14, ymm13, ymm0
	vpaddq ymm14, ymm14, ymm0
	vpor ymm13, ymm14, ymm13
	vpand ymm13, ymm13, ymm1
	vpmuludq ymm14, ymm13, ymm2
	vpsrlq ymm15, ymm13, 32
	vpmuludq ymm15, ymm15, ymm3
	vpaddq ymm14, ymm14, ymm15
	vpsllq ymm14, ymm14, 32
	vpmuludq ymm13, ymm13, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpshufb ymm13, ymm13, ymm6
	vpor ymm12, ymm13, ymm12
	vpor ymm11, ymm12, ymm11
	vmovq xmm12, qword ptr [rax + 8*rbx + 224]
	vmovq xmm13, qword ptr [rax + 8*rbx + 160]
	vpunpcklqdq xmm12, xmm13, xmm12
	vmovq xmm13, qword ptr [rax + 8*rbx + 96]
	vmovq xmm14, qword ptr [rax + 8*rbx + 32]
	vpunpcklqdq xmm13, xmm14, xmm13
	vinserti128 ymm12, ymm13, xmm12, 1
	vpand ymm13, ymm12, ymm0
	vpaddq ymm13, ymm13, ymm0
	vpor ymm12, ymm13, ymm12
	vpand ymm12, ymm12, ymm1
	vpmuludq ymm13, ymm12, ymm2
	vpsrlq ymm14, ymm12, 32
	vpmuludq ymm14, ymm14, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpsllq ymm13, ymm13, 32
	vpmuludq ymm12, ymm12, ymm3
	vpaddq ymm12, ymm12, ymm13
	vpshufb ymm12, ymm12, ymm7
	vmovq xmm13, qword ptr [rax + 8*rbx + 232]
	vmovq xmm14, qword ptr [rax + 8*rbx + 168]
	vpunpcklqdq xmm13, xmm14, xmm13
	vmovq xmm14, qword ptr [rax + 8*rbx + 104]
	vmovq xmm15, qword ptr [rax + 8*rbx + 40]
	vpunpcklqdq xmm14, xmm15, xmm14
	vinserti128 ymm13, ymm14, xmm13, 1
	vpand ymm14, ymm13, ymm0
	vpaddq ymm14, ymm14, ymm0
	vpor ymm13, ymm14, ymm13
	vpand ymm13, ymm13, ymm1
	vpmuludq ymm14, ymm13, ymm2
	vpsrlq ymm15, ymm13, 32
	vpmuludq ymm15, ymm15, ymm3
	vpaddq ymm14, ymm14, ymm15
	vpsllq ymm14, ymm14, 32
	vpmuludq ymm13, ymm13, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpshufb ymm13, ymm13, ymm8
	vpor ymm12, ymm13, ymm12
	vmovq xmm13, qword ptr [rax + 8*rbx + 240]
	vmovq xmm14, qword ptr [rax + 8*rbx + 176]
	vpunpcklqdq xmm13, xmm14, xmm13
	vmovq xmm14, qword ptr [rax + 8*rbx + 112]
	vmovq xmm15, qword ptr [rax + 8*rbx + 48]
	vpunpcklqdq xmm14, xmm15, xmm14
	vinserti128 ymm13, ymm14, xmm13, 1
	vpand ymm14, ymm13, ymm0
	vpaddq ymm14, ymm14, ymm0
	vpor ymm13, ymm14, ymm13
	vpand ymm13, ymm13, ymm1
	vpmuludq ymm14, ymm13, ymm2
	vpsrlq ymm15, ymm13, 32
	vpmuludq ymm15, ymm15, ymm3
	vpaddq ymm14, ymm14, ymm15
	vpsllq ymm14, ymm14, 32
	vpmuludq ymm13, ymm13, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpshufb ymm13, ymm13, ymm9
	vpor ymm12, ymm13, ymm12
	vpor ymm11, ymm12, ymm11
	vmovq xmm12, qword ptr [rax + 8*rbx + 248]
	vmovq xmm13, qword ptr [rax + 8*rbx + 184]
	vpunpcklqdq xmm12, xmm13, xmm12
	vmovq xmm13, qword ptr [rax + 8*rbx + 120]
	vmovq xmm14, qword ptr [rax + 8*rbx + 56]
	vpunpcklqdq xmm13, xmm14, xmm13
	vinserti128 ymm12, ymm13, xmm12, 1
	vpand ymm13, ymm12, ymm0
	vpaddq ymm13, ymm13, ymm0
	vpor ymm12, ymm13, ymm12
	vpand ymm12, ymm12, ymm1
	vpmuludq ymm13, ymm12, ymm2
	vpsrlq ymm14, ymm12, 32
	vpmuludq ymm14, ymm14, ymm3
	vpaddq ymm13, ymm13, ymm14
	vpsllq ymm13, ymm13, 32
	vpmuludq ymm12, ymm12, ymm3
	vpaddq ymm12, ymm12, ymm13
	vpand ymm12, ymm12, ymm10
	vpor ymm11, ymm12, ymm11
	vmovdqu ymmword ptr [rdx + rbx], ymm11
	add rbx, 32
	cmp r11, rbx
	jne .LBB13_4
	cmp r9, r10
	je .LBB13_8
.LBB13_6:
	movabs r11, -9187201950435737472
	movabs rbx, 9187201950435737471
	movabs r14, 567382630219905
	mov r15, r10
	shl r15, 6
	add r15, rax
	vpbroadcastq ymm0, qword ptr [rip + .LCPI13_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI13_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI13_2]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI13_3]
	vmovdqa ymm4, ymmword ptr [rip + .LCPI13_11]
	movabs r12, -72057594037927936
	vmovdqa xmm5, xmmword ptr [rip + .LCPI13_12]
.LBB13_7:
	mov rbp, qword ptr [r15]
	mov r13, rbp
	and r13, rbx
	add r13, rbx
	or r13, rbp
	and r13, r11
	imul r13, r14
	shr r13, 56
	vmovdqu ymm6, ymmword ptr [r15 + 8]
	vpand ymm7, ymm6, ymm0
	vpaddq ymm7, ymm7, ymm0
	vpor ymm6, ymm7, ymm6
	vpand ymm6, ymm6, ymm1
	vpmuludq ymm7, ymm6, ymm2
	vpsrlq ymm8, ymm6, 32
	vpmuludq ymm8, ymm8, ymm3
	vpaddq ymm7, ymm8, ymm7
	vpsllq ymm7, ymm7, 32
	vpmuludq ymm6, ymm6, ymm3
	vpaddq ymm6, ymm6, ymm7
	vpshufb ymm6, ymm6, ymm4
	mov r8, qword ptr [r15 + 56]
	mov rbp, r8
	and rbp, rbx
	add rbp, rbx
	or rbp, r8
	and rbp, r11
	imul rbp, r14
	and rbp, r12
	vextracti128 xmm7, ymm6, 1
	vpor xmm6, xmm6, xmm7
	vpshufd xmm7, xmm6, 238
	vpor xmm6, xmm6, xmm7
	vmovdqu xmm7, xmmword ptr [r15 + 40]
	vpand xmm8, xmm7, xmm0
	vpaddq xmm8, xmm8, xmm0
	vpor xmm7, xmm8, xmm7
	vpand xmm7, xmm7, xmm1
	vpmuludq xmm8, xmm7, xmm2
	vpsrlq xmm9, xmm7, 32
	vpmuludq xmm9, xmm9, xmm3
	vpaddq xmm8, xmm8, xmm9
	vpsllq xmm8, xmm8, 32
	vpmuludq xmm7, xmm7, xmm3
	vpaddq xmm7, xmm8, xmm7
	vpshufb xmm7, xmm7, xmm5
	vmovq xmm8, rbp
	vpunpcklqdq xmm6, xmm6, xmm8
	vpor xmm6, xmm6, xmm7
	vpshufd xmm7, xmm6, 238
	vpor xmm6, xmm6, xmm7
	vmovq r8, xmm6
	or r8, r13
	mov qword ptr [rdx + 8*r10], r8
	inc r10
	add r15, 64
	cmp r9, r10
	jne .LBB13_7
.LBB13_8:
	mov rcx, qword ptr [rsp + 16]
	test rcx, rcx
	je .LBB13_25
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp rcx, 4
	jae .LBB13_11
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB13_21
.LBB13_11:
	cmp ecx, 16
	jae .LBB13_16
	xor r10d, r10d
	xor eax, eax
	jmp .LBB13_13
.LBB13_16:
	mov r10d, esi
	and r10d, 48
	add rax, r11
	add rax, 12
	vmovdqa ymm1, ymmword ptr [rip + .LCPI13_13]
	vpxor xmm0, xmm0, xmm0
	xor r11d, r11d
	vpbroadcastq ymm2, qword ptr [rip + .LCPI13_14]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI13_15]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI13_16]
	vpxor xmm5, xmm5, xmm5
	vpcmpeqd xmm6, xmm6, xmm6
	vpbroadcastq ymm7, qword ptr [rip + .LCPI13_17]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI13_18]
	vpxor xmm9, xmm9, xmm9
	vpxor xmm10, xmm10, xmm10
	vpxor xmm11, xmm11, xmm11
.LBB13_17:
	vpaddq ymm12, ymm1, ymm2
	vmovd xmm13, dword ptr [rax + r11 - 8]
	vpcmpeqb xmm13, xmm13, xmm5
	vpxor xmm13, xmm13, xmm6
	vpmovzxbq ymm13, xmm13
	vpand ymm13, ymm13, ymm7
	vpsllvq ymm12, ymm13, ymm12
	vpaddq ymm13, ymm1, ymm3
	vpor ymm9, ymm12, ymm9
	vmovd xmm12, dword ptr [rax + r11 - 4]
	vpcmpeqb xmm12, xmm12, xmm5
	vpxor xmm12, xmm12, xmm6
	vpmovzxbq ymm12, xmm12
	vpand ymm12, ymm12, ymm7
	vpsllvq ymm12, ymm12, ymm13
	vpaddq ymm13, ymm1, ymm4
	vpor ymm10, ymm12, ymm10
	vmovd xmm12, dword ptr [rax + r11]
	vpcmpeqb xmm12, xmm12, xmm5
	vpxor xmm12, xmm12, xmm6
	vpmovzxbq ymm12, xmm12
	vpand ymm12, ymm12, ymm7
	vpsllvq ymm12, ymm12, ymm13
	vpor ymm11, ymm12, ymm11
	vmovd xmm12, dword ptr [rax + r11 - 12]
	vpcmpeqb xmm12, xmm12, xmm5
	vpxor xmm12, xmm12, xmm6
	vpmovzxbq ymm12, xmm12
	vpand ymm12, ymm12, ymm7
	vpsllvq ymm12, ymm12, ymm1
	vpor ymm0, ymm12, ymm0
	add r11, 16
	vpaddq ymm1, ymm8, ymm1
	cmp r10, r11
	jne .LBB13_17
	vpor ymm0, ymm9, ymm0
	vpor ymm0, ymm10, ymm0
	vpor ymm0, ymm11, ymm0
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp ecx, r10d
	je .LBB13_23
	test sil, 12
	je .LBB13_20
.LBB13_13:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vmovq xmm1, r11
	vpbroadcastq ymm1, xmm1
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI13_13]
	vpxor xmm2, xmm2, xmm2
	vpcmpeqd xmm3, xmm3, xmm3
	vpbroadcastq ymm4, qword ptr [rip + .LCPI13_17]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI13_14]
.LBB13_14:
	vmovd xmm6, dword ptr [r9 + r11]
	vpcmpeqb xmm6, xmm6, xmm2
	vpxor xmm6, xmm6, xmm3
	vpmovzxbq ymm6, xmm6
	vpand ymm6, ymm6, ymm4
	vpsllvq ymm6, ymm6, ymm1
	vpor ymm0, ymm6, ymm0
	add r11, 4
	vpaddq ymm1, ymm1, ymm5
	cmp r10, r11
	jne .LBB13_14
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp ecx, r10d
	je .LBB13_23
.LBB13_21:
	add r9, rcx
.LBB13_22:
	xor ecx, ecx
	cmp byte ptr [rsi], 0
	setne cl
	shlx rcx, rcx, r10
	inc r10
	inc rsi
	or rax, rcx
	cmp rsi, r9
	jne .LBB13_22
.LBB13_23:
	mov rsi, qword ptr [rsp + 8]
	cmp rdi, rsi
	jae .LBB13_26
	mov qword ptr [rdx + 8*rdi], rax
.LBB13_25:
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB13_20:
	lea rsi, [r9 + r10]
	jmp .LBB13_21
.LBB13_26:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.45]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
