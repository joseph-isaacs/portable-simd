bitpacking::filter::filter_portable_branchless:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB25_27
	mov r10, rsi
	shr r10, 3
	je .LBB25_2
	shl r10, 6
	xor r11d, r11d
	vpcmpeqd ymm0, ymm0, ymm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI25_2]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI25_3]
	vpxor xmm3, xmm3, xmm3
	xor ebx, ebx
	xor ecx, ecx
	xor r14d, r14d
	xor r15d, r15d
	xor edi, edi
.LBB25_14:
	cmp rdi, r9
	jae .LBB25_23
	mov rax, qword ptr [rsp + 16]
	vmovdqu ymm6, ymmword ptr [rax + rbx]
	vmovdqu ymm4, ymmword ptr [rax + rbx + 32]
	mov rax, qword ptr [rsp + 8]
	vpand ymm5, ymm4, ymmword ptr [rax + rbx + 32]
	vpand ymm7, ymm6, ymmword ptr [rax + rbx]
	vpxor ymm8, ymm6, ymm0
	vpaddq ymm9, ymm8, ymm8
	vpsllq ymm10, ymm8, 2
	vpxor ymm10, ymm10, ymm9
	vpxor ymm8, ymm10, ymm8
	vpsllq ymm8, ymm8, 2
	vpxor ymm8, ymm8, ymm9
	vpsllq ymm10, ymm8, 4
	vpxor ymm8, ymm10, ymm8
	vpsllq ymm10, ymm8, 8
	vpxor ymm8, ymm10, ymm8
	vpsllq ymm10, ymm8, 16
	vpxor ymm8, ymm10, ymm8
	vpsllq ymm10, ymm8, 32
	vpxor ymm8, ymm10, ymm8
	vpand ymm10, ymm8, ymm6
	vpxor ymm11, ymm10, ymm6
	vpsrlq ymm10, ymm10, 1
	vpor ymm10, ymm11, ymm10
	vpand ymm11, ymm8, ymm7
	vpxor ymm7, ymm11, ymm7
	vpsrlq ymm11, ymm11, 1
	vpor ymm7, ymm11, ymm7
	vpandn ymm8, ymm8, ymm9
	vpaddq ymm9, ymm8, ymm8
	vpxor ymm9, ymm9, ymm8
	vpsllq ymm11, ymm9, 2
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 4
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 8
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 16
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 32
	vpxor ymm9, ymm11, ymm9
	vpand ymm11, ymm9, ymm10
	vpxor ymm10, ymm11, ymm10
	vpsrlq ymm12, ymm11, 2
	vpor ymm10, ymm10, ymm12
	vpand ymm11, ymm11, ymm7
	vpxor ymm7, ymm11, ymm7
	vpsrlq ymm11, ymm11, 2
	vpor ymm7, ymm11, ymm7
	vpandn ymm8, ymm9, ymm8
	vpaddq ymm9, ymm8, ymm8
	vpxor ymm9, ymm9, ymm8
	vpsllq ymm11, ymm9, 2
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 4
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 8
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 16
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 32
	vpxor ymm9, ymm11, ymm9
	vpand ymm11, ymm9, ymm10
	vpxor ymm10, ymm11, ymm10
	vpsrlq ymm12, ymm11, 4
	vpor ymm10, ymm10, ymm12
	vpand ymm11, ymm11, ymm7
	vpxor ymm7, ymm11, ymm7
	vpsrlq ymm11, ymm11, 4
	vpor ymm7, ymm11, ymm7
	vpandn ymm8, ymm9, ymm8
	vpaddq ymm9, ymm8, ymm8
	vpxor ymm9, ymm9, ymm8
	vpsllq ymm11, ymm9, 2
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 4
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 8
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 16
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 32
	vpxor ymm9, ymm11, ymm9
	vpand ymm11, ymm9, ymm10
	vpxor ymm10, ymm11, ymm10
	vpsrlq ymm12, ymm11, 8
	vpor ymm10, ymm10, ymm12
	vpand ymm11, ymm11, ymm7
	vpxor ymm7, ymm11, ymm7
	vpsrlq ymm11, ymm11, 8
	vpor ymm7, ymm11, ymm7
	vpandn ymm8, ymm9, ymm8
	vpaddq ymm9, ymm8, ymm8
	vpxor ymm9, ymm9, ymm8
	vpsllq ymm11, ymm9, 2
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 4
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 8
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 16
	vpxor ymm9, ymm11, ymm9
	vpsllq ymm11, ymm9, 32
	vpxor ymm9, ymm11, ymm9
	vpand ymm11, ymm9, ymm10
	vpxor ymm10, ymm11, ymm10
	vpsrlq ymm12, ymm11, 16
	vpor ymm10, ymm10, ymm12
	vpand ymm11, ymm11, ymm7
	vpxor ymm7, ymm11, ymm7
	vpsrlq ymm11, ymm11, 16
	vpor ymm7, ymm11, ymm7
	vpandn ymm8, ymm9, ymm8
	vpaddq ymm9, ymm8, ymm8
	vpxor ymm8, ymm9, ymm8
	vpsllq ymm9, ymm8, 2
	vpxor ymm8, ymm9, ymm8
	vpsllq ymm9, ymm8, 4
	vpxor ymm8, ymm9, ymm8
	vpsllq ymm9, ymm8, 8
	vpxor ymm8, ymm9, ymm8
	vpsllq ymm9, ymm8, 16
	vpxor ymm8, ymm9, ymm8
	vpsllq ymm9, ymm8, 32
	vpxor ymm8, ymm9, ymm8
	vpand ymm9, ymm10, ymm7
	vpand ymm8, ymm8, ymm9
	vpxor ymm7, ymm8, ymm7
	vpsrlq ymm8, ymm8, 32
	vpor ymm7, ymm8, ymm7
	vpand ymm8, ymm6, ymm1
	vpshufb ymm8, ymm2, ymm8
	vpsrlw ymm6, ymm6, 4
	vpand ymm6, ymm6, ymm1
	vpshufb ymm6, ymm2, ymm6
	vpaddb ymm6, ymm8, ymm6
	vpsadbw ymm6, ymm6, ymm3
	vmovd ebp, xmm6
	add ebp, ecx
	vmovq rax, xmm7
	xor r12d, r12d
	shld r12, rax, cl
	shlx rax, rax, rcx
	test cl, 64
	cmovne r12, rax
	cmovne rax, r11
	or rax, r14
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, ebp
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB25_23
	or r12, r15
	mov r14d, ebp
	and r14d, 63
	test bpl, 64
	cmovne rax, r12
	mov r15d, 0
	cmove r15, r12
	vpextrd ebp, xmm6, 2
	add ebp, r14d
	vpextrq r12, xmm7, 1
	shlx rcx, r12, r14
	or rcx, rax
	mov qword ptr [r8 + 8*rdi], rcx
	mov eax, ebp
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB25_23
	not r14b
	shr r12
	shrx rax, r12, r14
	or rax, r15
	mov r14d, ebp
	and r14d, 63
	test bpl, 64
	cmovne rcx, rax
	mov r15d, 0
	cmove r15, rax
	vextracti128 xmm6, ymm6, 1
	vmovd ebp, xmm6
	add ebp, r14d
	vextracti128 xmm7, ymm7, 1
	vmovq r12, xmm7
	shlx rax, r12, r14
	or rax, rcx
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, ebp
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB25_23
	not r14b
	shr r12
	shrx rcx, r12, r14
	or rcx, r15
	mov r14d, ebp
	and r14d, 63
	test bpl, 64
	cmovne rax, rcx
	mov r15d, 0
	cmove r15, rcx
	vpextrd ebp, xmm6, 2
	add ebp, r14d
	vpextrq r12, xmm7, 1
	shlx rcx, r12, r14
	or rcx, rax
	mov qword ptr [r8 + 8*rdi], rcx
	mov eax, ebp
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB25_23
	vpxor ymm6, ymm4, ymm0
	vpaddq ymm7, ymm6, ymm6
	vpsllq ymm8, ymm6, 2
	vpxor ymm8, ymm8, ymm7
	vpxor ymm6, ymm8, ymm6
	vpsllq ymm6, ymm6, 2
	vpxor ymm6, ymm6, ymm7
	vpsllq ymm8, ymm6, 4
	vpxor ymm6, ymm8, ymm6
	vpsllq ymm8, ymm6, 8
	vpxor ymm6, ymm8, ymm6
	vpsllq ymm8, ymm6, 16
	vpxor ymm6, ymm8, ymm6
	vpsllq ymm8, ymm6, 32
	vpxor ymm6, ymm8, ymm6
	vpand ymm8, ymm6, ymm4
	vpxor ymm9, ymm8, ymm4
	vpsrlq ymm8, ymm8, 1
	vpor ymm8, ymm9, ymm8
	vpand ymm9, ymm6, ymm5
	vpxor ymm5, ymm9, ymm5
	vpsrlq ymm9, ymm9, 1
	vpor ymm5, ymm9, ymm5
	vpandn ymm6, ymm6, ymm7
	vpaddq ymm7, ymm6, ymm6
	vpxor ymm7, ymm7, ymm6
	vpsllq ymm9, ymm7, 2
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 4
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 8
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 16
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 32
	vpxor ymm7, ymm9, ymm7
	vpand ymm9, ymm8, ymm7
	vpxor ymm8, ymm9, ymm8
	vpsrlq ymm10, ymm9, 2
	vpor ymm8, ymm8, ymm10
	vpand ymm9, ymm9, ymm5
	vpxor ymm5, ymm9, ymm5
	vpsrlq ymm9, ymm9, 2
	vpor ymm5, ymm9, ymm5
	vpandn ymm6, ymm7, ymm6
	vpaddq ymm7, ymm6, ymm6
	vpxor ymm7, ymm7, ymm6
	vpsllq ymm9, ymm7, 2
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 4
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 8
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 16
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 32
	vpxor ymm7, ymm9, ymm7
	vpand ymm9, ymm8, ymm7
	vpxor ymm8, ymm9, ymm8
	vpsrlq ymm10, ymm9, 4
	vpor ymm8, ymm8, ymm10
	vpand ymm9, ymm9, ymm5
	vpxor ymm5, ymm9, ymm5
	vpsrlq ymm9, ymm9, 4
	vpor ymm5, ymm9, ymm5
	vpandn ymm6, ymm7, ymm6
	vpaddq ymm7, ymm6, ymm6
	vpxor ymm7, ymm7, ymm6
	vpsllq ymm9, ymm7, 2
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 4
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 8
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 16
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 32
	vpxor ymm7, ymm9, ymm7
	vpand ymm9, ymm8, ymm7
	vpxor ymm8, ymm9, ymm8
	vpsrlq ymm10, ymm9, 8
	vpor ymm8, ymm8, ymm10
	vpand ymm9, ymm9, ymm5
	vpxor ymm5, ymm9, ymm5
	vpsrlq ymm9, ymm9, 8
	vpor ymm5, ymm9, ymm5
	vpandn ymm6, ymm7, ymm6
	vpaddq ymm7, ymm6, ymm6
	vpxor ymm7, ymm7, ymm6
	vpsllq ymm9, ymm7, 2
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 4
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 8
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 16
	vpxor ymm7, ymm9, ymm7
	vpsllq ymm9, ymm7, 32
	vpxor ymm7, ymm9, ymm7
	vpand ymm9, ymm8, ymm7
	vpxor ymm8, ymm9, ymm8
	vpsrlq ymm10, ymm9, 16
	vpor ymm8, ymm8, ymm10
	vpand ymm9, ymm9, ymm5
	vpxor ymm5, ymm9, ymm5
	vpsrlq ymm9, ymm9, 16
	vpor ymm5, ymm9, ymm5
	vpandn ymm6, ymm7, ymm6
	vpaddq ymm7, ymm6, ymm6
	vpxor ymm6, ymm7, ymm6
	vpsllq ymm7, ymm6, 2
	vpxor ymm6, ymm7, ymm6
	vpsllq ymm7, ymm6, 4
	vpxor ymm6, ymm7, ymm6
	vpsllq ymm7, ymm6, 8
	vpxor ymm6, ymm7, ymm6
	vpsllq ymm7, ymm6, 16
	vpxor ymm6, ymm7, ymm6
	vpsllq ymm7, ymm6, 32
	vpxor ymm6, ymm7, ymm6
	vpand ymm7, ymm8, ymm5
	vpand ymm6, ymm6, ymm7
	vpxor ymm5, ymm6, ymm5
	vpsrlq ymm6, ymm6, 32
	vpor ymm5, ymm5, ymm6
	vpand ymm6, ymm4, ymm1
	vpshufb ymm6, ymm2, ymm6
	vpsrlw ymm4, ymm4, 4
	vpand ymm4, ymm4, ymm1
	vpshufb ymm4, ymm2, ymm4
	vpaddb ymm4, ymm4, ymm6
	vpsadbw ymm4, ymm4, ymm3
	not r14b
	shr r12
	shrx rdx, r12, r14
	or rdx, r15
	mov eax, ebp
	and eax, 63
	test bpl, 64
	cmovne rcx, rdx
	mov r15d, 0
	cmove r15, rdx
	vmovd ebp, xmm4
	add ebp, eax
	vmovq r12, xmm5
	shlx r14, r12, rax
	or r14, rcx
	mov qword ptr [r8 + 8*rdi], r14
	mov ecx, ebp
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB25_23
	not al
	shr r12
	shrx rcx, r12, rax
	or rcx, r15
	mov eax, ebp
	and eax, 63
	test bpl, 64
	cmovne r14, rcx
	mov r15d, 0
	cmove r15, rcx
	vpextrd ebp, xmm4, 2
	add ebp, eax
	vpextrq r12, xmm5, 1
	shlx rcx, r12, rax
	or rcx, r14
	mov qword ptr [r8 + 8*rdi], rcx
	mov edx, ebp
	shr edx, 6
	add rdi, rdx
	cmp rdi, r9
	jae .LBB25_23
	not al
	shr r12
	shrx rax, r12, rax
	or rax, r15
	mov r14d, ebp
	and r14d, 63
	test bpl, 64
	cmovne rcx, rax
	mov r15d, 0
	cmove r15, rax
	vextracti128 xmm4, ymm4, 1
	vmovd ebp, xmm4
	add ebp, r14d
	vextracti128 xmm5, ymm5, 1
	vmovq r13, xmm5
	shlx rax, r13, r14
	or rax, rcx
	mov qword ptr [r8 + 8*rdi], rax
	mov r12d, ebp
	shr r12d, 6
	add r12, rdi
	cmp r12, r9
	jae .LBB25_22
	not r14b
	shr r13
	shrx rdx, r13, r14
	or rdx, r15
	mov edi, ebp
	and edi, 63
	test bpl, 64
	cmovne rax, rdx
	cmovne rdx, r11
	vpextrd ecx, xmm4, 2
	add ecx, edi
	vpextrq r15, xmm5, 1
	shlx r14, r15, rdi
	or r14, rax
	not dil
	shr r15
	shrx r15, r15, rdi
	or r15, rdx
	mov qword ptr [r8 + 8*r12], r14
	mov edi, ecx
	shr edi, 6
	add rdi, r12
	test cl, 64
	cmovne r14, r15
	cmovne r15, r11
	and ecx, 63
	add rbx, 64
	cmp r10, rbx
	jne .LBB25_14
	mov r10d, esi
	and r10d, 7
	jne .LBB25_4
	jmp .LBB25_9
.LBB25_2:
	xor edi, edi
	xor r14d, r14d
	xor r15d, r15d
	xor ecx, ecx
	mov r10d, esi
	and r10d, 7
	je .LBB25_9
.LBB25_4:
	shl rsi, 3
	movabs rax, 9223372036854775744
	and rax, rsi
	add qword ptr [rsp + 8], rax
	add qword ptr [rsp + 16], rax
	xor ebx, ebx
	jmp .LBB25_5
.LBB25_8:
	inc rbx
	mov r15, r13
	cmp r10, rbx
	je .LBB25_9
.LBB25_5:
	mov esi, ecx
	mov rax, qword ptr [rsp + 16]
	mov r12, qword ptr [rax + 8*rbx]
	mov rax, qword ptr [rsp + 8]
	mov r13, qword ptr [rax + 8*rbx]
	and r13, r12
	mov rcx, r12
	not rcx
	lea rax, [rcx + rcx]
	lea r11, [4*rcx]
	xor r11, rax
	xor r11, rcx
	shl r11, 2
	xor r11, rax
	mov rcx, r11
	shl rcx, 4
	xor rcx, r11
	mov r11, rcx
	shl r11, 8
	xor r11, rcx
	mov rbp, r11
	shl rbp, 16
	xor rbp, r11
	mov rcx, rbp
	shl rcx, 32
	xor rcx, rbp
	mov rbp, rcx
	and rbp, r12
	mov r11, rbp
	xor r11, r12
	shr rbp
	or rbp, r11
	andn rax, rcx, rax
	and rcx, r13
	xor r13, rcx
	shr rcx
	or rcx, r13
	lea r11, [rax + rax]
	xor r11, rax
	lea r13, [4*r11]
	xor r13, r11
	mov r11, r13
	shl r11, 4
	xor r11, r13
	mov r13, r11
	shl r13, 8
	xor r13, r11
	mov r11, r13
	shl r11, 16
	xor r11, r13
	mov r13, r11
	shl r13, 32
	xor r13, r11
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov r11, r13
	shr r11, 2
	or r11, rbp
	and r13, rcx
	xor rcx, r13
	shr r13, 2
	or r13, rcx
	lea rcx, [rax + rax]
	xor rcx, rax
	lea rbp, [4*rcx]
	xor rbp, rcx
	mov rcx, rbp
	shl rcx, 4
	xor rcx, rbp
	mov rbp, rcx
	shl rbp, 8
	xor rbp, rcx
	mov rdx, rbp
	shl rdx, 16
	xor rdx, rbp
	mov rcx, rdx
	shl rcx, 32
	xor rcx, rdx
	andn rax, rcx, rax
	and rcx, r11
	xor r11, rcx
	mov rbp, rcx
	shr rbp, 4
	or rbp, r11
	and rcx, r13
	xor r13, rcx
	shr rcx, 4
	or rcx, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea r11, [4*rdx]
	xor r11, rdx
	mov rdx, r11
	shl rdx, 4
	xor rdx, r11
	mov r11, rdx
	shl r11, 8
	xor r11, rdx
	mov rdx, r11
	shl rdx, 16
	xor rdx, r11
	mov r13, rdx
	shl r13, 32
	xor r13, rdx
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov r11, r13
	shr r11, 8
	or r11, rbp
	and r13, rcx
	xor rcx, r13
	shr r13, 8
	or r13, rcx
	lea rcx, [rax + rax]
	xor rcx, rax
	lea rdx, [4*rcx]
	xor rdx, rcx
	mov rcx, rdx
	shl rcx, 4
	xor rcx, rdx
	mov rdx, rcx
	shl rdx, 8
	xor rdx, rcx
	mov rbp, rdx
	shl rbp, 16
	xor rbp, rdx
	mov rcx, rbp
	shl rcx, 32
	xor rcx, rbp
	andn rax, rcx, rax
	and rcx, r11
	xor r11, rcx
	mov rbp, rcx
	shr rbp, 16
	or rbp, r11
	and rcx, r13
	xor r13, rcx
	shr rcx, 16
	or rcx, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea rax, [4*rdx]
	xor rax, rdx
	mov rdx, rax
	shl rdx, 4
	xor rdx, rax
	mov rax, rdx
	shl rax, 8
	xor rax, rdx
	mov rdx, rax
	shl rdx, 16
	xor rdx, rax
	mov rax, rdx
	shl rax, 32
	xor rax, rdx
	and rbp, rcx
	and rbp, rax
	xor rcx, rbp
	shr rbp, 32
	or rbp, rcx
	xor r13d, r13d
	mov ecx, esi
	shld r13, rbp, cl
	mov rax, r14
	xor ecx, ecx
	popcnt rcx, r12
	shlx r14, rbp, rsi
	test sil, 64
	cmovne r13, r14
	mov edx, 0
	cmovne r14, rdx
	or r13, r15
	or r14, rax
	add ecx, esi
	cmp ecx, 63
	jbe .LBB25_8
	cmp rdi, r9
	jae .LBB25_25
	mov qword ptr [r8 + 8*rdi], r14
	inc rdi
	add ecx, -64
	mov r14, r13
	xor r13d, r13d
	jmp .LBB25_8
.LBB25_9:
	test ecx, ecx
	je .LBB25_12
	cmp rdi, r9
	jae .LBB25_24
	mov qword ptr [r8 + 8*rdi], r14
.LBB25_12:
	shl rdi, 6
	mov eax, ecx
	add rax, rdi
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB25_27:
	lea r9, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.8]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB25_22:
	mov rdi, r12
.LBB25_23:
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.4]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB25_25:
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.3]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB25_24:
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.2]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
