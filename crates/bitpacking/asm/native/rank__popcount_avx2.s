bitpacking::rank::popcount_avx2:
	mov ecx, esi
	and ecx, 3
	mov rax, rsi
	shr rax, 2
	je .LBB10_1
	push rbx
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI10_3]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI10_4]
	mov rdx, rdi
	vpxor xmm2, xmm2, xmm2
	jmp .LBB10_3
.LBB10_8:
	vpsadbw ymm4, ymm4, ymm0
	vpaddq ymm2, ymm4, ymm2
	sub rax, r8
	je .LBB10_9
.LBB10_3:
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
	test bl, 96
	je .LBB10_6
	mov ebx, r11d
	shr ebx, 5
	inc ebx
	and ebx, 3
	mov r9, rdx
.LBB10_5:
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
	jne .LBB10_5
.LBB10_6:
	add rdx, r10
	cmp r11, 96
	jb .LBB10_8
.LBB10_7:
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
	vpaddb ymm4, ymm4, ymm5
	sub r9, -128
	cmp r9, rdx
	jne .LBB10_7
	jmp .LBB10_8
.LBB10_9:
	vextracti128 xmm0, ymm2, 1
	vpaddq xmm0, xmm2, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	pop rbx
	test rcx, rcx
	je .LBB10_11
.LBB10_12:
	movabs rdx, 1152921504606846972
	and rsi, rdx
	lea rdx, [rdi + 8*rsi]
	movabs rsi, 2305843009213693951
	add rcx, rsi
	mov sil, 61
	bzhi rsi, rcx, rsi
	and ecx, 3
	neg rcx
	add rcx, rsi
	add rcx, 4
	vpbroadcastq ymm0, rsi
	vpxor xmm1, xmm1, xmm1
	vmovdqa ymm2, ymmword ptr [rip + .LCPI10_2]
	xor esi, esi
	vpbroadcastd ymm4, dword ptr [rip + .LCPI10_3]
	vbroadcasti128 ymm5, xmmword ptr [rip + .LCPI10_4]
	vpxor xmm6, xmm6, xmm6
.LBB10_13:
	vmovdqa ymm3, ymm6
	vpbroadcastq ymm6, rsi
	vpor ymm6, ymm6, ymm2
	vpcmpleuq k1, ymm6, ymm0
	vmovdqu64 ymm6 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpand ymm7, ymm6, ymm4
	vpshufb ymm7, ymm5, ymm7
	vpsrlw ymm6, ymm6, 4
	vpand ymm6, ymm6, ymm4
	vpshufb ymm6, ymm5, ymm6
	vpaddb ymm6, ymm6, ymm7
	vpsadbw ymm6, ymm6, ymm1
	vpaddq ymm6, ymm6, ymm3
	add rsi, 4
	cmp rcx, rsi
	jne .LBB10_13
	vmovdqa64 ymm3 {k1}, ymm6
	vextracti128 xmm0, ymm3, 1
	vpaddq xmm0, xmm3, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	add rax, rcx
	vzeroupper
	ret
.LBB10_1:
	xor eax, eax
	test rcx, rcx
	jne .LBB10_12
.LBB10_11:
	xor ecx, ecx
	add rax, rcx
	vzeroupper
	ret
