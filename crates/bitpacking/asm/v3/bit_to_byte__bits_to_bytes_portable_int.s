bitpacking::bit_to_byte::bits_to_bytes_portable_int:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB11_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB11_7
	mov eax, ecx
	and eax, 7
	cmp rcx, 8
	jae .LBB11_8
	xor esi, esi
	jmp .LBB11_5
.LBB11_8:
	movabs rsi, 144115188075855864
	and rcx, rsi
	lea r8, [rdx + 448]
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI11_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI11_1]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI11_4]
	vmovdqa ymm3, ymmword ptr [rip + .LCPI11_3]
.LBB11_9:
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 416], ymm4
	vmovdqu ymmword ptr [r8 - 448], ymm5
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 8]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 352], ymm4
	vmovdqu ymmword ptr [r8 - 384], ymm5
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 16]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 288], ymm4
	vpand ymm4, ymm5, ymm2
	vmovdqu ymmword ptr [r8 - 320], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 24]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 224], ymm4
	vmovdqu ymmword ptr [r8 - 256], ymm5
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 32]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 160], ymm4
	vmovdqu ymmword ptr [r8 - 192], ymm5
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 40]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 96], ymm4
	vpand ymm4, ymm5, ymm2
	vmovdqu ymmword ptr [r8 - 128], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 48]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 - 32], ymm4
	vmovdqu ymmword ptr [r8 - 64], ymm5
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 56]
	add rsi, 8
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [r8 + 32], ymm4
	vmovdqu ymmword ptr [r8], ymm5
	add r8, 512
	cmp rcx, rsi
	jne .LBB11_9
	test rax, rax
	je .LBB11_7
.LBB11_5:
	lea rcx, [rdi + 8*rsi]
	shl rsi, 6
	add rdx, rsi
	shl eax, 3
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI11_0]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI11_1]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI11_4]
	vmovdqa ymm3, ymmword ptr [rip + .LCPI11_3]
.LBB11_6:
	vpbroadcastq ymm4, qword ptr [rcx + rsi]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm1
	vpcmpeqb ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpshufb ymm4, ymm4, ymm3
	vpand ymm4, ymm4, ymm1
	vpcmpeqb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vmovdqu ymmword ptr [rdx + 8*rsi + 32], ymm4
	vmovdqu ymmword ptr [rdx + 8*rsi], ymm5
	add rsi, 8
	cmp rax, rsi
	jne .LBB11_6
.LBB11_7:
	pop rax
	vzeroupper
	ret
.LBB11_10:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.35]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.42]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
