bitpacking::expand::expand_naive:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov qword ptr [rsp + 16], r8
	mov qword ptr [rsp + 8], rsi
	mov qword ptr [rsp], rdi
	cmp r9, rcx
	jb .LBB30_14
	mov r8, rcx
	test rcx, rcx
	je .LBB30_13
	xor r11d, r11d
	xor r14d, r14d
	xor r9d, r9d
	xor ebx, ebx
	xor eax, eax
	xor r15d, r15d
	jmp .LBB30_3
.LBB30_12:
	sub r9d, r10d
	mov rsi, qword ptr [rsp + 16]
	mov qword ptr [rsi + 8*r14], rcx
	inc r14
	cmp r14, r8
	je .LBB30_13
.LBB30_3:
	mov rbp, qword ptr [rdx + 8*r14]
	popcnt r10, rbp
	cmp r9d, r10d
	jae .LBB30_4
	cmp r15, qword ptr [rsp + 8]
	jae .LBB30_6
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rcx + 8*r15]
	jmp .LBB30_8
.LBB30_4:
	mov r12, rbx
	jmp .LBB30_9
.LBB30_6:
	xor edi, edi
.LBB30_8:
	inc r15
	xor esi, esi
	mov ecx, r9d
	shld rsi, rdi, cl
	shlx r12, rdi, r9
	test r9b, 64
	cmovne rsi, r12
	cmovne r12, r11
	or rax, rsi
	or r12, rbx
	add r9d, 64
	mov rbx, r12
.LBB30_9:
	mov rsi, rax
	test r10b, 64
	shrx r13, rax, r10
	mov rax, r13
	cmovne rax, r11
	mov ecx, r10d
	shrd rbx, rsi, cl
	test r10b, 64
	mov rcx, -1
	shlx rdi, rcx, r10
	cmovne rdi, r11
	cmovne rbx, r13
	mov ecx, 0
	test rbp, rbp
	je .LBB30_12
	andn r12, rdi, r12
	xor ecx, ecx
	xor edi, edi
.LBB30_11:
	blsi rsi, rbp
	bt r12, rdi
	mov r13d, 0
	cmovb r13, rsi
	or rcx, r13
	inc edi
	blsr rbp, rbp
	jne .LBB30_11
	jmp .LBB30_12
.LBB30_13:
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB30_14:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.0]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.2]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
