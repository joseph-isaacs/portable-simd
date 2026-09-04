bitpacking::filter::filter_portable4:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB33_30
	mov r14, rsi
	shr r14, 2
	je .LBB33_2
	shl r14, 5
	xor r15d, r15d
	vpcmpeqd ymm0, ymm0, ymm0
	vpbroadcastd ymm1, dword ptr [rip + .LCPI33_2]
	vbroadcasti128 ymm2, xmmword ptr [rip + .LCPI33_3]
	vpxor xmm3, xmm3, xmm3
	xor r12d, r12d
	xor ecx, ecx
	xor r11d, r11d
	xor ebx, ebx
	xor edi, edi
	jmp .LBB33_9
.LBB33_28:
	mov qword ptr [r8 + 8*rdi], r11
	inc rdi
	add ecx, -64
	mov r11, rbx
	xor ebx, ebx
.LBB33_29:
	add r12, 32
	cmp r14, r12
	je .LBB33_3
.LBB33_9:
	vmovdqu ymm4, ymmword ptr [rdx + r12]
	mov rax, qword ptr [rsp + 16]
	vpand ymm5, ymm4, ymmword ptr [rax + r12]
	vpxor ymm6, ymm4, ymm0
	vpaddq ymm7, ymm6, ymm6
	vpsllq ymm8, ymm6, 2
	vpxor ymm6, ymm8, ymm6
	vpxor ymm6, ymm6, ymm7
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
	vpand ymm6, ymm7, ymm6
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
	cmovne rbp, r15
	or r13, rbx
	or rbp, r11
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB33_20
	cmp rdi, r9
	jae .LBB33_11
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB33_20:
	vpextrq rax, xmm5, 1
	xor r11d, r11d
	mov ecx, r10d
	shld r11, rax, cl
	vpextrd ecx, xmm4, 2
	shlx rbx, rax, r10
	test r10b, 64
	cmovne r11, rbx
	cmovne rbx, r15
	or r11, r13
	or rbx, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB33_23
	cmp rdi, r9
	jae .LBB33_11
	mov qword ptr [r8 + 8*rdi], rbx
	inc rdi
	add ecx, -64
	mov rbx, r11
	xor r11d, r11d
.LBB33_23:
	vextracti128 xmm5, ymm5, 1
	vmovq rax, xmm5
	xor r13d, r13d
	shld r13, rax, cl
	vextracti128 xmm4, ymm4, 1
	vmovd r10d, xmm4
	shlx rbp, rax, rcx
	test cl, 64
	cmovne r13, rbp
	cmovne rbp, r15
	or r13, r11
	or rbp, rbx
	add r10d, ecx
	cmp r10d, 64
	jb .LBB33_26
	cmp rdi, r9
	jae .LBB33_11
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r10d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB33_26:
	vpextrq rax, xmm5, 1
	xor ebx, ebx
	mov ecx, r10d
	shld rbx, rax, cl
	vpextrd ecx, xmm4, 2
	shlx r11, rax, r10
	test r10b, 64
	cmovne rbx, r11
	cmovne r11, r15
	or rbx, r13
	or r11, rbp
	add ecx, r10d
	cmp ecx, 64
	jb .LBB33_29
	cmp rdi, r9
	jb .LBB33_28
.LBB33_11:
	mov rsi, r9
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.6]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB33_2:
	xor edi, edi
	xor r11d, r11d
	xor ebx, ebx
	xor ecx, ecx
.LBB33_3:
	mov qword ptr [rsp + 8], r9
	mov r9d, esi
	and r9d, 3
	je .LBB33_12
	shl rsi, 3
	movabs rax, 9223372036854775776
	and rax, rsi
	add qword ptr [rsp + 16], rax
	add rdx, rax
	xor r15d, r15d
	jmp .LBB33_5
.LBB33_18:
	mov rdx, r10
	inc r15
	mov rbx, r13
	cmp r9, r15
	je .LBB33_12
.LBB33_5:
	mov esi, ecx
	mov r10, rdx
	mov r12, qword ptr [rdx + 8*r15]
	mov rax, qword ptr [rsp + 16]
	mov r13, qword ptr [rax + 8*r15]
	and r13, r12
	mov rcx, r12
	not rcx
	lea rax, [rcx + rcx]
	lea r14, [4*rcx]
	xor r14, rax
	xor r14, rcx
	shl r14, 2
	xor r14, rax
	mov rcx, r14
	shl rcx, 4
	xor rcx, r14
	mov r14, rcx
	shl r14, 8
	xor r14, rcx
	mov rbp, r14
	shl rbp, 16
	xor rbp, r14
	mov rcx, rbp
	shl rcx, 32
	xor rcx, rbp
	mov rbp, rcx
	and rbp, r12
	mov r14, rbp
	xor r14, r12
	shr rbp
	or rbp, r14
	andn rax, rcx, rax
	and rcx, r13
	xor r13, rcx
	shr rcx
	or rcx, r13
	lea r14, [rax + rax]
	xor r14, rax
	lea r13, [4*r14]
	xor r13, r14
	mov r14, r13
	shl r14, 4
	xor r14, r13
	mov r13, r14
	shl r13, 8
	xor r13, r14
	mov r14, r13
	shl r14, 16
	xor r14, r13
	mov r13, r14
	shl r13, 32
	xor r13, r14
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov r14, r13
	shr r14, 2
	or r14, rbp
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
	and rcx, r14
	xor r14, rcx
	mov rbp, rcx
	shr rbp, 4
	or rbp, r14
	and rcx, r13
	xor r13, rcx
	shr rcx, 4
	or rcx, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea r14, [4*rdx]
	xor r14, rdx
	mov rdx, r14
	shl rdx, 4
	xor rdx, r14
	mov r14, rdx
	shl r14, 8
	xor r14, rdx
	mov rdx, r14
	shl rdx, 16
	xor rdx, r14
	mov r13, rdx
	shl r13, 32
	xor r13, rdx
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov r14, r13
	shr r14, 8
	or r14, rbp
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
	and rcx, r14
	xor r14, rcx
	mov rbp, rcx
	shr rbp, 16
	or rbp, r14
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
	mov rax, r11
	xor ecx, ecx
	popcnt rcx, r12
	shlx r11, rbp, rsi
	test sil, 64
	cmovne r13, r11
	mov edx, 0
	cmovne r11, rdx
	or r13, rbx
	or r11, rax
	add ecx, esi
	cmp ecx, 63
	jbe .LBB33_18
	cmp rdi, qword ptr [rsp + 8]
	jae .LBB33_7
	mov qword ptr [r8 + 8*rdi], r11
	inc rdi
	add ecx, -64
	mov r11, r13
	xor r13d, r13d
	jmp .LBB33_18
.LBB33_12:
	test ecx, ecx
	mov rsi, qword ptr [rsp + 8]
	je .LBB33_15
	cmp rdi, rsi
	jae .LBB33_16
	mov qword ptr [r8 + 8*rdi], r11
.LBB33_15:
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
.LBB33_30:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.54]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB33_7:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.6]
	mov rsi, qword ptr [rsp + 8]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB33_16:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.5]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
