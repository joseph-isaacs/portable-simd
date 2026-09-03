bitpacking::filter::filter_naive:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], r8
	mov qword ptr [rsp + 16], rdi
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB15_19
	xor ecx, ecx
	test rsi, rsi
	je .LBB15_2
	mov qword ptr [rsp], r9
	mov r11d, 1
	xor ecx, ecx
	xor eax, eax
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
	jmp .LBB15_4
.LBB15_10:
	mov rdi, qword ptr [rsp + 8]
	mov qword ptr [rdi + 8*rax], rbx
	inc rax
	add ecx, -64
	mov rbx, r12
	xor r12d, r12d
.LBB15_11:
	inc r14
	mov r15, r12
	cmp r14, rsi
	je .LBB15_12
.LBB15_4:
	mov r10, qword ptr [rdx + 8*r14]
	test r10, r10
	je .LBB15_5
	mov rdi, qword ptr [rsp + 16]
	mov r12, qword ptr [rdi + 8*r14]
	xor ebp, ebp
	mov r13, r10
	xor r9d, r9d
.LBB15_7:
	blsi r8, r13
	and r8, r12
	shlx rdi, r11, r9
	cmove rdi, r8
	or rbp, rdi
	inc r9d
	blsr r13, r13
	jne .LBB15_7
	jmp .LBB15_8
.LBB15_5:
	xor ebp, ebp
.LBB15_8:
	xor r12d, r12d
	shld r12, rbp, cl
	xor edi, edi
	popcnt rdi, r10
	shlx r8, rbp, rcx
	test cl, 64
	cmovne r12, r8
	mov r9d, 0
	cmovne r8, r9
	or r12, r15
	or rbx, r8
	add ecx, edi
	cmp ecx, 63
	jbe .LBB15_11
	cmp rax, qword ptr [rsp]
	jb .LBB15_10
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.3]
	mov rdi, rax
	mov rsi, qword ptr [rsp]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB15_12:
	test ecx, ecx
	je .LBB15_13
	mov rsi, qword ptr [rsp]
	cmp rax, rsi
	jae .LBB15_17
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rdx + 8*rax], rbx
	mov ecx, ecx
	jmp .LBB15_16
.LBB15_2:
	xor eax, eax
	jmp .LBB15_16
.LBB15_13:
	xor ecx, ecx
.LBB15_16:
	shl rax, 6
	add rax, rcx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB15_19:
	lea r9, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.1]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB15_17:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.2]
	mov rdi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
