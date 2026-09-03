bitpacking::select::select_pdep:
	test rsi, rsi
	je .LBB28_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r8d, r8d
	mov r9, rdx
.LBB28_3:
	mov r10, qword ptr [rdi + r8]
	popcnt r11, r10
	sub r9, r11
	jb .LBB28_6
	add r8, 8
	add rcx, -64
	mov rdx, r9
	cmp rsi, r8
	jne .LBB28_3
	ret
.LBB28_1:
	xor eax, eax
	ret
.LBB28_6:
	mov eax, 1
	shlx rdx, rax, rdx
	pdep rdx, rdx, r10
	tzcnt rdx, rdx
	sub rdx, rcx
	ret
