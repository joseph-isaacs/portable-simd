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
	jne .LBB19_19
	xor ecx, ecx
	test rsi, rsi
	je .LBB19_2
	mov qword ptr [rsp], r9
	mov r11d, 1
	xor ecx, ecx
	xor eax, eax
	xor ebx, ebx
	xor r15d, r15d
	xor r14d, r14d
	jmp .LBB19_4
.LBB19_10:
	mov rdi, qword ptr [rsp + 8]
	mov qword ptr [rdi + 8*rax], rbx
	inc rax
	add ecx, -64
	mov rbx, r12
	xor r12d, r12d
.LBB19_11:
	inc r14
	mov r15, r12
	cmp r14, rsi
	je .LBB19_12
.LBB19_4:
	mov r10, qword ptr [rdx + 8*r14]
	test r10, r10
	je .LBB19_5
	mov rdi, qword ptr [rsp + 16]
	mov rbp, qword ptr [rdi + 8*r14]
	xor r13d, r13d
	mov r12, r10
	xor r9d, r9d
.LBB19_7:
	blsi r8, r12
	and r8, rbp
	shlx rdi, r11, r9
	cmove rdi, r8
	or r13, rdi
	inc r9d
	blsr r12, r12
	jne .LBB19_7
	jmp .LBB19_8
.LBB19_5:
	xor r13d, r13d
.LBB19_8:
	popcnt rdi, r10
	xor r12d, r12d
	shld r12, r13, cl
	shlx r8, r13, rcx
	test cl, 64
	cmovne r12, r8
	mov r9d, 0
	cmovne r8, r9
	or r12, r15
	or rbx, r8
	add ecx, edi
	cmp ecx, 63
	jbe .LBB19_11
	cmp rax, qword ptr [rsp]
	jb .LBB19_10
	lea rdx, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.3]
	mov rdi, rax
	mov rsi, qword ptr [rsp]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB19_12:
	test ecx, ecx
	je .LBB19_13
	mov rsi, qword ptr [rsp]
	cmp rax, rsi
	jae .LBB19_17
	mov rdx, qword ptr [rsp + 8]
	mov qword ptr [rdx + 8*rax], rbx
	mov ecx, ecx
	jmp .LBB19_16
.LBB19_2:
	xor eax, eax
	jmp .LBB19_16
.LBB19_13:
	xor ecx, ecx
.LBB19_16:
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
.LBB19_19:
	lea r9, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.1]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB19_17:
	lea rdx, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.2]
	mov rdi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
