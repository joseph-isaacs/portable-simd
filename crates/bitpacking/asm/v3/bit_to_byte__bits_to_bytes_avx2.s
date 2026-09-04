bitpacking::bit_to_byte::bits_to_bytes_avx2:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB6_9
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB6_8
	cmp rcx, 1
	jne .LBB6_4
	xor eax, eax
	jmp .LBB6_7
.LBB6_4:
	movabs rsi, 144115188075855870
	and rsi, rcx
	lea r8, [rdx + 96]
	xor eax, eax
	vmovdqa ymm0, ymmword ptr [rip + .LCPI6_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI6_1]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI6_3]
.LBB6_5:
	mov r9, qword ptr [rdi + 8*rax]
	vmovd xmm3, r9d
	vpbroadcastd ymm3, xmm3
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 96], ymm3
	shr r9, 32
	vmovd xmm3, r9d
	vpbroadcastd ymm3, xmm3
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 64], ymm3
	mov r9, qword ptr [rdi + 8*rax + 8]
	vmovd xmm3, r9d
	vpbroadcastd ymm3, xmm3
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 32], ymm3
	shr r9, 32
	vmovd xmm3, r9d
	vpbroadcastd ymm3, xmm3
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8], ymm3
	add rax, 2
	sub r8, -128
	cmp rsi, rax
	jne .LBB6_5
	test cl, 1
	je .LBB6_8
.LBB6_7:
	mov rcx, qword ptr [rdi + 8*rax]
	shl rax, 6
	vmovd xmm0, ecx
	vpbroadcastd ymm0, xmm0
	vmovdqa ymm1, ymmword ptr [rip + .LCPI6_0]
	vpshufb ymm0, ymm0, ymm1
	vpbroadcastq ymm2, qword ptr [rip + .LCPI6_1]
	vpand ymm0, ymm0, ymm2
	vpcmpeqb ymm0, ymm0, ymm2
	vpbroadcastd ymm3, dword ptr [rip + .LCPI6_3]
	vpand ymm0, ymm0, ymm3
	vmovdqu ymmword ptr [rdx + rax], ymm0
	shr rcx, 32
	vmovd xmm0, ecx
	vpbroadcastd ymm0, xmm0
	vpshufb ymm0, ymm0, ymm1
	vpand ymm0, ymm0, ymm2
	vpcmpeqb ymm0, ymm0, ymm2
	vpand ymm0, ymm0, ymm3
	vmovdqu ymmword ptr [rdx + rax + 32], ymm0
.LBB6_8:
	pop rax
	vzeroupper
	ret
.LBB6_9:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.35]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.37]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
