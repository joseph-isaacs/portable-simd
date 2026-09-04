bitpacking::rank::popcount_avx2:
	mov ecx, esi
	and ecx, 3
	mov rax, rsi
	shr rax, 2
	je .LBB23_1
	push rbx
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI23_3]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI23_4]
	mov rdx, rdi
	vpxor xmm2, xmm2, xmm2
	jmp .LBB23_3
.LBB23_8:
	vpsadbw ymm4, ymm4, ymm0
	vpaddq ymm2, ymm4, ymm2
	sub rax, r8
	je .LBB23_9
.LBB23_3:
	cmp rax, 31
	mov r8d, 31
	cmovb r8, rax
	mov r10d, r8d
	shl r10d, 5
	lea r11, [r10 - 32]
	mov ebx, r11d
	not ebx
	mov r9, rdx
	vpxor xmm4, xmm4, xmm4
	test bl, -32
	je .LBB23_6
	mov ebx, r11d
	shr ebx, 5
	inc ebx
	and ebx, 7
	mov r9, rdx
.LBB23_5:
	vmovdqu ymm5, ymmword ptr [r9]
	add r9, 32
	vpsrlw ymm6, ymm5, 4
	vpand ymm5, ymm5, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpand ymm5, ymm6, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm4, ymm4, ymm5
	dec rbx
	jne .LBB23_5
.LBB23_6:
	add rdx, r10
	cmp r11, 224
	jb .LBB23_8
.LBB23_7:
	vmovdqu ymm5, ymmword ptr [r9]
	vmovdqu ymm6, ymmword ptr [r9 + 32]
	vmovdqu ymm7, ymmword ptr [r9 + 64]
	vmovdqu ymm8, ymmword ptr [r9 + 96]
	vpsrlw ymm9, ymm5, 4
	vpand ymm5, ymm5, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpand ymm5, ymm9, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm4, ymm4, ymm5
	vpsrlw ymm5, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpand ymm5, ymm5, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm5, ymm6, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpsrlw ymm5, ymm7, 4
	vpand ymm6, ymm7, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpand ymm5, ymm5, ymm1
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm5, ymm6, ymm5
	vpsrlw ymm6, ymm8, 4
	vpand ymm7, ymm8, ymm1
	vpshufb ymm7, ymm3, ymm7
	vpaddb ymm5, ymm7, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpand ymm5, ymm6, ymm1
	vpshufb ymm5, ymm3, ymm5
	vmovdqu ymm6, ymmword ptr [r9 + 128]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpand ymm6, ymm7, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm5, ymm6
	vmovdqu ymm6, ymmword ptr [r9 + 160]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpand ymm5, ymm7, ymm1
	vpshufb ymm5, ymm3, ymm5
	vmovdqu ymm6, ymmword ptr [r9 + 192]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpand ymm6, ymm7, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm5, ymm6
	vmovdqu ymm6, ymmword ptr [r9 + 224]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpand ymm6, ymm7, ymm1
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm5, ymm6
	vpaddb ymm4, ymm5, ymm4
	add r9, 256
	cmp r9, rdx
	jne .LBB23_7
	jmp .LBB23_8
.LBB23_9:
	vextracti128 xmm0, ymm2, 1
	vpaddq xmm0, xmm2, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	pop rbx
	test rcx, rcx
	je .LBB23_11
.LBB23_12:
	movabs rdx, 1152921504606846972
	and rsi, rdx
	lea rdx, [rdi + 8*rsi]
	movabs rsi, 2305843009213693951
	add rcx, rsi
	mov sil, 61
	bzhi rsi, rcx, rsi
	and ecx, 3
	neg rcx
	lea rcx, [rsi + rcx + 4]
	vpbroadcastq ymm0, rsi
	vpxor xmm3, xmm3, xmm3
	xor esi, esi
	vmovdqa ymm2, ymmword ptr [rip + .LCPI23_2]
.LBB23_13:
	vmovdqa ymm1, ymm3
	vpbroadcastq ymm3, rsi
	vpor ymm3, ymm3, ymm2
	vpcmpleuq k1, ymm3, ymm0
	vmovdqu64 ymm3 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpopcntq ymm3, ymm3
	vpaddq ymm3, ymm3, ymm1
	add rsi, 4
	cmp rcx, rsi
	jne .LBB23_13
	vmovdqa64 ymm1 {k1}, ymm3
	vextracti128 xmm0, ymm1, 1
	vpaddq xmm0, xmm1, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	add rax, rcx
	vzeroupper
	ret
.LBB23_1:
	xor eax, eax
	test rcx, rcx
	jne .LBB23_12
.LBB23_11:
	xor ecx, ecx
	add rax, rcx
	vzeroupper
	ret
