bitpacking::byte_to_bit::bytes_to_bits_scalar:
	test rsi, rsi
	je .LBB5_21
	mov r9, rsi
	lea rax, [rsi + 63]
	shr rax, 6
	cmp rcx, rax
	cmovb rax, rcx
	test rax, rax
	je .LBB5_21
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	lea rcx, [rdi + 12]
	xor r8d, r8d
	mov r15d, 64
	vmovdqa ymm0, ymmword ptr [rip + .LCPI5_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI5_4]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI5_1]
	vmovdqa ymm3, ymmword ptr [rip + .LCPI5_0]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI5_2]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI5_3]
	vpbroadcastq ymm6, qword ptr [rip + .LCPI5_5]
	mov r10, rdi
	mov r11, r9
	jmp .LBB5_3
.LBB5_4:
	xor r13d, r13d
.LBB5_19:
	mov qword ptr [rdx + 8*r8], r13
	inc r8
	add r11, -64
	add rcx, 64
	add r10, 64
	cmp r8, rax
	je .LBB5_20
.LBB5_3:
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
	je .LBB5_4
	add rbx, rdi
	cmp r14, 4
	jae .LBB5_7
	xor r13d, r13d
	xor r14d, r14d
	mov rbp, rbx
	jmp .LBB5_17
.LBB5_7:
	cmp r14, 16
	jae .LBB5_12
	xor r14d, r14d
	xor r13d, r13d
	jmp .LBB5_9
.LBB5_12:
	mov r13d, r12d
	and r13d, 112
	mov r14d, esi
	and r14d, 112
	vpxor xmm7, xmm7, xmm7
	xor ebp, ebp
	vpxor xmm8, xmm8, xmm8
	vpxor xmm10, xmm10, xmm10
	vpxor xmm9, xmm9, xmm9
	vmovdqa ymm11, ymm3
.LBB5_13:
	vpaddq ymm12, ymm11, ymm2
	vpaddq ymm13, ymm11, ymm4
	vmovd xmm14, dword ptr [rcx + rbp - 12]
	vmovd xmm15, dword ptr [rcx + rbp - 8]
	vmovd xmm16, dword ptr [rcx + rbp - 4]
	vpaddq ymm17, ymm11, ymm5
	vmovd xmm18, dword ptr [rcx + rbp]
	vptestmb k0, xmm14, xmm14
	vptestmb k1, xmm15, xmm15
	vptestmb k2, xmm16, xmm16
	vptestmb k3, xmm18, xmm18
	vpmovm2q ymm14, k0
	vpsrlq ymm14, ymm14, 63
	vpmovm2q ymm15, k1
	vpsrlq ymm15, ymm15, 63
	vpmovm2q ymm16, k2
	vpsrlq ymm16, ymm16, 63
	vpmovm2q ymm18, k3
	vpsrlq ymm18, ymm18, 63
	vpandq ymm19, ymm11, ymm1
	vpsllvq ymm14, ymm14, ymm19
	vpor ymm8, ymm14, ymm8
	vpand ymm12, ymm12, ymm1
	vpsllvq ymm12, ymm15, ymm12
	vpor ymm10, ymm12, ymm10
	vpand ymm12, ymm13, ymm1
	vpsllvq ymm12, ymm16, ymm12
	vpor ymm9, ymm12, ymm9
	vpandq ymm12, ymm17, ymm1
	vpsllvq ymm12, ymm18, ymm12
	vpor ymm7, ymm12, ymm7
	add rbp, 16
	vpaddq ymm11, ymm11, ymm6
	cmp r13, rbp
	jne .LBB5_13
	vpor ymm8, ymm10, ymm8
	vpternlogq ymm7, ymm9, ymm8, 254
	vextracti128 xmm8, ymm7, 1
	vpor xmm7, xmm8, xmm7
	vpshufd xmm8, xmm7, 238
	vpor xmm7, xmm8, xmm7
	vmovq r13, xmm7
	cmp rsi, r14
	je .LBB5_19
	test sil, 12
	je .LBB5_16
.LBB5_9:
	mov r15, r14
	and r12d, 124
	mov r14d, esi
	and r14d, 124
	lea rbp, [rbx + r14]
	vmovq xmm7, r13
	vpbroadcastq ymm8, r15
	vpor ymm8, ymm8, ymm0
.LBB5_10:
	vmovd xmm9, dword ptr [r10 + r15]
	vptestmb k0, xmm9, xmm9
	vpmovm2q ymm9, k0
	vpsrlq ymm9, ymm9, 63
	vpand ymm10, ymm8, ymm1
	vpsllvq ymm9, ymm9, ymm10
	vpor ymm7, ymm9, ymm7
	add r15, 4
	vpaddq ymm8, ymm8, ymm2
	cmp r12, r15
	jne .LBB5_10
	vextracti128 xmm8, ymm7, 1
	vpor xmm7, xmm8, xmm7
	vpshufd xmm8, xmm7, 238
	vpor xmm7, xmm8, xmm7
	vmovq r13, xmm7
	cmp rsi, r14
	mov r15d, 64
	je .LBB5_19
.LBB5_17:
	add rbx, rsi
.LBB5_18:
	xor esi, esi
	cmp byte ptr [rbp], 0
	setne sil
	shlx rsi, rsi, r14
	inc r14
	inc rbp
	or r13, rsi
	cmp rbp, rbx
	jne .LBB5_18
	jmp .LBB5_19
.LBB5_16:
	lea rbp, [rbx + r14]
	jmp .LBB5_17
.LBB5_20:
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
.LBB5_21:
	vzeroupper
	ret
