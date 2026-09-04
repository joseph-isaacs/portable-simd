bitpacking::rank_index::rank_index_portable:
	cmp rcx, rsi
	jb .LBB5_14
	mov eax, esi
	and eax, 7
	mov rcx, rsi
	shr rcx, 3
	je .LBB5_2
	shl rcx, 5
	vpxor xmm1, xmm1, xmm1
	xor r8d, r8d
	vpbroadcastd ymm2, dword ptr [rip + .LCPI5_2]
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI5_3]
	vpxor xmm0, xmm0, xmm0
	vpxor xmm4, xmm4, xmm4
.LBB5_4:
	vmovdqu ymm5, ymmword ptr [rdi + 2*r8]
	vmovdqu ymm6, ymmword ptr [rdi + 2*r8 + 32]
	vpand ymm7, ymm5, ymm2
	vpshufb ymm7, ymm3, ymm7
	vpsrlw ymm5, ymm5, 4
	vpand ymm5, ymm5, ymm2
	vpshufb ymm5, ymm3, ymm5
	vpaddb ymm5, ymm5, ymm7
	vpsadbw ymm5, ymm5, ymm1
	vpand ymm7, ymm6, ymm2
	vpshufb ymm7, ymm3, ymm7
	vpsrlw ymm6, ymm6, 4
	vpand ymm6, ymm6, ymm2
	vpshufb ymm6, ymm3, ymm6
	vpaddb ymm6, ymm6, ymm7
	vpsadbw ymm6, ymm6, ymm1
	vpblendd ymm7, ymm6, ymm5, 192
	vpermq ymm7, ymm7, 147
	vpermq ymm8, ymm5, 144
	vpblendd ymm8, ymm8, ymm1, 3
	vpaddq ymm7, ymm7, ymm6
	vpaddq ymm8, ymm8, ymm5
	vperm2i128 ymm9, ymm8, ymm7, 33
	vperm2i128 ymm10, ymm8, ymm8, 8
	vpaddq ymm7, ymm9, ymm7
	vpaddq ymm8, ymm10, ymm8
	vpaddq ymm7, ymm8, ymm7
	vpsubq ymm5, ymm0, ymm5
	vpsubq ymm6, ymm4, ymm6
	vpaddq ymm6, ymm6, ymm7
	vpaddq ymm5, ymm8, ymm5
	vshufps ymm5, ymm5, ymm6, 136
	vpermpd ymm5, ymm5, 216
	vmovups ymmword ptr [rdx + r8], ymm5
	vpermq ymm5, ymm7, 255
	vpaddq ymm4, ymm5, ymm4
	vpaddq ymm0, ymm5, ymm0
	add r8, 32
	cmp rcx, r8
	jne .LBB5_4
	test rax, rax
	jne .LBB5_6
.LBB5_13:
	vzeroupper
	ret
.LBB5_2:
	vpxor xmm0, xmm0, xmm0
	test rax, rax
	je .LBB5_13
.LBB5_6:
	movabs rcx, 1152921504606846968
	and rsi, rcx
	mov rcx, qword ptr [rdi + 8*rsi]
	vmovd dword ptr [rdx + 4*rsi], xmm0
	cmp eax, 1
	je .LBB5_13
	vmovd r8d, xmm0
	popcnt rcx, rcx
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB5_13
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 16]
	mov dword ptr [rdx + 4*rsi + 8], ecx
	cmp eax, 3
	je .LBB5_13
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 24]
	mov dword ptr [rdx + 4*rsi + 12], ecx
	cmp eax, 4
	je .LBB5_13
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 32]
	mov dword ptr [rdx + 4*rsi + 16], ecx
	cmp eax, 5
	je .LBB5_13
	popcnt r8, r8
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 40]
	mov dword ptr [rdx + 4*rsi + 20], ecx
	cmp eax, 6
	je .LBB5_13
	xor eax, eax
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 24], ecx
	vzeroupper
	ret
.LBB5_14:
	push rax
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.30]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.34]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
