bitpacking::byte_to_bit::bytes_to_bits_avx2:
	push r15
	push r14
	push rbx
	mov rax, rdi
	mov r8d, esi
	and r8d, 63
	mov rdi, rsi
	shr rdi, 6
	cmp rcx, rdi
	mov r10, rdi
	cmovb r10, rcx
	test r10, r10
	je .LBB3_8
	mov r9d, r10d
	and r9d, 3
	cmp r10, 4
	jae .LBB3_3
	xor r11d, r11d
	jmp .LBB3_6
.LBB3_3:
	movabs r11, 144115188075855868
	and r10, r11
	lea rbx, [rax + 224]
	xor r11d, r11d
	vpxor xmm0, xmm0, xmm0
.LBB3_4:
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 224]
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 192]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 160]
	mov qword ptr [rdx + 8*r11], r15
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 128]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [rdx + 8*r11 + 8], r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 96]
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 64]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 32]
	mov qword ptr [rdx + 8*r11 + 16], r15
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [rdx + 8*r11 + 24], r15
	add r11, 4
	add rbx, 256
	cmp r10, r11
	jne .LBB3_4
	test r9, r9
	je .LBB3_8
.LBB3_6:
	lea r10, [rdx + 8*r11]
	shl r11, 6
	add r11, rax
	add r11, 32
	shl r9d, 3
	xor ebx, ebx
	vpxor xmm0, xmm0, xmm0
.LBB3_7:
	vpcmpeqb ymm1, ymm0, ymmword ptr [r11 + 8*rbx - 32]
	vpcmpeqb ymm2, ymm0, ymmword ptr [r11 + 8*rbx]
	vpmovmskb r14d, ymm1
	vpmovmskb r15d, ymm2
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [r10 + rbx], r15
	add rbx, 8
	cmp r9, rbx
	jne .LBB3_7
.LBB3_8:
	test r8, r8
	je .LBB3_25
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp r8, 4
	jae .LBB3_11
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB3_21
.LBB3_11:
	cmp r8d, 16
	jae .LBB3_16
	xor r10d, r10d
	xor eax, eax
	jmp .LBB3_13
.LBB3_16:
	mov r10d, esi
	and r10d, 48
	add rax, r11
	add rax, 12
	vmovdqa ymm1, ymmword ptr [rip + .LCPI3_0]
	vpxor xmm0, xmm0, xmm0
	xor r11d, r11d
	vpbroadcastq ymm2, qword ptr [rip + .LCPI3_1]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI3_2]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI3_3]
	vpxor xmm5, xmm5, xmm5
	vpcmpeqd xmm6, xmm6, xmm6
	vpbroadcastq ymm7, qword ptr [rip + .LCPI3_4]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI3_5]
	vpxor xmm9, xmm9, xmm9
	vpxor xmm10, xmm10, xmm10
	vpxor xmm11, xmm11, xmm11
.LBB3_17:
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
	jne .LBB3_17
	vpor ymm0, ymm9, ymm0
	vpor ymm0, ymm10, ymm0
	vpor ymm0, ymm11, ymm0
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB3_23
	test sil, 12
	je .LBB3_20
.LBB3_13:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vmovq xmm1, r11
	vpbroadcastq ymm1, xmm1
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI3_0]
	vpxor xmm2, xmm2, xmm2
	vpcmpeqd xmm3, xmm3, xmm3
	vpbroadcastq ymm4, qword ptr [rip + .LCPI3_4]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI3_1]
.LBB3_14:
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
	jne .LBB3_14
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB3_23
.LBB3_21:
	add r9, r8
.LBB3_22:
	xor r8d, r8d
	cmp byte ptr [rsi], 0
	setne r8b
	shlx r8, r8, r10
	inc r10
	inc rsi
	or rax, r8
	cmp rsi, r9
	jne .LBB3_22
.LBB3_23:
	cmp rdi, rcx
	jae .LBB3_26
	mov qword ptr [rdx + 8*rdi], rax
.LBB3_25:
	pop rbx
	pop r14
	pop r15
	vzeroupper
	ret
.LBB3_20:
	lea rsi, [r9 + r10]
	jmp .LBB3_21
.LBB3_26:
	lea rdx, [rip + .Lanon.530bf91f7973b101a7a33e88209e6107.12]
	mov rsi, rcx
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
