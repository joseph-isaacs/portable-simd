bitpacking::rank::popcount_avx512:
	mov eax, esi
	and eax, 7
	mov rcx, rsi
	shr rcx, 3
	je .LBB13_1
	push rbx
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd zmm1, dword ptr [rip + .LCPI13_3]
	vbroadcasti32x4 zmm3, xmmword ptr [rip + .LCPI13_4]
	mov rdx, rdi
	vpxor xmm2, xmm2, xmm2
	jmp .LBB13_3
.LBB13_8:
	vpsadbw zmm4, zmm4, zmm0
	vpaddq zmm2, zmm4, zmm2
	sub rcx, r8
	je .LBB13_9
.LBB13_3:
	cmp rcx, 31
	mov r8d, 31
	cmovb r8, rcx
	mov r10d, r8d
	shl r10d, 6
	lea r11, [r10 - 64]
	mov ebx, r11d
	not ebx
	mov r9, rdx
	vpxor xmm4, xmm4, xmm4
	test ebx, 448
	je .LBB13_6
	mov ebx, r11d
	shr ebx, 6
	inc ebx
	and ebx, 7
	mov r9, rdx
.LBB13_5:
	vmovdqu64 zmm5, zmmword ptr [r9]
	add r9, 64
	vpsrlw zmm6, zmm5, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpandq zmm5, zmm6, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm4, zmm4, zmm5
	dec rbx
	jne .LBB13_5
.LBB13_6:
	add rdx, r10
	cmp r11, 448
	jb .LBB13_8
.LBB13_7:
	vmovdqu64 zmm5, zmmword ptr [r9]
	vmovdqu64 zmm6, zmmword ptr [r9 + 64]
	vmovdqu64 zmm7, zmmword ptr [r9 + 128]
	vmovdqu64 zmm8, zmmword ptr [r9 + 192]
	vpsrlw zmm9, zmm5, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpandq zmm5, zmm9, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm4, zmm4, zmm5
	vpsrlw zmm5, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm5, zmm6, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpsrlw zmm5, zmm7, 4
	vpandq zmm6, zmm7, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm3, zmm5
	vpaddb zmm5, zmm6, zmm5
	vpsrlw zmm6, zmm8, 4
	vpandq zmm7, zmm8, zmm1
	vpshufb zmm7, zmm3, zmm7
	vpaddb zmm5, zmm7, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpandq zmm5, zmm6, zmm1
	vpshufb zmm5, zmm3, zmm5
	vmovdqu64 zmm6, zmmword ptr [r9 + 256]
	vpsrlw zmm7, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm6, zmm5
	vpandq zmm6, zmm7, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm5, zmm6
	vmovdqu64 zmm6, zmmword ptr [r9 + 320]
	vpsrlw zmm7, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm6, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpandq zmm5, zmm7, zmm1
	vpshufb zmm5, zmm3, zmm5
	vmovdqu64 zmm6, zmmword ptr [r9 + 384]
	vpsrlw zmm7, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm6, zmm5
	vpandq zmm6, zmm7, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm5, zmm6
	vmovdqu64 zmm6, zmmword ptr [r9 + 448]
	vpsrlw zmm7, zmm6, 4
	vpandq zmm6, zmm6, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm6, zmm5
	vpandq zmm6, zmm7, zmm1
	vpshufb zmm6, zmm3, zmm6
	vpaddb zmm5, zmm5, zmm6
	vpaddb zmm4, zmm5, zmm4
	add r9, 512
	cmp r9, rdx
	jne .LBB13_7
	jmp .LBB13_8
.LBB13_9:
	vextracti64x4 ymm0, zmm2, 1
	vpaddq zmm0, zmm2, zmm0
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	pop rbx
	test rax, rax
	je .LBB13_11
.LBB13_12:
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
	vmovdqa ymm2, ymmword ptr [rip + .LCPI13_2]
.LBB13_13:
	vmovdqa ymm1, ymm3
	vpbroadcastq ymm3, rsi
	vpor ymm3, ymm3, ymm2
	vpcmpleuq k1, ymm3, ymm0
	vmovdqu64 ymm3 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpopcntq ymm3, ymm3
	vpaddq ymm3, ymm3, ymm1
	add rsi, 4
	cmp rax, rsi
	jne .LBB13_13
	vmovdqa64 ymm1 {k1}, ymm3
	vextracti128 xmm0, ymm1, 1
	vpaddq xmm0, xmm1, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
.LBB13_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB13_12
.LBB13_11:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
