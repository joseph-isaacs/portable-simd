bitpacking::rank::popcount_portable_u8:
	push rbp
	push r14
	push rbx
	mov eax, esi
	and eax, 7
	mov rdx, rsi
	xor ecx, ecx
	shr rdx, 3
	je .LBB16_1
	vpxor xmm0, xmm0, xmm0
	mov r8, rdi
	jmp .LBB16_4
.LBB16_9:
	sub rdx, r9
	vpsadbw zmm1, zmm1, zmm0
	vextracti64x4 ymm2, zmm1, 1
	vpaddq ymm1, ymm1, ymm2
	vextracti128 xmm2, ymm1, 1
	vpaddq xmm1, xmm1, xmm2
	vpshufd xmm2, xmm1, 238
	vpaddq xmm1, xmm1, xmm2
	vpextrw r9d, xmm1, 0
	add rcx, r9
	test rdx, rdx
	je .LBB16_1
.LBB16_4:
	cmp rdx, 31
	mov r9d, 31
	cmovb r9, rdx
	mov r11d, r9d
	shl r11d, 6
	lea rbx, [r11 - 64]
	mov ebp, ebx
	not ebp
	mov r10, r8
	vpxor xmm1, xmm1, xmm1
	test ebp, 448
	je .LBB16_7
	mov r14d, ebx
	shr r14d, 6
	inc r14d
	and r14d, 7
	mov r10, r8
.LBB16_6:
	vpopcntb zmm2, zmmword ptr [r10]
	add r10, 64
	vpaddb zmm1, zmm2, zmm1
	dec r14
	jne .LBB16_6
.LBB16_7:
	add r8, r11
	cmp rbx, 448
	jb .LBB16_9
.LBB16_8:
	vpopcntb zmm2, zmmword ptr [r10]
	vpaddb zmm1, zmm2, zmm1
	vpopcntb zmm2, zmmword ptr [r10 + 64]
	vpopcntb zmm3, zmmword ptr [r10 + 128]
	vpaddb zmm2, zmm3, zmm2
	vpaddb zmm1, zmm2, zmm1
	vpopcntb zmm2, zmmword ptr [r10 + 192]
	vpopcntb zmm3, zmmword ptr [r10 + 256]
	vpaddb zmm2, zmm3, zmm2
	vpopcntb zmm3, zmmword ptr [r10 + 320]
	vpaddb zmm2, zmm3, zmm2
	vpaddb zmm1, zmm2, zmm1
	vpopcntb zmm2, zmmword ptr [r10 + 384]
	vpopcntb zmm3, zmmword ptr [r10 + 448]
	add r10, 512
	vpaddb zmm2, zmm3, zmm2
	vpaddb zmm1, zmm2, zmm1
	cmp r10, r8
	jne .LBB16_8
	jmp .LBB16_9
.LBB16_1:
	test rax, rax
	je .LBB16_2
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
	vmovdqa ymm2, ymmword ptr [rip + .LCPI16_0]
.LBB16_11:
	vmovdqa ymm1, ymm3
	vpbroadcastq ymm3, rsi
	vpor ymm3, ymm3, ymm2
	vpcmpleuq k1, ymm3, ymm0
	vmovdqu64 ymm3 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpopcntq ymm3, ymm3
	vpaddq ymm3, ymm3, ymm1
	add rsi, 4
	cmp rax, rsi
	jne .LBB16_11
	vmovdqa64 ymm1 {k1}, ymm3
	vextracti128 xmm0, ymm1, 1
	vpaddq xmm0, xmm1, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	jmp .LBB16_13
.LBB16_2:
	xor eax, eax
.LBB16_13:
	add rax, rcx
	pop rbx
	pop r14
	pop rbp
	vzeroupper
	ret
