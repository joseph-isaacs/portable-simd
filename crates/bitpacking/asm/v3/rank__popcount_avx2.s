bitpacking::rank::popcount_avx2:
	mov ecx, esi
	and ecx, 3
	mov rax, rsi
	shr rax, 2
	je .LBB9_1
	push rbx
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI9_4]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI9_5]
	mov rdx, rdi
	vpxor xmm2, xmm2, xmm2
	jmp .LBB9_3
.LBB9_8:
	vpsadbw ymm4, ymm4, ymm0
	vpaddq ymm2, ymm4, ymm2
	sub rax, r8
	je .LBB9_9
.LBB9_3:
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
	je .LBB9_6
	mov ebx, r11d
	shr ebx, 5
	inc ebx
	and ebx, 3
	mov r9, rdx
.LBB9_5:
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
	jne .LBB9_5
.LBB9_6:
	add rdx, r10
	cmp r11, 96
	jb .LBB9_8
.LBB9_7:
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
	jne .LBB9_7
	jmp .LBB9_8
.LBB9_9:
	vextracti128 xmm0, ymm2, 1
	vpaddq xmm0, xmm2, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	pop rbx
	test rcx, rcx
	je .LBB9_11
.LBB9_12:
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
	vmovq xmm0, rsi
	vpbroadcastq ymm3, xmm0
	vpxor xmm0, xmm0, xmm0
	xor esi, esi
	vmovdqa ymm1, ymmword ptr [rip + .LCPI9_2]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI9_3]
	vpor ymm3, ymm3, ymm2
	vpcmpeqd ymm4, ymm4, ymm4
	vpbroadcastd ymm5, dword ptr [rip + .LCPI9_4]
	vbroadcasti128 ymm6, xmmword ptr [rip + .LCPI9_5]
	vpxor xmm8, xmm8, xmm8
.LBB9_13:
	vmovq xmm7, rsi
	vpbroadcastq ymm7, xmm7
	vpor ymm7, ymm7, ymm1
	vpxor ymm7, ymm7, ymm2
	vpcmpgtq ymm7, ymm7, ymm3
	vpxor ymm9, ymm7, ymm4
	vpmaskmovq ymm10, ymm9, ymmword ptr [rdx + 8*rsi]
	vmovdqa ymm9, ymm8
	vpand ymm8, ymm10, ymm5
	vpshufb ymm8, ymm6, ymm8
	vpsrlw ymm10, ymm10, 4
	vpand ymm10, ymm10, ymm5
	vpshufb ymm10, ymm6, ymm10
	vpaddb ymm8, ymm10, ymm8
	vpsadbw ymm8, ymm8, ymm0
	vpaddq ymm8, ymm8, ymm9
	add rsi, 4
	cmp rcx, rsi
	jne .LBB9_13
	vblendvpd ymm0, ymm8, ymm9, ymm7
	vextractf128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	add rax, rcx
	vzeroupper
	ret
.LBB9_1:
	xor eax, eax
	test rcx, rcx
	jne .LBB9_12
.LBB9_11:
	xor ecx, ecx
	add rax, rcx
	vzeroupper
	ret
