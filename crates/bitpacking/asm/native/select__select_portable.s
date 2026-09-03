bitpacking::select::select_portable:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov rcx, rsi
	shr rcx, 3
	je .LBB24_1
	mov r10, rcx
	shl r10, 6
	xor eax, eax
	vpbroadcastd zmm0, dword ptr [rip + .LCPI24_4]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI24_3]
	vpxor xmm2, xmm2, xmm2
	vpxor xmm3, xmm3, xmm3
	mov r9, rdi
	mov r8, rdx
.LBB24_5:
	vmovdqu64 zmm4, zmmword ptr [r9]
	vpandq zmm5, zmm4, zmm0
	vpshufb zmm5, zmm1, zmm5
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm0
	vpshufb zmm4, zmm1, zmm4
	vpaddb zmm4, zmm4, zmm5
	vpsadbw zmm4, zmm4, zmm2
	vpmovqb xmm5, zmm4
	vpsadbw xmm5, xmm5, xmm3
	vmovq r11, xmm5
	sub r8, r11
	jb .LBB24_12
	add r9, 64
	add rax, -512
	mov rdx, r8
	add r10, -64
	jne .LBB24_5
	lea r9d, [8*rsi]
	and r9d, 56
	je .LBB24_3
.LBB24_7:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rsi, [rdi + 8*rsi]
	shl rcx, 9
	neg rcx
	xor eax, eax
	xor edi, edi
	mov r10, r8
.LBB24_8:
	mov rdx, qword ptr [rsi + rdi]
	xor r11d, r11d
	popcnt r11, rdx
	sub r10, r11
	jb .LBB24_11
	add rcx, -64
	add rdi, 8
	mov r8, r10
	cmp r9, rdi
	jne .LBB24_8
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB24_1:
	mov r8, rdx
	lea r9d, [8*rsi]
	and r9d, 56
	jne .LBB24_7
.LBB24_3:
	xor eax, eax
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB24_12:
	vpxor xmm0, xmm0, xmm0
	valignq zmm1, zmm4, zmm0, 7
	vpaddq zmm1, zmm1, zmm4
	valignq zmm2, zmm1, zmm0, 6
	vpaddq zmm1, zmm2, zmm1
	valignq zmm2, zmm1, zmm0, 4
	vpaddq zmm1, zmm2, zmm1
	vpbroadcastq zmm2, rdx
	vpcmpleuq k0, zmm1, zmm2
	valignq zmm0, zmm1, zmm0, 7
	vmovdqa64 zmmword ptr [rsp], zmm0
	kmovb ecx, k0
	popcnt ecx, ecx
	and ecx, 7
	lea esi, [8*rcx]
	sub edx, dword ptr [rsp + rsi]
	mov rsi, qword ptr [r9 + rsi]
	vmovq xmm0, rsi
	vpbroadcastd xmm1, dword ptr [rip + .LCPI24_4]
	vpand xmm2, xmm0, xmm1
	vmovdqa xmm3, xmmword ptr [rip + .LCPI24_3]
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
	vpbroadcastb xmm1, edx
	vpcmpleub k0, xmm0, xmm1
	vpsllq xmm0, xmm0, 8
	vmovq qword ptr [rsp], xmm0
	kmovb edi, k0
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
.LBB24_11:
	vmovq xmm0, rdx
	vpbroadcastd xmm1, dword ptr [rip + .LCPI24_4]
	vmovdqa xmm2, xmmword ptr [rip + .LCPI24_3]
	vpand xmm3, xmm0, xmm1
	vpshufb xmm3, xmm2, xmm3
	vpsrlw xmm0, xmm0, 4
	vpand xmm0, xmm0, xmm1
	vpshufb xmm0, xmm2, xmm0
	vpaddb xmm0, xmm0, xmm3
	vpsllq xmm1, xmm0, 8
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 16
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 32
	vpaddb xmm0, xmm1, xmm0
	vpbroadcastb xmm1, r8d
	vpcmpleub k0, xmm0, xmm1
	vpsllq xmm0, xmm0, 8
	vmovq qword ptr [rsp], xmm0
	kmovb eax, k0
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
