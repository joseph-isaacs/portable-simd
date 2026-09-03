bitpacking::filter::filter_vortex_lut:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 56
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rcx
	cmp rsi, rcx
	jne .LBB21_18
	cmp r9, rsi
	jbe .LBB21_19
	xor r14d, r14d
	xor eax, eax
	test rsi, rsi
	je .LBB21_17
	xor ecx, ecx
	xor r9d, r9d
	xor ebx, ebx
	xor r15d, r15d
.LBB21_4:
	mov r12, rcx
	mov r13, r9
	jmp .LBB21_5
.LBB21_12:
	xor r10d, r10d
	mov ecx, ebx
	shld r10, r9, cl
	shlx rcx, r9, rbx
	test bl, 64
	cmovne r10, rcx
	cmovne rcx, r14
	or r10, r13
	or rcx, r12
	mov qword ptr [r8 + 8*rax], rcx
	inc rax
	mov r12, r10
	xor r13d, r13d
.LBB21_13:
	inc r15
	cmp r15, rsi
	jae .LBB21_10
.LBB21_5:
	mov r9, qword ptr [rdi + 8*r15]
	mov rcx, qword ptr [rdx + 8*r15]
	cmp rcx, -1
	je .LBB21_12
	test rcx, rcx
	je .LBB21_13
	mov qword ptr [rsp + 32], rdi
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 24], rdx
	mov qword ptr [rsp + 8], r8
	mov qword ptr [rsp], rax
	xor ebp, ebp
	popcnt rbp, rcx
	mov rdi, r9
	mov rsi, rcx
	call <bitpacking::filter::pext_byte_lut as core::ops::function::Fn<(u64, u64)>>::call
	xor r9d, r9d
	mov ecx, ebx
	shld r9, rax, cl
	shlx rcx, rax, rbx
	test bl, 64
	cmovne r9, rcx
	cmovne rcx, r14
	or r9, r13
	or rcx, r12
	add ebp, ebx
	cmp ebp, 64
	jb .LBB21_8
	mov rax, qword ptr [rsp]
	mov r8, qword ptr [rsp + 8]
	mov qword ptr [r8 + 8*rax], rcx
	inc rax
	add ebp, -64
	mov ebx, ebp
	mov rcx, r9
	xor r9d, r9d
	jmp .LBB21_15
.LBB21_8:
	mov ebx, ebp
	mov rax, qword ptr [rsp]
	mov r8, qword ptr [rsp + 8]
.LBB21_15:
	mov rsi, qword ptr [rsp + 16]
	inc r15
	cmp r15, rsi
	mov rdx, qword ptr [rsp + 24]
	mov rdi, qword ptr [rsp + 32]
	jb .LBB21_4
	mov r12, rcx
.LBB21_10:
	test ebx, ebx
	je .LBB21_11
	mov qword ptr [r8 + 8*rax], r12
	mov r14d, ebx
	jmp .LBB21_17
.LBB21_11:
	xor r14d, r14d
.LBB21_17:
	shl rax, 6
	add rax, r14
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB21_18:
	lea r9, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.5]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB21_19:
	lea rdi, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.6]
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.7]
	mov esi, 95
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
