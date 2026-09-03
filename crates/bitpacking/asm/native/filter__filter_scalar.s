bitpacking::filter::filter_scalar:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 8], r8
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB19_15
	xor edx, edx
	test rsi, rsi
	je .LBB19_2
	mov qword ptr [rsp], r9
	xor r15d, r15d
	xor eax, eax
	xor r12d, r12d
	xor ebx, ebx
	xor r11d, r11d
	jmp .LBB19_4
.LBB19_7:
	inc r11
	mov rbx, r13
	cmp rsi, r11
	je .LBB19_8
.LBB19_4:
	mov r14, r12
	mov ecx, r15d
	mov r8, qword ptr [rsp + 16]
	mov r15, qword ptr [r8 + 8*r11]
	mov r13, qword ptr [rdi + 8*r11]
	and r13, r15
	mov r10, r15
	not r10
	lea r9, [r10 + r10]
	lea r12, [4*r10]
	xor r12, r10
	xor r12, r9
	shl r12, 2
	xor r12, r9
	mov r10, r12
	shl r10, 4
	xor r10, r12
	mov r12, r10
	shl r12, 8
	xor r12, r10
	mov r10, r12
	shl r10, 16
	xor r10, r12
	mov r12, r10
	shl r12, 32
	xor r12, r10
	mov rbp, r12
	and rbp, r15
	mov r10, rbp
	xor r10, r15
	shr rbp
	or rbp, r10
	andn r9, r12, r9
	and r12, r13
	xor r13, r12
	shr r12
	or r12, r13
	lea r10, [r9 + r9]
	xor r10, r9
	lea r13, [4*r10]
	xor r13, r10
	mov r10, r13
	shl r10, 4
	xor r10, r13
	mov r13, r10
	shl r13, 8
	xor r13, r10
	mov r10, r13
	shl r10, 16
	xor r10, r13
	mov r13, r10
	shl r13, 32
	xor r13, r10
	andn r9, r13, r9
	and r13, rbp
	xor rbp, r13
	mov r10, r13
	shr r10, 2
	or r10, rbp
	and r13, r12
	xor r12, r13
	shr r13, 2
	or r13, r12
	lea r12, [r9 + r9]
	xor r12, r9
	lea rbp, [4*r12]
	xor rbp, r12
	mov r12, rbp
	shl r12, 4
	xor r12, rbp
	mov rbp, r12
	shl rbp, 8
	xor rbp, r12
	mov r8, rbp
	shl r8, 16
	xor r8, rbp
	mov r12, r8
	shl r12, 32
	xor r12, r8
	andn r9, r12, r9
	and r12, r10
	xor r10, r12
	mov rbp, r12
	shr rbp, 4
	or rbp, r10
	and r12, r13
	xor r13, r12
	shr r12, 4
	or r12, r13
	lea r8, [r9 + r9]
	xor r8, r9
	lea r10, [4*r8]
	xor r10, r8
	mov r8, r10
	shl r8, 4
	xor r8, r10
	mov r10, r8
	shl r10, 8
	xor r10, r8
	mov r8, r10
	shl r8, 16
	xor r8, r10
	mov r13, r8
	shl r13, 32
	xor r13, r8
	andn r9, r13, r9
	and r13, rbp
	xor rbp, r13
	mov r10, r13
	shr r10, 8
	or r10, rbp
	and r13, r12
	xor r12, r13
	shr r13, 8
	or r13, r12
	lea r8, [r9 + r9]
	xor r8, r9
	lea r12, [4*r8]
	xor r12, r8
	mov r8, r12
	shl r8, 4
	xor r8, r12
	mov r12, r8
	shl r12, 8
	xor r12, r8
	mov r8, r12
	shl r8, 16
	xor r8, r12
	mov rbp, r8
	shl rbp, 32
	xor rbp, r8
	andn r8, rbp, r9
	and rbp, r10
	xor r10, rbp
	mov r12, rbp
	shr r12, 16
	or r12, r10
	and rbp, r13
	xor r13, rbp
	shr rbp, 16
	or rbp, r13
	lea r9, [r8 + r8]
	xor r9, r8
	lea r8, [4*r9]
	xor r8, r9
	mov r9, r8
	shl r9, 4
	xor r9, r8
	mov r8, r9
	shl r8, 8
	xor r8, r9
	mov r9, r8
	shl r9, 16
	xor r9, r8
	mov r8, r9
	shl r8, 32
	xor r8, r9
	and r12, rbp
	and r12, r8
	xor rbp, r12
	shr r12, 32
	or r12, rbp
	popcnt r15, r15
	xor r13d, r13d
	shld r13, r12, cl
	shlx r12, r12, rcx
	test cl, 64
	cmovne r13, r12
	cmovne r12, rdx
	or r13, rbx
	or r12, r14
	add r15d, ecx
	cmp r15d, 63
	jbe .LBB19_7
	cmp rax, qword ptr [rsp]
	jae .LBB19_14
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rcx + 8*rax], r12
	inc rax
	add r15d, -64
	mov r12, r13
	xor r13d, r13d
	jmp .LBB19_7
.LBB19_8:
	test r15d, r15d
	je .LBB19_9
	mov rsi, qword ptr [rsp]
	cmp rax, rsi
	jae .LBB19_13
	mov rcx, qword ptr [rsp + 8]
	mov qword ptr [rcx + 8*rax], r12
	mov edx, r15d
	jmp .LBB19_12
.LBB19_2:
	xor eax, eax
	jmp .LBB19_12
.LBB19_9:
	xor edx, edx
.LBB19_12:
	shl rax, 6
	add rax, rdx
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB19_15:
	lea r9, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.1]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB19_14:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.3]
	mov rdi, rax
	mov rsi, qword ptr [rsp]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB19_13:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.2]
	mov rdi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
