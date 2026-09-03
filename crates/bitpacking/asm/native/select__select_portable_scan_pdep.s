 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::select::select_portable_scan_pdep:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov r8, rsi
	shr r8, 3
	je .LBB33_9
	mov rax, r8
	shl rax, 6
	xor r9d, r9d
	vpxor xmm0, xmm0, xmm0
	mov r10, rdi
	mov rcx, rdx
.LBB33_2:
	vpopcntq zmm1, zmmword ptr [r10]
	vpmovqb xmm2, zmm1
	vpsadbw xmm2, xmm2, xmm0
	vmovq r11, xmm2
	sub rcx, r11
	jb .LBB33_11
	add r10, 64
	add r9, -512
	mov rdx, rcx
	add rax, -64
	jne .LBB33_2
	lea edx, [8*rsi]
	and edx, 56
	je .LBB33_10
.LBB33_5:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rsi, [rdi + 8*rsi]
	shl r8, 9
	neg r8
	xor eax, eax
	xor edi, edi
	mov r9, rcx
.LBB33_6:
	mov r10, qword ptr [rsi + rdi]
	popcnt r11, r10
	sub r9, r11
	jb .LBB33_12
	add r8, -64
	add rdi, 8
	mov rcx, r9
	cmp rdx, rdi
	jne .LBB33_6
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB33_9:
	mov rcx, rdx
	lea edx, [8*rsi]
	and edx, 56
	jne .LBB33_5
.LBB33_10:
	xor eax, eax
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB33_11:
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
	kmovb eax, k0
	popcnt ecx, eax
	and ecx, 7
	lea esi, [8*rcx]
	sub edx, dword ptr [rsp + rsi]
	mov eax, 1
	shlx rdx, rax, rdx
	pdep rdx, rdx, qword ptr [r10 + rsi]
	tzcnt rdx, rdx
	shl ecx, 6
	add rcx, rdx
	sub rcx, r9
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB33_12:
	mov eax, 1
	shlx rcx, rax, rcx
	pdep rcx, rcx, r10
	tzcnt rcx, rcx
	sub rcx, r8
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
