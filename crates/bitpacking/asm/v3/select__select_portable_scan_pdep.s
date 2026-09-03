bitpacking::select::select_portable_scan_pdep:
	push rbp
	mov rbp, rsp
	and rsp, -64
	sub rsp, 128
	mov r8, rsi
	shr r8, 3
	je .LBB30_9
	mov rax, r8
	shl rax, 6
	xor r9d, r9d
	vpbroadcastd ymm1, dword ptr [rip + .LCPI30_3]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI30_4]
	vpxor xmm0, xmm0, xmm0
	mov r10, rdi
	mov rcx, rdx
.LBB30_2:
	vmovdqu ymm4, ymmword ptr [r10]
	vmovdqu ymm3, ymmword ptr [r10 + 32]
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
	sub rcx, r11
	jb .LBB30_11
	add r10, 64
	add r9, -512
	mov rdx, rcx
	add rax, -64
	jne .LBB30_2
	lea edx, [8*rsi]
	and edx, 56
	je .LBB30_10
.LBB30_5:
	movabs rax, 1152921504606846968
	and rsi, rax
	lea rsi, [rdi + 8*rsi]
	shl r8, 9
	neg r8
	xor eax, eax
	xor edi, edi
	mov r9, rcx
.LBB30_6:
	mov r10, qword ptr [rsi + rdi]
	xor r11d, r11d
	popcnt r11, r10
	sub r9, r11
	jb .LBB30_12
	add r8, -64
	add rdi, 8
	mov rcx, r9
	cmp rdx, rdi
	jne .LBB30_6
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB30_9:
	mov rcx, rdx
	lea edx, [8*rsi]
	and edx, 56
	jne .LBB30_5
.LBB30_10:
	xor eax, eax
	mov rdx, rcx
	mov rsp, rbp
	pop rbp
	vzeroupper
	ret
.LBB30_11:
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
	vpbroadcastq ymm3, qword ptr [rip + .LCPI30_2]
	vpor ymm5, ymm1, ymm3
	vpxor ymm2, ymm2, ymm3
	vpcmpgtq ymm5, ymm5, ymm2
	vpor ymm3, ymm0, ymm3
	vpcmpgtq ymm2, ymm3, ymm2
	vpackssdw ymm2, ymm2, ymm5
	vpermq ymm2, ymm2, 216
	vmovmskps eax, ymm2
	xor eax, 255
	vpblendd ymm1, ymm1, ymm0, 192
	vpermq ymm0, ymm0, 144
	vpblendd ymm0, ymm0, ymm4, 3
	vmovdqa ymmword ptr [rsp], ymm0
	vpermq ymm0, ymm1, 147
	vmovdqa ymmword ptr [rsp + 32], ymm0
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
.LBB30_12:
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
