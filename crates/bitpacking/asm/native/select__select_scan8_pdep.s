bitpacking::select::select_scan8_pdep:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	mov qword ptr [rsp - 104], rdx
	mov qword ptr [rsp - 80], rsi
	mov rax, rsi
	shr rax, 3
	mov qword ptr [rsp - 88], rax
	mov qword ptr [rsp - 96], rdi
	je .LBB53_5
	shl rax, 6
	add rax, rdi
	mov qword ptr [rsp - 72], rax
	xor eax, eax
	mov r8, rdi
	mov r9, qword ptr [rsp - 104]
.LBB53_2:
	mov qword ptr [rsp - 64], rax
	mov rax, qword ptr [r8]
	mov rcx, qword ptr [r8 + 8]
	mov qword ptr [rsp - 24], rax
	popcnt rax, rax
	mov qword ptr [rsp - 16], rcx
	popcnt rcx, rcx
	mov qword ptr [rsp - 8], rax
	mov qword ptr [rsp - 32], rcx
	lea rdx, [rcx + rax]
	mov rbp, qword ptr [r8 + 16]
	popcnt r14, rbp
	mov rdi, qword ptr [r8 + 24]
	popcnt rax, rdi
	add rdx, rax
	add rdx, r14
	mov r10, qword ptr [r8 + 32]
	popcnt rbx, r10
	mov rsi, qword ptr [r8 + 40]
	popcnt r11, rsi
	lea rcx, [r11 + rbx]
	mov r15, qword ptr [r8 + 48]
	popcnt r13, r15
	add rcx, r13
	add rcx, rdx
	mov r12, qword ptr [r8 + 56]
	popcnt rdx, r12
	add rcx, rdx
	sub r9, rcx
	jb .LBB53_10
	add r8, 64
	mov rax, qword ptr [rsp - 64]
	add rax, 512
	mov qword ptr [rsp - 104], r9
	cmp r8, qword ptr [rsp - 72]
	jne .LBB53_2
	mov rdx, qword ptr [rsp - 80]
	lea ecx, [8*rdx]
	and ecx, 56
	jne .LBB53_6
	jmp .LBB53_21
.LBB53_5:
	mov r9, qword ptr [rsp - 104]
	mov rdx, qword ptr [rsp - 80]
	lea ecx, [8*rdx]
	and ecx, 56
	je .LBB53_21
.LBB53_6:
	movabs rax, 1152921504606846968
	and rdx, rax
	mov rax, qword ptr [rsp - 96]
	lea rdx, [rax + 8*rdx]
	mov r11, qword ptr [rsp - 88]
	shl r11, 9
	neg r11
	xor eax, eax
	xor esi, esi
	mov rdi, r9
.LBB53_7:
	mov r8, qword ptr [rdx + rsi]
	popcnt r10, r8
	sub rdi, r10
	jb .LBB53_12
	add r11, -64
	add rsi, 8
	mov r9, rdi
	cmp rcx, rsi
	jne .LBB53_7
	jmp .LBB53_22
.LBB53_10:
	mov rcx, qword ptr [rsp - 24]
	mov qword ptr [rsp - 72], r14
	mov qword ptr [rsp - 80], rbp
	mov qword ptr [rsp - 88], rax
	mov qword ptr [rsp - 96], rdi
	mov qword ptr [rsp - 40], rbx
	mov qword ptr [rsp - 48], r11
	mov qword ptr [rsp - 56], r13
	mov rbp, qword ptr [rsp - 16]
	mov r8, qword ptr [rsp - 104]
	sub r8, qword ptr [rsp - 8]
	jae .LBB53_13
	xor r9d, r9d
	mov r8, qword ptr [rsp - 104]
	mov r14, rcx
	jmp .LBB53_20
.LBB53_12:
	mov eax, 1
	shlx rcx, rax, r9
	pdep rcx, rcx, r8
	tzcnt r9, rcx
	sub r9, r11
	jmp .LBB53_23
.LBB53_13:
	mov r9d, 64
	mov rdi, r8
	sub rdi, qword ptr [rsp - 32]
	mov r14, rbp
	jb .LBB53_20
	mov r9d, 128
	mov rax, rdi
	mov r8, rdi
	mov r14, qword ptr [rsp - 80]
	sub rax, qword ptr [rsp - 72]
	jb .LBB53_20
	mov r9d, 192
	mov rdi, rax
	mov r8, rax
	mov r14, qword ptr [rsp - 96]
	sub rdi, qword ptr [rsp - 88]
	jb .LBB53_20
	mov r9d, 256
	mov rax, rdi
	mov r8, rdi
	mov r14, r10
	sub rax, qword ptr [rsp - 40]
	jb .LBB53_20
	mov r11, rsi
	mov r9d, 320
	mov rsi, rax
	mov r8, rax
	mov r14, r11
	sub rsi, qword ptr [rsp - 48]
	jb .LBB53_20
	mov r9d, 384
	mov rax, rsi
	mov r8, rsi
	mov r14, r15
	sub rax, qword ptr [rsp - 56]
	jb .LBB53_20
	mov r9d, 448
	mov r8, rax
	mov r14, r12
	cmp rax, rdx
	jae .LBB53_21
.LBB53_20:
	mov eax, 1
	shlx rcx, rax, r8
	pdep rcx, rcx, r14
	tzcnt rcx, rcx
	add r9, qword ptr [rsp - 64]
	add r9, rcx
	jmp .LBB53_23
.LBB53_21:
	xor eax, eax
.LBB53_22:
.LBB53_23:
	mov rdx, r9
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
