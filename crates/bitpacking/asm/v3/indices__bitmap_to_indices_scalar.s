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
	je .LBB52_1
	lea rsi, [rdi + 8*rsi]
	lea r9, [rdx + 12]
	xor eax, eax
	jmp .LBB52_3
.LBB52_6:
	xor r10d, r10d
.LBB52_15:
	add rdi, 8
	inc r8d
	add rax, r10
	cmp rdi, rsi
	je .LBB52_16
.LBB52_3:
	mov r10, rcx
	sub r10, rax
	jb .LBB52_17
	cmp r10, 64
	jb .LBB52_9
	mov r14, qword ptr [rdi]
	test r14, r14
	je .LBB52_6
	mov r11d, r8d
	shl r11d, 6
	xor r10d, r10d
	popcnt r10, r14
	mov ebx, r10d
	and ebx, 3
	cmp r10, 4
	jae .LBB52_10
	xor r15d, r15d
	jmp .LBB52_13
.LBB52_10:
	mov r12d, r10d
	and r12d, -4
	lea r13, [r9 + 4*rax]
	xor r15d, r15d
.LBB52_11:
	xor ebp, ebp
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 12], ebp
	blsr r14, r14
	xor ebp, ebp
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 8], ebp
	blsr r14, r14
	xor ebp, ebp
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15 - 4], ebp
	blsr r14, r14
	xor ebp, ebp
	tzcnt rbp, r14
	or ebp, r11d
	mov dword ptr [r13 + 4*r15], ebp
	blsr r14, r14
	add r15, 4
	cmp r12, r15
	jne .LBB52_11
	test rbx, rbx
	je .LBB52_15
.LBB52_13:
	lea r12, [4*rax]
	lea r15, [r12 + 4*r15]
	add r15, rdx
	xor r12d, r12d
.LBB52_14:
	xor r13d, r13d
	tzcnt r13, r14
	or r13d, r11d
	mov dword ptr [r15 + 4*r12], r13d
	blsr r14, r14
	inc r12
	cmp rbx, r12
	jne .LBB52_14
	jmp .LBB52_15
.LBB52_1:
	xor eax, eax
.LBB52_16:
	add rsp, 8
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB52_17:
	lea r8, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.26]
	mov rdi, rax
	mov rsi, rcx
	mov rdx, rcx
	mov rcx, r8
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB52_9:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.55]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.57]
	mov esi, 33
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
