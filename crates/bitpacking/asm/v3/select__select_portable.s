bitpacking::select::select_portable:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov rcx, rsi
	shr rcx, 3
	je .LBB27_1
	mov r10, rcx
	shl r10, 6
	xor eax, eax
	vpbroadcastd ymm1, dword ptr [rip + .LCPI27_5]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI27_4]
	vpxor xmm0, xmm0, xmm0
	mov r9, rdi
	mov r8, rdx
.LBB27_5:
	vmovdqu ymm4, ymmword ptr [r9]
	vmovdqu ymm3, ymmword ptr [r9 + 32]
	vpand ymm5, ymm3, ymm1
	vpshufb ymm5, ymm2, ymm5
	vpsrlw ymm3, ymm3, 4
	vpand ymm3, ymm3, ymm1
	vpshufb ymm3, ymm2, ymm3
	vpaddb ymm3, ymm3, ymm5
	vpand ymm5, ymm4, ymm1
	vpshufb ymm5, ymm2, ymm5
	vpsrlw ymm4, ymm4, 4
	vpand ymm4, ymm4, ymm1
	vpshufb ymm4, ymm2, ymm4
	vpaddb ymm4, ymm4, ymm5
	vpaddb ymm5, ymm4, ymm3
	vpsadbw ymm5, ymm5, ymm0
	vextracti128 xmm6, ymm5, 1
	vpaddq xmm5, xmm5, xmm6
	vpshufd xmm6, xmm5, 238
	vpaddq xmm5, xmm5, xmm6
	vmovq r11, xmm5
	sub r8, r11
	jb .LBB27_12
	add r9, 64
	add rax, -512
	mov rdx, r8
	add r10, -64
	jne .LBB27_5
	lea r9d, [8*rsi]
	and r9d, 56
	je .LBB27_3
.LBB27_7:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rsi, [rdi + 8*rsi]
	shl rcx, 9
	neg rcx
	xor eax, eax
	xor edi, edi
	mov r10, r8
.LBB27_8:
	mov rdx, qword ptr [rsi + rdi]
	xor r11d, r11d
	popcnt r11, rdx
	sub r10, r11
	jb .LBB27_11
	add rcx, -64
	add rdi, 8
	mov r8, r10
	cmp r9, rdi
	jne .LBB27_8
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB27_1:
	mov r8, rdx
	lea r9d, [8*rsi]
	and r9d, 56
	jne .LBB27_7
.LBB27_3:
	xor eax, eax
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB27_12:
	vpsadbw ymm1, ymm3, ymm0
	vpsadbw ymm0, ymm4, ymm0
	vpblendd ymm2, ymm1, ymm0, 192
	vpermq ymm2, ymm2, 147
	vpermq ymm3, ymm0, 144
	vpxor xmm4, xmm4, xmm4
	vpblendd ymm3, ymm3, ymm4, 3
	vpaddq ymm0, ymm3, ymm0
	vpaddq ymm1, ymm2, ymm1
	vperm2i128 ymm2, ymm0, ymm1, 33
	vperm2i128 ymm3, ymm0, ymm0, 8
	vpaddq ymm0, ymm3, ymm0
	vpaddq ymm1, ymm2, ymm1
	vpaddq ymm1, ymm0, ymm1
	vmovq xmm2, rdx
	vpbroadcastq ymm2, xmm2
	vpbroadcastq ymm3, qword ptr [rip + .LCPI27_2]
	vpor ymm5, ymm1, ymm3
	vpxor ymm2, ymm2, ymm3
	vpcmpgtq ymm5, ymm5, ymm2
	vpor ymm3, ymm0, ymm3
	vpcmpgtq ymm2, ymm3, ymm2
	vpackssdw ymm2, ymm2, ymm5
	vpermq ymm2, ymm2, 216
	vmovmskps ecx, ymm2
	xor ecx, 255
	vpblendd ymm1, ymm1, ymm0, 192
	vpermq ymm1, ymm1, 147
	vpermq ymm0, ymm0, 144
	vpblendd ymm0, ymm0, ymm4, 3
	vmovdqa ymmword ptr [rsp], ymm0
	vmovdqa ymmword ptr [rsp + 32], ymm1
	popcnt ecx, ecx
	and ecx, 7
	lea esi, [8*rcx]
	sub edx, dword ptr [rsp + rsi]
	mov rsi, qword ptr [r9 + rsi]
	vmovq xmm0, rsi
	vpbroadcastd xmm1, dword ptr [rip + .LCPI27_5]
	vpand xmm2, xmm0, xmm1
	vmovdqa xmm3, xmmword ptr [rip + .LCPI27_4]
	vpshufb xmm2, xmm3, xmm2
	vpsrlw xmm0, xmm0, 4
	vpand xmm0, xmm0, xmm1
	vpshufb xmm0, xmm3, xmm0
	vpaddb xmm0, xmm0, xmm2
	vpsllq xmm1, xmm0, 8
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 16
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 32
	vpaddb xmm0, xmm1, xmm0
	vmovd xmm1, edx
	vpbroadcastb xmm1, xmm1
	vpminub xmm1, xmm0, xmm1
	vpcmpeqb xmm1, xmm0, xmm1
	vpmovmskb edi, xmm1
	vpsllq xmm0, xmm0, 8
	vmovq qword ptr [rsp], xmm0
	movzx edi, dil
	popcnt edi, edi
	mov r8d, edi
	and r8d, 7
	movzx r9d, byte ptr [rsp + r8]
	sub dl, r9b
	and dl, 7
	movzx edx, dl
	shl edx, 8
	shl r8d, 3
	shrx rsi, rsi, r8
	movzx esi, sil
	and dil, 7
	movzx edi, dil
	add rdx, qword ptr [rip + bitpacking::select::SELECT_IN_BYTE@GOTPCREL]
	movzx esi, byte ptr [rsi + rdx]
	shl ecx, 6
	lea rdx, [rcx + 8*rdi]
	add rdx, rsi
	sub rdx, rax
	mov eax, 1
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB27_11:
	vmovq xmm0, rdx
	vpbroadcastd xmm1, dword ptr [rip + .LCPI27_5]
	vpand xmm2, xmm0, xmm1
	vmovdqa xmm3, xmmword ptr [rip + .LCPI27_4]
	vpshufb xmm2, xmm3, xmm2
	vpsrlw xmm0, xmm0, 4
	vpand xmm0, xmm0, xmm1
	vpshufb xmm0, xmm3, xmm0
	vpaddb xmm0, xmm0, xmm2
	vpsllq xmm1, xmm0, 8
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 16
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 32
	vpaddb xmm0, xmm1, xmm0
	vmovd xmm1, r8d
	vpbroadcastb xmm1, xmm1
	vpminub xmm1, xmm0, xmm1
	vpcmpeqb xmm1, xmm0, xmm1
	vpsllq xmm0, xmm0, 8
	vmovq qword ptr [rsp], xmm0
	vpmovmskb eax, xmm1
	movzx eax, al
	popcnt eax, eax
	mov esi, eax
	and esi, 7
	movzx edi, byte ptr [rsp + rsi]
	sub r8b, dil
	and r8b, 7
	movzx edi, r8b
	shl edi, 8
	shl esi, 3
	shrx rdx, rdx, rsi
	movzx edx, dl
	and al, 7
	movzx eax, al
	add rdi, qword ptr [rip + bitpacking::select::SELECT_IN_BYTE@GOTPCREL]
	movzx edx, byte ptr [rdx + rdi]
	lea rdx, [rdx + 8*rax]
	sub rdx, rcx
	mov eax, 1
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
