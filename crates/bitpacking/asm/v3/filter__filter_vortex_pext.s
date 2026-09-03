bitpacking::filter::filter_vortex_pext:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rcx
	cmp rsi, rcx
	jne .LBB22_18
	cmp r9, rsi
	jbe .LBB22_19
	xor r9d, r9d
	xor eax, eax
	test rsi, rsi
	je .LBB22_17
	xor r15d, r15d
	xor r14d, r14d
	xor ecx, ecx
	xor r10d, r10d
.LBB22_4:
	mov r11, r15
	mov rbx, r14
	jmp .LBB22_5
.LBB22_12:
	xor r15d, r15d
	shld r15, r14, cl
	shlx r14, r14, rcx
	test cl, 64
	cmovne r15, r14
	cmovne r14, r9
	or r15, rbx
	or r14, r11
	mov qword ptr [r8 + 8*rax], r14
	inc rax
	mov r11, r15
	xor ebx, ebx
.LBB22_13:
	inc r10
	cmp r10, rsi
	jae .LBB22_10
.LBB22_5:
	mov r14, qword ptr [rdi + 8*r10]
	mov r15, qword ptr [rdx + 8*r10]
	cmp r15, -1
	je .LBB22_12
	test r15, r15
	je .LBB22_13
	pext r13, r14, r15
	xor r14d, r14d
	shld r14, r13, cl
	xor r12d, r12d
	popcnt r12, r15
	shlx r15, r13, rcx
	test cl, 64
	cmovne r14, r15
	cmovne r15, r9
	or r14, rbx
	or r15, r11
	add r12d, ecx
	cmp r12d, 64
	jb .LBB22_8
	mov qword ptr [r8 + 8*rax], r15
	inc rax
	add r12d, -64
	mov ecx, r12d
	mov r15, r14
	xor r14d, r14d
	inc r10
	cmp r10, rsi
	jb .LBB22_4
	jmp .LBB22_9
.LBB22_8:
	mov ecx, r12d
	inc r10
	cmp r10, rsi
	jb .LBB22_4
.LBB22_9:
	mov r11, r15
.LBB22_10:
	test ecx, ecx
	je .LBB22_11
	mov qword ptr [r8 + 8*rax], r11
	mov r9d, ecx
	jmp .LBB22_17
.LBB22_11:
	xor r9d, r9d
.LBB22_17:
	shl rax, 6
	add rax, r9
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB22_18:
	lea r9, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.5]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB22_19:
	lea rdi, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.6]
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.7]
	mov esi, 95
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
