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
	jne .LBB27_15
	xor eax, eax
	test rsi, rsi
	je .LBB27_2
	mov qword ptr [rsp + 8], r9
	mov r13, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	xor r11d, r11d
	mov qword ptr [rsp], 0
	xor r15d, r15d
	xor r12d, r12d
	xor r14d, r14d
	jmp .LBB27_4
.LBB27_7:
	inc r14
	mov r12, r9
	cmp rsi, r14
	je .LBB27_8
.LBB27_4:
	mov rax, qword ptr [rsp + 24]
	mov rax, qword ptr [rax + 8*r14]
	mov rcx, qword ptr [rsp + 32]
	mov rbx, qword ptr [rcx + 8*r14]
	mov r9d, ebx
	and r9d, 65280
	add r9, r13
	movzx ebp, ah
	movzx ebp, byte ptr [rbp + r9]
	movzx ecx, bh
	popcnt r10d, ecx
	mov r9d, eax
	movzx ecx, al
	mov r8d, eax
	shr r8d, 16
	mov edi, ebx
	shl edi, 8
	movzx edi, di
	add rdi, r13
	movzx ecx, byte ptr [rcx + rdi]
	movzx edi, bl
	popcnt edi, edi
	shlx rbp, rbp, rdi
	or rbp, rcx
	mov rcx, rbx
	shr rcx, 16
	add r10b, dil
	mov edi, ecx
	shl edi, 8
	movzx edi, di
	add rdi, r13
	movzx r8d, r8b
	movzx edi, byte ptr [r8 + rdi]
	mov r8, rbx
	movzx ecx, cl
	shr r9d, 24
	shr r8, 24
	shlx rdi, rdi, r10
	popcnt ecx, ecx
	add cl, r10b
	mov r10d, r8d
	shl r10d, 8
	movzx r10d, r10w
	add r10, r13
	movzx r9d, byte ptr [r9 + r10]
	mov rdx, rax
	shlx r10, r9, rcx
	or r10, rdi
	mov rdi, rbx
	movzx r8d, r8b
	shr rdx, 32
	shr rdi, 32
	popcnt r8d, r8d
	add r8b, cl
	mov ecx, edi
	shl ecx, 8
	movzx ecx, cx
	add rcx, r13
	movzx edx, dl
	movzx ecx, byte ptr [rdx + rcx]
	mov rdx, rax
	shlx r9, rcx, r8
	or r9, rbp
	mov rcx, rbx
	movzx edi, dil
	shr rdx, 40
	shr rcx, 40
	popcnt edi, edi
	add dil, r8b
	mov r8d, ecx
	shl r8d, 8
	movzx r8d, r8w
	add r8, r13
	movzx edx, dl
	movzx edx, byte ptr [rdx + r8]
	mov r8, rax
	shlx rbp, rdx, rdi
	or rbp, r10
	mov r10, rbx
	movzx ecx, cl
	shr r8, 48
	shr r10, 48
	popcnt ecx, ecx
	add cl, dil
	mov edx, r10d
	shl edx, 8
	movzx edx, dx
	add rdx, r13
	movzx edi, r8b
	movzx edx, byte ptr [rdi + rdx]
	shlx rdx, rdx, rcx
	or rdx, r9
	movzx edi, r10b
	popcnt edi, edi
	add dil, cl
	shr rax, 56
	and r10d, 65280
	add r10, r13
	movzx eax, byte ptr [rax + r10]
	shlx rax, rax, rdi
	or rax, rbp
	mov ecx, r11d
	popcnt r11, rbx
	mov rdi, r15
	or rax, rdx
	xor r9d, r9d
	shld r9, rax, cl
	shlx r15, rax, rcx
	xor eax, eax
	test cl, 64
	cmovne r9, r15
	cmovne r15, rax
	or r9, r12
	or r15, rdi
	add r11d, ecx
	cmp r11d, 63
	jbe .LBB27_7
	mov rdi, qword ptr [rsp]
	cmp rdi, qword ptr [rsp + 8]
	jae .LBB27_14
	mov rax, qword ptr [rsp + 16]
	mov qword ptr [rax + 8*rdi], r15
	inc rdi
	mov qword ptr [rsp], rdi
	add r11d, -64
	mov r15, r9
	xor r9d, r9d
	jmp .LBB27_7
.LBB27_8:
	test r11d, r11d
	je .LBB27_9
	mov rdi, qword ptr [rsp]
	mov rsi, qword ptr [rsp + 8]
	cmp rdi, rsi
	jae .LBB27_13
	mov rax, qword ptr [rsp + 16]
	mov qword ptr [rax + 8*rdi], r15
	mov eax, r11d
	jmp .LBB27_12
.LBB27_2:
	xor edi, edi
	jmp .LBB27_12
.LBB27_9:
	xor eax, eax
	mov rdi, qword ptr [rsp]
.LBB27_12:
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
.LBB27_15:
	lea r9, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.1]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB27_14:
	lea rdx, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.3]
	mov rsi, qword ptr [rsp + 8]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB27_13:
	lea rdx, [rip + .Lanon.3f31a1251e1a19459a541c87c7cffd2b.2]
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
