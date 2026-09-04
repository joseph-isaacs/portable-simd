bitpacking::expand::expand_bmi2:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 24
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 8], rdi
	cmp r9, rcx
	jb .LBB24_10
	mov rax, rcx
	test rcx, rcx
	je .LBB24_9
	xor r11d, r11d
	xor r15d, r15d
	xor r9d, r9d
	xor esi, esi
	xor r13d, r13d
	xor r14d, r14d
	jmp .LBB24_3
.LBB24_6:
	mov rcx, qword ptr [rsp + 8]
	mov rbx, qword ptr [rcx + 8*r14]
.LBB24_7:
	xor edi, edi
	mov ecx, r9d
	shld rdi, rbx, cl
	inc r14
	shlx rcx, rbx, r9
	test r9b, 64
	cmovne rdi, rcx
	cmovne rcx, r11
	or r13, rdi
	or rsi, rcx
	add r9d, 64
.LBB24_8:
	test r10b, 64
	shrx rdi, r13, r10
	mov rbx, rdi
	cmovne rbx, r11
	mov r12, rsi
	mov ecx, r10d
	shrd r12, r13, cl
	test r10b, 64
	mov rcx, -1
	shlx rcx, rcx, r10
	cmovne rcx, r11
	cmovne r12, rdi
	andn rcx, rcx, rsi
	pdep rcx, rcx, rbp
	mov qword ptr [r8 + 8*r15], rcx
	inc r15
	sub r9d, r10d
	mov rsi, r12
	mov r13, rbx
	cmp rax, r15
	je .LBB24_9
.LBB24_3:
	mov rbp, qword ptr [rdx + 8*r15]
	xor r10d, r10d
	popcnt r10, rbp
	cmp r9d, r10d
	jae .LBB24_8
	cmp r14, qword ptr [rsp + 16]
	jb .LBB24_6
	xor ebx, ebx
	jmp .LBB24_7
.LBB24_9:
	add rsp, 24
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB24_10:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.0]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.2]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
