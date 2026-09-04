bitpacking::rank_index::rank_index_avx2:
	cmp rcx, rsi
	jb .LBB3_10
	mov eax, esi
	and eax, 3
	mov r8, rsi
	shr r8, 2
	je .LBB3_2
	shl r8, 4
	xor ecx, ecx
	vpbroadcastd ymm0, dword ptr [rip + .LCPI3_3]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI3_4]
	vpxor xmm2, xmm2, xmm2
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI3_5]
	xor r9d, r9d
.LBB3_4:
	mov r10, rcx
	vmovdqu ymm4, ymmword ptr [rdi + 2*r9]
	vpsrlw ymm5, ymm4, 4
	vpand ymm4, ymm4, ymm0
	vpshufb ymm4, ymm1, ymm4
	vpand ymm5, ymm5, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpsadbw ymm4, ymm4, ymm2
	vpslldq ymm5, ymm4, 8
	vpaddq ymm5, ymm4, ymm5
	vpermq ymm6, ymm5, 85
	vpblendd ymm6, ymm2, ymm6, 240
	vpaddq ymm5, ymm5, ymm6
	vmovq xmm6, rcx
	vpbroadcastq ymm6, xmm6
	vpsubq ymm4, ymm6, ymm4
	vpaddq ymm4, ymm4, ymm5
	vpermd ymm4, ymm3, ymm4
	vmovdqu xmmword ptr [rdx + r9], xmm4
	vextracti128 xmm4, ymm5, 1
	vpextrq rcx, xmm4, 1
	add rcx, r10
	add r9, 16
	cmp r8, r9
	jne .LBB3_4
	test rax, rax
	jne .LBB3_6
.LBB3_9:
	vzeroupper
	ret
.LBB3_2:
	xor ecx, ecx
	test rax, rax
	je .LBB3_9
.LBB3_6:
	movabs r8, 1152921504606846972
	and rsi, r8
	mov r8, qword ptr [rdi + 8*rsi]
	mov dword ptr [rdx + 4*rsi], ecx
	cmp eax, 1
	je .LBB3_9
	popcnt r8, r8
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
