bitpacking::select::select_naive:
	test rsi, rsi
	je .LBB22_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r9d, r9d
	mov r10, rdx
.LBB22_3:
	mov r8, qword ptr [rdi + r9]
	xor r11d, r11d
	popcnt r11, r8
	sub r10, r11
	jb .LBB22_6
	add r9, 8
	add rcx, -64
	mov rdx, r10
	cmp rsi, r9
	jne .LBB22_3
	ret
.LBB22_1:
	xor eax, eax
	ret
.LBB22_6:
	test rdx, rdx
	je .LBB22_12
	lea esi, [rdx - 1]
	mov eax, edx
	and eax, 7
	cmp esi, 7
	jb .LBB22_11
	and edx, -8
.LBB22_9:
	blsr rsi, r8
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr r8, rsi
	add edx, -8
	jne .LBB22_9
	test eax, eax
	je .LBB22_12
.LBB22_11:
	blsr r8, r8
	dec eax
	jne .LBB22_11
.LBB22_12:
	xor edx, edx
	tzcnt rdx, r8
	sub rdx, rcx
	mov eax, 1
	ret
