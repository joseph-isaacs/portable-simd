bitpacking::rank::popcount_portable_u8:
	push rbp
	push r14
	push rbx
	mov eax, esi
	and eax, 7
	mov rdx, rsi
	xor ecx, ecx
	shr rdx, 3
	je .LBB15_1
	vpxor xmm0, xmm0, xmm0
	vpbroadcastd zmm1, dword ptr [rip + .LCPI15_5]
	vbroadcasti32x4 zmm2, xmmword ptr [rip + .LCPI15_6]
	mov r8, rdi
	jmp .LBB15_4
.LBB15_9:
	sub rdx, r9
	vpsadbw zmm3, zmm3, zmm0
	vextracti64x4 ymm4, zmm3, 1
	vpaddq ymm3, ymm3, ymm4
	vextracti128 xmm4, ymm3, 1
	vpaddq xmm3, xmm3, xmm4
	vpshufd xmm4, xmm3, 238
	vpaddq xmm3, xmm3, xmm4
	vpextrw r9d, xmm3, 0
	add rcx, r9
	test rdx, rdx
	je .LBB15_1
.LBB15_4:
	cmp rdx, 31
	mov r9d, 31
	cmovb r9, rdx
	mov r11d, r9d
	shl r11d, 6
	lea rbx, [r11 - 64]
	mov ebp, ebx
	not ebp
	mov r10, r8
	vpxor xmm3, xmm3, xmm3
	test bpl, -64
	je .LBB15_7
	mov r14d, ebx
	shr r14d, 6
	inc r14d
	and r14d, 3
	mov r10, r8
.LBB15_6:
	vmovdqu64 zmm4, zmmword ptr [r10]
	add r10, 64
	vpandq zmm5, zmm4, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm3, zmm5, zmm3
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpaddb zmm3, zmm4, zmm3
	dec r14
	jne .LBB15_6
.LBB15_7:
	add r8, r11
	cmp rbx, 192
	jb .LBB15_9
.LBB15_8:
	vmovdqu64 zmm4, zmmword ptr [r10]
	vmovdqu64 zmm5, zmmword ptr [r10 + 64]
	vmovdqu64 zmm6, zmmword ptr [r10 + 128]
	vmovdqu64 zmm7, zmmword ptr [r10 + 192]
	vpandq zmm8, zmm4, zmm1
	vpshufb zmm8, zmm2, zmm8
	vpaddb zmm3, zmm8, zmm3
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpaddb zmm3, zmm4, zmm3
	vpandq zmm4, zmm5, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpsrlw zmm5, zmm5, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpaddb zmm3, zmm4, zmm3
	vpandq zmm4, zmm6, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpsrlw zmm5, zmm6, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpaddb zmm3, zmm4, zmm3
	add r10, 256
	vpandq zmm4, zmm7, zmm1
	vpshufb zmm4, zmm2, zmm4
	vpsrlw zmm5, zmm7, 4
	vpandq zmm5, zmm5, zmm1
	vpshufb zmm5, zmm2, zmm5
	vpaddb zmm4, zmm5, zmm4
	vpaddb zmm3, zmm4, zmm3
	cmp r10, r8
	jne .LBB15_8
	jmp .LBB15_9
.LBB15_1:
	test rax, rax
	je .LBB15_2
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
	vmovdqa ymm2, ymmword ptr [rip + .LCPI15_2]
	xor esi, esi
	vpbroadcastd ymm4, dword ptr [rip + .LCPI15_5]
	vbroadcasti128 ymm5, xmmword ptr [rip + .LCPI15_6]
	vpxor xmm6, xmm6, xmm6
.LBB15_11:
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
	jne .LBB15_11
	vmovdqa64 ymm3 {k1}, ymm6
	vextracti128 xmm0, ymm3, 1
	vpaddq xmm0, xmm3, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	jmp .LBB15_13
.LBB15_2:
	xor eax, eax
.LBB15_13:
	add rax, rcx
	pop rbx
	pop r14
	pop rbp
	vzeroupper
	ret
