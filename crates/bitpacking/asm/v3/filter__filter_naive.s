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
	jne .LBB29_19
	xor ecx, ecx
	test rsi, rsi
	je .LBB29_2
	mov qword ptr [rsp], r9
	mov r11d, 1
	xor ecx, ecx
	xor eax, eax
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
	jmp .LBB29_4
.LBB29_10:
	mov rdi, qword ptr [rsp + 8]
	mov qword ptr [rdi + 8*rax], rbx
	inc rax
	add ecx, -64
	mov rbx, r12
	xor r12d, r12d
.LBB29_11:
	inc r14
	mov r15, r12
	cmp r14, rsi
	je .LBB29_12
.LBB29_4:
	mov r10, qword ptr [rdx + 8*r14]
	test r10, r10
	je .LBB29_5
	mov rdi, qword ptr [rsp + 16]
	mov r12, qword ptr [rdi + 8*r14]
	xor ebp, ebp
	mov r13, r10
	xor r9d, r9d
.LBB29_7:
	blsi r8, r13
	and r8, r12
	shlx rdi, r11, r9
	cmove rdi, r8
	or rbp, rdi
	inc r9d
	blsr r13, r13
	jne .LBB29_7
	jmp .LBB29_8
.LBB29_5:
	xor ebp, ebp
.LBB29_8:
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
	jbe .LBB29_11
	cmp rax, qword ptr [rsp]
	jb .LBB29_10
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.6]
	mov rdi, rax
	mov rsi, qword ptr [rsp]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB29_12:
	test ecx, ecx
	je .LBB29_13
	mov rsi, qword ptr [rsp]
	cmp rax, rsi
	jae .LBB29_17
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rdx + 8*rax], rbx
	mov ecx, ecx
	jmp .LBB29_16
.LBB29_2:
	xor eax, eax
	jmp .LBB29_16
.LBB29_13:
	xor ecx, ecx
.LBB29_16:
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
.LBB29_19:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.4]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB29_17:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.5]
	mov rdi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
