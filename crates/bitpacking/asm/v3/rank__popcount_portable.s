bitpacking::rank::popcount_portable:
	mov eax, esi
	and eax, 7
	lea r8, [8*rsi]
	mov rcx, r8
	and rcx, -64
	je .LBB12_1
	add r8, -64
	test r8b, 64
	jne .LBB12_3
	lea rdx, [rdi + 64]
	vmovdqu ymm0, ymmword ptr [rdi]
	vmovdqu ymm1, ymmword ptr [rdi + 32]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI12_4]
	vpand ymm3, ymm1, ymm2
	vbroadcasti128 ymm4, xmmword ptr [rip + .LCPI12_5]
	vpshufb ymm3, ymm4, ymm3
	vpsrlw ymm1, ymm1, 4
	vpand ymm1, ymm1, ymm2
	vpshufb ymm1, ymm4, ymm1
	vpaddb ymm1, ymm1, ymm3
	vpxor xmm3, xmm3, xmm3
	vpsadbw ymm1, ymm1, ymm3
	vpand ymm5, ymm0, ymm2
	vpshufb ymm5, ymm4, ymm5
	vpsrlw ymm0, ymm0, 4
	vpand ymm0, ymm0, ymm2
	vpshufb ymm0, ymm4, ymm0
	vpaddb ymm0, ymm0, ymm5
	vpsadbw ymm0, ymm0, ymm3
	cmp r8, 64
	jae .LBB12_6
	jmp .LBB12_8
.LBB12_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB12_11
.LBB12_10:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
.LBB12_3:
	vpxor xmm0, xmm0, xmm0
	vpxor xmm1, xmm1, xmm1
	mov rdx, rdi
	cmp r8, 64
	jb .LBB12_8
.LBB12_6:
	add rcx, rdi
	vpbroadcastd ymm2, dword ptr [rip + .LCPI12_4]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI12_5]
	vpxor xmm4, xmm4, xmm4
.LBB12_7:
	vmovdqu ymm5, ymmword ptr [rdx]
	vmovdqu ymm6, ymmword ptr [rdx + 32]
	vmovdqu ymm7, ymmword ptr [rdx + 64]
	vmovdqu ymm8, ymmword ptr [rdx + 96]
	vpand ymm9, ymm6, ymm2
	vpshufb ymm9, ymm3, ymm9
	vpsrlw ymm6, ymm6, 4
	vpand ymm6, ymm6, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm6, ymm9, ymm6
	vpsadbw ymm6, ymm6, ymm4
	vpaddq ymm1, ymm6, ymm1
	vpand ymm6, ymm5, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpsrlw ymm5, ymm5, 4
	vpand ymm5, ymm5, ymm2
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm5, ymm5, ymm6
	vpsadbw ymm5, ymm5, ymm4
	vpaddq ymm0, ymm5, ymm0
	sub rdx, -128
	vpand ymm5, ymm7, ymm2
	vpshufb ymm5, ymm3, ymm5
	vpsrlw ymm6, ymm7, 4
	vpand ymm6, ymm6, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpsadbw ymm5, ymm5, ymm4
	vpaddq ymm0, ymm5, ymm0
	vpand ymm5, ymm8, ymm2
	vpshufb ymm5, ymm3, ymm5
	vpsrlw ymm6, ymm8, 4
	vpand ymm6, ymm6, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpsadbw ymm5, ymm5, ymm4
	vpaddq ymm1, ymm5, ymm1
	cmp rdx, rcx
	jne .LBB12_7
.LBB12_8:
	vpaddq ymm0, ymm0, ymm1
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	test rax, rax
	je .LBB12_10
.LBB12_11:
	movabs rdx, 1152921504606846968
	and rsi, rdx
	lea rdx, [rdi + 8*rsi]
	movabs rsi, 2305843009213693951
	add rax, rsi
	mov sil, 61
	bzhi rsi, rax, rsi
	and eax, 3
	neg rax
	add rax, rsi
	add rax, 4
	vmovq xmm0, rsi
	vpbroadcastq ymm3, xmm0
	vpxor xmm0, xmm0, xmm0
	xor esi, esi
	vmovdqa ymm1, ymmword ptr [rip + .LCPI12_2]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI12_3]
	vpor ymm3, ymm3, ymm2
	vpcmpeqd ymm4, ymm4, ymm4
	vpbroadcastd ymm5, dword ptr [rip + .LCPI12_4]
	vbroadcasti128 ymm6, xmmword ptr [rip + .LCPI12_5]
	vpxor xmm8, xmm8, xmm8
.LBB12_12:
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
	cmp rax, rsi
	jne .LBB12_12
	vblendvpd ymm0, ymm8, ymm9, ymm7
	vextractf128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
