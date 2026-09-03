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
	jne .LBB19_14
	xor r10d, r10d
	test rsi, rsi
	je .LBB19_2
	xor ecx, ecx
	xor eax, eax
	xor r11d, r11d
	xor r14d, r14d
	xor ebx, ebx
.LBB19_4:
	cmp rax, r9
	jae .LBB19_13
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
	jne .LBB19_4
	test ecx, ecx
	je .LBB19_7
	cmp rax, r9
	jae .LBB19_11
	mov qword ptr [r8 + 8*rax], r11
	mov r10d, ecx
	jmp .LBB19_10
.LBB19_2:
	xor eax, eax
	jmp .LBB19_10
.LBB19_7:
	xor r10d, r10d
.LBB19_10:
	shl rax, 6
	or rax, r10
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB19_14:
	lea r9, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.1]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB19_13:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.4]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB19_11:
	lea rdx, [rip + .Lanon.7aebbe0b8f2c1738ea529ab66bab80d6.2]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
