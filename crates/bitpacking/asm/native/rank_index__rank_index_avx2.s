bitpacking::rank_index::rank_index_avx2:
	push rbx
	cmp rcx, rsi
	jb .LBB3_14
	mov eax, esi
	and eax, 3
	mov r9, rsi
	shr r9, 2
	je .LBB3_2
	cmp r9, 1
	jne .LBB3_5
	xor ecx, ecx
	xor r8d, r8d
	jmp .LBB3_8
.LBB3_2:
	xor ecx, ecx
	jmp .LBB3_9
.LBB3_5:
	movabs r10, 288230376151711742
	and r10, r9
	mov r11d, 16
	xor ecx, ecx
	vpbroadcastd ymm0, dword ptr [rip + .LCPI3_3]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI3_4]
	vpxor xmm2, xmm2, xmm2
	vmovdqa ymm3, ymmword ptr [rip + .LCPI3_2]
	xor r8d, r8d
.LBB3_6:
	vmovdqu ymm4, ymmword ptr [rdi + 2*r11 - 32]
	vpsrlw ymm5, ymm4, 4
	vpand ymm4, ymm4, ymm0
	vpshufb ymm4, ymm1, ymm4
	vpand ymm5, ymm5, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpsadbw ymm4, ymm4, ymm2
	vpslldq ymm5, ymm4, 8
	vpaddq ymm5, ymm4, ymm5
	vmovdqa ymm6, ymm5
	vpermt2q ymm6, ymm3, ymm2
	vpaddq ymm5, ymm5, ymm6
	vpbroadcastq ymm6, rcx
	vpsubq ymm4, ymm6, ymm4
	vpaddq ymm4, ymm4, ymm5
	vpmovqd xmmword ptr [rdx + r11 - 16], ymm4
	vextracti128 xmm4, ymm5, 1
	vpextrq rbx, xmm4, 1
	add rbx, rcx
	add r8, 2
	vmovdqu ymm4, ymmword ptr [rdi + 2*r11]
	vpsrlw ymm5, ymm4, 4
	vpand ymm4, ymm4, ymm0
	vpshufb ymm4, ymm1, ymm4
	vpand ymm5, ymm5, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpaddb ymm4, ymm5, ymm4
	vpsadbw ymm4, ymm4, ymm2
	vpslldq ymm5, ymm4, 8
	vpaddq ymm5, ymm4, ymm5
	vmovdqa ymm6, ymm5
	vpermt2q ymm6, ymm3, ymm2
	vpaddq ymm5, ymm5, ymm6
	vpbroadcastq ymm6, rbx
	vpsubq ymm4, ymm6, ymm4
	vpaddq ymm4, ymm4, ymm5
	vpmovqd xmmword ptr [rdx + r11], ymm4
	vextracti128 xmm4, ymm5, 1
	vpextrq rcx, xmm4, 1
	add rcx, rbx
	add r11, 32
	cmp r10, r8
	jne .LBB3_6
	test r9b, 1
	je .LBB3_9
.LBB3_8:
	mov r9, rcx
	mov rcx, r8
	shl rcx, 5
	shl r8, 4
	vmovdqu ymm0, ymmword ptr [rdi + rcx]
	vpsrlw ymm1, ymm0, 4
	vpbroadcastd ymm2, dword ptr [rip + .LCPI3_3]
	vpand ymm0, ymm0, ymm2
	vbroadcasti128 ymm3, xmmword ptr [rip + .LCPI3_4]
	vpshufb ymm0, ymm3, ymm0
	vpand ymm1, ymm1, ymm2
	vpshufb ymm1, ymm3, ymm1
	vpaddb ymm0, ymm1, ymm0
	vpxor xmm1, xmm1, xmm1
	vpsadbw ymm0, ymm0, ymm1
	vpslldq ymm2, ymm0, 8
	vpaddq ymm2, ymm0, ymm2
	vmovdqa ymm3, ymmword ptr [rip + .LCPI3_2]
	vpermi2q ymm3, ymm2, ymm1
	vpaddq ymm1, ymm2, ymm3
	vpbroadcastq ymm2, r9
	vpsubq ymm0, ymm2, ymm0
	vpaddq ymm0, ymm0, ymm1
	vpmovqd xmmword ptr [rdx + r8], ymm0
	vextracti128 xmm0, ymm1, 1
	vpextrq rcx, xmm0, 1
	add rcx, r9
.LBB3_9:
	test rax, rax
	je .LBB3_13
	movabs r8, 1152921504606846972
	and rsi, r8
	mov r8, qword ptr [rdi + 8*rsi]
	mov dword ptr [rdx + 4*rsi], ecx
	cmp eax, 1
	je .LBB3_13
	popcnt r8, r8
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB3_13
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 8], ecx
.LBB3_13:
	pop rbx
	vzeroupper
	ret
.LBB3_14:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.32]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.34]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
