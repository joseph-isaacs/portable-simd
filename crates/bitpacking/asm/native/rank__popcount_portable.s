bitpacking::rank::popcount_portable:
	mov eax, esi
	and eax, 7
	lea r8, [8*rsi]
	mov rcx, r8
	and rcx, -64
	je .LBB14_1
	add r8, -64
	mov edx, r8d
	not edx
	test dl, -64
	jne .LBB14_4
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
	jmp .LBB14_6
.LBB14_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB14_12
.LBB14_11:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
.LBB14_4:
	mov r9d, r8d
	shr r9d, 6
	inc r9d
	and r9d, 3
	neg r9
	vpxor xmm1, xmm1, xmm1
	vpbroadcastd zmm2, dword ptr [rip + .LCPI14_5]
	vbroadcasti32x4 zmm3, xmmword ptr [rip + .LCPI14_6]
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
.LBB14_5:
	vmovdqu64 zmm4, zmmword ptr [rdx]
	add rdx, 64
	vpandq zmm5, zmm4, zmm2
	vpshufb zmm5, zmm3, zmm5
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm2
	vpshufb zmm4, zmm3, zmm4
	vpaddb zmm4, zmm4, zmm5
	vpsadbw zmm4, zmm4, zmm1
	vpaddq zmm0, zmm4, zmm0
	inc r9
	jne .LBB14_5
.LBB14_6:
	cmp r8, 192
	jb .LBB14_9
	add rcx, rdi
	vpbroadcastd zmm1, dword ptr [rip + .LCPI14_5]
	vbroadcasti32x4 zmm2, xmmword ptr [rip + .LCPI14_6]
	vpxor xmm3, xmm3, xmm3
.LBB14_8:
	vmovdqu64 zmm4, zmmword ptr [rdx]
	vmovdqu64 zmm5, zmmword ptr [rdx + 64]
	vmovdqu64 zmm6, zmmword ptr [rdx + 128]
	vmovdqu64 zmm7, zmmword ptr [rdx + 192]
	vpandq zmm8, zmm4, zmm1
	vpshufb zmm8, zmm2, zmm8
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpaddb zmm4, zmm4, zmm8
	vpsadbw zmm4, zmm4, zmm3
	vpaddq zmm0, zmm4, zmm0
	vpandq zmm4, zmm5, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpsrlw zmm5, zmm5, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpsadbw zmm4, zmm4, zmm3
	vpandq zmm5, zmm6, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpsrlw zmm6, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm2, zmm6
	vpaddb zmm5, zmm6, zmm5
	vpsadbw zmm5, zmm5, zmm3
	vpaddq zmm4, zmm5, zmm4
	vpaddq zmm0, zmm4, zmm0
	add rdx, 256
	vpandq zmm4, zmm7, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpsrlw zmm5, zmm7, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpsadbw zmm4, zmm4, zmm3
	vpaddq zmm0, zmm4, zmm0
	cmp rdx, rcx
	jne .LBB14_8
.LBB14_9:
	vextracti64x4 ymm1, zmm0, 1
	vpaddq zmm0, zmm0, zmm1
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	test rax, rax
	je .LBB14_11
.LBB14_12:
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
	vpbroadcastq ymm0, rsi
	vpxor xmm1, xmm1, xmm1
	vmovdqa ymm2, ymmword ptr [rip + .LCPI14_2]
	xor esi, esi
	vpbroadcastd ymm4, dword ptr [rip + .LCPI14_5]
	vbroadcasti128 ymm5, xmmword ptr [rip + .LCPI14_6]
	vpxor xmm6, xmm6, xmm6
.LBB14_13:
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
	cmp rax, rsi
	jne .LBB14_13
	vmovdqa64 ymm3 {k1}, ymm6
	vextracti128 xmm0, ymm3, 1
	vpaddq xmm0, xmm3, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
