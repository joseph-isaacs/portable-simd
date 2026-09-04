bitpacking::bit_to_byte::bits_to_bytes_pdep:
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB7_5
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB7_4
	shl rcx, 3
	xor eax, eax
	movabs rsi, 72340172838076673
.LBB7_3:
	mov r8, qword ptr [rdi + rax]
	pdep r9, r8, rsi
	mov qword ptr [rdx + 8*rax], r9
	mov r9d, r8d
	shr r9d, 8
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 8], r9
	mov r9d, r8d
	shr r9d, 16
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 16], r9
	mov r9d, r8d
	shr r9d, 24
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 24], r9
	mov r9, r8
	shr r9, 32
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 32], r9
	mov r9, r8
	shr r9, 40
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 40], r9
	mov r9, r8
	shr r9, 48
	pdep r9, r9, rsi
	mov qword ptr [rdx + 8*rax + 48], r9
	shr r8, 56
	pdep r8, r8, rsi
	mov qword ptr [rdx + 8*rax + 56], r8
	add rax, 8
	cmp rcx, rax
	jne .LBB7_3
.LBB7_4:
	ret
.LBB7_5:
	push rax
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.35]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.38]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
