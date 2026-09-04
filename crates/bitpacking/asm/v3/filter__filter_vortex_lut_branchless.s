bitpacking::filter::filter_vortex_lut_branchless:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 56
	mov qword ptr [rsp + 40], rsi
	mov qword ptr [rsp + 48], rcx
	cmp rsi, rcx
	jne .LBB39_19
	cmp r9, rsi
	jbe .LBB39_20
	xor r9d, r9d
	test rsi, rsi
	je .LBB39_3
	mov r12, rdx
	mov rbp, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	xor eax, eax
	xor r10d, r10d
	xor edx, edx
	xor ecx, ecx
	xor r11d, r11d
.LBB39_5:
	mov r15, r10
	mov r14, rdx
	jmp .LBB39_6
.LBB39_13:
	xor r10d, r10d
	shld r10, rdx, cl
	shlx rdx, rdx, rcx
	test cl, 64
	cmovne r10, rdx
	cmovne rdx, r9
	or r10, r14
	or rdx, r15
	mov qword ptr [r8 + 8*rax], rdx
	inc rax
	mov r15, r10
	xor r14d, r14d
.LBB39_14:
	inc r11
	cmp r11, rsi
	jae .LBB39_11
.LBB39_6:
	mov rdx, qword ptr [rdi + 8*r11]
	mov rbx, qword ptr [r12 + 8*r11]
	cmp rbx, -1
	je .LBB39_13
	test rbx, rbx
	je .LBB39_14
	mov qword ptr [rsp + 32], r8
	mov r8d, ebx
	and r8d, 65280
	add r8, rbp
	movzx ebp, dh
	movzx r8d, byte ptr [rbp + r8]
	mov qword ptr [rsp + 16], r8
	movzx ebp, bh
	xor r13d, r13d
	popcnt r13d, ebp
	mov r8d, edx
	shr r8d, 16
	mov dword ptr [rsp + 24], r8d
	mov r8d, edx
	shr r8d, 24
	mov qword ptr [rsp + 8], r8
	mov ebp, ebx
	shl ebp, 8
	movzx ebp, bp
	add rbp, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx r8d, dl
	movzx r10d, byte ptr [r8 + rbp]
	movzx ebp, bl
	xor r8d, r8d
	popcnt r8d, ebp
	shlx rbp, qword ptr [rsp + 16], r8
	or rbp, r10
	mov r10, rbx
	shr r10, 16
	add r13b, r8b
	movzx r8d, r10b
	mov dword ptr [rsp + 4], r8d
	shl r10d, 8
	movzx r10d, r10w
	add r10, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx r8d, byte ptr [rsp + 24]
	movzx r8d, byte ptr [r8 + r10]
	mov r10, rdx
	shr r10, 32
	mov qword ptr [rsp + 16], r10
	shlx r8, r8, r13
	or r8, rbp
	mov qword ptr [rsp + 24], r8
	mov r8, rbx
	shr r8, 24
	mov r10d, dword ptr [rsp + 4]
	xor ebp, ebp
	popcnt ebp, r10d
	add bpl, r13b
	movzx r10d, r8b
	mov dword ptr [rsp + 4], r10d
	shl r8d, 8
	movzx r8d, r8w
	add r8, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	mov r10, qword ptr [rsp + 8]
	movzx r10d, byte ptr [r10 + r8]
	mov r8, rbx
	shr r8, 32
	shlx r13, r10, rbp
	mov r10d, dword ptr [rsp + 4]
	popcnt r10d, r10d
	add r10b, bpl
	movzx ebp, r8b
	mov dword ptr [rsp + 8], ebp
	shl r8d, 8
	movzx r8d, r8w
	add r8, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx ebp, byte ptr [rsp + 16]
	movzx r8d, byte ptr [rbp + r8]
	mov rbp, rdx
	shr rbp, 40
	shlx r8, r8, r10
	or r8, r13
	mov r13, rdx
	shr r13, 48
	mov qword ptr [rsp + 16], r13
	or r8, qword ptr [rsp + 24]
	mov qword ptr [rsp + 24], r8
	mov r13, rbx
	shr r13, 40
	mov r8d, dword ptr [rsp + 8]
	popcnt r8d, r8d
	add r8b, r10b
	movzx r10d, r13b
	mov dword ptr [rsp + 4], r10d
	mov r10d, r13d
	shl r10d, 8
	movzx r10d, r10w
	add r10, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx r13d, bpl
	movzx r13d, byte ptr [r13 + r10]
	mov r10, rbx
	shr r10, 48
	shlx r13, r13, r8
	mov qword ptr [rsp + 8], r13
	mov ebp, dword ptr [rsp + 4]
	popcnt ebp, ebp
	add bpl, r8b
	mov r8d, r10d
	shl r8d, 8
	movzx r8d, r8w
	add r8, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx r13d, byte ptr [rsp + 16]
	movzx r8d, byte ptr [r13 + r8]
	shlx r8, r8, rbp
	or r8, qword ptr [rsp + 8]
	movzx r13d, r10b
	popcnt r13d, r13d
	add r13b, bpl
	mov rbp, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	shr rdx, 56
	and r10d, 65280
	add r10, rbp
	movzx edx, byte ptr [rdx + r10]
	shlx r10, rdx, r13
	or r10, r8
	or r10, qword ptr [rsp + 24]
	xor edx, edx
	shld rdx, r10, cl
	popcnt rbx, rbx
	shlx r10, r10, rcx
	test cl, 64
	cmovne rdx, r10
	cmovne r10, r9
	or rdx, r14
	or r10, r15
	add ebx, ecx
	cmp ebx, 64
	jb .LBB39_9
	mov r8, qword ptr [rsp + 32]
	mov qword ptr [r8 + 8*rax], r10
	inc rax
	add ebx, -64
	mov ecx, ebx
	mov r10, rdx
	xor edx, edx
	inc r11
	cmp r11, rsi
	jb .LBB39_5
	jmp .LBB39_10
.LBB39_9:
	mov ecx, ebx
	mov r8, qword ptr [rsp + 32]
	inc r11
	cmp r11, rsi
	jb .LBB39_5
.LBB39_10:
	mov r15, r10
.LBB39_11:
	test ecx, ecx
	je .LBB39_12
	mov qword ptr [r8 + 8*rax], r15
	mov r9d, ecx
	jmp .LBB39_18
.LBB39_3:
	xor eax, eax
	jmp .LBB39_18
.LBB39_12:
	xor r9d, r9d
.LBB39_18:
	shl rax, 6
	add rax, r9
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB39_19:
	lea r9, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.8]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB39_20:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.9]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.10]
	mov esi, 95
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
