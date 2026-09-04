bitpacking::bit_to_byte::bits_to_bytes_avx2:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB7_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB7_9
	mov eax, ecx
	and eax, 3
	cmp rcx, 4
	jae .LBB7_4
	xor esi, esi
	jmp .LBB7_7
.LBB7_4:
	movabs rsi, 144115188075855868
	and rcx, rsi
	lea r8, [rdx + 224]
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI7_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI7_1]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI7_3]
.LBB7_5:
	mov r9, qword ptr [rdi + 8*rsi]
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 224], ymm3
	shr r9, 32
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 192], ymm3
	mov r9, qword ptr [rdi + 8*rsi + 8]
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 160], ymm3
	shr r9, 32
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 128], ymm3
	mov r9, qword ptr [rdi + 8*rsi + 16]
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 96], ymm3
	shr r9, 32
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 64], ymm3
	mov r9, qword ptr [rdi + 8*rsi + 24]
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8 - 32], ymm3
	shr r9, 32
	vpbroadcastd ymm3, r9d
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r8], ymm3
	add rsi, 4
	add r8, 256
	cmp rcx, rsi
	jne .LBB7_5
	test rax, rax
	je .LBB7_9
.LBB7_7:
	lea rcx, [rdi + 8*rsi]
	shl rsi, 6
	lea rdx, [rsi + rdx + 32]
	shl eax, 3
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI7_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI7_1]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI7_3]
.LBB7_8:
	mov rdi, qword ptr [rcx + rsi]
	vpbroadcastd ymm3, edi
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [rdx + 8*rsi - 32], ymm3
	shr rdi, 32
	vpbroadcastd ymm3, edi
	vpshufb ymm3, ymm3, ymm0
	vpand ymm3, ymm3, ymm1
	vpcmpeqb ymm3, ymm3, ymm1
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [rdx + 8*rsi], ymm3
	add rsi, 8
	cmp rax, rsi
	jne .LBB7_8
.LBB7_9:
	pop rax
	vzeroupper
	ret
.LBB7_10:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.38]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.40]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
