bitpacking::filter::filter_byte_lut:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 56
	mov qword ptr [rsp + 16], r8
	mov qword ptr [rsp + 32], rdx
	mov qword ptr [rsp + 24], rdi
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rcx
	cmp rsi, rcx
	jne .LBB31_15
	mov rbx, rsi
	xor eax, eax
	test rsi, rsi
	je .LBB31_2
	mov qword ptr [rsp + 8], r9
	xor ecx, ecx
	mov qword ptr [rsp], 0
	xor eax, eax
	xor ebp, ebp
	xor r12d, r12d
	jmp .LBB31_4
.LBB31_7:
	inc r12
	mov rbp, rdx
	cmp rbx, r12
	je .LBB31_8
.LBB31_4:
	mov r13, rax
	mov r14d, ecx
	mov rax, qword ptr [rsp + 24]
	mov rdi, qword ptr [rax + 8*r12]
	mov rax, qword ptr [rsp + 32]
	mov r15, qword ptr [rax + 8*r12]
	mov rsi, r15
	call <bitpacking::filter::pext_byte_lut as core::ops::function::Fn<(u64, u64)>>::call
	xor esi, esi
	xor edx, edx
	mov ecx, r14d
	shld rdx, rax, cl
	xor ecx, ecx
	popcnt rcx, r15
	shlx rax, rax, r14
	test r14b, 64
	cmovne rdx, rax
	cmovne rax, rsi
	or rdx, rbp
	or rax, r13
	add ecx, r14d
	cmp ecx, 63
	jbe .LBB31_7
	mov rdi, qword ptr [rsp]
	cmp rdi, qword ptr [rsp + 8]
	jae .LBB31_14
	mov rsi, qword ptr [rsp + 16]
	mov qword ptr [rsi + 8*rdi], rax
	inc rdi
	mov qword ptr [rsp], rdi
	add ecx, -64
	mov rax, rdx
	xor edx, edx
	jmp .LBB31_7
.LBB31_8:
	test ecx, ecx
	je .LBB31_9
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp]
	cmp rdi, rsi
	jae .LBB31_13
	mov rdx, qword ptr [rsp + 16]
	mov qword ptr [rdx + 8*rdi], rax
	mov eax, ecx
	jmp .LBB31_12
.LBB31_2:
	xor edi, edi
	jmp .LBB31_12
.LBB31_9:
	xor eax, eax
	mov rdi, qword ptr [rsp]
.LBB31_12:
	shl rdi, 6
	add rdi, rax
	mov rax, rdi
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB31_15:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.4]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB31_14:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.6]
	mov rsi, qword ptr [rsp + 8]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB31_13:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.5]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
