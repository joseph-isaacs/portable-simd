bitpacking::select::select_portable:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov rcx, rsi
	shr rcx, 3
	je .LBB51_1
	mov r10, rcx
	shl r10, 6
	xor eax, eax
	vpxor xmm0, xmm0, xmm0
	mov r9, rdi
	mov r8, rdx
.LBB51_5:
	vpopcntq zmm1, zmmword ptr [r9]
	vpmovqb xmm2, zmm1
	vpsadbw xmm2, xmm2, xmm0
	vmovq r11, xmm2
	sub r8, r11
	jb .LBB51_12
	add r9, 64
	add rax, -512
	mov rdx, r8
	add r10, -64
	jne .LBB51_5
	lea edx, [8*rsi]
	and edx, 56
	je .LBB51_3
.LBB51_7:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rdi, [rdi + 8*rsi]
	shl rcx, 9
	neg rcx
	xor eax, eax
	xor r9d, r9d
	mov r10, r8
.LBB51_8:
	mov rsi, qword ptr [rdi + r9]
	popcnt r11, rsi
	sub r10, r11
	jb .LBB51_11
	add rcx, -64
	add r9, 8
	mov r8, r10
	cmp rdx, r9
	jne .LBB51_8
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB51_1:
	mov r8, rdx
	lea edx, [8*rsi]
	and edx, 56
	jne .LBB51_7
.LBB51_3:
	xor eax, eax
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB51_12:
	vpxor xmm0, xmm0, xmm0
	valignq zmm2, zmm1, zmm0, 7
	vpaddq zmm1, zmm2, zmm1
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
	vpopcntb xmm0, xmm0
	vpsllq xmm1, xmm0, 8
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 16
	vpaddb xmm0, xmm1, xmm0
	vpsllq xmm1, xmm0, 32
	vpaddb xmm0, xmm1, xmm0
	vpbroadcastb xmm1, edx
	vpsllq xmm2, xmm0, 8
	vmovq qword ptr [rsp], xmm2
	vpcmpleub k0, xmm0, xmm1
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
.LBB51_11:
	vmovq xmm0, rsi
	vpopcntb xmm0, xmm0
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
	mov edx, eax
	and edx, 7
	movzx edi, byte ptr [rsp + rdx]
	sub r8b, dil
	and r8b, 7
	movzx edi, r8b
	shl edi, 8
	shl edx, 3
	shrx rdx, rsi, rdx
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
