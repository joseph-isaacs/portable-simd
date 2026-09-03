bitpacking::rank::popcount_portable_u8:
	push rbx
	mov eax, esi
	and eax, 7
	mov rdx, rsi
	xor ecx, ecx
	shr rdx, 3
	je .LBB13_1
	vpbroadcastd ymm0, dword ptr [rip + .LCPI13_4]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI13_5]
	vpxor xmm2, xmm2, xmm2
	mov r8, rdi
	jmp .LBB13_4
.LBB13_8:
	sub rdx, r9
	vpsadbw ymm3, ymm3, ymm2
	vpsadbw ymm4, ymm4, ymm2
	vpaddq ymm3, ymm3, ymm4
	vextracti128 xmm4, ymm3, 1
	vpaddq xmm3, xmm3, xmm4
	vpshufd xmm4, xmm3, 238
	vpaddq xmm3, xmm3, xmm4
	vpextrw r9d, xmm3, 0
	add rcx, r9
	test rdx, rdx
	je .LBB13_1
.LBB13_4:
	cmp rdx, 31
	mov r9d, 31
	cmovb r9, rdx
	mov r11d, r9d
	shl r11d, 6
	lea rbx, [r11 - 64]
	mov r10, r8
	vpxor xmm3, xmm3, xmm3
	vpxor xmm4, xmm4, xmm4
	test bl, 64
	jne .LBB13_6
	lea r10, [r8 + 64]
	vmovdqu ymm3, ymmword ptr [r8]
	vmovdqu ymm4, ymmword ptr [r8 + 32]
	vpand ymm5, ymm4, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm4, ymm4, 4
	vpand ymm4, ymm4, ymm0
	vpshufb ymm4, ymm1, ymm4
	vpaddb ymm4, ymm4, ymm5
	vpand ymm5, ymm3, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm3, ymm3, 4
	vpand ymm3, ymm3, ymm0
	vpshufb ymm3, ymm1, ymm3
	vpaddb ymm3, ymm3, ymm5
.LBB13_6:
	add r8, r11
	test rbx, rbx
	je .LBB13_8
.LBB13_7:
	vmovdqu ymm5, ymmword ptr [r10]
	vmovdqu ymm6, ymmword ptr [r10 + 32]
	vmovdqu ymm7, ymmword ptr [r10 + 64]
	vmovdqu ymm8, ymmword ptr [r10 + 96]
	vpand ymm9, ymm6, ymm0
	vpshufb ymm9, ymm1, ymm9
	vpaddb ymm4, ymm9, ymm4
	vpsrlw ymm6, ymm6, 4
	vpand ymm6, ymm6, ymm0
	vpshufb ymm6, ymm1, ymm6
	vpaddb ymm4, ymm6, ymm4
	vpand ymm6, ymm5, ymm0
	vpshufb ymm6, ymm1, ymm6
	vpaddb ymm3, ymm6, ymm3
	vpsrlw ymm5, ymm5, 4
	vpand ymm5, ymm5, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpaddb ymm3, ymm5, ymm3
	sub r10, -128
	vpand ymm5, ymm7, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm6, ymm7, 4
	vpand ymm6, ymm6, ymm0
	vpshufb ymm6, ymm1, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpaddb ymm3, ymm5, ymm3
	vpand ymm5, ymm8, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm6, ymm8, 4
	vpand ymm6, ymm6, ymm0
	vpshufb ymm6, ymm1, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpaddb ymm4, ymm5, ymm4
	cmp r10, r8
	jne .LBB13_7
	jmp .LBB13_8
.LBB13_1:
	test rax, rax
	je .LBB13_2
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
	vmovdqa ymm1, ymmword ptr [rip + .LCPI13_2]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI13_3]
	vpor ymm3, ymm3, ymm2
	vpcmpeqd ymm4, ymm4, ymm4
	vpbroadcastd ymm5, dword ptr [rip + .LCPI13_4]
	vbroadcasti128 ymm6, xmmword ptr [rip + .LCPI13_5]
	vpxor xmm8, xmm8, xmm8
.LBB13_10:
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
	jne .LBB13_10
	vblendvpd ymm0, ymm8, ymm9, ymm7
	vextractf128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	pop rbx
	vzeroupper
	ret
.LBB13_2:
	xor eax, eax
	add rax, rcx
	pop rbx
	vzeroupper
	ret
