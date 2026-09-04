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
	jne .LBB33_16
	xor r10d, r10d
	test rsi, rsi
	je .LBB33_2
	xor r11d, r11d
	xor eax, eax
	xor r14d, r14d
	xor r12d, r12d
	xor ebx, ebx
	jmp .LBB33_4
.LBB33_7:
	inc rbx
	mov r12, r15
	cmp rsi, rbx
	je .LBB33_8
.LBB33_4:
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
	jbe .LBB33_7
	cmp rax, r9
	jae .LBB33_15
	mov qword ptr [r8 + 8*rax], r14
	inc rax
	add r11d, -64
	mov r14, r15
	xor r15d, r15d
	jmp .LBB33_7
.LBB33_8:
	test r11d, r11d
	je .LBB33_9
	cmp rax, r9
	jae .LBB33_13
	mov qword ptr [r8 + 8*rax], r14
	mov r10d, r11d
	jmp .LBB33_12
.LBB33_2:
	xor eax, eax
	jmp .LBB33_12
.LBB33_9:
	xor r10d, r10d
.LBB33_12:
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
.LBB33_16:
	lea r9, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.4]
	lea rsi, [rsp + 8]
	lea rdx, [rsp + 16]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB33_15:
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.6]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB33_13:
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.5]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
