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
	vmovdqa ymm1, ymmword ptr [rip + .LCPI6_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI6_2]
	vpbroadcastd ymm3, dword ptr [rip + .LCPI6_4]
.LBB6_5:
	vpbroadcastq ymm4, qword ptr [rdi + 8*rax]
	vpshufb ymm5, ymm4, ymm0
	vpshufb ymm4, ymm4, ymm1
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 96], ymm5
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8 - 64], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rax + 8]
	add rax, 2
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 32], ymm5
	vpshufb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8], ymm4
	sub r8, -128
	cmp rsi, rax
	jne .LBB6_5
	test cl, 1
	je .LBB6_8
.LBB6_7:
	vpbroadcastq ymm0, qword ptr [rdi + 8*rax]
	shl rax, 6
	vpshufb ymm1, ymm0, ymmword ptr [rip + .LCPI6_0]
	vpshufb ymm0, ymm0, ymmword ptr [rip + .LCPI6_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI6_2]
	vpand ymm1, ymm1, ymm2
	vpcmpeqb ymm1, ymm1, ymm2
	vpbroadcastd ymm3, dword ptr [rip + .LCPI6_4]
	vpand ymm1, ymm1, ymm3
	vmovdqu ymmword ptr [rdx + rax], ymm1
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
