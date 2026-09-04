bitpacking::bit_to_byte::bits_to_bytes_pdep:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB8_9
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB8_8
	movabs rax, 72340172838076673
	cmp rcx, 1
	jne .LBB8_4
	xor esi, esi
	jmp .LBB8_7
.LBB8_4:
	movabs r8, 144115188075855870
	and r8, rcx
	lea r9, [rdx + 120]
	xor esi, esi
.LBB8_5:
	mov r10, qword ptr [rdi + 8*rsi]
	pdep r11, r10, rax
	mov qword ptr [r9 - 120], r11
	mov r11d, r10d
	shr r11d, 8
	pdep r11, r11, rax
	mov qword ptr [r9 - 112], r11
	mov r11d, r10d
	shr r11d, 16
	pdep r11, r11, rax
	mov qword ptr [r9 - 104], r11
	mov r11d, r10d
	shr r11d, 24
	pdep r11, r11, rax
	mov qword ptr [r9 - 96], r11
	mov r11, r10
	shr r11, 32
	pdep r11, r11, rax
	mov qword ptr [r9 - 88], r11
	mov r11, r10
	shr r11, 40
	pdep r11, r11, rax
	mov qword ptr [r9 - 80], r11
	mov r11, r10
	shr r11, 48
	pdep r11, r11, rax
	mov qword ptr [r9 - 72], r11
	shr r10, 56
	pdep r10, r10, rax
	mov qword ptr [r9 - 64], r10
	mov r10, qword ptr [rdi + 8*rsi + 8]
	pdep r11, r10, rax
	mov qword ptr [r9 - 56], r11
	mov r11d, r10d
	shr r11d, 8
	pdep r11, r11, rax
	mov qword ptr [r9 - 48], r11
	mov r11d, r10d
	shr r11d, 16
	pdep r11, r11, rax
	mov qword ptr [r9 - 40], r11
	mov r11d, r10d
	shr r11d, 24
	pdep r11, r11, rax
	mov qword ptr [r9 - 32], r11
	mov r11, r10
	shr r11, 32
	pdep r11, r11, rax
	mov qword ptr [r9 - 24], r11
	mov r11, r10
	shr r11, 40
	pdep r11, r11, rax
	mov qword ptr [r9 - 16], r11
	mov r11, r10
	shr r11, 48
	pdep r11, r11, rax
	mov qword ptr [r9 - 8], r11
	shr r10, 56
	pdep r10, r10, rax
	mov qword ptr [r9], r10
	add rsi, 2
	sub r9, -128
	cmp r8, rsi
	jne .LBB8_5
	test cl, 1
	je .LBB8_8
.LBB8_7:
	mov rcx, qword ptr [rdi + 8*rsi]
	shl rsi, 6
	pdep rdi, rcx, rax
	mov qword ptr [rdx + rsi], rdi
	mov edi, ecx
	shr edi, 8
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 8], rdi
	mov edi, ecx
	shr edi, 16
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 16], rdi
	mov edi, ecx
	shr edi, 24
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 24], rdi
	mov rdi, rcx
	shr rdi, 32
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 32], rdi
	mov rdi, rcx
	shr rdi, 40
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 40], rdi
	mov rdi, rcx
	shr rdi, 48
	pdep rdi, rdi, rax
	mov qword ptr [rdx + rsi + 48], rdi
	shr rcx, 56
	pdep rax, rcx, rax
	mov qword ptr [rdx + rsi + 56], rax
.LBB8_8:
	pop rax
	ret
.LBB8_9:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.37]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.40]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
