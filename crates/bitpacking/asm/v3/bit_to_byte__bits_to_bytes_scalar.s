bitpacking::bit_to_byte::bits_to_bytes_scalar:
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB9_5
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB9_4
	shl rcx, 3
	xor eax, eax
	vmovdqa ymm7, ymmword ptr [rip + .LCPI9_7]
	vpbroadcastq ymm8, qword ptr [rip + .LCPI9_8]
	vpbroadcastd ymm9, dword ptr [rip + .LCPI9_18]
	vmovdqa ymm10, ymmword ptr [rip + .LCPI9_10]
	vmovdqa ymm11, ymmword ptr [rip + .LCPI9_11]
	vmovdqa ymm12, ymmword ptr [rip + .LCPI9_12]
	vmovdqa ymm13, ymmword ptr [rip + .LCPI9_13]
	vmovdqa ymm14, ymmword ptr [rip + .LCPI9_14]
	vmovdqa ymm15, ymmword ptr [rip + .LCPI9_15]
	vmovdqa ymm0, ymmword ptr [rip + .LCPI9_16]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI9_17]
.LBB9_3:
	vpbroadcastq ymm2, qword ptr [rdi + rax]
	vpsrlvq ymm3, ymm2, ymmword ptr [rip + .LCPI9_0]
	vpsrlvq ymm4, ymm2, ymmword ptr [rip + .LCPI9_4]
	vpsrlvq ymm5, ymm2, ymmword ptr [rip + .LCPI9_6]
	vpsrlvq ymm6, ymm2, ymm7
	vpand ymm6, ymm8, ymm6
	vpand ymm5, ymm8, ymm5
	vpackusdw ymm5, ymm5, ymm6
	vpsrlvq ymm6, ymm2, ymmword ptr [rip + .LCPI9_5]
	vpand ymm6, ymm8, ymm6
	vpand ymm4, ymm8, ymm4
	vpackusdw ymm4, ymm4, ymm6
	vpsrlvq ymm6, ymm2, ymmword ptr [rip + .LCPI9_2]
	vpermq ymm5, ymm5, 216
	vpermq ymm4, ymm4, 216
	vpackusdw ymm4, ymm4, ymm5
	vpsrlvq ymm5, ymm2, ymmword ptr [rip + .LCPI9_3]
	vpand ymm5, ymm8, ymm5
	vpand ymm6, ymm8, ymm6
	vpackusdw ymm5, ymm6, ymm5
	vpsrlvq ymm6, ymm2, ymmword ptr [rip + .LCPI9_1]
	vpand ymm6, ymm8, ymm6
	vpand ymm3, ymm8, ymm3
	vpackusdw ymm3, ymm3, ymm6
	vpermq ymm4, ymm4, 216
	vpermq ymm5, ymm5, 216
	vpermq ymm3, ymm3, 216
	vpackusdw ymm3, ymm3, ymm5
	vpermq ymm3, ymm3, 216
	vpackuswb ymm3, ymm3, ymm4
	vpermq ymm3, ymm3, 216
	vpand ymm3, ymm9, ymm3
	vmovdqu ymmword ptr [rdx + 8*rax], ymm3
	vpsrlvq ymm3, ymm2, ymm14
	vpsrlvq ymm4, ymm2, ymm0
	vpsrlvq ymm5, ymm2, ymm1
	vpand ymm5, ymm8, ymm5
	vpand ymm4, ymm8, ymm4
	vpackusdw ymm4, ymm4, ymm5
	vpsrlvq ymm5, ymm2, ymm15
	vpand ymm5, ymm8, ymm5
	vpand ymm3, ymm8, ymm3
	vpackusdw ymm3, ymm3, ymm5
	vpsrlvq ymm5, ymm2, ymm12
	vpermq ymm4, ymm4, 216
	vpermq ymm3, ymm3, 216
	vpackusdw ymm3, ymm3, ymm4
	vpsrlvq ymm4, ymm2, ymm13
	vpand ymm4, ymm8, ymm4
	vpand ymm5, ymm8, ymm5
	vpackusdw ymm4, ymm5, ymm4
	vpsrlvq ymm5, ymm2, ymm10
	vpsrlvq ymm2, ymm2, ymm11
	vpand ymm2, ymm8, ymm2
	vpand ymm5, ymm8, ymm5
	vpackusdw ymm2, ymm5, ymm2
	vpermq ymm4, ymm4, 216
	vpermq ymm2, ymm2, 216
	vpackusdw ymm2, ymm2, ymm4
	vpermq ymm3, ymm3, 216
	vpermq ymm2, ymm2, 216
	vpackuswb ymm2, ymm2, ymm3
	vpermq ymm2, ymm2, 216
	vpand ymm2, ymm9, ymm2
	vmovdqu ymmword ptr [rdx + 8*rax + 32], ymm2
	add rax, 8
	cmp rcx, rax
	jne .LBB9_3
.LBB9_4:
	vzeroupper
	ret
.LBB9_5:
	push rax
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.35]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.40]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
