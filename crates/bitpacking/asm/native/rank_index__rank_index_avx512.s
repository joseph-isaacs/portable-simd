bitpacking::rank_index::rank_index_avx512:
	push rbx
	cmp rcx, rsi
	jb .LBB4_18
	mov eax, esi
	and eax, 7
	mov r9, rsi
	shr r9, 3
	je .LBB4_2
	cmp r9, 1
	jne .LBB4_5
	xor ecx, ecx
	xor r8d, r8d
	jmp .LBB4_8
.LBB4_2:
	xor ecx, ecx
	jmp .LBB4_9
.LBB4_5:
	movabs r10, 144115188075855870
	and r10, r9
	mov r11d, 32
	xor ecx, ecx
	vpbroadcastd zmm0, dword ptr [rip + .LCPI4_2]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI4_3]
	vpxor xmm2, xmm2, xmm2
	xor r8d, r8d
.LBB4_6:
	vmovdqu64 zmm3, zmmword ptr [rdi + 2*r11 - 64]
	vpsrlw zmm4, zmm3, 4
	vpandq zmm3, zmm3, zmm0
	vpshufb zmm3, zmm1, zmm3
	vpandq zmm4, zmm4, zmm0
	vpshufb zmm4, zmm1, zmm4
	vpaddb zmm3, zmm4, zmm3
	vpsadbw zmm3, zmm3, zmm2
	valignq zmm4, zmm3, zmm2, 7
	vpaddq zmm4, zmm4, zmm3
	valignq zmm5, zmm4, zmm2, 6
	vpaddq zmm4, zmm5, zmm4
	vinserti64x4 zmm5, zmm2, ymm4, 1
	vpaddq zmm4, zmm5, zmm4
	vpbroadcastq zmm5, rcx
	vpsubq zmm3, zmm5, zmm3
	vpaddq zmm3, zmm3, zmm4
	vpmovqd ymmword ptr [rdx + r11 - 32], zmm3
	vextracti32x4 xmm3, zmm4, 3
	vpextrq rbx, xmm3, 1
	add rbx, rcx
	add r8, 2
	vmovdqu64 zmm3, zmmword ptr [rdi + 2*r11]
	vpsrlw zmm4, zmm3, 4
	vpandq zmm3, zmm3, zmm0
	vpshufb zmm3, zmm1, zmm3
	vpandq zmm4, zmm4, zmm0
	vpshufb zmm4, zmm1, zmm4
	vpaddb zmm3, zmm4, zmm3
	vpsadbw zmm3, zmm3, zmm2
	valignq zmm4, zmm3, zmm2, 7
	vpaddq zmm4, zmm4, zmm3
	valignq zmm5, zmm4, zmm2, 6
	vpaddq zmm4, zmm5, zmm4
	vinserti64x4 zmm5, zmm2, ymm4, 1
	vpaddq zmm4, zmm5, zmm4
	vpbroadcastq zmm5, rbx
	vpsubq zmm3, zmm5, zmm3
	vpaddq zmm3, zmm3, zmm4
	vpmovqd ymmword ptr [rdx + r11], zmm3
	vextracti32x4 xmm3, zmm4, 3
	vpextrq rcx, xmm3, 1
	add rcx, rbx
	add r11, 64
	cmp r10, r8
	jne .LBB4_6
	test r9b, 1
	je .LBB4_9
.LBB4_8:
	mov r9, rcx
	mov rcx, r8
	shl rcx, 6
	shl r8, 5
	vmovdqu64 zmm0, zmmword ptr [rdi + rcx]
	vpsrlw zmm1, zmm0, 4
	vpbroadcastd zmm2, dword ptr [rip + .LCPI4_2]
	vpandq zmm0, zmm0, zmm2
	vbroadcasti32x4 zmm3, xmmword ptr [rip + .LCPI4_3]
	vpshufb zmm0, zmm3, zmm0
	vpandq zmm1, zmm1, zmm2
	vpshufb zmm1, zmm3, zmm1
	vpaddb zmm0, zmm1, zmm0
	vpxor xmm1, xmm1, xmm1
	vpsadbw zmm0, zmm0, zmm1
	valignq zmm2, zmm0, zmm1, 7
	vpaddq zmm2, zmm2, zmm0
	valignq zmm3, zmm2, zmm1, 6
	vpaddq zmm2, zmm3, zmm2
	vinserti64x4 zmm1, zmm1, ymm2, 1
	vpaddq zmm1, zmm1, zmm2
	vpbroadcastq zmm2, r9
	vpsubq zmm0, zmm2, zmm0
	vpaddq zmm0, zmm0, zmm1
	vpmovqd ymmword ptr [rdx + r8], zmm0
	vextracti32x4 xmm0, zmm1, 3
	vpextrq rcx, xmm0, 1
	add rcx, r9
.LBB4_9:
	test rax, rax
	je .LBB4_17
	movabs r8, 1152921504606846968
	and rsi, r8
	mov r8, qword ptr [rdi + 8*rsi]
	mov dword ptr [rdx + 4*rsi], ecx
	cmp eax, 1
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 16]
	mov dword ptr [rdx + 4*rsi + 8], ecx
	cmp eax, 3
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 24]
	mov dword ptr [rdx + 4*rsi + 12], ecx
	cmp eax, 4
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 32]
	mov dword ptr [rdx + 4*rsi + 16], ecx
	cmp eax, 5
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 40]
	mov dword ptr [rdx + 4*rsi + 20], ecx
	cmp eax, 6
	je .LBB4_17
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 24], ecx
.LBB4_17:
	pop rbx
	vzeroupper
	ret
.LBB4_18:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.32]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.35]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
