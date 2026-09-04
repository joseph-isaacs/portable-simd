bitpacking::byte_to_bit::bytes_to_bits_scalar:
	test rsi, rsi
	je .LBB14_21
	mov r9, rsi
	lea rax, [rsi + 63]
	shr rax, 6
	cmp rcx, rax
	cmovb rax, rcx
	test rax, rax
	je .LBB14_21
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	lea rcx, [rdi + 12]
	xor r8d, r8d
	mov r15d, 64
	vmovdqa ymm0, ymmword ptr [rip + .LCPI14_0]
	vpxor xmm1, xmm1, xmm1
	vpcmpeqd xmm2, xmm2, xmm2
	vpbroadcastq ymm3, qword ptr [rip + .LCPI14_4]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI14_5]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI14_1]
	vpbroadcastq ymm6, qword ptr [rip + .LCPI14_2]
	vpbroadcastq ymm7, qword ptr [rip + .LCPI14_3]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI14_6]
	mov r10, rdi
	mov r11, r9
	jmp .LBB14_3
.LBB14_4:
	xor r13d, r13d
.LBB14_19:
	mov qword ptr [rdx + 8*r8], r13
	inc r8
	add r11, -64
	add rcx, 64
	add r10, 64
	cmp r8, rax
	je .LBB14_20
.LBB14_3:
	cmp r11, 64
	mov r12d, 64
	cmovb r12, r11
	mov rbx, r8
	shl rbx, 6
	mov rsi, r9
	sub rsi, rbx
	cmp rsi, 64
	cmovae rsi, r15
	mov r14, r9
	sub r14, rbx
	je .LBB14_4
	add rbx, rdi
	cmp r14, 4
	jae .LBB14_7
	xor r13d, r13d
	xor r14d, r14d
	mov rbp, rbx
	jmp .LBB14_17
.LBB14_7:
	cmp r14, 16
	jae .LBB14_12
	xor r14d, r14d
	xor r13d, r13d
	jmp .LBB14_9
.LBB14_12:
	mov r13d, r12d
	and r13d, 112
	mov r14d, esi
	and r14d, 112
	vpxor xmm9, xmm9, xmm9
	xor ebp, ebp
	vpxor xmm10, xmm10, xmm10
	vpxor xmm11, xmm11, xmm11
	vpxor xmm12, xmm12, xmm12
	vmovdqa ymm13, ymm0
.LBB14_13:
	vmovd xmm14, dword ptr [rcx + rbp - 12]
	vpcmpeqb xmm14, xmm14, xmm1
	vpxor xmm14, xmm14, xmm2
	vpmovzxbq ymm14, xmm14
	vpand ymm14, ymm14, ymm3
	vpand ymm15, ymm13, ymm4
	vpsllvq ymm14, ymm14, ymm15
	vpaddq ymm15, ymm13, ymm5
	vpor ymm9, ymm14, ymm9
	vmovd xmm14, dword ptr [rcx + rbp - 8]
	vpcmpeqb xmm14, xmm14, xmm1
	vpxor xmm14, xmm14, xmm2
	vpmovzxbq ymm14, xmm14
	vpand ymm14, ymm14, ymm3
	vpand ymm15, ymm15, ymm4
	vpsllvq ymm14, ymm14, ymm15
	vpaddq ymm15, ymm13, ymm6
	vpor ymm10, ymm14, ymm10
	vmovd xmm14, dword ptr [rcx + rbp - 4]
	vpcmpeqb xmm14, xmm14, xmm1
	vpxor xmm14, xmm14, xmm2
	vpmovzxbq ymm14, xmm14
	vpand ymm14, ymm14, ymm3
	vpand ymm15, ymm15, ymm4
	vpsllvq ymm14, ymm14, ymm15
	vpaddq ymm15, ymm13, ymm7
	vpor ymm11, ymm14, ymm11
	vmovd xmm14, dword ptr [rcx + rbp]
	vpcmpeqb xmm14, xmm14, xmm1
	vpxor xmm14, xmm14, xmm2
	vpmovzxbq ymm14, xmm14
	vpand ymm14, ymm14, ymm3
	vpand ymm15, ymm15, ymm4
	vpsllvq ymm14, ymm14, ymm15
	vpor ymm12, ymm14, ymm12
	add rbp, 16
	vpaddq ymm13, ymm13, ymm8
	cmp r13, rbp
	jne .LBB14_13
	vpor ymm9, ymm10, ymm9
	vpor ymm9, ymm11, ymm9
	vpor ymm9, ymm12, ymm9
	vextracti128 xmm10, ymm9, 1
	vpor xmm9, xmm9, xmm10
	vpshufd xmm10, xmm9, 238
	vpor xmm9, xmm9, xmm10
	vmovq r13, xmm9
	cmp rsi, r14
	je .LBB14_19
	test sil, 12
	je .LBB14_16
.LBB14_9:
	mov r15, r14
	and r12d, 124
	mov r14d, esi
	and r14d, 124
	lea rbp, [rbx + r14]
	vmovq xmm9, r13
	vmovq xmm10, r15
	vpbroadcastq ymm10, xmm10
	vpor ymm10, ymm10, ymm0
.LBB14_10:
	vmovd xmm11, dword ptr [r10 + r15]
	vpcmpeqb xmm11, xmm11, xmm1
	vpxor xmm11, xmm11, xmm2
	vpmovzxbq ymm11, xmm11
	vpand ymm11, ymm11, ymm3
	vpand ymm12, ymm10, ymm4
	vpsllvq ymm11, ymm11, ymm12
	vpor ymm9, ymm11, ymm9
	add r15, 4
	vpaddq ymm10, ymm10, ymm5
	cmp r12, r15
	jne .LBB14_10
	vextracti128 xmm10, ymm9, 1
	vpor xmm9, xmm9, xmm10
	vpshufd xmm10, xmm9, 238
	vpor xmm9, xmm9, xmm10
	vmovq r13, xmm9
	cmp rsi, r14
	mov r15d, 64
	je .LBB14_19
.LBB14_17:
	add rbx, rsi
.LBB14_18:
	xor esi, esi
	cmp byte ptr [rbp], 0
	setne sil
	shlx rsi, rsi, r14
	inc r14
	inc rbp
	or r13, rsi
	cmp rbp, rbx
	jne .LBB14_18
	jmp .LBB14_19
.LBB14_16:
	lea rbp, [rbx + r14]
	jmp .LBB14_17
.LBB14_20:
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
.LBB14_21:
	vzeroupper
	ret
