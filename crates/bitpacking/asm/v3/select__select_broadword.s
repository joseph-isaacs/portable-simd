bitpacking::select::select_broadword:
	test rsi, rsi
	je .LBB24_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r9d, r9d
	mov r10, rdx
.LBB24_3:
	mov r8, qword ptr [rdi + r9]
	xor r11d, r11d
	popcnt r11, r8
	sub r10, r11
	jb .LBB24_6
	add r9, 8
	add rcx, -64
	mov rdx, r10
	cmp rsi, r9
	jne .LBB24_3
	ret
.LBB24_1:
	xor eax, eax
	ret
.LBB24_6:
	mov rax, r8
	shr rax
	movabs rsi, 6148914691236517205
	and rsi, rax
	mov rax, r8
	sub rax, rsi
	movabs rsi, 3689348814741910323
	mov rdi, rax
	and rdi, rsi
	shr rax, 2
	and rax, rsi
	add rax, rdi
	mov rsi, rax
	shr rsi, 4
	add rsi, rax
	movabs rax, 1085102592571150095
	and rax, rsi
	movabs rsi, 72340172838076672
	movabs rdi, -72340172838076673
	imul rdi, rax
	imul rax, rsi
	inc rsi
	imul rsi, rdx
	movabs r9, -9187201950435737472
	or rsi, r9
	add rsi, rdi
	and rsi, r9
	popcnt rsi, rsi
	lea edi, [8*rsi]
	shrx rax, rax, rdi
	sub edx, eax
	and edx, 7
	shl edx, 8
	shrx rax, r8, rdi
	movzx eax, al
	add rdx, qword ptr [rip + bitpacking::select::SELECT_IN_BYTE@GOTPCREL]
	movzx eax, byte ptr [rax + rdx]
	lea edx, [rax + 8*rsi]
	sub rdx, rcx
	mov eax, 1
	ret
