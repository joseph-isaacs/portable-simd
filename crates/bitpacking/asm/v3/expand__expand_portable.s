bitpacking::expand::expand_portable:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 296
	mov qword ptr [rsp + 32], r8
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp], rdi
	cmp r9, rcx
	jb .LBB27_58
	mov r15, -1
	mov eax, ecx
	and eax, 7
	mov qword ptr [rsp + 40], rax
	mov qword ptr [rsp + 48], rcx
	shr rcx, 3
	je .LBB27_2
	shl rcx, 6
	xor r13d, r13d
	vpbroadcastd ymm3, dword ptr [rip + .LCPI27_2]
	vbroadcasti128 ymm4, xmmword ptr [rip + .LCPI27_3]
	vpxor xmm2, xmm2, xmm2
	xor ebx, ebx
	xor eax, eax
	xor ebp, ebp
	xor r12d, r12d
	xor r11d, r11d
	mov qword ptr [rsp + 56], rcx
	jmp .LBB27_8
.LBB27_52:
	mov rbp, rbx
	mov rbx, qword ptr [rsp + 16]
.LBB27_57:
	test r10b, 64
	shrx rdi, rsi, r10
	mov r11, rdi
	cmovne r11, r13
	mov r12, rdx
	mov ecx, r10d
	shrd r12, rsi, cl
	test r10b, 64
	shlx rcx, r15, r10
	cmovne rcx, r13
	cmovne r12, rdi
	andn rcx, rcx, rdx
	vmovq xmm0, rcx
	vpbroadcastq ymm0, xmm0
	vpblendd ymm0, ymm3, ymm0, 192
	vmovdqu ymmword ptr [rsp + 256], ymm0
	vpcmpeqd ymm0, ymm0, ymm0
	vpxor ymm1, ymm8, ymm0
	vpxor ymm3, ymm7, ymm0
	vpaddq ymm0, ymm3, ymm3
	vpaddq ymm2, ymm1, ymm1
	vpsllq ymm4, ymm1, 2
	vpsllq ymm5, ymm3, 2
	vpxor ymm3, ymm5, ymm3
	vpxor ymm1, ymm4, ymm1
	vpxor ymm1, ymm1, ymm2
	vpxor ymm3, ymm3, ymm0
	vpsllq ymm3, ymm3, 2
	vpsllq ymm1, ymm1, 2
	vpxor ymm1, ymm1, ymm2
	vpxor ymm3, ymm3, ymm0
	vpsllq ymm4, ymm3, 4
	vpsllq ymm5, ymm1, 4
	vpxor ymm1, ymm5, ymm1
	vpxor ymm3, ymm4, ymm3
	vpsllq ymm4, ymm3, 8
	vpsllq ymm5, ymm1, 8
	vpxor ymm1, ymm5, ymm1
	vpxor ymm3, ymm4, ymm3
	vpsllq ymm4, ymm3, 16
	vpsllq ymm5, ymm1, 16
	vpxor ymm1, ymm5, ymm1
	vpxor ymm3, ymm4, ymm3
	vpsllq ymm4, ymm3, 32
	vpsllq ymm5, ymm1, 32
	vpxor ymm6, ymm5, ymm1
	vmovdqu ymmword ptr [rsp + 128], ymm6
	vpxor ymm5, ymm4, ymm3
	vmovdqu ymmword ptr [rsp + 64], ymm5
	vpand ymm9, ymm5, ymm7
	vmovdqu ymmword ptr [rsp + 192], ymm9
	vpand ymm10, ymm8, ymm6
	vpxor ymm1, ymm10, ymm8
	vpxor ymm4, ymm9, ymm7
	vpsrlq ymm3, ymm10, 1
	vpor ymm3, ymm1, ymm3
	vpsrlq ymm1, ymm9, 1
	vpor ymm4, ymm4, ymm1
	vpandn ymm1, ymm5, ymm0
	vpandn ymm2, ymm6, ymm2
	vpaddq ymm0, ymm2, ymm2
	vpaddq ymm5, ymm1, ymm1
	vpxor ymm5, ymm5, ymm1
	vpxor ymm0, ymm0, ymm2
	vpsllq ymm6, ymm0, 2
	vmovdqu ymmword ptr [rsp + 160], ymm7
	vpsllq ymm7, ymm5, 2
	vpxor ymm5, ymm7, ymm5
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm0, 4
	vpsllq ymm7, ymm5, 4
	vpxor ymm5, ymm7, ymm5
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm0, 8
	vpsllq ymm7, ymm5, 8
	vpxor ymm5, ymm7, ymm5
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm0, 16
	vpsllq ymm7, ymm5, 16
	vpxor ymm5, ymm7, ymm5
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm0, 32
	vpsllq ymm7, ymm5, 32
	vpxor ymm5, ymm7, ymm5
	vpxor ymm6, ymm6, ymm0
	vpand ymm12, ymm5, ymm4
	vpxor ymm0, ymm12, ymm4
	vpsrlq ymm4, ymm12, 2
	vpor ymm0, ymm0, ymm4
	vpand ymm13, ymm6, ymm3
	vpxor ymm3, ymm13, ymm3
	vpsrlq ymm4, ymm13, 2
	vpor ymm4, ymm3, ymm4
	vpandn ymm2, ymm6, ymm2
	vpandn ymm3, ymm5, ymm1
	vpaddq ymm1, ymm2, ymm2
	vpxor ymm1, ymm1, ymm2
	vpsllq ymm5, ymm1, 2
	vpxor ymm1, ymm5, ymm1
	vpaddq ymm5, ymm3, ymm3
	vpxor ymm5, ymm5, ymm3
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm1, 4
	vpxor ymm1, ymm6, ymm1
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm1, 8
	vpxor ymm1, ymm6, ymm1
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm1, 16
	vpxor ymm1, ymm6, ymm1
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm1, 32
	vpxor ymm6, ymm6, ymm1
	vpsllq ymm1, ymm5, 32
	vpxor ymm5, ymm1, ymm5
	vpand ymm14, ymm6, ymm4
	vpxor ymm1, ymm14, ymm4
	vpsrlq ymm4, ymm14, 4
	vpor ymm1, ymm1, ymm4
	vpand ymm15, ymm5, ymm0
	vpxor ymm0, ymm15, ymm0
	vpsrlq ymm4, ymm15, 4
	vpor ymm4, ymm0, ymm4
	vpandn ymm0, ymm5, ymm3
	vpandn ymm6, ymm6, ymm2
	vpaddq ymm2, ymm0, ymm0
	vpxor ymm2, ymm2, ymm0
	vpsllq ymm3, ymm2, 2
	vpxor ymm2, ymm3, ymm2
	vpaddq ymm3, ymm6, ymm6
	vpxor ymm3, ymm3, ymm6
	vpsllq ymm5, ymm3, 2
	vpxor ymm3, ymm5, ymm3
	vpsllq ymm5, ymm2, 4
	vpxor ymm2, ymm5, ymm2
	vpsllq ymm5, ymm3, 4
	vpxor ymm3, ymm5, ymm3
	vpsllq ymm5, ymm2, 8
	vpxor ymm2, ymm5, ymm2
	vpsllq ymm5, ymm3, 8
	vpxor ymm3, ymm5, ymm3
	vpsllq ymm5, ymm2, 16
	vpxor ymm2, ymm5, ymm2
	vpsllq ymm5, ymm3, 16
	vpxor ymm3, ymm5, ymm3
	vpsllq ymm5, ymm2, 32
	vpxor ymm5, ymm5, ymm2
	vpsllq ymm2, ymm3, 32
	vpxor ymm7, ymm2, ymm3
	vmovdqu ymmword ptr [rsp + 224], ymm8
	vpand ymm8, ymm5, ymm4
	vpxor ymm3, ymm8, ymm4
	vpsrlq ymm4, ymm8, 8
	vpor ymm4, ymm3, ymm4
	vpand ymm3, ymm7, ymm1
	vpxor ymm1, ymm3, ymm1
	vpsrlq ymm11, ymm3, 8
	vpor ymm1, ymm11, ymm1
	vpandn ymm6, ymm7, ymm6
	vpandn ymm5, ymm5, ymm0
	vpaddq ymm0, ymm6, ymm6
	vpxor ymm0, ymm0, ymm6
	vpsllq ymm7, ymm0, 2
	vpxor ymm0, ymm7, ymm0
	vpaddq ymm7, ymm5, ymm5
	vpxor ymm7, ymm7, ymm5
	vpsllq ymm11, ymm7, 2
	vpxor ymm7, ymm11, ymm7
	vpsllq ymm11, ymm0, 4
	vpxor ymm0, ymm11, ymm0
	vpsllq ymm11, ymm7, 4
	vpxor ymm7, ymm11, ymm7
	vpsllq ymm11, ymm0, 8
	vpxor ymm0, ymm11, ymm0
	vpsllq ymm11, ymm7, 8
	vpxor ymm7, ymm11, ymm7
	vpsllq ymm11, ymm0, 16
	vpxor ymm0, ymm11, ymm0
	vpsllq ymm11, ymm7, 16
	vpxor ymm7, ymm11, ymm7
	vpsllq ymm11, ymm0, 32
	vpxor ymm11, ymm11, ymm0
	vpsllq ymm0, ymm7, 32
	vpxor ymm0, ymm0, ymm7
	vpand ymm2, ymm11, ymm1
	vpxor ymm1, ymm2, ymm1
	vpsrlq ymm7, ymm2, 16
	vpor ymm7, ymm1, ymm7
	vpand ymm1, ymm0, ymm4
	vpxor ymm4, ymm1, ymm4
	vpsrlq ymm9, ymm1, 16
	vpor ymm4, ymm9, ymm4
	vpandn ymm0, ymm0, ymm5
	vpandn ymm5, ymm11, ymm6
	vpaddq ymm6, ymm0, ymm0
	vpxor ymm0, ymm6, ymm0
	vpaddq ymm6, ymm5, ymm5
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm0, 2
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm0, 4
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm0, 8
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm0, 16
	vpxor ymm0, ymm6, ymm0
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm0, 32
	vpxor ymm0, ymm6, ymm0
	vpand ymm0, ymm0, ymm4
	vpsllq ymm4, ymm5, 32
	vpxor ymm4, ymm4, ymm5
	vpand ymm4, ymm4, ymm7
	vmovdqu ymm6, ymmword ptr [rsp + 96]
	vpsllq ymm5, ymm6, 32
	vpandn ymm6, ymm0, ymm6
	vpand ymm0, ymm5, ymm0
	vpor ymm0, ymm0, ymm6
	vmovdqu ymm6, ymmword ptr [rsp + 256]
	vpsllq ymm5, ymm6, 32
	vpandn ymm6, ymm4, ymm6
	vpand ymm4, ymm5, ymm4
	vpor ymm4, ymm4, ymm6
	vpsllq ymm5, ymm4, 16
	vpandn ymm4, ymm2, ymm4
	vpand ymm2, ymm5, ymm2
	vpor ymm2, ymm2, ymm4
	vpsllq ymm4, ymm0, 16
	vpandn ymm0, ymm1, ymm0
	vpand ymm1, ymm4, ymm1
	vpor ymm0, ymm1, ymm0
	vpsllq ymm1, ymm0, 8
	vpandn ymm0, ymm8, ymm0
	vpand ymm1, ymm8, ymm1
	vpor ymm0, ymm1, ymm0
	vpsllq ymm1, ymm2, 8
	vpandn ymm2, ymm3, ymm2
	vpand ymm1, ymm1, ymm3
	vpor ymm1, ymm1, ymm2
	vpsllq ymm2, ymm1, 4
	vpandn ymm1, ymm14, ymm1
	vpand ymm2, ymm14, ymm2
	vpor ymm1, ymm2, ymm1
	vpsllq ymm2, ymm0, 4
	vpandn ymm0, ymm15, ymm0
	vpand ymm2, ymm15, ymm2
	vpor ymm0, ymm2, ymm0
	vpsllq ymm2, ymm0, 2
	vpandn ymm0, ymm12, ymm0
	vpand ymm2, ymm12, ymm2
	vpor ymm0, ymm2, ymm0
	vpsllq ymm2, ymm1, 2
	vpandn ymm1, ymm13, ymm1
	vpand ymm2, ymm13, ymm2
	vpor ymm1, ymm2, ymm1
	vpandn ymm2, ymm10, ymm1
	vpaddq ymm1, ymm1, ymm1
	vpand ymm1, ymm1, ymmword ptr [rsp + 128]
	vpor ymm1, ymm1, ymm2
	vmovdqu ymm2, ymmword ptr [rsp + 192]
	vpandn ymm2, ymm2, ymm0
	vpaddq ymm0, ymm0, ymm0
	vpand ymm0, ymm0, ymmword ptr [rsp + 64]
	vpor ymm0, ymm0, ymm2
	vpand ymm1, ymm1, ymmword ptr [rsp + 224]
	vpand ymm0, ymm0, ymmword ptr [rsp + 160]
	mov rcx, qword ptr [rsp + 32]
	vmovdqu ymmword ptr [rcx + rbx], ymm0
	vmovdqu ymmword ptr [rcx + rbx + 32], ymm1
	sub eax, r10d
	add rbx, 64
	mov rcx, qword ptr [rsp + 56]
	cmp rcx, rbx
	vpbroadcastd ymm3, dword ptr [rip + .LCPI27_2]
	vbroadcasti128 ymm4, xmmword ptr [rip + .LCPI27_3]
	vpxor xmm2, xmm2, xmm2
	je .LBB27_3
.LBB27_8:
	mov rcx, qword ptr [rsp + 24]
	vmovdqu ymm7, ymmword ptr [rcx + rbx]
	vpand ymm0, ymm7, ymm3
	vpshufb ymm0, ymm4, ymm0
	vpsrlw ymm1, ymm7, 4
	vpand ymm1, ymm1, ymm3
	vpshufb ymm1, ymm4, ymm1
	vpaddb ymm0, ymm1, ymm0
	vpsadbw ymm5, ymm0, ymm2
	vmovd r10d, xmm5
	cmp eax, r10d
	jae .LBB27_19
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_10
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*rbp]
	jmp .LBB27_18
.LBB27_10:
	xor edx, edx
.LBB27_18:
	xor esi, esi
	mov ecx, eax
	shld rsi, rdx, cl
	inc rbp
	shlx rcx, rdx, rax
	test al, 64
	cmovne rsi, rcx
	cmovne rcx, r13
	or r11, rsi
	or r12, rcx
	add eax, 64
.LBB27_19:
	test r10b, 64
	shrx rsi, r11, r10
	mov rdx, rsi
	cmovne rdx, r13
	mov r9, r12
	mov ecx, r10d
	shrd r9, r11, cl
	test r10b, 64
	shlx rcx, r15, r10
	cmovne rcx, r13
	mov qword ptr [rsp + 64], rcx
	cmovne r9, rsi
	sub eax, r10d
	vpextrd r10d, xmm5, 2
	cmp eax, r10d
	jae .LBB27_24
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_21
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rcx + 8*rbp]
	jmp .LBB27_23
.LBB27_21:
	xor esi, esi
.LBB27_23:
	xor edi, edi
	mov ecx, eax
	shld rdi, rsi, cl
	inc rbp
	shlx rcx, rsi, rax
	test al, 64
	cmovne rdi, rcx
	cmovne rcx, r13
	or rdx, rdi
	or r9, rcx
	add eax, 64
.LBB27_24:
	test r10b, 64
	shrx r8, rdx, r10
	mov rdi, r8
	cmovne rdi, r13
	mov rsi, r9
	mov ecx, r10d
	shrd rsi, rdx, cl
	test r10b, 64
	shlx rcx, r15, r10
	cmovne rcx, r13
	mov qword ptr [rsp + 192], rcx
	cmovne rsi, r8
	sub eax, r10d
	vextracti128 xmm2, ymm5, 1
	vmovd r10d, xmm2
	cmp eax, r10d
	mov qword ptr [rsp + 96], r9
	jae .LBB27_29
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_26
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*rbp]
	jmp .LBB27_28
.LBB27_26:
	xor edx, edx
.LBB27_28:
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdx, cl
	inc rbp
	shlx rcx, rdx, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r13
	or rdi, r8
	or rsi, rcx
	add eax, 64
.LBB27_29:
	test r10b, 64
	shrx r8, rdi, r10
	mov r9, r8
	cmovne r9, r13
	mov rdx, rsi
	mov ecx, r10d
	shrd rdx, rdi, cl
	test r10b, 64
	shlx rcx, r15, r10
	cmovne rcx, r13
	mov qword ptr [rsp + 160], rcx
	cmovne rdx, r8
	sub eax, r10d
	vpextrd r10d, xmm2, 2
	cmp eax, r10d
	jae .LBB27_34
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_31
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rcx + 8*rbp]
	jmp .LBB27_33
.LBB27_31:
	xor edi, edi
.LBB27_33:
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdi, cl
	inc rbp
	shlx rcx, rdi, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r13
	or r9, r8
	or rdx, rcx
	add eax, 64
.LBB27_34:
	mov rcx, qword ptr [rsp + 24]
	vmovdqu ymm8, ymmword ptr [rcx + rbx + 32]
	vpand ymm0, ymm8, ymm3
	vpshufb ymm0, ymm4, ymm0
	vpsrlw ymm1, ymm8, 4
	vpand ymm1, ymm1, ymm3
	test r10b, 64
	shrx r8, r9, r10
	mov r14, r8
	cmovne r14, r13
	mov rdi, rdx
	mov ecx, r10d
	shrd rdi, r9, cl
	vpshufb ymm1, ymm4, ymm1
	vpaddb ymm0, ymm1, ymm0
	test r10b, 64
	shlx rcx, r15, r10
	cmovne rcx, r13
	mov qword ptr [rsp + 128], rcx
	cmovne rdi, r8
	vpxor xmm1, xmm1, xmm1
	vpsadbw ymm6, ymm0, ymm1
	sub eax, r10d
	vmovd r10d, xmm6
	cmp eax, r10d
	jae .LBB27_39
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_36
	mov rcx, qword ptr [rsp]
	mov r9, qword ptr [rcx + 8*rbp]
	jmp .LBB27_38
.LBB27_36:
	xor r9d, r9d
.LBB27_38:
	xor r8d, r8d
	mov ecx, eax
	shld r8, r9, cl
	inc rbp
	shlx rcx, r9, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r13
	or r14, r8
	or rdi, rcx
	add eax, 64
.LBB27_39:
	test r10b, 64
	shrx r8, r14, r10
	mov r15, r8
	cmovne r15, r13
	mov r9, rdi
	mov ecx, r10d
	shrd r9, r14, cl
	test r10b, 64
	mov rcx, -1
	mov r11d, 0
	shlx r13, rcx, r10
	cmovne r13, r11
	cmovne r9, r8
	sub eax, r10d
	vpextrd r10d, xmm6, 2
	cmp eax, r10d
	mov qword ptr [rsp + 16], rbx
	jae .LBB27_40
	cmp rbp, qword ptr [rsp + 8]
	jae .LBB27_42
	mov rcx, qword ptr [rsp]
	mov r14, qword ptr [rcx + 8*rbp]
	jmp .LBB27_44
.LBB27_40:
	mov rbx, rbp
	xor r11d, r11d
	jmp .LBB27_45
.LBB27_42:
	xor r14d, r14d
.LBB27_44:
	xor r8d, r8d
	mov ecx, eax
	shld r8, r14, cl
	inc rbp
	mov rbx, rbp
	shlx rcx, r14, rax
	test al, 64
	cmovne r8, rcx
	mov r11d, 0
	cmovne rcx, r11
	or r15, r8
	or r9, rcx
	add eax, 64
.LBB27_45:
	test r10b, 64
	shrx r8, r15, r10
	mov rbp, r8
	cmovne rbp, r11
	mov r14, r9
	mov ecx, r10d
	shrd r14, r15, cl
	test r10b, 64
	mov rcx, -1
	shlx r15, rcx, r10
	cmovne r15, r11
	cmovne r14, r8
	sub eax, r10d
	vextracti128 xmm2, ymm6, 1
	vmovd r10d, xmm2
	cmp eax, r10d
	jae .LBB27_46
	cmp rbx, qword ptr [rsp + 8]
	jae .LBB27_48
	mov rcx, qword ptr [rsp]
	mov r8, qword ptr [rcx + 8*rbx]
	jmp .LBB27_50
.LBB27_46:
	xor r8d, r8d
	jmp .LBB27_51
.LBB27_48:
	xor r8d, r8d
.LBB27_50:
	xor r11d, r11d
	mov ecx, eax
	shld r11, r8, cl
	inc rbx
	shlx rcx, r8, rax
	test al, 64
	cmovne r11, rcx
	mov r8d, 0
	cmovne rcx, r8
	or rbp, r11
	or r14, rcx
	add eax, 64
.LBB27_51:
	mov rcx, qword ptr [rsp + 64]
	andn rcx, rcx, r12
	vmovq xmm0, rcx
	mov rcx, qword ptr [rsp + 192]
	andn rcx, rcx, qword ptr [rsp + 96]
	vpinsrq xmm1, xmm0, rcx, 1
	mov rcx, qword ptr [rsp + 160]
	andn rcx, rcx, rsi
	vmovq xmm3, rcx
	mov rcx, qword ptr [rsp + 128]
	andn rcx, rcx, rdx
	vmovq xmm4, rcx
	andn rcx, r13, rdi
	vmovq xmm5, rcx
	vpblendd ymm5, ymm0, ymm5, 3
	andn rcx, r15, r9
	vpinsrq xmm6, xmm5, rcx, 1
	test r10b, 64
	shrx rdi, rbp, r10
	mov rsi, rdi
	cmovne rsi, r8
	mov rdx, r14
	mov ecx, r10d
	shrd rdx, rbp, cl
	test r10b, 64
	cmovne rdx, rdi
	mov r15, -1
	shlx rcx, r15, r10
	cmovne rcx, r8
	andn rcx, rcx, r14
	sub eax, r10d
	vpblendd ymm0, ymm0, ymm1, 15
	vpbroadcastq ymm1, xmm3
	vpblendd ymm0, ymm0, ymm1, 48
	vpbroadcastq ymm1, xmm4
	vpblendd ymm0, ymm0, ymm1, 192
	vmovdqu ymmword ptr [rsp + 96], ymm0
	vpblendd ymm0, ymm5, ymm6, 15
	vmovq xmm1, rcx
	vpbroadcastq ymm1, xmm1
	vpblendd ymm3, ymm0, ymm1, 48
	vpextrd r10d, xmm2, 2
	cmp eax, r10d
	mov r13d, 0
	jae .LBB27_52
	mov rbp, rbx
	cmp rbx, qword ptr [rsp + 8]
	jae .LBB27_54
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rcx + 8*rbp]
	jmp .LBB27_56
.LBB27_54:
	xor edi, edi
.LBB27_56:
	mov rbx, qword ptr [rsp + 16]
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdi, cl
	inc rbp
	shlx rcx, rdi, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r13
	or rsi, r8
	or rdx, rcx
	add eax, 64
	jmp .LBB27_57
.LBB27_2:
	xor r12d, r12d
	xor r11d, r11d
	xor ebp, ebp
	xor eax, eax
.LBB27_3:
	cmp qword ptr [rsp + 40], 0
	je .LBB27_16
	mov rdx, qword ptr [rsp + 48]
	shl rdx, 3
	movabs rcx, 9223372036854775744
	and rcx, rdx
	add qword ptr [rsp + 24], rcx
	add qword ptr [rsp + 32], rcx
	xor edx, edx
	jmp .LBB27_5
.LBB27_6:
	mov qword ptr [rsp + 16], rbp
	mov rdi, -1
	xor r10d, r10d
.LBB27_15:
	test r9b, 64
	shrx rdx, r11, r9
	mov rcx, rdx
	cmovne rcx, r10
	mov qword ptr [rsp + 64], rcx
	mov r8, r12
	mov ecx, r9d
	shrd r8, r11, cl
	test r9b, 64
	mov rcx, r14
	not rcx
	shlx rsi, rdi, r9
	cmovne rsi, r10
	cmovne r8, rdx
	lea r11, [rcx + rcx]
	lea rdx, [4*rcx]
	xor rdx, r11
	xor rdx, rcx
	shl rdx, 2
	xor rdx, r11
	mov rcx, rdx
	shl rcx, 4
	xor rcx, rdx
	mov rdx, rcx
	shl rdx, 8
	xor rdx, rcx
	mov r10, rdx
	shl r10, 16
	xor r10, rdx
	mov rcx, r10
	shl rcx, 32
	xor rcx, r10
	mov rdx, rcx
	and rdx, r14
	mov r10, rdx
	xor r10, r14
	mov r15, rdx
	shr r15
	or r15, r10
	andn r10, rcx, r11
	lea r11, [r10 + r10]
	xor r11, r10
	lea rbx, [4*r11]
	xor rbx, r11
	mov r11, rbx
	shl r11, 4
	xor r11, rbx
	mov rbx, r11
	shl rbx, 8
	xor rbx, r11
	mov r13, rbx
	shl r13, 16
	xor r13, rbx
	mov r11, r13
	shl r11, 32
	xor r11, r13
	andn r10, r11, r10
	and r11, r15
	xor r15, r11
	mov rbp, r11
	shr rbp, 2
	or rbp, r15
	lea rbx, [r10 + r10]
	xor rbx, r10
	lea r15, [4*rbx]
	xor r15, rbx
	mov rbx, r15
	shl rbx, 4
	xor rbx, r15
	mov r15, rbx
	shl r15, 8
	xor r15, rbx
	mov rbx, r15
	shl rbx, 16
	xor rbx, r15
	mov r13, rbx
	shl r13, 32
	xor r13, rbx
	andn rbx, r13, r10
	and r13, rbp
	xor rbp, r13
	mov r15, r13
	shr r15, 4
	or r15, rbp
	lea r10, [rbx + rbx]
	xor r10, rbx
	lea rbp, [4*r10]
	xor rbp, r10
	mov r10, rbp
	shl r10, 4
	xor r10, rbp
	mov rbp, r10
	shl rbp, 8
	xor rbp, r10
	mov r10, rbp
	shl r10, 16
	xor r10, rbp
	mov rdi, r10
	shl rdi, 32
	xor rdi, r10
	andn rbx, rdi, rbx
	and rdi, r15
	xor r15, rdi
	mov rbp, rdi
	shr rbp, 8
	or rbp, r15
	lea r10, [rbx + rbx]
	xor r10, rbx
	lea r15, [4*r10]
	xor r15, r10
	mov r10, r15
	shl r10, 4
	xor r10, r15
	mov r15, r10
	shl r15, 8
	xor r15, r10
	mov r10, r15
	shl r10, 16
	xor r10, r15
	mov r15, r10
	shl r15, 32
	xor r15, r10
	andn r10, r15, rbx
	and r15, rbp
	xor rbp, r15
	mov rbx, r15
	shr rbx, 16
	or rbx, rbp
	lea rbp, [r10 + r10]
	xor rbp, r10
	lea r10, [4*rbp]
	xor r10, rbp
	mov rbp, r10
	shl rbp, 4
	xor rbp, r10
	mov r10, rbp
	shl r10, 8
	xor r10, rbp
	mov rbp, r10
	shl rbp, 16
	xor rbp, r10
	mov r10, rbp
	shl r10, 32
	xor r10, rbp
	and r10, rbx
	andn rsi, rsi, r12
	andn rbx, r10, rsi
	shl rsi, 32
	and rsi, r10
	or rsi, rbx
	andn r10, r15, rsi
	shl rsi, 16
	and rsi, r15
	or rsi, r10
	andn r10, rdi, rsi
	shl rsi, 8
	and rsi, rdi
	or rsi, r10
	andn rdi, r13, rsi
	shl rsi, 4
	and rsi, r13
	or rsi, rdi
	andn rdi, r11, rsi
	shl rsi, 2
	and rsi, r11
	or rsi, rdi
	sub eax, r9d
	andn rdx, rdx, rsi
	add rsi, rsi
	and rsi, rcx
	or rsi, rdx
	and rsi, r14
	mov rcx, qword ptr [rsp + 32]
	mov rdx, qword ptr [rsp + 96]
	mov qword ptr [rcx + 8*rdx], rsi
	inc rdx
	mov r12, r8
	mov r11, qword ptr [rsp + 64]
	cmp qword ptr [rsp + 40], rdx
	mov rbp, qword ptr [rsp + 16]
	je .LBB27_16
.LBB27_5:
	mov rcx, qword ptr [rsp + 24]
	mov r14, qword ptr [rcx + 8*rdx]
	xor r9d, r9d
	popcnt r9, r14
	cmp eax, r9d
	mov qword ptr [rsp + 96], rdx
	jae .LBB27_6
	cmp rbp, qword ptr [rsp + 8]
	mov rdi, -1
	mov r10d, 0
	jae .LBB27_12
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*rbp]
	jmp .LBB27_14
.LBB27_12:
	xor edx, edx
.LBB27_14:
	xor esi, esi
	mov ecx, eax
	shld rsi, rdx, cl
	inc rbp
	mov qword ptr [rsp + 16], rbp
	shlx rcx, rdx, rax
	test al, 64
	cmovne rsi, rcx
	cmovne rcx, r10
	or r11, rsi
	or r12, rcx
	add eax, 64
	jmp .LBB27_15
.LBB27_16:
	add rsp, 296
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB27_58:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.0]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.53]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
