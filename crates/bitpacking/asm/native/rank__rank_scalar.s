 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::rank::rank_scalar:
	push rax
	mov rcx, rsi
	shl rcx, 6
	cmp rdx, rcx
	ja .LBB10_25
	mov rax, rsi
	mov rsi, rdx
	shr rsi, 6
	and rdx, 63
	je .LBB10_2
	cmp rsi, rax
	jae .LBB10_7
	bzhi rcx, qword ptr [rdi + 8*rsi], rdx
	popcnt rcx, rcx
	cmp rsi, rax
	ja .LBB10_4
.LBB10_8:
	test rsi, rsi
	je .LBB10_9
	lea rax, [8*rsi]
	add rax, -8
	cmp rax, 24
	jae .LBB10_12
	xor eax, eax
	mov r10, rdi
	jmp .LBB10_22
.LBB10_2:
	xor ecx, ecx
	cmp rsi, rax
	jbe .LBB10_8
.LBB10_4:
	lea rcx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.21]
	xor edi, edi
	mov rdx, rax
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB10_9:
	xor eax, eax
	add rax, rcx
	pop rcx
	ret
.LBB10_12:
	mov rdx, rax
	shr rdx, 3
	inc rdx
	movabs r8, 4611686018427387888
	cmp rax, 120
	jae .LBB10_17
	xor r9d, r9d
	xor eax, eax
	jmp .LBB10_14
.LBB10_17:
	mov r9, rdx
	and r9, r8
	vpxor xmm0, xmm0, xmm0
	xor eax, eax
	vpxor xmm1, xmm1, xmm1
	vpxor xmm2, xmm2, xmm2
	vpxor xmm3, xmm3, xmm3
.LBB10_18:
	vpopcntq ymm4, ymmword ptr [rdi + 8*rax]
	vpaddq ymm0, ymm4, ymm0
	vpopcntq ymm4, ymmword ptr [rdi + 8*rax + 32]
	vpaddq ymm1, ymm4, ymm1
	vpopcntq ymm4, ymmword ptr [rdi + 8*rax + 64]
	vpaddq ymm2, ymm4, ymm2
	vpopcntq ymm4, ymmword ptr [rdi + 8*rax + 96]
	vpaddq ymm3, ymm4, ymm3
	add rax, 16
	cmp r9, rax
	jne .LBB10_18
	vpaddq ymm0, ymm1, ymm0
	vpaddq ymm0, ymm2, ymm0
	vpaddq ymm0, ymm3, ymm0
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp rdx, r9
	je .LBB10_24
	test dl, 12
	je .LBB10_21
.LBB10_14:
	add r8, 12
	and r8, rdx
	lea r10, [rdi + 8*r8]
	vmovq xmm0, rax
.LBB10_15:
	vpopcntq ymm1, ymmword ptr [rdi + 8*r9]
	vpaddq ymm0, ymm1, ymm0
	add r9, 4
	cmp r8, r9
	jne .LBB10_15
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp rdx, r8
	je .LBB10_24
.LBB10_22:
	lea rdx, [rdi + 8*rsi]
.LBB10_23:
	popcnt rsi, qword ptr [r10]
	add r10, 8
	add rax, rsi
	cmp r10, rdx
	jne .LBB10_23
.LBB10_24:
	add rax, rcx
	pop rcx
	vzeroupper
	ret
.LBB10_21:
	lea r10, [rdi + 8*r9]
	jmp .LBB10_22
.LBB10_25:
	lea rdi, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.18]
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.19]
	mov esi, 53
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB10_7:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.20]
	mov rdi, rsi
	mov rsi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
