bitpacking::rank_index::rank_index_portable:
	cmp rcx, rsi
	jb .LBB5_14
	mov eax, esi
	and eax, 7
	mov r8, rsi
	shr r8, 3
	je .LBB5_2
	shl r8, 5
	xor ecx, ecx
	vpbroadcastd ymm0, dword ptr [rip + .LCPI5_2]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI5_3]
	vpxor xmm2, xmm2, xmm2
	xor r9d, r9d
.LBB5_4:
	mov r10, rcx
	vmovdqu ymm3, ymmword ptr [rdi + 2*r9]
	vmovdqu ymm4, ymmword ptr [rdi + 2*r9 + 32]
	vpand ymm5, ymm3, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm3, ymm3, 4
	vpand ymm3, ymm3, ymm0
	vpshufb ymm3, ymm1, ymm3
	vpaddb ymm3, ymm3, ymm5
	vpsadbw ymm3, ymm3, ymm2
	vpand ymm5, ymm4, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm4, ymm4, 4
	vpand ymm4, ymm4, ymm0
	vpshufb ymm4, ymm1, ymm4
	vpaddb ymm4, ymm4, ymm5
	vpsadbw ymm4, ymm4, ymm2
	vpblendd ymm5, ymm4, ymm3, 192
	vpermq ymm5, ymm5, 147
	vpermq ymm6, ymm3, 144
	vpblendd ymm6, ymm6, ymm2, 3
	vpaddq ymm5, ymm5, ymm4
	vpaddq ymm6, ymm6, ymm3
	vperm2i128 ymm7, ymm6, ymm5, 33
	vperm2i128 ymm8, ymm6, ymm6, 8
	vpaddq ymm5, ymm7, ymm5
	vpaddq ymm6, ymm8, ymm6
	vpaddq ymm5, ymm6, ymm5
	vmovq xmm7, rcx
	vpbroadcastq ymm7, xmm7
	vpsubq ymm3, ymm7, ymm3
	vpsubq ymm4, ymm7, ymm4
	vpaddq ymm4, ymm4, ymm5
	vpaddq ymm3, ymm3, ymm6
	vshufps ymm3, ymm3, ymm4, 136
	vpermpd ymm3, ymm3, 216
	vmovups ymmword ptr [rdx + r9], ymm3
	vextracti128 xmm3, ymm5, 1
	vpextrq rcx, xmm3, 1
	add rcx, r10
	add r9, 32
	cmp r8, r9
	jne .LBB5_4
	test rax, rax
	jne .LBB5_6
.LBB5_13:
	vzeroupper
	ret
.LBB5_2:
	xor ecx, ecx
	test rax, rax
	je .LBB5_13
.LBB5_6:
	movabs r8, 1152921504606846968
	and rsi, r8
	mov r8, qword ptr [rdi + 8*rsi]
	mov dword ptr [rdx + 4*rsi], ecx
	cmp eax, 1
	je .LBB5_13
	popcnt r8, r8
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
