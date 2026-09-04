bitpacking::filter::filter_bmi2_branchless:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rcx
	cmp rsi, rcx
	jne .LBB36_14
	xor r10d, r10d
	test rsi, rsi
	je .LBB36_2
	xor ecx, ecx
	xor eax, eax
	xor r11d, r11d
	xor r14d, r14d
	xor ebx, ebx
.LBB36_4:
	cmp rax, r9
	jae .LBB36_13
	mov r15, qword ptr [rdi + 8*rbx]
	mov r12, qword ptr [rdx + 8*rbx]
	pext r15, r15, r12
	inc rbx
	xor r13d, r13d
	shld r13, r15, cl
	popcnt r12, r12
	add r12d, ecx
	shlx r15, r15, rcx
	test cl, 64
	cmovne r13, r15
	cmovne r15, r10
	or r13, r14
	or r11, r15
	mov qword ptr [r8 + 8*rax], r11
	mov ecx, r12d
	shr ecx, 6
	add rax, rcx
	test r12b, 64
	mov r14, r13
	cmovne r14, r10
	cmovne r11, r13
	mov ecx, r12d
	and ecx, 63
	cmp rsi, rbx
	jne .LBB36_4
	test ecx, ecx
	je .LBB36_7
	cmp rax, r9
	jae .LBB36_11
	mov qword ptr [r8 + 8*rax], r11
	mov r10d, ecx
	jmp .LBB36_10
.LBB36_2:
	xor eax, eax
	jmp .LBB36_10
.LBB36_7:
	xor r10d, r10d
.LBB36_10:
	shl rax, 6
	or rax, r10
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB36_14:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.4]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB36_13:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.7]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB36_11:
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.5]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
