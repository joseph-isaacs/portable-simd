bitpacking::select::select_naive:
	test rsi, rsi
	je .LBB28_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r9d, r9d
	mov r10, rdx
.LBB28_3:
	mov r8, qword ptr [rdi + r9]
	xor r11d, r11d
	popcnt r11, r8
	sub r10, r11
	jb .LBB28_6
	add r9, 8
	add rcx, -64
	mov rdx, r10
	cmp rsi, r9
	jne .LBB28_3
	ret
.LBB28_1:
	xor eax, eax
	ret
.LBB28_6:
	test rdx, rdx
	je .LBB28_12
	lea esi, [rdx - 1]
	mov eax, edx
	and eax, 7
	cmp esi, 7
	jb .LBB28_11
	and edx, -8
.LBB28_9:
	blsr rsi, r8
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr r8, rsi
	add edx, -8
	jne .LBB28_9
	test eax, eax
	je .LBB28_12
.LBB28_11:
	blsr r8, r8
	dec eax
	jne .LBB28_11
.LBB28_12:
	xor edx, edx
	tzcnt rdx, r8
	sub rdx, rcx
	mov eax, 1
	ret
