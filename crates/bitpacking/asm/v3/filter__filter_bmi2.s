bitpacking::filter::filter_bmi2:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov qword ptr [rsp], r8
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp + 16], rcx
	cmp rsi, rcx
	jne .LBB14_16
	xor r8d, r8d
	test rsi, rsi
	je .LBB14_2
	xor ebx, ebx
	xor eax, eax
	xor r11d, r11d
	xor r12d, r12d
	xor r14d, r14d
	jmp .LBB14_4
.LBB14_7:
	inc r14
	mov r12, r15
	cmp rsi, r14
	je .LBB14_8
.LBB14_4:
	mov ecx, ebx
	mov rbx, qword ptr [rdi + 8*r14]
	mov r13, qword ptr [rdx + 8*r14]
	pext rbp, rbx, r13
	xor r15d, r15d
	shld r15, rbp, cl
	mov r10, r11
	xor ebx, ebx
	popcnt rbx, r13
	shlx r11, rbp, rcx
	test cl, 64
	cmovne r15, r11
	cmovne r11, r8
	or r15, r12
	or r11, r10
	add ebx, ecx
	cmp ebx, 63
	jbe .LBB14_7
	cmp rax, r9
	jae .LBB14_15
	mov rcx, qword ptr [rsp]
	mov qword ptr [rcx + 8*rax], r11
	inc rax
	add ebx, -64
	mov r11, r15
	xor r15d, r15d
	jmp .LBB14_7
.LBB14_8:
	test ebx, ebx
	je .LBB14_9
	cmp rax, r9
	jae .LBB14_13
	mov rcx, qword ptr [rsp]
	mov qword ptr [rcx + 8*rax], r11
	mov r8d, ebx
	jmp .LBB14_12
.LBB14_2:
	xor eax, eax
	jmp .LBB14_12
.LBB14_9:
	xor r8d, r8d
.LBB14_12:
	shl rax, 6
	add rax, r8
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB14_16:
	lea r9, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.1]
	lea rsi, [rsp + 8]
	lea rdx, [rsp + 16]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB14_15:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.3]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB14_13:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.2]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
