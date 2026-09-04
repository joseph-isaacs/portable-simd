bitpacking::indices::bitmap_to_indices_scalar:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	push rax
	xor r8d, r8d
	test rsi, rsi
	je .LBB59_1
	lea rsi, [rdi + 8*rsi]
	lea r9, [rdx + 28]
	xor eax, eax
	jmp .LBB59_3
.LBB59_6:
	xor r10d, r10d
.LBB59_15:
	add rdi, 8
	inc r8d
	add rax, r10
	cmp rdi, rsi
	je .LBB59_16
.LBB59_3:
	mov r10, rcx
	sub r10, rax
	jb .LBB59_17
	cmp r10, 64
	jb .LBB59_9
	mov r14, qword ptr [rdi]
	test r14, r14
	je .LBB59_6
	mov r11d, r8d
	shl r11d, 6
	popcnt r10, r14
	mov ebx, r10d
	and ebx, 7
	cmp r10, 8
	jae .LBB59_10
	xor r15d, r15d
	jmp .LBB59_13
.LBB59_10:
	mov r12d, r10d
	and r12d, -8
	lea r13, [r9 + 4*rax]
	xor r15d, r15d
.LBB59_11:
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 28], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 24], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 20], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 16], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 12], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 8], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 4], ebp
	blsr r14, r14
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15], ebp
	blsr r14, r14
	add r15, 8
	cmp r12, r15
	jne .LBB59_11
	test rbx, rbx
	je .LBB59_15
.LBB59_13:
	lea r12, [4*rax]
	lea r15, [r12 + 4*r15]
	add r15, rdx
	xor r12d, r12d
.LBB59_14:
	tzcnt r13, r14
	or r13d, r11d
	mov dword ptr [r15 + 4*r12], r13d
	blsr r14, r14
	inc r12
	cmp rbx, r12
	jne .LBB59_14
	jmp .LBB59_15
.LBB59_1:
	xor eax, eax
.LBB59_16:
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB59_17:
	lea r8, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.27]
	mov rdi, rax
	mov rsi, rcx
	mov rdx, rcx
	mov rcx, r8
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB59_9:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.59]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.62]
	mov esi, 33
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
