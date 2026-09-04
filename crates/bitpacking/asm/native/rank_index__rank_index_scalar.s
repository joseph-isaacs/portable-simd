bitpacking::rank_index::rank_index_scalar:
	cmp rcx, rsi
	jb .LBB5_4
	test rsi, rsi
	je .LBB5_10
	mov eax, esi
	and eax, 7
	cmp rsi, 8
	jae .LBB5_5
	xor ecx, ecx
	xor r8d, r8d
	jmp .LBB5_8
.LBB5_5:
	movabs rcx, 1152921504606846968
	and rsi, rcx
	xor ecx, ecx
	xor r8d, r8d
.LBB5_6:
	popcnt r9, qword ptr [rdi + 8*r8]
	mov dword ptr [rdx + 4*r8], ecx
	add r9d, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 8]
	mov dword ptr [rdx + 4*r8 + 4], r9d
	add ecx, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 16]
	mov dword ptr [rdx + 4*r8 + 8], ecx
	add r9d, ecx
	popcnt rcx, qword ptr [rdi + 8*r8 + 24]
	mov dword ptr [rdx + 4*r8 + 12], r9d
	add ecx, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 32]
	mov dword ptr [rdx + 4*r8 + 16], ecx
	add r9d, ecx
	popcnt r10, qword ptr [rdi + 8*r8 + 40]
	mov dword ptr [rdx + 4*r8 + 20], r9d
	add r10d, r9d
	popcnt r9, qword ptr [rdi + 8*r8 + 48]
	mov dword ptr [rdx + 4*r8 + 24], r10d
	popcnt rcx, qword ptr [rdi + 8*r8 + 56]
	add r9d, r10d
	mov dword ptr [rdx + 4*r8 + 28], r9d
	add r8, 8
	add ecx, r9d
	cmp rsi, r8
	jne .LBB5_6
	test rax, rax
	je .LBB5_10
.LBB5_8:
	lea rdx, [rdx + 4*r8]
	lea rsi, [rdi + 8*r8]
	xor edi, edi
.LBB5_9:
	mov r8d, ecx
	popcnt rcx, qword ptr [rsi + 8*rdi]
	mov dword ptr [rdx + 4*rdi], r8d
	add ecx, r8d
	inc rdi
	cmp rax, rdi
	jne .LBB5_9
.LBB5_10:
	ret
.LBB5_4:
	push rax
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.32]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.36]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
