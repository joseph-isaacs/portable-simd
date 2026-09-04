bitpacking::rank_index::rank_index_scalar:
	cmp rcx, rsi
	jb .LBB4_4
	test rsi, rsi
	je .LBB4_10
	mov eax, esi
	and eax, 7
	cmp rsi, 8
	jae .LBB4_5
	xor ecx, ecx
	xor r8d, r8d
	jmp .LBB4_8
.LBB4_5:
	movabs rcx, 1152921504606846968
	and rsi, rcx
	xor ecx, ecx
	xor r8d, r8d
.LBB4_6:
	xor r9d, r9d
	popcnt r9, qword ptr [rdi + 8*r8]
	mov dword ptr [rdx + 4*r8], ecx
	add r9d, ecx
	xor ecx, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 8]
	mov dword ptr [rdx + 4*r8 + 4], r9d
	add ecx, r9d
	xor r9d, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 16]
	mov dword ptr [rdx + 4*r8 + 8], ecx
	add r9d, ecx
	xor ecx, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 24]
	mov dword ptr [rdx + 4*r8 + 12], r9d
	add ecx, r9d
	xor r9d, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 32]
	mov dword ptr [rdx + 4*r8 + 16], ecx
	add r9d, ecx
	xor ecx, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 40]
	mov dword ptr [rdx + 4*r8 + 20], r9d
	add ecx, r9d
	xor r9d, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 48]
	mov dword ptr [rdx + 4*r8 + 24], ecx
	add r9d, ecx
	xor ecx, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 56]
	mov dword ptr [rdx + 4*r8 + 28], r9d
	add r8, 8
	add ecx, r9d
	cmp rsi, r8
	jne .LBB4_6
	test rax, rax
	je .LBB4_10
.LBB4_8:
	lea rdx, [rdx + 4*r8]
	lea rsi, [rdi + 8*r8]
	xor edi, edi
.LBB4_9:
	mov r8d, ecx
	xor ecx, ecx
	popcnt rcx, qword ptr [rsi + 8*rdi]
	mov dword ptr [rdx + 4*rdi], r8d
	add ecx, r8d
	inc rdi
	cmp rax, rdi
	jne .LBB4_9
.LBB4_10:
	ret
.LBB4_4:
	push rax
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.30]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.33]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
