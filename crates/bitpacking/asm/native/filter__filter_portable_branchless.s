bitpacking::filter::filter_portable_branchless:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB23_27
	mov rbp, rdi
	mov rbx, rsi
	shr rbx, 3
	je .LBB23_2
	shl rbx, 6
	xor r14d, r14d
	vpbroadcastd zmm0, dword ptr [rip + .LCPI23_2]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI23_3]
	vpxor xmm2, xmm2, xmm2
	xor r15d, r15d
	xor r10d, r10d
	xor r12d, r12d
	xor r11d, r11d
	xor edi, edi
.LBB23_12:
	cmp rdi, r9
	jae .LBB23_21
	vmovdqu64 zmm4, zmmword ptr [rdx + r15]
	vpandq zmm3, zmm4, zmmword ptr [rbp + r15]
	vmovdqa64 zmm5, zmm4
	vpternlogq zmm5, zmm4, zmm4, 15
	vpaddq zmm6, zmm5, zmm5
	vpsllq zmm7, zmm5, 2
	vpternlogq zmm7, zmm6, zmm5, 150
	vpsllq zmm5, zmm7, 2
	vpxorq zmm5, zmm5, zmm6
	vpsllq zmm7, zmm5, 4
	vpxorq zmm5, zmm7, zmm5
	vpsllq zmm7, zmm5, 8
	vpxorq zmm5, zmm7, zmm5
	vpsllq zmm7, zmm5, 16
	vpxorq zmm5, zmm7, zmm5
	vpsllq zmm7, zmm5, 32
	vpxorq zmm5, zmm7, zmm5
	vpandq zmm7, zmm5, zmm4
	vpsrlq zmm8, zmm7, 1
	vpternlogq zmm8, zmm7, zmm4, 246
	vpandq zmm7, zmm5, zmm3
	vpsrlq zmm9, zmm7, 1
	vpternlogq zmm9, zmm7, zmm3, 246
	vpandnq zmm3, zmm5, zmm6
	vpaddq zmm5, zmm3, zmm3
	vpxorq zmm5, zmm5, zmm3
	vpsllq zmm6, zmm5, 2
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 4
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 8
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 16
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 32
	vpxorq zmm5, zmm6, zmm5
	vpandq zmm6, zmm5, zmm8
	vpsrlq zmm7, zmm6, 2
	vpternlogq zmm7, zmm6, zmm8, 246
	vpandq zmm6, zmm6, zmm9
	vpsrlq zmm8, zmm6, 2
	vpternlogq zmm8, zmm6, zmm9, 246
	vpandnq zmm3, zmm5, zmm3
	vpaddq zmm5, zmm3, zmm3
	vpxorq zmm5, zmm5, zmm3
	vpsllq zmm6, zmm5, 2
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 4
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 8
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 16
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 32
	vpxorq zmm5, zmm6, zmm5
	vpandq zmm6, zmm5, zmm7
	vpsrlq zmm9, zmm6, 4
	vpternlogq zmm9, zmm6, zmm7, 246
	vpandq zmm6, zmm6, zmm8
	vpsrlq zmm7, zmm6, 4
	vpternlogq zmm7, zmm6, zmm8, 246
	vpandnq zmm3, zmm5, zmm3
	vpaddq zmm5, zmm3, zmm3
	vpxorq zmm5, zmm5, zmm3
	vpsllq zmm6, zmm5, 2
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 4
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 8
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 16
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 32
	vpxorq zmm5, zmm6, zmm5
	vpandq zmm6, zmm5, zmm9
	vpsrlq zmm8, zmm6, 8
	vpternlogq zmm8, zmm6, zmm9, 246
	vpandq zmm6, zmm6, zmm7
	vpsrlq zmm9, zmm6, 8
	vpternlogq zmm9, zmm6, zmm7, 246
	vpandnq zmm3, zmm5, zmm3
	vpaddq zmm5, zmm3, zmm3
	vpxorq zmm5, zmm5, zmm3
	vpsllq zmm6, zmm5, 2
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 4
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 8
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 16
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 32
	vpxorq zmm5, zmm6, zmm5
	vpandq zmm6, zmm5, zmm8
	vpsrlq zmm7, zmm6, 16
	vpternlogq zmm7, zmm6, zmm8, 246
	vpandq zmm6, zmm6, zmm9
	vpsrlq zmm8, zmm6, 16
	vpternlogq zmm8, zmm6, zmm9, 246
	vpandnq zmm3, zmm5, zmm3
	vpaddq zmm5, zmm3, zmm3
	vpxorq zmm3, zmm5, zmm3
	vpsllq zmm5, zmm3, 2
	vpxorq zmm3, zmm5, zmm3
	vpsllq zmm5, zmm3, 4
	vpxorq zmm3, zmm5, zmm3
	vpsllq zmm5, zmm3, 8
	vpxorq zmm3, zmm5, zmm3
	vpsllq zmm5, zmm3, 16
	vpxorq zmm3, zmm5, zmm3
	vpsllq zmm5, zmm3, 32
	vpxorq zmm5, zmm5, zmm3
	vpternlogq zmm5, zmm8, zmm7, 128
	vpsrlq zmm3, zmm5, 32
	vpternlogq zmm3, zmm5, zmm8, 246
	vpandq zmm5, zmm4, zmm0
	vpshufb zmm5, zmm1, zmm5
	vpsrlw zmm4, zmm4, 4
	vpandq zmm4, zmm4, zmm0
	vpshufb zmm4, zmm1, zmm4
	vpaddb zmm4, zmm4, zmm5
	vmovq rax, xmm3
	xor r13d, r13d
	mov ecx, r10d
	shld r13, rax, cl
	vpsadbw zmm4, zmm4, zmm2
	vmovd ecx, xmm4
	add ecx, r10d
	shlx rax, rax, r10
	test r10b, 64
	cmovne r13, rax
	cmovne rax, r14
	or rax, r12
	mov qword ptr [r8 + 8*rdi], rax
	mov r10d, ecx
	shr r10d, 6
	add rdi, r10
	cmp rdi, r9
	jae .LBB23_21
	or r13, r11
	mov r10d, ecx
	and r10d, 63
	test cl, 64
	cmovne rax, r13
	mov r12d, 0
	cmove r12, r13
	vpextrd r11d, xmm4, 2
	add r11d, r10d
	vpextrq r13, xmm3, 1
	shlx rcx, r13, r10
	or rcx, rax
	mov qword ptr [r8 + 8*rdi], rcx
	mov eax, r11d
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB23_21
	not r10b
	shr r13
	shrx r10, r13, r10
	or r10, r12
	mov eax, r11d
	and eax, 63
	test r11b, 64
	cmovne rcx, r10
	mov r12d, 0
	cmove r12, r10
	vextracti128 xmm5, ymm4, 1
	vmovd r11d, xmm5
	add r11d, eax
	vextracti128 xmm5, ymm3, 1
	vmovq r13, xmm5
	shlx r10, r13, rax
	or r10, rcx
	mov qword ptr [r8 + 8*rdi], r10
	mov ecx, r11d
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB23_21
	not al
	shr r13
	shrx rcx, r13, rax
	or rcx, r12
	mov eax, r11d
	and eax, 63
	test r11b, 64
	cmovne r10, rcx
	mov r12d, 0
	cmove r12, rcx
	vextracti128 xmm5, ymm4, 1
	vpextrd r11d, xmm5, 2
	add r11d, eax
	vextracti128 xmm5, ymm3, 1
	vpextrq r13, xmm5, 1
	shlx rcx, r13, rax
	or rcx, r10
	mov qword ptr [r8 + 8*rdi], rcx
	mov r10d, r11d
	shr r10d, 6
	add rdi, r10
	cmp rdi, r9
	jae .LBB23_21
	not al
	shr r13
	shrx rax, r13, rax
	or rax, r12
	mov r10d, r11d
	and r10d, 63
	test r11b, 64
	cmovne rcx, rax
	mov r12d, 0
	cmove r12, rax
	vextracti32x4 xmm5, zmm4, 2
	vmovd r11d, xmm5
	add r11d, r10d
	vextracti32x4 xmm6, zmm3, 2
	vmovq r13, xmm6
	shlx rax, r13, r10
	or rax, rcx
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, r11d
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB23_21
	not r10b
	shr r13
	shrx rcx, r13, r10
	or rcx, r12
	mov r10d, r11d
	and r10d, 63
	test r11b, 64
	cmovne rax, rcx
	mov r12d, 0
	cmove r12, rcx
	vpextrd r11d, xmm5, 2
	add r11d, r10d
	vpextrq r13, xmm6, 1
	shlx rcx, r13, r10
	or rcx, rax
	mov qword ptr [r8 + 8*rdi], rcx
	mov eax, r11d
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB23_21
	not r10b
	shr r13
	shrx rax, r13, r10
	or rax, r12
	mov r10d, r11d
	and r10d, 63
	test r11b, 64
	cmovne rcx, rax
	mov r12d, 0
	cmove r12, rax
	vextracti32x4 xmm4, zmm4, 3
	vmovd r11d, xmm4
	add r11d, r10d
	vextracti32x4 xmm3, zmm3, 3
	vmovq r13, xmm3
	shlx rax, r13, r10
	or rax, rcx
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, r11d
	shr ecx, 6
	add rcx, rdi
	cmp rcx, r9
	jae .LBB23_20
	not r10b
	shr r13
	shrx r13, r13, r10
	or r13, r12
	mov edi, r11d
	and edi, 63
	test r11b, 64
	cmovne rax, r13
	cmovne r13, r14
	vpextrd r10d, xmm4, 2
	add r10d, edi
	vpextrq r11, xmm3, 1
	shlx r12, r11, rdi
	or r12, rax
	not dil
	shr r11
	shrx r11, r11, rdi
	or r11, r13
	mov qword ptr [r8 + 8*rcx], r12
	mov edi, r10d
	shr edi, 6
	add rdi, rcx
	test r10b, 64
	cmovne r12, r11
	cmovne r11, r14
	and r10d, 63
	add r15, 64
	cmp rbx, r15
	jne .LBB23_12
	mov eax, esi
	and eax, 7
	mov qword ptr [rsp + 16], rax
	jne .LBB23_4
	jmp .LBB23_7
.LBB23_2:
	xor edi, edi
	xor r12d, r12d
	xor r11d, r11d
	xor r10d, r10d
	mov eax, esi
	and eax, 7
	mov qword ptr [rsp + 16], rax
	je .LBB23_7
.LBB23_4:
	shl rsi, 3
	movabs rax, 9223372036854775744
	and rax, rsi
	add rbp, rax
	add rdx, rax
	xor r14d, r14d
	mov qword ptr [rsp + 8], rdx
	jmp .LBB23_5
.LBB23_6:
	mov rdx, qword ptr [rsp + 8]
	mov rbp, rbx
	inc r14
	mov r11, r13
	cmp qword ptr [rsp + 16], r14
	je .LBB23_7
.LBB23_5:
	mov r15, r12
	mov ecx, r10d
	mov r10, qword ptr [rdx + 8*r14]
	mov rbx, rbp
	mov r13, qword ptr [rbp + 8*r14]
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
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rsi, r13
	shr rsi, 2
	or rsi, rbp
	and r13, r12
	xor r12, r13
	shr r13, 2
	or r13, r12
	lea r12, [rax + rax]
	xor r12, rax
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
	andn rax, r12, rax
	and r12, rsi
	xor rsi, r12
	mov rbp, r12
	shr rbp, 4
	or rbp, rsi
	and r12, r13
	xor r13, r12
	shr r12, 4
	or r12, r13
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
	and r13, r12
	xor r12, r13
	shr r13, 8
	or r13, r12
	lea rdx, [rax + rax]
	xor rdx, rax
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
	andn rax, rbp, rax
	and rbp, rsi
	xor rsi, rbp
	mov r12, rbp
	shr r12, 16
	or r12, rsi
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
	and r12, rbp
	and r12, rax
	xor rbp, r12
	shr r12, 32
	or r12, rbp
	popcnt r10, r10
	xor r13d, r13d
	shld r13, r12, cl
	shlx r12, r12, rcx
	test cl, 64
	cmovne r13, r12
	mov eax, 0
	cmovne r12, rax
	or r13, r11
	or r12, r15
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB23_6
	cmp rdi, r9
	jae .LBB23_25
	mov qword ptr [r8 + 8*rdi], r12
	inc rdi
	add r10d, -64
	mov r12, r13
	xor r13d, r13d
	jmp .LBB23_6
.LBB23_7:
	test r10d, r10d
	je .LBB23_10
	cmp rdi, r9
	jae .LBB23_22
	mov qword ptr [r8 + 8*rdi], r12
.LBB23_10:
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
.LBB23_27:
	lea r9, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.5]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB23_20:
	mov rdi, rcx
.LBB23_21:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.4]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB23_25:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.3]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB23_22:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.2]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
