bitpacking::filter::filter_bmi2:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rcx
	cmp rsi, rcx
	jne .LBB18_16
	xor r10d, r10d
	test rsi, rsi
	je .LBB18_2
	xor r11d, r11d
	xor eax, eax
	xor r14d, r14d
	xor r12d, r12d
	xor ebx, ebx
	jmp .LBB18_4
.LBB18_7:
	inc rbx
	mov r12, r15
	cmp rsi, rbx
	je .LBB18_8
.LBB18_4:
	mov r13, r14
	mov ecx, r11d
	mov r11, qword ptr [rdi + 8*rbx]
	mov r14, qword ptr [rdx + 8*rbx]
	pext rbp, r11, r14
	popcnt r11, r14
	xor r15d, r15d
	shld r15, rbp, cl
	shlx r14, rbp, rcx
	test cl, 64
	cmovne r15, r14
	cmovne r14, r10
	or r15, r12
	or r14, r13
	add r11d, ecx
	cmp r11d, 63
	jbe .LBB18_7
	cmp rax, r9
	jae .LBB18_15
	mov qword ptr [r8 + 8*rax], r14
	inc rax
	add r11d, -64
	mov r14, r15
	xor r15d, r15d
	jmp .LBB18_7
.LBB18_8:
	test r11d, r11d
	je .LBB18_9
	cmp rax, r9
	jae .LBB18_13
	mov qword ptr [r8 + 8*rax], r14
	mov r10d, r11d
	jmp .LBB18_12
.LBB18_2:
	xor eax, eax
	jmp .LBB18_12
.LBB18_9:
	xor r10d, r10d
.LBB18_12:
	shl rax, 6
	add rax, r10
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB18_16:
	lea r9, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.1]
	lea rsi, [rsp + 8]
	lea rdx, [rsp + 16]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB18_15:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.3]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB18_13:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.2]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
