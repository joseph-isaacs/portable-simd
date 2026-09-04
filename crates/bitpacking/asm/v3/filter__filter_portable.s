bitpacking::filter::filter_portable:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB32_41
	mov r11, rsi
	shr r11, 3
	je .LBB32_2
	shl r11, 6
	xor ebx, ebx
	vpcmpeqd ymm0, ymm0, ymm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI32_2]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI32_3]
	vpxor xmm3, xmm3, xmm3
	xor r14d, r14d
	xor ecx, ecx
	xor r15d, r15d
	xor r12d, r12d
	xor edi, edi
	jmp .LBB32_9
.LBB32_33:
	add r14, 64
	cmp r11, r14
	je .LBB32_3
.LBB32_9:
	vmovdqu ymm4, ymmword ptr [rdx + r14 + 32]
	mov rax, qword ptr [rsp + 8]
	vpand ymm5, ymm4, ymmword ptr [rax + r14 + 32]
	vmovdqu ymm6, ymmword ptr [rdx + r14]
	vpand ymm7, ymm6, ymmword ptr [rax + r14]
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
	vmovq rax, xmm7
	xor r13d, r13d
	shld r13, rax, cl
	vpsadbw ymm6, ymm6, ymm3
	vmovd r10d, xmm6
	shlx rbp, rax, rcx
	test cl, 64
	cmovne r13, rbp
	cmovne rbp, rbx
	or r13, r12
	or rbp, r15
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB32_12
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB32_12:
	vpextrq rax, xmm7, 1
	xor r15d, r15d
	mov ecx, r10d
	shld r15, rax, cl
	vpextrd ecx, xmm6, 2
	shlx r12, rax, r10
	test r10b, 64
	cmovne r15, r12
	cmovne r12, rbx
	or r15, r13
	or r12, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB32_15
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], r12
	inc rdi
	add ecx, -64
	mov r12, r15
	xor r15d, r15d
.LBB32_15:
	vextracti128 xmm7, ymm7, 1
	vmovq rax, xmm7
	xor r13d, r13d
	shld r13, rax, cl
	vextracti128 xmm6, ymm6, 1
	vmovd r10d, xmm6
	shlx rbp, rax, rcx
	test cl, 64
	cmovne r13, rbp
	cmovne rbp, rbx
	or r13, r15
	or rbp, r12
	add r10d, ecx
	cmp r10d, 64
	jb .LBB32_18
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB32_18:
	vpextrq rax, xmm7, 1
	xor r15d, r15d
	mov ecx, r10d
	shld r15, rax, cl
	vpextrd ecx, xmm6, 2
	shlx r12, rax, r10
	test r10b, 64
	cmovne r15, r12
	cmovne r12, rbx
	or r15, r13
	or r12, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB32_21
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], r12
	inc rdi
	add ecx, -64
	mov r12, r15
	xor r15d, r15d
.LBB32_21:
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
	vmovq rax, xmm5
	xor r13d, r13d
	shld r13, rax, cl
	vpsadbw ymm4, ymm4, ymm3
	vmovd r10d, xmm4
	shlx rbp, rax, rcx
	test cl, 64
	cmovne r13, rbp
	cmovne rbp, rbx
	or r13, r15
	or rbp, r12
	add r10d, ecx
	cmp r10d, 64
	jb .LBB32_24
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB32_24:
	vpextrq rax, xmm5, 1
	xor r15d, r15d
	mov ecx, r10d
	shld r15, rax, cl
	vpextrd ecx, xmm4, 2
	shlx r12, rax, r10
	test r10b, 64
	cmovne r15, r12
	cmovne r12, rbx
	or r15, r13
	or r12, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB32_27
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], r12
	inc rdi
	add ecx, -64
	mov r12, r15
	xor r15d, r15d
.LBB32_27:
	vextracti128 xmm5, ymm5, 1
	vmovq rax, xmm5
	xor r13d, r13d
	shld r13, rax, cl
	vextracti128 xmm4, ymm4, 1
	vmovd r10d, xmm4
	shlx rbp, rax, rcx
	test cl, 64
	cmovne r13, rbp
	cmovne rbp, rbx
	or r13, r15
	or rbp, r12
	add r10d, ecx
	cmp r10d, 64
	jb .LBB32_30
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB32_30:
	vpextrq rax, xmm5, 1
	xor r12d, r12d
	mov ecx, r10d
	shld r12, rax, cl
	vpextrd ecx, xmm4, 2
	shlx r15, rax, r10
	test r10b, 64
	cmovne r12, r15
	cmovne r15, rbx
	or r12, r13
	or r15, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB32_33
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], r15
	inc rdi
	add ecx, -64
	mov r15, r12
	xor r12d, r12d
	jmp .LBB32_33
.LBB32_2:
	xor edi, edi
	xor r15d, r15d
	xor r12d, r12d
	xor ecx, ecx
.LBB32_3:
	mov eax, esi
	and eax, 7
	mov qword ptr [rsp + 16], rax
	je .LBB32_34
	shl rsi, 3
	movabs rax, 9223372036854775744
	and rax, rsi
	add qword ptr [rsp + 8], rax
	add rdx, rax
	xor ebx, ebx
	jmp .LBB32_5
.LBB32_40:
	mov rdx, r10
	inc rbx
	mov r12, r13
	cmp qword ptr [rsp + 16], rbx
	je .LBB32_34
.LBB32_5:
	mov esi, ecx
	mov r10, rdx
	mov r14, qword ptr [rdx + 8*rbx]
	mov rax, qword ptr [rsp + 8]
	mov r13, qword ptr [rax + 8*rbx]
	and r13, r14
	mov rcx, r14
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
	and rbp, r14
	mov r11, rbp
	xor r11, r14
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
	mov rax, r15
	xor ecx, ecx
	popcnt rcx, r14
	shlx r15, rbp, rsi
	test sil, 64
	cmovne r13, r15
	mov edx, 0
	cmovne r15, rdx
	or r13, r12
	or r15, rax
	add ecx, esi
	cmp ecx, 63
	jbe .LBB32_40
	cmp rdi, r9
	jae .LBB32_7
	mov qword ptr [r8 + 8*rdi], r15
	inc rdi
	add ecx, -64
	mov r15, r13
	xor r13d, r13d
	jmp .LBB32_40
.LBB32_34:
	test ecx, ecx
	je .LBB32_37
	cmp rdi, r9
	jae .LBB32_38
	mov qword ptr [r8 + 8*rdi], r15
.LBB32_37:
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
.LBB32_41:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.11]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB32_7:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.6]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB32_38:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.5]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
