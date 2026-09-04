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
	jne .LBB44_19
	cmp r9, rsi
	jbe .LBB44_20
	xor r13d, r13d
	test rsi, rsi
	je .LBB44_3
	mov r12, rdx
	xor eax, eax
	xor r10d, r10d
	xor edx, edx
	xor ecx, ecx
	xor r11d, r11d
.LBB44_5:
	mov r15, r10
	mov r14, rdx
	jmp .LBB44_6
.LBB44_13:
	xor r9d, r9d
	shld r9, rdx, cl
	shlx rdx, rdx, rcx
	test cl, 64
	cmovne r9, rdx
	cmovne rdx, r13
	or r9, r14
	or rdx, r15
	mov qword ptr [r8 + 8*rax], rdx
	inc rax
	mov r15, r9
	xor r14d, r14d
.LBB44_14:
	inc r11
	cmp r11, rsi
	jae .LBB44_11
.LBB44_6:
	mov rdx, qword ptr [rdi + 8*r11]
	mov rbx, qword ptr [r12 + 8*r11]
	cmp rbx, -1
	je .LBB44_13
	test rbx, rbx
	je .LBB44_14
	mov qword ptr [rsp + 32], r8
	mov r9d, ebx
	and r9d, 65280
	mov r8, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	add r9, r8
	movzx ebp, dh
	movzx r13d, byte ptr [rbp + r9]
	movzx ebp, bh
	popcnt r10d, ebp
	mov r9d, edx
	shr r9d, 16
	mov dword ptr [rsp], r9d
	mov r9d, edx
	shr r9d, 24
	mov qword ptr [rsp + 8], r9
	mov ebp, ebx
	shl ebp, 8
	movzx ebp, bp
	add rbp, r8
	movzx r9d, dl
	movzx r9d, byte ptr [r9 + rbp]
	movzx ebp, bl
	popcnt ebp, ebp
	shlx r13, r13, rbp
	or r13, r9
	mov qword ptr [rsp + 16], r13
	mov r9, rbx
	shr r9, 16
	add r10b, bpl
	movzx r13d, r9b
	shl r9d, 8
	movzx r9d, r9w
	add r9, r8
	movzx ebp, byte ptr [rsp]
	movzx r9d, byte ptr [rbp + r9]
	mov rbp, rbx
	shr rbp, 24
	shlx r9, r9, r10
	mov qword ptr [rsp], r9
	popcnt r9d, r13d
	add r9b, r10b
	movzx r10d, bpl
	mov dword ptr [rsp + 28], r10d
	mov r10d, ebp
	shl r10d, 8
	movzx r10d, r10w
	add r10, r8
	mov r13, qword ptr [rsp + 8]
	movzx ebp, byte ptr [r13 + r10]
	mov r10, rdx
	shr r10, 32
	shlx r13, rbp, r9
	or r13, qword ptr [rsp]
	mov qword ptr [rsp + 8], r13
	mov r13, rbx
	shr r13, 32
	popcnt ebp, dword ptr [rsp + 28]
	add bpl, r9b
	movzx r9d, r13b
	mov dword ptr [rsp], r9d
	mov r9d, r13d
	shl r9d, 8
	movzx r9d, r9w
	add r9, r8
	movzx r10d, r10b
	movzx r10d, byte ptr [r10 + r9]
	mov r9, rdx
	shr r9, 40
	shlx r10, r10, rbp
	or r10, qword ptr [rsp + 16]
	mov qword ptr [rsp + 16], r10
	mov r13, rbx
	shr r13, 40
	popcnt r10d, dword ptr [rsp]
	add r10b, bpl
	movzx ebp, r13b
	mov dword ptr [rsp], ebp
	mov ebp, r13d
	shl ebp, 8
	movzx r13d, bp
	add r13, r8
	movzx r9d, r9b
	movzx r9d, byte ptr [r9 + r13]
	mov r13, rdx
	shr r13, 48
	shlx rbp, r9, r10
	or rbp, qword ptr [rsp + 8]
	mov r9, rbx
	shr r9, 48
	popcnt r8d, dword ptr [rsp]
	add r8b, r10b
	mov r10d, r9d
	shl r10d, 8
	movzx r10d, r10w
	add r10, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx r13d, r13b
	movzx r10d, byte ptr [r13 + r10]
	shlx r10, r10, r8
	or r10, qword ptr [rsp + 16]
	movzx r13d, r9b
	popcnt r13d, r13d
	add r13b, r8b
	shr rdx, 56
	and r9d, 65280
	add r9, qword ptr [rip + bitpacking::filter::BYTE_PEXT_LUT@GOTPCREL]
	movzx edx, byte ptr [rdx + r9]
	shlx r8, rdx, r13
	xor r13d, r13d
	or r8, rbp
	popcnt r9, rbx
	or r8, r10
	xor edx, edx
	shld rdx, r8, cl
	shlx r10, r8, rcx
	test cl, 64
	cmovne rdx, r10
	cmovne r10, r13
	or rdx, r14
	or r10, r15
	add r9d, ecx
	cmp r9d, 64
	jb .LBB44_9
	mov r8, qword ptr [rsp + 32]
	mov qword ptr [r8 + 8*rax], r10
	inc rax
	add r9d, -64
	mov ecx, r9d
	mov r10, rdx
	xor edx, edx
	inc r11
	cmp r11, rsi
	jb .LBB44_5
	jmp .LBB44_10
.LBB44_9:
	mov ecx, r9d
	mov r8, qword ptr [rsp + 32]
	inc r11
	cmp r11, rsi
	jb .LBB44_5
.LBB44_10:
	mov r15, r10
.LBB44_11:
	test ecx, ecx
	je .LBB44_12
	mov qword ptr [r8 + 8*rax], r15
	mov r13d, ecx
	jmp .LBB44_18
.LBB44_3:
	xor eax, eax
	jmp .LBB44_18
.LBB44_12:
	xor r13d, r13d
.LBB44_18:
	shl rax, 6
	add rax, r13
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB44_19:
	lea r9, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.8]
	lea rsi, [rsp + 40]
	lea rdx, [rsp + 48]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB44_20:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.9]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.10]
	mov esi, 95
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
