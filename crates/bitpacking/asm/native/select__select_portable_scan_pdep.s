bitpacking::select::select_portable_scan_pdep:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov r8, rsi
	shr r8, 3
	je .LBB26_9
	mov rax, r8
	shl rax, 6
	xor r9d, r9d
	vpbroadcastd zmm0, dword ptr [rip + .LCPI26_2]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI26_3]
	vpxor xmm2, xmm2, xmm2
	vpxor xmm3, xmm3, xmm3
	mov r10, rdi
	mov rcx, rdx
.LBB26_2:
	vmovdqu64 zmm4, zmmword ptr [r10]
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
	sub rcx, r11
	jb .LBB26_11
	add r10, 64
	add r9, -512
	mov rdx, rcx
	add rax, -64
	jne .LBB26_2
	lea edx, [8*rsi]
	and edx, 56
	je .LBB26_10
.LBB26_5:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rsi, [rdi + 8*rsi]
	shl r8, 9
	neg r8
	xor eax, eax
	xor edi, edi
	mov r9, rcx
.LBB26_6:
	mov r10, qword ptr [rsi + rdi]
	xor r11d, r11d
	popcnt r11, r10
	sub r9, r11
	jb .LBB26_12
	add r8, -64
	add rdi, 8
	mov rcx, r9
	cmp rdx, rdi
	jne .LBB26_6
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB26_9:
	mov rcx, rdx
	lea edx, [8*rsi]
	and edx, 56
	jne .LBB26_5
.LBB26_10:
	xor eax, eax
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB26_11:
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
	kmovb eax, k0
	xor ecx, ecx
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
.LBB26_12:
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
