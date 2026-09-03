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
	jne .LBB21_15
	mov rbx, rsi
	xor eax, eax
	test rsi, rsi
	je .LBB21_2
	mov qword ptr [rsp + 8], r9
	xor edx, edx
	mov qword ptr [rsp], 0
	xor eax, eax
	xor ebp, ebp
	xor r12d, r12d
	jmp .LBB21_4
.LBB21_7:
	inc r12
	mov rbp, rsi
	cmp rbx, r12
	je .LBB21_8
.LBB21_4:
	mov r13, rax
	mov r14d, edx
	mov rax, qword ptr [rsp + 24]
	mov rdi, qword ptr [rax + 8*r12]
	mov rax, qword ptr [rsp + 32]
	mov r15, qword ptr [rax + 8*r12]
	mov rsi, r15
	call <bitpacking::filter::pext_byte_lut as core::ops::function::Fn<(u64, u64)>>::call
	popcnt rdx, r15
	xor esi, esi
	mov ecx, r14d
	shld rsi, rax, cl
	xor ecx, ecx
	shlx rax, rax, r14
	test r14b, 64
	cmovne rsi, rax
	cmovne rax, rcx
	or rsi, rbp
	or rax, r13
	add edx, r14d
	cmp edx, 63
	jbe .LBB21_7
	mov rdi, qword ptr [rsp]
	cmp rdi, qword ptr [rsp + 8]
	jae .LBB21_14
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rcx + 8*rdi], rax
	inc rdi
	mov qword ptr [rsp], rdi
	add edx, -64
	mov rax, rsi
	xor esi, esi
	jmp .LBB21_7
.LBB21_8:
	test edx, edx
	je .LBB21_9
	mov rsi, qword ptr [rsp + 8]
	mov rdi, qword ptr [rsp]
	cmp rdi, rsi
	jae .LBB21_13
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rcx + 8*rdi], rax
	mov eax, edx
	jmp .LBB21_12
.LBB21_2:
	xor edi, edi
	jmp .LBB21_12
.LBB21_9:
	xor eax, eax
	mov rdi, qword ptr [rsp]
.LBB21_12:
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
.LBB21_15:
	lea r9, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.1]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB21_14:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.3]
	mov rsi, qword ptr [rsp + 8]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB21_13:
	lea rdx, [rip + .Lanon.cb6c5d1d9c81477bac8acc2b0e6bb2ed.2]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
