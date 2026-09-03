bitpacking::filter::filter_byte_lut_branchless:
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
	jne .LBB24_15
	xor ecx, ecx
	test rsi, rsi
	je .LBB24_2
	mov qword ptr [rsp + 8], r9
	mov rax, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	xor r13d, r13d
	mov qword ptr [rsp], 0
	xor r14d, r14d
	xor r12d, r12d
	xor r15d, r15d
	jmp .LBB24_4
.LBB24_7:
	inc r15
	mov r12, r10
	cmp rsi, r15
	je .LBB24_8
.LBB24_4:
	mov rcx, qword ptr [rsp + 24]
	mov rdx, qword ptr [rcx + 8*r15]
	mov rcx, qword ptr [rsp + 32]
	mov rbx, qword ptr [rcx + 8*r15]
	mov ecx, ebx
	and ecx, 65280
	add rcx, rax
	movzx ebp, dh
	movzx ecx, byte ptr [rbp + rcx]
	movzx ebp, bh
	xor r8d, r8d
	popcnt r8d, ebp
	mov ebp, edx
	movzx r9d, dl
	mov r10d, edx
	shr r10d, 16
	mov edi, ebx
	shl edi, 8
	movzx edi, di
	add rdi, rax
	movzx edi, byte ptr [r9 + rdi]
	movzx r9d, bl
	popcnt r9d, r9d
	shlx r11, rcx, r9
	or r11, rdi
	mov rdi, rbx
	shr rdi, 16
	add r8b, r9b
	mov ecx, edi
	shl ecx, 8
	movzx ecx, cx
	add rcx, rax
	movzx r9d, r10b
	movzx r9d, byte ptr [r9 + rcx]
	mov rcx, rdx
	shlx r10, r9, r8
	or r10, r11
	mov r9, rbx
	movzx edi, dil
	shr ebp, 24
	shr r9, 24
	popcnt edi, edi
	add dil, r8b
	mov r8d, r9d
	shl r8d, 8
	movzx r8d, r8w
	add r8, rax
	movzx r11d, byte ptr [rbp + r8]
	mov r8, rbx
	movzx r9d, r9b
	shr rcx, 32
	shr r8, 32
	shlx r11, r11, rdi
	popcnt r9d, r9d
	add r9b, dil
	mov edi, r8d
	shl edi, 8
	movzx edi, di
	add rdi, rax
	movzx ecx, cl
	movzx ecx, byte ptr [rcx + rdi]
	mov rdi, rdx
	shlx rbp, rcx, r9
	or rbp, r11
	mov rcx, rdx
	or rbp, r10
	mov r10, rbx
	movzx r8d, r8b
	shr rdi, 40
	shr r10, 40
	xor r11d, r11d
	popcnt r11d, r8d
	add r11b, r9b
	mov r8d, r10d
	shl r8d, 8
	movzx r8d, r8w
	add r8, rax
	movzx edi, dil
	movzx edi, byte ptr [rdi + r8]
	mov r8, rbx
	movzx r9d, r10b
	shr rcx, 48
	shr r8, 48
	shlx rdi, rdi, r11
	popcnt r9d, r9d
	add r9b, r11b
	mov r10d, r8d
	shl r10d, 8
	movzx r10d, r10w
	add r10, rax
	movzx ecx, cl
	movzx ecx, byte ptr [rcx + r10]
	shlx rcx, rcx, r9
	or rcx, rdi
	movzx edi, r8b
	popcnt edi, edi
	add dil, r9b
	shr rdx, 56
	and r8d, 65280
	add r8, rax
	movzx edx, byte ptr [rdx + r8]
	shlx rdx, rdx, rdi
	or rdx, rcx
	mov ecx, r13d
	or rdx, rbp
	xor r10d, r10d
	shld r10, rdx, cl
	popcnt r13, rbx
	mov rdi, r14
	shlx r14, rdx, rcx
	xor edx, edx
	test cl, 64
	cmovne r10, r14
	cmovne r14, rdx
	or r10, r12
	or r14, rdi
	add r13d, ecx
	cmp r13d, 63
	jbe .LBB24_7
	mov rdi, qword ptr [rsp]
	cmp rdi, qword ptr [rsp + 8]
	jae .LBB24_14
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rcx + 8*rdi], r14
	inc rdi
	mov qword ptr [rsp], rdi
	add r13d, -64
	mov r14, r10
	xor r10d, r10d
	jmp .LBB24_7
.LBB24_8:
	test r13d, r13d
	je .LBB24_9
	mov rsi, qword ptr [rsp + 8]
	mov rax, qword ptr [rsp]
	cmp rax, rsi
	jae .LBB24_13
	mov rcx, qword ptr [rsp + 16]
	mov qword ptr [rcx + 8*rax], r14
	mov ecx, r13d
	jmp .LBB24_12
.LBB24_2:
	xor eax, eax
	jmp .LBB24_12
.LBB24_9:
	xor ecx, ecx
	mov rax, qword ptr [rsp]
.LBB24_12:
	shl rax, 6
	add rax, rcx
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB24_15:
	lea r9, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.1]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB24_14:
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.3]
	mov rsi, qword ptr [rsp + 8]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB24_13:
	lea rdx, [rip + .Lanon.304d81c3d1ee12b02a4bfe6c59582894.2]
	mov rdi, rax
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
