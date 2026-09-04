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
	jne .LBB37_42
	mov qword ptr [rsp + 16], rsi
	shr rsi, 3
	je .LBB37_2
	shl rsi, 6
	mov qword ptr [rsp], rsi
	xor r14d, r14d
	xor r15d, r15d
	xor r10d, r10d
	xor r13d, r13d
	xor r12d, r12d
	xor edi, edi
	jmp .LBB37_9
.LBB37_31:
	mov rax, qword ptr [rsp]
	add r15, 64
	cmp rax, r15
	je .LBB37_3
.LBB37_9:
	vmovdqu64 zmm1, zmmword ptr [rdx + r15]
	mov rax, qword ptr [rsp + 8]
	vpandq zmm0, zmm1, zmmword ptr [rax + r15]
	vmovdqa64 zmm2, zmm1
	vpternlogq zmm2, zmm1, zmm1, 15
	vpaddq zmm3, zmm2, zmm2
	vpsllq zmm4, zmm2, 2
	vpternlogq zmm4, zmm3, zmm2, 150
	vpsllq zmm2, zmm4, 2
	vpxorq zmm2, zmm2, zmm3
	vpsllq zmm4, zmm2, 4
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 8
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 16
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 32
	vpxorq zmm2, zmm4, zmm2
	vpandq zmm4, zmm2, zmm1
	vpsrlq zmm5, zmm4, 1
	vpternlogq zmm5, zmm4, zmm1, 246
	vpandq zmm4, zmm2, zmm0
	vpsrlq zmm6, zmm4, 1
	vpternlogq zmm6, zmm4, zmm0, 246
	vpandnq zmm0, zmm2, zmm3
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm5
	vpsrlq zmm4, zmm3, 2
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandq zmm3, zmm3, zmm6
	vpsrlq zmm5, zmm3, 2
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm4
	vpsrlq zmm6, zmm3, 4
	vpternlogq zmm6, zmm3, zmm4, 246
	vpandq zmm3, zmm3, zmm5
	vpsrlq zmm4, zmm3, 4
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm6
	vpsrlq zmm5, zmm3, 8
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandq zmm3, zmm3, zmm4
	vpsrlq zmm6, zmm3, 8
	vpternlogq zmm6, zmm3, zmm4, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm5
	vpsrlq zmm4, zmm3, 16
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandq zmm3, zmm3, zmm6
	vpsrlq zmm5, zmm3, 16
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 2
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 4
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 8
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 16
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 32
	vpxorq zmm2, zmm2, zmm0
	vpternlogq zmm2, zmm5, zmm4, 128
	vpsrlq zmm0, zmm2, 32
	vpternlogq zmm0, zmm2, zmm5, 246
	vpopcntq zmm1, zmm1
	vmovq rax, xmm0
	vmovd r11d, xmm1
	xor ebp, ebp
	mov ecx, r10d
	shld rbp, rax, cl
	shlx rsi, rax, r10
	test r10b, 64
	cmovne rbp, rsi
	cmovne rsi, r14
	or rbp, r12
	or rsi, r13
	add r11d, r10d
	cmp r11d, 63
	jbe .LBB37_12
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rsi
	inc rdi
	add r11d, -64
	mov rsi, rbp
	xor ebp, ebp
.LBB37_12:
	vpextrq rax, xmm0, 1
	vpextrd r10d, xmm1, 2
	xor r12d, r12d
	mov ecx, r11d
	shld r12, rax, cl
	shlx rbx, rax, r11
	test r11b, 64
	cmovne r12, rbx
	cmovne rbx, r14
	or r12, rbp
	or rbx, rsi
	add r10d, r11d
	cmp r10d, 64
	jb .LBB37_15
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rbx
	inc rdi
	add r10d, -64
	mov rbx, r12
	xor r12d, r12d
.LBB37_15:
	vextracti128 xmm2, ymm0, 1
	vmovq rax, xmm2
	vextracti128 xmm2, ymm1, 1
	vmovd r11d, xmm2
	xor r13d, r13d
	mov ecx, r10d
	shld r13, rax, cl
	shlx rbp, rax, r10
	test r10b, 64
	cmovne r13, rbp
	cmovne rbp, r14
	or r13, r12
	or rbp, rbx
	add r11d, r10d
	cmp r11d, 64
	jb .LBB37_18
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rbp
	inc rdi
	add r11d, -64
	mov rbp, r13
	xor r13d, r13d
.LBB37_18:
	vextracti128 xmm2, ymm0, 1
	vpextrq rax, xmm2, 1
	vextracti128 xmm2, ymm1, 1
	vpextrd r10d, xmm2, 2
	xor r12d, r12d
	mov ecx, r11d
	shld r12, rax, cl
	shlx rsi, rax, r11
	test r11b, 64
	cmovne r12, rsi
	cmovne rsi, r14
	or r12, r13
	or rsi, rbp
	add r10d, r11d
	cmp r10d, 64
	jb .LBB37_21
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rsi
	inc rdi
	add r10d, -64
	mov rsi, r12
	xor r12d, r12d
.LBB37_21:
	vextracti32x4 xmm2, zmm0, 2
	vmovq rax, xmm2
	vextracti32x4 xmm3, zmm1, 2
	vmovd r11d, xmm3
	xor r13d, r13d
	mov ecx, r10d
	shld r13, rax, cl
	shlx rbx, rax, r10
	test r10b, 64
	cmovne r13, rbx
	cmovne rbx, r14
	or r13, r12
	or rbx, rsi
	add r11d, r10d
	cmp r11d, 64
	jb .LBB37_24
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rbx
	inc rdi
	add r11d, -64
	mov rbx, r13
	xor r13d, r13d
.LBB37_24:
	vpextrq rax, xmm2, 1
	vpextrd r10d, xmm3, 2
	xor r12d, r12d
	mov ecx, r11d
	shld r12, rax, cl
	shlx rsi, rax, r11
	test r11b, 64
	cmovne r12, rsi
	cmovne rsi, r14
	or r12, r13
	or rsi, rbx
	add r10d, r11d
	cmp r10d, 64
	jb .LBB37_27
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rsi
	inc rdi
	add r10d, -64
	mov rsi, r12
	xor r12d, r12d
.LBB37_27:
	vextracti32x4 xmm0, zmm0, 3
	vmovq rax, xmm0
	vextracti32x4 xmm1, zmm1, 3
	vmovd r11d, xmm1
	xor ebp, ebp
	mov ecx, r10d
	shld rbp, rax, cl
	shlx rbx, rax, r10
	test r10b, 64
	cmovne rbp, rbx
	cmovne rbx, r14
	or rbp, r12
	or rbx, rsi
	add r11d, r10d
	cmp r11d, 64
	jb .LBB37_30
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], rbx
	inc rdi
	add r11d, -64
	mov rbx, rbp
	xor ebp, ebp
.LBB37_30:
	vpextrq rax, xmm0, 1
	vpextrd r10d, xmm1, 2
	xor r12d, r12d
	mov ecx, r11d
	shld r12, rax, cl
	shlx r13, rax, r11
	test r11b, 64
	cmovne r12, r13
	cmovne r13, r14
	or r12, rbp
	or r13, rbx
	add r10d, r11d
	cmp r10d, 64
	jb .LBB37_31
	cmp rdi, r9
	mov rax, qword ptr [rsp]
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], r13
	inc rdi
	add r10d, -64
	mov r13, r12
	xor r12d, r12d
	add r15, 64
	cmp rax, r15
	jne .LBB37_9
	jmp .LBB37_3
.LBB37_2:
	xor edi, edi
	xor r13d, r13d
	xor r12d, r12d
	xor r10d, r10d
.LBB37_3:
	mov rcx, qword ptr [rsp + 16]
	mov eax, ecx
	and eax, 7
	mov qword ptr [rsp], rax
	je .LBB37_32
	shl rcx, 3
	movabs rax, 9223372036854775744
	and rax, rcx
	add qword ptr [rsp + 8], rax
	add rdx, rax
	xor ebx, ebx
	jmp .LBB37_5
.LBB37_38:
	mov rdx, r11
	inc rbx
	mov r12, rbp
	cmp qword ptr [rsp], rbx
	je .LBB37_32
.LBB37_5:
	mov r14, r13
	mov ecx, r10d
	mov r11, rdx
	mov r10, qword ptr [rdx + 8*rbx]
	mov rax, qword ptr [rsp + 8]
	mov r13, qword ptr [rax + 8*rbx]
	and r13, r10
	mov rsi, r10
	not rsi
	lea rax, [rsi + rsi]
	lea r15, [4*rsi]
	xor r15, rax
	xor r15, rsi
	shl r15, 2
	xor r15, rax
	mov rsi, r15
	shl rsi, 4
	xor rsi, r15
	mov r15, rsi
	shl r15, 8
	xor r15, rsi
	mov rsi, r15
	shl rsi, 16
	xor rsi, r15
	mov r15, rsi
	shl r15, 32
	xor r15, rsi
	mov rbp, r15
	and rbp, r10
	mov rsi, rbp
	xor rsi, r10
	shr rbp
	or rbp, rsi
	andn rax, r15, rax
	and r15, r13
	xor r13, r15
	shr r15
	or r15, r13
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
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rsi, r13
	shr rsi, 2
	or rsi, rbp
	and r13, r15
	xor r15, r13
	shr r13, 2
	or r13, r15
	lea r15, [rax + rax]
	xor r15, rax
	lea rbp, [4*r15]
	xor rbp, r15
	mov r15, rbp
	shl r15, 4
	xor r15, rbp
	mov rbp, r15
	shl rbp, 8
	xor rbp, r15
	mov rdx, rbp
	shl rdx, 16
	xor rdx, rbp
	mov r15, rdx
	shl r15, 32
	xor r15, rdx
	andn rax, r15, rax
	and r15, rsi
	xor rsi, r15
	mov rbp, r15
	shr rbp, 4
	or rbp, rsi
	and r15, r13
	xor r13, r15
	shr r15, 4
	or r15, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea rsi, [4*rdx]
	xor rsi, rdx
	mov rdx, rsi
	shl rdx, 4
	xor rdx, rsi
	mov rsi, rdx
	shl rsi, 8
	xor rsi, rdx
	mov rdx, rsi
	shl rdx, 16
	xor rdx, rsi
	mov r13, rdx
	shl r13, 32
	xor r13, rdx
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rsi, r13
	shr rsi, 8
	or rsi, rbp
	and r13, r15
	xor r15, r13
	shr r13, 8
	or r13, r15
	lea rdx, [rax + rax]
	xor rdx, rax
	lea r15, [4*rdx]
	xor r15, rdx
	mov rdx, r15
	shl rdx, 4
	xor rdx, r15
	mov r15, rdx
	shl r15, 8
	xor r15, rdx
	mov rdx, r15
	shl rdx, 16
	xor rdx, r15
	mov rbp, rdx
	shl rbp, 32
	xor rbp, rdx
	andn rax, rbp, rax
	and rbp, rsi
	xor rsi, rbp
	mov r15, rbp
	shr r15, 16
	or r15, rsi
	and rbp, r13
	xor r13, rbp
	shr rbp, 16
	or rbp, r13
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
	and r15, rbp
	and r15, rax
	xor rbp, r15
	shr r15, 32
	or r15, rbp
	popcnt r10, r10
	xor ebp, ebp
	shld rbp, r15, cl
	shlx r13, r15, rcx
	test cl, 64
	cmovne rbp, r13
	mov eax, 0
	cmovne r13, rax
	or rbp, r12
	or r13, r14
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB37_38
	cmp rdi, r9
	jae .LBB37_7
	mov qword ptr [r8 + 8*rdi], r13
	inc rdi
	add r10d, -64
	mov r13, rbp
	xor ebp, ebp
	jmp .LBB37_38
.LBB37_32:
	test r10d, r10d
	je .LBB37_35
	cmp rdi, r9
	jae .LBB37_36
	mov qword ptr [r8 + 8*rdi], r13
.LBB37_35:
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
.LBB37_42:
	lea r9, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.11]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB37_7:
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.6]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB37_36:
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.5]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
