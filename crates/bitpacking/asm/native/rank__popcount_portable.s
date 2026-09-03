bitpacking::rank::popcount_portable:
	mov eax, esi
	and eax, 7
	lea r8, [8*rsi]
	mov rcx, r8
	and rcx, -64
	je .LBB15_1
	add r8, -64
	mov edx, r8d
	not edx
	test edx, 448
	jne .LBB15_4
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
	jmp .LBB15_6
.LBB15_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB15_12
.LBB15_11:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
.LBB15_4:
	mov r9d, r8d
	shr r9d, 6
	inc r9d
	and r9d, 7
	neg r9
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
.LBB15_5:
	vpopcntq zmm1, zmmword ptr [rdx]
	add rdx, 64
	vpaddq zmm0, zmm1, zmm0
	inc r9
	jne .LBB15_5
.LBB15_6:
	cmp r8, 448
	jb .LBB15_9
	add rcx, rdi
.LBB15_8:
	vpopcntq zmm1, zmmword ptr [rdx]
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 64]
	vpopcntq zmm2, zmmword ptr [rdx + 128]
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 192]
	vpopcntq zmm2, zmmword ptr [rdx + 256]
	vpaddq zmm1, zmm2, zmm1
	vpopcntq zmm2, zmmword ptr [rdx + 320]
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 384]
	vpopcntq zmm2, zmmword ptr [rdx + 448]
	add rdx, 512
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	cmp rdx, rcx
	jne .LBB15_8
.LBB15_9:
	vextracti64x4 ymm1, zmm0, 1
	vpaddq zmm0, zmm0, zmm1
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	test rax, rax
	je .LBB15_11
.LBB15_12:
	movabs rdx, 1152921504606846968
	and rsi, rdx
	lea rdx, [rdi + 8*rsi]
	movabs rsi, 2305843009213693951
	add rax, rsi
	mov sil, 61
	bzhi rsi, rax, rsi
	and eax, 3
	neg rax
	lea rax, [rsi + rax + 4]
	vpbroadcastq ymm0, rsi
	vpxor xmm3, xmm3, xmm3
	xor esi, esi
	vmovdqa ymm2, ymmword ptr [rip + .LCPI15_0]
.LBB15_13:
	vmovdqa ymm1, ymm3
	vpbroadcastq ymm3, rsi
	vpor ymm3, ymm3, ymm2
	vpcmpleuq k1, ymm3, ymm0
	vmovdqu64 ymm3 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpopcntq ymm3, ymm3
	vpaddq ymm3, ymm3, ymm1
	add rsi, 4
	cmp rax, rsi
	jne .LBB15_13
	vmovdqa64 ymm1 {k1}, ymm3
	vextracti128 xmm0, ymm1, 1
	vpaddq xmm0, xmm1, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
