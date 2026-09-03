bitpacking::filter::filter_portable4:
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
	jne .LBB21_30
	mov qword ptr [rsp + 16], rsi
	mov r14, rsi
	shr r14, 2
	je .LBB21_2
	shl r14, 5
	xor r15d, r15d
	vpbroadcastd ymm0, dword ptr [rip + .LCPI21_2]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI21_3]
	vpxor xmm2, xmm2, xmm2
	xor r12d, r12d
	xor r10d, r10d
	xor r13d, r13d
	xor ebx, ebx
	xor edi, edi
	mov rsi, rdx
	jmp .LBB21_9
.LBB21_28:
	mov qword ptr [r8 + 8*rdi], r13
	inc rdi
	add r10d, -64
	mov r13, rbx
	xor ebx, ebx
.LBB21_29:
	add r12, 32
	cmp r14, r12
	je .LBB21_3
.LBB21_9:
	vmovdqu ymm3, ymmword ptr [rsi + r12]
	mov rax, qword ptr [rsp + 8]
	vpand ymm4, ymm3, ymmword ptr [rax + r12]
	vmovdqa ymm5, ymm3
	vpternlogq ymm5, ymm3, ymm3, 15
	vpaddq ymm6, ymm5, ymm5
	vpsllq ymm7, ymm5, 2
	vpternlogq ymm7, ymm6, ymm5, 150
	vpsllq ymm5, ymm7, 2
	vpxor ymm5, ymm5, ymm6
	vpsllq ymm7, ymm5, 4
	vpxor ymm5, ymm7, ymm5
	vpsllq ymm7, ymm5, 8
	vpxor ymm5, ymm7, ymm5
	vpsllq ymm7, ymm5, 16
	vpxor ymm5, ymm7, ymm5
	vpsllq ymm7, ymm5, 32
	vpxor ymm5, ymm7, ymm5
	vpand ymm7, ymm5, ymm3
	vpsrlq ymm8, ymm7, 1
	vpternlogq ymm8, ymm7, ymm3, 246
	vpand ymm7, ymm5, ymm4
	vpsrlq ymm9, ymm7, 1
	vpternlogq ymm9, ymm7, ymm4, 246
	vpandn ymm4, ymm5, ymm6
	vpaddq ymm5, ymm4, ymm4
	vpxor ymm5, ymm5, ymm4
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 32
	vpxor ymm5, ymm6, ymm5
	vpand ymm6, ymm8, ymm5
	vpsrlq ymm7, ymm6, 2
	vpternlogq ymm7, ymm6, ymm8, 246
	vpand ymm6, ymm9, ymm6
	vpsrlq ymm8, ymm6, 2
	vpternlogq ymm8, ymm6, ymm9, 246
	vpandn ymm4, ymm5, ymm4
	vpaddq ymm5, ymm4, ymm4
	vpxor ymm5, ymm5, ymm4
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 32
	vpxor ymm5, ymm6, ymm5
	vpand ymm6, ymm5, ymm7
	vpsrlq ymm9, ymm6, 4
	vpternlogq ymm9, ymm6, ymm7, 246
	vpand ymm6, ymm8, ymm6
	vpsrlq ymm7, ymm6, 4
	vpternlogq ymm7, ymm6, ymm8, 246
	vpandn ymm4, ymm5, ymm4
	vpaddq ymm5, ymm4, ymm4
	vpxor ymm5, ymm5, ymm4
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 32
	vpxor ymm5, ymm6, ymm5
	vpand ymm6, ymm9, ymm5
	vpsrlq ymm8, ymm6, 8
	vpternlogq ymm8, ymm6, ymm9, 246
	vpand ymm6, ymm6, ymm7
	vpsrlq ymm9, ymm6, 8
	vpternlogq ymm9, ymm6, ymm7, 246
	vpandn ymm4, ymm5, ymm4
	vpaddq ymm5, ymm4, ymm4
	vpxor ymm5, ymm5, ymm4
	vpsllq ymm6, ymm5, 2
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 4
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 8
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 16
	vpxor ymm5, ymm6, ymm5
	vpsllq ymm6, ymm5, 32
	vpxor ymm5, ymm6, ymm5
	vpand ymm6, ymm8, ymm5
	vpsrlq ymm7, ymm6, 16
	vpternlogq ymm7, ymm6, ymm8, 246
	vpand ymm6, ymm9, ymm6
	vpsrlq ymm8, ymm6, 16
	vpternlogq ymm8, ymm6, ymm9, 246
	vpandn ymm4, ymm5, ymm4
	vpaddq ymm5, ymm4, ymm4
	vpxor ymm4, ymm5, ymm4
	vpsllq ymm5, ymm4, 2
	vpxor ymm4, ymm5, ymm4
	vpsllq ymm5, ymm4, 4
	vpxor ymm4, ymm5, ymm4
	vpsllq ymm5, ymm4, 8
	vpxor ymm4, ymm5, ymm4
	vpsllq ymm5, ymm4, 16
	vpxor ymm4, ymm5, ymm4
	vpsllq ymm5, ymm4, 32
	vpxor ymm5, ymm5, ymm4
	vpternlogq ymm5, ymm8, ymm7, 128
	vpsrlq ymm4, ymm5, 32
	vpternlogq ymm4, ymm5, ymm8, 246
	vpand ymm5, ymm3, ymm0
	vpshufb ymm5, ymm1, ymm5
	vpsrlw ymm3, ymm3, 4
	vpand ymm3, ymm3, ymm0
	vpshufb ymm3, ymm1, ymm3
	vpaddb ymm3, ymm3, ymm5
	vpsadbw ymm3, ymm3, ymm2
	vmovq rax, xmm4
	vmovd r11d, xmm3
	xor ebp, ebp
	mov ecx, r10d
	shld rbp, rax, cl
	shlx rax, rax, r10
	test r10b, 64
	cmovne rbp, rax
	cmovne rax, r15
	or rbp, rbx
	or rax, r13
	add r11d, r10d
	cmp r11d, 63
	jbe .LBB21_20
	cmp rdi, r9
	jae .LBB21_11
	mov qword ptr [r8 + 8*rdi], rax
	inc rdi
	add r11d, -64
	mov rax, rbp
	xor ebp, ebp
.LBB21_20:
	vpextrq rdx, xmm4, 1
	vpextrd r10d, xmm3, 2
	xor ebx, ebx
	mov ecx, r11d
	shld rbx, rdx, cl
	shlx r13, rdx, r11
	test r11b, 64
	cmovne rbx, r13
	cmovne r13, r15
	or rbx, rbp
	or r13, rax
	add r10d, r11d
	cmp r10d, 64
	jb .LBB21_23
	cmp rdi, r9
	jae .LBB21_11
	mov qword ptr [r8 + 8*rdi], r13
	inc rdi
	add r10d, -64
	mov r13, rbx
	xor ebx, ebx
.LBB21_23:
	vextracti128 xmm4, ymm4, 1
	vmovq rax, xmm4
	vextracti128 xmm3, ymm3, 1
	vmovd r11d, xmm3
	xor ebp, ebp
	mov ecx, r10d
	shld rbp, rax, cl
	shlx rax, rax, r10
	test r10b, 64
	cmovne rbp, rax
	cmovne rax, r15
	or rbp, rbx
	or rax, r13
	add r11d, r10d
	cmp r11d, 64
	jb .LBB21_26
	cmp rdi, r9
	jae .LBB21_11
	mov qword ptr [r8 + 8*rdi], rax
	inc rdi
	add r11d, -64
	mov rax, rbp
	xor ebp, ebp
.LBB21_26:
	vpextrq rdx, xmm4, 1
	vpextrd r10d, xmm3, 2
	xor ebx, ebx
	mov ecx, r11d
	shld rbx, rdx, cl
	shlx r13, rdx, r11
	test r11b, 64
	cmovne rbx, r13
	cmovne r13, r15
	or rbx, rbp
	or r13, rax
	add r10d, r11d
	cmp r10d, 64
	jb .LBB21_29
	cmp rdi, r9
	jb .LBB21_28
.LBB21_11:
	mov rsi, r9
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.3]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB21_2:
	xor edi, edi
	xor r13d, r13d
	xor ebx, ebx
	xor r10d, r10d
	mov rsi, rdx
.LBB21_3:
	mov qword ptr [rsp], r9
	mov rcx, qword ptr [rsp + 16]
	mov r9d, ecx
	and r9d, 3
	je .LBB21_12
	shl rcx, 3
	movabs rax, 9223372036854775776
	and rax, rcx
	add qword ptr [rsp + 8], rax
	add rsi, rax
	xor r14d, r14d
	jmp .LBB21_5
.LBB21_18:
	mov rsi, r11
	inc r14
	mov rbx, rbp
	cmp r9, r14
	je .LBB21_12
.LBB21_5:
	mov r15, r13
	mov ecx, r10d
	mov r11, rsi
	mov r10, qword ptr [rsi + 8*r14]
	mov rax, qword ptr [rsp + 8]
	mov r13, qword ptr [rax + 8*r14]
	and r13, r10
	mov rsi, r10
	not rsi
	lea rax, [rsi + rsi]
	lea r12, [4*rsi]
	xor r12, rax
	xor r12, rsi
	shl r12, 2
	xor r12, rax
	mov rsi, r12
	shl rsi, 4
	xor rsi, r12
	mov r12, rsi
	shl r12, 8
	xor r12, rsi
	mov rsi, r12
	shl rsi, 16
	xor rsi, r12
	mov r12, rsi
	shl r12, 32
	xor r12, rsi
	mov rbp, r12
	and rbp, r10
	mov rsi, rbp
	xor rsi, r10
	shr rbp
	or rbp, rsi
	andn rax, r12, rax
	and r12, r13
	xor r13, r12
	shr r12
	or r12, r13
	lea rsi, [rax + rax]
	xor rsi, rax
	lea r13, [4*rsi]
	xor r13, rsi
	mov rsi, r13
	shl rsi, 4
	xor rsi, r13
	mov r13, rsi
	shl r13, 8
	xor r13, rsi
	mov rsi, r13
	shl rsi, 16
	xor rsi, r13
	mov r13, rsi
	shl r13, 32
	xor r13, rsi
	andn rsi, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rax, r13
	shr rax, 2
	or rax, rbp
	and r13, r12
	xor r12, r13
	shr r13, 2
	or r13, r12
	lea r12, [rsi + rsi]
	xor r12, rsi
	lea rbp, [4*r12]
	xor rbp, r12
	mov r12, rbp
	shl r12, 4
	xor r12, rbp
	mov rbp, r12
	shl rbp, 8
	xor rbp, r12
	mov rdx, rbp
	shl rdx, 16
	xor rdx, rbp
	mov r12, rdx
	shl r12, 32
	xor r12, rdx
	andn rsi, r12, rsi
	and r12, rax
	xor rax, r12
	mov rbp, r12
	shr rbp, 4
	or rbp, rax
	and r12, r13
	xor r13, r12
	shr r12, 4
	or r12, r13
	lea rax, [rsi + rsi]
	xor rax, rsi
	lea rdx, [4*rax]
	xor rdx, rax
	mov rax, rdx
	shl rax, 4
	xor rax, rdx
	mov rdx, rax
	shl rdx, 8
	xor rdx, rax
	mov rax, rdx
	shl rax, 16
	xor rax, rdx
	mov r13, rax
	shl r13, 32
	xor r13, rax
	andn rsi, r13, rsi
	and r13, rbp
	xor rbp, r13
	mov rax, r13
	shr rax, 8
	or rax, rbp
	and r13, r12
	xor r12, r13
	shr r13, 8
	or r13, r12
	lea rdx, [rsi + rsi]
	xor rdx, rsi
	lea r12, [4*rdx]
	xor r12, rdx
	mov rdx, r12
	shl rdx, 4
	xor rdx, r12
	mov r12, rdx
	shl r12, 8
	xor r12, rdx
	mov rdx, r12
	shl rdx, 16
	xor rdx, r12
	mov rbp, rdx
	shl rbp, 32
	xor rbp, rdx
	andn rdx, rbp, rsi
	and rbp, rax
	xor rax, rbp
	mov r12, rbp
	shr r12, 16
	or r12, rax
	and rbp, r13
	xor r13, rbp
	shr rbp, 16
	or rbp, r13
	lea rax, [rdx + rdx]
	xor rax, rdx
	lea rdx, [4*rax]
	xor rdx, rax
	mov rax, rdx
	shl rax, 4
	xor rax, rdx
	mov rdx, rax
	shl rdx, 8
	xor rdx, rax
	mov rax, rdx
	shl rax, 16
	xor rax, rdx
	mov rdx, rax
	shl rdx, 32
	xor rdx, rax
	and r12, rbp
	and r12, rdx
	xor rbp, r12
	shr r12, 32
	or r12, rbp
	popcnt r10, r10
	xor ebp, ebp
	shld rbp, r12, cl
	shlx r13, r12, rcx
	test cl, 64
	cmovne rbp, r13
	mov eax, 0
	cmovne r13, rax
	or rbp, rbx
	or r13, r15
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB21_18
	cmp rdi, qword ptr [rsp]
	jae .LBB21_7
	mov qword ptr [r8 + 8*rdi], r13
	inc rdi
	add r10d, -64
	mov r13, rbp
	xor ebp, ebp
	jmp .LBB21_18
.LBB21_12:
	test r10d, r10d
	mov rsi, qword ptr [rsp]
	je .LBB21_15
	cmp rdi, rsi
	jae .LBB21_16
	mov qword ptr [r8 + 8*rdi], r13
.LBB21_15:
	shl rdi, 6
	mov eax, r10d
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
.LBB21_30:
	lea r9, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.17]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB21_7:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.3]
	mov rsi, qword ptr [rsp]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB21_16:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.2]
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
