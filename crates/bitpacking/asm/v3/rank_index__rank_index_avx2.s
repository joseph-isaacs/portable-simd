bitpacking::rank_index::rank_index_avx2:
	cmp rcx, rsi
	jb .LBB3_10
	mov eax, esi
	and eax, 3
	mov rcx, rsi
	shr rcx, 2
	je .LBB3_2
	shl rcx, 4
	vpxor xmm1, xmm1, xmm1
	xor r8d, r8d
	vpbroadcastd ymm2, dword ptr [rip + .LCPI3_3]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI3_4]
	vbroadcasti128 ymm4, xmmword ptr [rip + .LCPI3_5]
	vpxor xmm0, xmm0, xmm0
.LBB3_4:
	vmovdqu ymm5, ymmword ptr [rdi + 2*r8]
	vpsrlw ymm6, ymm5, 4
	vpand ymm5, ymm5, ymm2
	vpshufb ymm5, ymm3, ymm5
	vpand ymm6, ymm6, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm5, ymm6, ymm5
	vpsadbw ymm5, ymm5, ymm1
	vpslldq ymm6, ymm5, 8
	vpaddq ymm6, ymm5, ymm6
	vpermq ymm7, ymm6, 85
	vpblendd ymm7, ymm1, ymm7, 240
	vpaddq ymm6, ymm6, ymm7
	vpsubq ymm5, ymm0, ymm5
	vpaddq ymm5, ymm5, ymm6
	vpermd ymm5, ymm4, ymm5
	vmovdqu xmmword ptr [rdx + r8], xmm5
	vpermq ymm5, ymm6, 255
	vpaddq ymm0, ymm5, ymm0
	add r8, 16
	cmp rcx, r8
	jne .LBB3_4
	test rax, rax
	jne .LBB3_6
.LBB3_9:
	vzeroupper
	ret
.LBB3_2:
	vpxor xmm0, xmm0, xmm0
	test rax, rax
	je .LBB3_9
.LBB3_6:
	movabs rcx, 1152921504606846972
	and rsi, rcx
	mov rcx, qword ptr [rdi + 8*rsi]
	vmovd dword ptr [rdx + 4*rsi], xmm0
	cmp eax, 1
	je .LBB3_9
	vmovd r8d, xmm0
	popcnt rcx, rcx
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB3_9
	xor eax, eax
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 8], ecx
	vzeroupper
	ret
.LBB3_10:
	push rax
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.30]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.32]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
