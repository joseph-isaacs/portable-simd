 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::select::select_naive:
	test rsi, rsi
	je .LBB23_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r9d, r9d
	mov r10, rdx
.LBB23_3:
	mov r8, qword ptr [rdi + r9]
	xor r11d, r11d
	popcnt r11, r8
	sub r10, r11
	jb .LBB23_6
	add r9, 8
	add rcx, -64
	mov rdx, r10
	cmp rsi, r9
	jne .LBB23_3
	ret
.LBB23_1:
	xor eax, eax
	ret
.LBB23_6:
	test rdx, rdx
	je .LBB23_12
	lea esi, [rdx - 1]
	mov eax, edx
	and eax, 7
	cmp esi, 7
	jb .LBB23_11
	and edx, -8
.LBB23_9:
	blsr rsi, r8
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr r8, rsi
	add edx, -8
	jne .LBB23_9
	test eax, eax
	je .LBB23_12
.LBB23_11:
	blsr r8, r8
	dec eax
	jne .LBB23_11
.LBB23_12:
	tzcnt rdx, r8
	sub rdx, rcx
	mov eax, 1
	ret
