bitpacking::rank::rank_scalar:
	push rax
	mov rcx, rsi
	shl rcx, 6
	cmp rdx, rcx
	ja .LBB17_25
	mov rax, rsi
	mov rsi, rdx
	shr rsi, 6
	and rdx, 63
	je .LBB17_2
	cmp rsi, rax
	jae .LBB17_7
	bzhi rcx, qword ptr [rdi + 8*rsi], rdx
	popcnt rcx, rcx
	cmp rsi, rax
	ja .LBB17_4
.LBB17_8:
	test rsi, rsi
	je .LBB17_9
	lea rax, [8*rsi]
	add rax, -8
	cmp rax, 24
	jae .LBB17_12
	xor eax, eax
	mov r10, rdi
	jmp .LBB17_22
.LBB17_2:
	xor ecx, ecx
	cmp rsi, rax
	jbe .LBB17_8
.LBB17_4:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.52]
	xor edi, edi
	mov rdx, rax
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB17_9:
	xor eax, eax
	add rax, rcx
	pop rcx
	ret
.LBB17_12:
	mov rdx, rax
	shr rdx, 3
	inc rdx
	movabs r8, 4611686018427387888
	cmp rax, 120
	jae .LBB17_17
	xor r9d, r9d
	xor eax, eax
	jmp .LBB17_14
.LBB17_17:
	mov r9, rdx
	and r9, r8
	vpxor xmm0, xmm0, xmm0
	xor eax, eax
	vpbroadcastd ymm1, dword ptr [rip + .LCPI17_2]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI17_3]
	vpxor xmm3, xmm3, xmm3
	vpxor xmm4, xmm4, xmm4
	vpxor xmm5, xmm5, xmm5
	vpxor xmm6, xmm6, xmm6
.LBB17_18:
	vmovdqu ymm7, ymmword ptr [rdi + 8*rax]
	vmovdqu ymm8, ymmword ptr [rdi + 8*rax + 32]
	vmovdqu ymm9, ymmword ptr [rdi + 8*rax + 64]
	vmovdqu ymm10, ymmword ptr [rdi + 8*rax + 96]
	vpand ymm11, ymm7, ymm1
	vpshufb ymm11, ymm2, ymm11
	vpsrlw ymm7, ymm7, 4
	vpand ymm7, ymm7, ymm1
	vpshufb ymm7, ymm2, ymm7
	vpaddb ymm7, ymm11, ymm7
	vpsadbw ymm7, ymm7, ymm0
	vpaddq ymm3, ymm7, ymm3
	vpand ymm7, ymm8, ymm1
	vpshufb ymm7, ymm2, ymm7
	vpsrlw ymm8, ymm8, 4
	vpand ymm8, ymm8, ymm1
	vpshufb ymm8, ymm2, ymm8
	vpaddb ymm7, ymm8, ymm7
	vpsadbw ymm7, ymm7, ymm0
	vpaddq ymm4, ymm7, ymm4
	vpand ymm7, ymm9, ymm1
	vpshufb ymm7, ymm2, ymm7
	vpsrlw ymm8, ymm9, 4
	vpand ymm8, ymm8, ymm1
	vpshufb ymm8, ymm2, ymm8
	vpaddb ymm7, ymm8, ymm7
	vpsadbw ymm7, ymm7, ymm0
	vpaddq ymm5, ymm7, ymm5
	vpand ymm7, ymm10, ymm1
	vpshufb ymm7, ymm2, ymm7
	vpsrlw ymm8, ymm10, 4
	vpand ymm8, ymm8, ymm1
	vpshufb ymm8, ymm2, ymm8
	vpaddb ymm7, ymm8, ymm7
	vpsadbw ymm7, ymm7, ymm0
	vpaddq ymm6, ymm7, ymm6
	add rax, 16
	cmp r9, rax
	jne .LBB17_18
	vpaddq ymm0, ymm4, ymm3
	vpaddq ymm0, ymm5, ymm0
	vpaddq ymm0, ymm6, ymm0
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp rdx, r9
	je .LBB17_24
	test dl, 12
	je .LBB17_21
.LBB17_14:
	add r8, 12
	and r8, rdx
	lea r10, [rdi + 8*r8]
	vmovq xmm0, rax
	vpbroadcastd ymm1, dword ptr [rip + .LCPI17_2]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI17_3]
	vpxor xmm3, xmm3, xmm3
.LBB17_15:
	vmovdqu ymm4, ymmword ptr [rdi + 8*r9]
	vpand ymm5, ymm4, ymm1
	vpshufb ymm5, ymm2, ymm5
	vpsrlw ymm4, ymm4, 4
	vpand ymm4, ymm4, ymm1
	vpshufb ymm4, ymm2, ymm4
	vpaddb ymm4, ymm4, ymm5
	vpsadbw ymm4, ymm4, ymm3
	vpaddq ymm0, ymm4, ymm0
	add r9, 4
	cmp r8, r9
	jne .LBB17_15
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp rdx, r8
	je .LBB17_24
.LBB17_22:
	lea rdx, [rdi + 8*rsi]
.LBB17_23:
	xor esi, esi
	popcnt rsi, qword ptr [r10]
	add r10, 8
	add rax, rsi
	cmp r10, rdx
	jne .LBB17_23
.LBB17_24:
	add rax, rcx
	pop rcx
	vzeroupper
	ret
.LBB17_21:
	lea r10, [rdi + 8*r9]
	jmp .LBB17_22
.LBB17_25:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.49]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.50]
	mov esi, 53
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB17_7:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.51]
	mov rdi, rsi
	mov rsi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
