bitpacking::rank::popcount_avx512:
	mov eax, esi
	and eax, 7
	mov rcx, rsi
	shr rcx, 3
	je .LBB12_1
	push rbx
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd zmm1, dword ptr [rip + .LCPI12_5]
	vbroadcasti32x4 zmm3, xmmword ptr [rip + .LCPI12_6]
	mov rdx, rdi
	vpxor xmm2, xmm2, xmm2
	jmp .LBB12_3
.LBB12_8:
	vpsadbw zmm4, zmm4, zmm0
	vpaddq zmm2, zmm4, zmm2
	sub rcx, r8
	je .LBB12_9
.LBB12_3:
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
	test bl, -64
	je .LBB12_6
	mov ebx, r11d
	shr ebx, 6
	inc ebx
	and ebx, 3
	mov r9, rdx
.LBB12_5:
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
	jne .LBB12_5
.LBB12_6:
	add rdx, r10
	cmp r11, 192
	jb .LBB12_8
.LBB12_7:
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
	vpaddb zmm4, zmm4, zmm5
	add r9, 256
	cmp r9, rdx
	jne .LBB12_7
	jmp .LBB12_8
.LBB12_9:
	vextracti64x4 ymm0, zmm2, 1
	vpaddq zmm0, zmm2, zmm0
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	pop rbx
	test rax, rax
	je .LBB12_11
.LBB12_12:
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
	vmovdqa ymm2, ymmword ptr [rip + .LCPI12_2]
	xor esi, esi
	vpbroadcastd ymm4, dword ptr [rip + .LCPI12_5]
	vbroadcasti128 ymm5, xmmword ptr [rip + .LCPI12_6]
	vpxor xmm6, xmm6, xmm6
.LBB12_13:
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
	jne .LBB12_13
	vmovdqa64 ymm3 {k1}, ymm6
	vextracti128 xmm0, ymm3, 1
	vpaddq xmm0, xmm3, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
.LBB12_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB12_12
.LBB12_11:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
