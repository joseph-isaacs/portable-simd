bitpacking::expand::expand_bmi2:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp], rdi
	cmp r9, rcx
	jb .LBB31_4
	test rcx, rcx
	je .LBB31_24
	cmp rcx, 1
	jne .LBB31_5
	xor ecx, ecx
	xor eax, eax
	xor r13d, r13d
	xor ebx, ebx
	jmp .LBB31_18
.LBB31_5:
	movabs rsi, 1152921504606846974
	mov qword ptr [rsp + 16], rcx
	and rsi, rcx
	xor r15d, r15d
	xor r12d, r12d
	xor eax, eax
	xor r13d, r13d
	xor ebp, ebp
	xor ebx, ebx
	jmp .LBB31_6
.LBB31_14:
	mov rcx, qword ptr [rsp]
	mov r13, qword ptr [rcx + 8*rbx]
.LBB31_15:
	inc rbx
	xor r9d, r9d
	mov ecx, eax
	shld r9, r13, cl
	shlx rcx, r13, rax
	test al, 64
	cmovne r9, rcx
	cmovne rcx, r15
	or r14, r9
	or r11, rcx
	add eax, 64
.LBB31_16:
	test r10b, 64
	shrx r9, r14, r10
	mov rbp, r9
	cmovne rbp, r15
	mov r13, r11
	mov ecx, r10d
	shrd r13, r14, cl
	lea rcx, [r12 + 2]
	test r10b, 64
	mov r14, -1
	shlx r14, r14, r10
	cmovne r14, r15
	cmovne r13, r9
	andn r9, r14, r11
	sub eax, r10d
	pdep rdi, r9, rdi
	mov qword ptr [r8 + 8*r12 + 8], rdi
	mov r12, rcx
	cmp rsi, rcx
	je .LBB31_17
.LBB31_6:
	mov rdi, qword ptr [rdx + 8*r12]
	popcnt r10, rdi
	cmp eax, r10d
	jae .LBB31_11
	cmp rbx, qword ptr [rsp + 8]
	jae .LBB31_8
	mov rcx, qword ptr [rsp]
	mov r9, qword ptr [rcx + 8*rbx]
	jmp .LBB31_10
.LBB31_8:
	xor r9d, r9d
.LBB31_10:
	inc rbx
	xor r11d, r11d
	mov ecx, eax
	shld r11, r9, cl
	shlx rcx, r9, rax
	test al, 64
	cmovne r11, rcx
	cmovne rcx, r15
	or rbp, r11
	or r13, rcx
	add eax, 64
.LBB31_11:
	test r10b, 64
	shrx r9, rbp, r10
	mov r14, r9
	cmovne r14, r15
	mov r11, r13
	mov ecx, r10d
	shrd r11, rbp, cl
	test r10b, 64
	mov rcx, -1
	shlx rcx, rcx, r10
	cmovne rcx, r15
	cmovne r11, r9
	andn rcx, rcx, r13
	sub eax, r10d
	pdep rcx, rcx, rdi
	mov qword ptr [r8 + 8*r12], rcx
	mov rdi, qword ptr [rdx + 8*r12 + 8]
	popcnt r10, rdi
	cmp eax, r10d
	jae .LBB31_16
	cmp rbx, qword ptr [rsp + 8]
	jb .LBB31_14
	xor r13d, r13d
	jmp .LBB31_15
.LBB31_17:
	test byte ptr [rsp + 16], 1
	je .LBB31_24
.LBB31_18:
	mov rdx, qword ptr [rdx + 8*rcx]
	popcnt rdi, rdx
	cmp eax, edi
	jae .LBB31_23
	cmp rbx, qword ptr [rsp + 8]
	jae .LBB31_20
	mov rsi, qword ptr [rsp]
	mov rsi, qword ptr [rsi + 8*rbx]
	jmp .LBB31_22
.LBB31_20:
	xor esi, esi
.LBB31_22:
	xor r9d, r9d
	shlx rsi, rsi, rax
	test al, 64
	cmovne rsi, r9
	or r13, rsi
.LBB31_23:
	mov rax, -1
	shlx rax, rax, rdi
	xor esi, esi
	test dil, 64
	cmove rsi, rax
	andn rax, rsi, r13
	pdep rax, rax, rdx
	mov qword ptr [r8 + 8*rcx], rax
.LBB31_24:
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB31_4:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.0]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.2]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
