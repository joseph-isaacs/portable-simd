bitpacking::byte_to_bit::bytes_to_bits_portable:
	push r15
	push r14
	push rbx
	mov rax, rdi
	mov r8d, esi
	and r8d, 63
	mov rdi, rsi
	shr rdi, 6
	cmp rcx, rdi
	mov r11, rdi
	cmovb r11, rcx
	test r11, r11
	je .LBB5_8
	mov r9d, r11d
	and r9d, 3
	cmp r11, 4
	jae .LBB5_3
	xor r10d, r10d
	jmp .LBB5_6
.LBB5_3:
	movabs r10, 144115188075855868
	and r11, r10
	lea rbx, [rax + 192]
	xor r10d, r10d
	vpxor xmm0, xmm0, xmm0
.LBB5_4:
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 192]
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 160]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 128]
	mov qword ptr [rdx + 8*r10], r15
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 96]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [rdx + 8*r10 + 8], r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 64]
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx - 32]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx]
	mov qword ptr [rdx + 8*r10 + 16], r15
	vpmovmskb r14d, ymm1
	vpcmpeqb ymm1, ymm0, ymmword ptr [rbx + 32]
	vpmovmskb r15d, ymm1
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [rdx + 8*r10 + 24], r15
	add r10, 4
	add rbx, 256
	cmp r11, r10
	jne .LBB5_4
	test r9, r9
	je .LBB5_8
.LBB5_6:
	lea r11, [rdx + 8*r10]
	shl r10, 6
	add r10, rax
	shl r9d, 3
	xor ebx, ebx
	vpxor xmm0, xmm0, xmm0
.LBB5_7:
	vpcmpeqb ymm1, ymm0, ymmword ptr [r10 + 8*rbx]
	vpcmpeqb ymm2, ymm0, ymmword ptr [r10 + 8*rbx + 32]
	vpmovmskb r14d, ymm1
	vpmovmskb r15d, ymm2
	shl r15, 32
	or r15, r14
	not r15
	mov qword ptr [r11 + rbx], r15
	add rbx, 8
	cmp r9, rbx
	jne .LBB5_7
.LBB5_8:
	test r8, r8
	je .LBB5_25
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp r8, 4
	jae .LBB5_11
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB5_21
.LBB5_11:
	cmp r8d, 16
	jae .LBB5_16
	xor r10d, r10d
	xor eax, eax
	jmp .LBB5_13
.LBB5_16:
	mov r10d, esi
	and r10d, 48
	add rax, r11
	add rax, 12
	vmovdqa ymm1, ymmword ptr [rip + .LCPI5_0]
	vpxor xmm0, xmm0, xmm0
	xor r11d, r11d
	vpbroadcastq ymm2, qword ptr [rip + .LCPI5_1]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI5_2]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI5_3]
	vpxor xmm5, xmm5, xmm5
	vpcmpeqd xmm6, xmm6, xmm6
	vpbroadcastq ymm7, qword ptr [rip + .LCPI5_4]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI5_5]
	vpxor xmm9, xmm9, xmm9
	vpxor xmm10, xmm10, xmm10
	vpxor xmm11, xmm11, xmm11
.LBB5_17:
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
	jne .LBB5_17
	vpor ymm0, ymm9, ymm0
	vpor ymm0, ymm10, ymm0
	vpor ymm0, ymm11, ymm0
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB5_23
	test sil, 12
	je .LBB5_20
.LBB5_13:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vmovq xmm1, r11
	vpbroadcastq ymm1, xmm1
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI5_0]
	vpxor xmm2, xmm2, xmm2
	vpcmpeqd xmm3, xmm3, xmm3
	vpbroadcastq ymm4, qword ptr [rip + .LCPI5_4]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI5_1]
.LBB5_14:
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
	jne .LBB5_14
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB5_23
.LBB5_21:
	add r9, r8
.LBB5_22:
	xor r8d, r8d
	cmp byte ptr [rsi], 0
	setne r8b
	shlx r8, r8, r10
	inc r10
	inc rsi
	or rax, r8
	cmp rsi, r9
	jne .LBB5_22
.LBB5_23:
	cmp rdi, rcx
	jae .LBB5_26
	mov qword ptr [rdx + 8*rdi], rax
.LBB5_25:
	pop rbx
	pop r14
	pop r15
	vzeroupper
	ret
.LBB5_20:
	lea rsi, [r9 + r10]
	jmp .LBB5_21
.LBB5_26:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.9]
	mov rsi, rcx
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
