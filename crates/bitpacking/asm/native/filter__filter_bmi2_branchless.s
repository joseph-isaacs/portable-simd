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
	jne .LBB22_14
	xor r10d, r10d
	test rsi, rsi
	je .LBB22_2
	xor ecx, ecx
	xor eax, eax
	xor r11d, r11d
	xor r14d, r14d
	xor ebx, ebx
.LBB22_4:
	cmp rax, r9
	jae .LBB22_13
	mov r15, qword ptr [rdi + 8*rbx]
	mov r12, qword ptr [rdx + 8*rbx]
	pext r13, r15, r12
	inc rbx
	xor r15d, r15d
	popcnt r15, r12
	add r15d, ecx
	xor r12d, r12d
	shld r12, r13, cl
	shlx r13, r13, rcx
	test cl, 64
	cmovne r12, r13
	cmovne r13, r10
	or r12, r14
	or r11, r13
	mov qword ptr [r8 + 8*rax], r11
	mov ecx, r15d
	shr ecx, 6
	add rax, rcx
	test r15b, 64
	mov r14, r12
	cmovne r14, r10
	cmovne r11, r12
	mov ecx, r15d
	and ecx, 63
	cmp rsi, rbx
	jne .LBB22_4
	test ecx, ecx
	je .LBB22_7
	cmp rax, r9
	jae .LBB22_11
	mov qword ptr [r8 + 8*rax], r11
	mov r10d, ecx
	jmp .LBB22_10
.LBB22_2:
	xor eax, eax
	jmp .LBB22_10
.LBB22_7:
	xor r10d, r10d
.LBB22_10:
	shl rax, 6
	or rax, r10
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB22_14:
	lea r9, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.1]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB22_13:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.4]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB22_11:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.2]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
