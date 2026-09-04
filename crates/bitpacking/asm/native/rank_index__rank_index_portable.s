bitpacking::rank_index::rank_index_portable:
	push rbx
	cmp rcx, rsi
	jb .LBB6_18
	mov eax, esi
	and eax, 7
	mov r9, rsi
	shr r9, 3
	je .LBB6_2
	cmp r9, 1
	jne .LBB6_5
	xor ecx, ecx
	xor r8d, r8d
	jmp .LBB6_8
.LBB6_2:
	xor ecx, ecx
	jmp .LBB6_9
.LBB6_5:
	movabs r10, 144115188075855870
	and r10, r9
	mov r11d, 32
	xor ecx, ecx
	vpxor xmm0, xmm0, xmm0
	xor r8d, r8d
.LBB6_6:
	vpopcntq zmm1, zmmword ptr [rdi + 2*r11 - 64]
	valignq zmm2, zmm1, zmm0, 7
	vpaddq zmm2, zmm2, zmm1
	valignq zmm3, zmm2, zmm0, 6
	vpaddq zmm2, zmm3, zmm2
	valignq zmm3, zmm2, zmm0, 4
	vpaddq zmm2, zmm3, zmm2
	vpbroadcastq zmm3, rcx
	vpsubq zmm1, zmm3, zmm1
	vpaddq zmm1, zmm1, zmm2
	vpmovqd ymmword ptr [rdx + r11 - 32], zmm1
	vextracti32x4 xmm1, zmm2, 3
	vpextrq rbx, xmm1, 1
	add rbx, rcx
	add r8, 2
	vpopcntq zmm1, zmmword ptr [rdi + 2*r11]
	valignq zmm2, zmm1, zmm0, 7
	vpaddq zmm2, zmm2, zmm1
	valignq zmm3, zmm2, zmm0, 6
	vpaddq zmm2, zmm3, zmm2
	valignq zmm3, zmm2, zmm0, 4
	vpaddq zmm2, zmm3, zmm2
	vpbroadcastq zmm3, rbx
	vpsubq zmm1, zmm3, zmm1
	vpaddq zmm1, zmm1, zmm2
	vpmovqd ymmword ptr [rdx + r11], zmm1
	vextracti32x4 xmm1, zmm2, 3
	vpextrq rcx, xmm1, 1
	add rcx, rbx
	add r11, 64
	cmp r10, r8
	jne .LBB6_6
	test r9b, 1
	je .LBB6_9
.LBB6_8:
	mov r9, rcx
	mov rcx, r8
	shl rcx, 6
	shl r8, 5
	vpopcntq zmm0, zmmword ptr [rdi + rcx]
	vpxor xmm1, xmm1, xmm1
	valignq zmm2, zmm0, zmm1, 7
	vpaddq zmm2, zmm2, zmm0
	valignq zmm3, zmm2, zmm1, 6
	vpaddq zmm2, zmm3, zmm2
	valignq zmm1, zmm2, zmm1, 4
	vpaddq zmm1, zmm1, zmm2
	vpbroadcastq zmm2, r9
	vpsubq zmm0, zmm2, zmm0
	vpaddq zmm0, zmm0, zmm1
	vpmovqd ymmword ptr [rdx + r8], zmm0
	vextracti32x4 xmm0, zmm1, 3
	vpextrq rcx, xmm0, 1
	add rcx, r9
.LBB6_9:
	test rax, rax
	je .LBB6_17
	movabs r8, 1152921504606846968
	and rsi, r8
	mov r8, qword ptr [rdi + 8*rsi]
	mov dword ptr [rdx + 4*rsi], ecx
	cmp eax, 1
	je .LBB6_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB6_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 16]
	mov dword ptr [rdx + 4*rsi + 8], ecx
	cmp eax, 3
	je .LBB6_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 24]
	mov dword ptr [rdx + 4*rsi + 12], ecx
	cmp eax, 4
	je .LBB6_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 32]
	mov dword ptr [rdx + 4*rsi + 16], ecx
	cmp eax, 5
	je .LBB6_17
	popcnt r8, r8
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 40]
	mov dword ptr [rdx + 4*rsi + 20], ecx
	cmp eax, 6
	je .LBB6_17
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 24], ecx
.LBB6_17:
	pop rbx
	vzeroupper
	ret
.LBB6_18:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.31]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.36]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
