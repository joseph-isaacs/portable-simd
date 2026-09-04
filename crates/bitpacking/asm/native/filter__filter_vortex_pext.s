bitpacking::filter::filter_vortex_pext:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rcx
	cmp rsi, rcx
	jne .LBB40_18
	cmp r9, rsi
	jbe .LBB40_19
	xor r9d, r9d
	xor eax, eax
	test rsi, rsi
	je .LBB40_17
	xor r15d, r15d
	xor r14d, r14d
	xor ecx, ecx
	xor r10d, r10d
.LBB40_4:
	mov r11, r15
	mov rbx, r14
	jmp .LBB40_5
.LBB40_12:
	xor r15d, r15d
	shld r15, r14, cl
	shlx r14, r14, rcx
	test cl, 64
	cmovne r15, r14
	cmovne r14, r9
	or r15, rbx
	or r14, r11
	mov qword ptr [r8 + 8*rax], r14
	inc rax
	mov r11, r15
	xor ebx, ebx
.LBB40_13:
	inc r10
	cmp r10, rsi
	jae .LBB40_10
.LBB40_5:
	mov r14, qword ptr [rdi + 8*r10]
	mov r15, qword ptr [rdx + 8*r10]
	cmp r15, -1
	je .LBB40_12
	test r15, r15
	je .LBB40_13
	popcnt r12, r15
	pext r15, r14, r15
	shlx r13, r15, rcx
	xor r14d, r14d
	shld r14, r15, cl
	test cl, 64
	cmovne r14, r13
	mov r15, r13
	cmovne r15, r9
	or r14, rbx
	or r15, r11
	add r12d, ecx
	cmp r12d, 64
	jb .LBB40_8
	mov qword ptr [r8 + 8*rax], r15
	inc rax
	add r12d, -64
	mov ecx, r12d
	mov r15, r14
	xor r14d, r14d
	inc r10
	cmp r10, rsi
	jb .LBB40_4
	jmp .LBB40_9
.LBB40_8:
	mov ecx, r12d
	inc r10
	cmp r10, rsi
	jb .LBB40_4
.LBB40_9:
	mov r11, r15
.LBB40_10:
	test ecx, ecx
	je .LBB40_11
	mov qword ptr [r8 + 8*rax], r11
	mov r9d, ecx
	jmp .LBB40_17
.LBB40_11:
	xor r9d, r9d
.LBB40_17:
	shl rax, 6
	add rax, r9
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB40_18:
	lea r9, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.8]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB40_19:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.9]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.10]
	mov esi, 95
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
