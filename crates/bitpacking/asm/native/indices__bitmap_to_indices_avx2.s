bitpacking::indices::bitmap_to_indices_avx2:
	push rbp
	push r15
	push r14
	push rbx
	push rax
	test rsi, rsi
	je .LBB62_1
	shl rsi, 3
	mov r9d, 56
	xor r8d, r8d
	mov r10, qword ptr [rip + bitpacking::indices::POS_LUT@GOTPCREL]
	xor r11d, r11d
.LBB62_3:
	mov rax, rcx
	sub rax, r8
	jb .LBB62_8
	cmp rax, 63
	jbe .LBB62_7
	mov rax, qword ptr [rdi + r11]
	lea rbx, [rdx + 4*r8]
	lea ebp, [r9 - 56]
	movzx r14d, al
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	vpbroadcastd ymm1, ebp
	vpaddd ymm0, ymm1, ymm0
	vmovdqu ymmword ptr [rdx + 4*r8], ymm0
	popcnt r14d, r14d
	movzx ebp, ah
	vpmovzxbd ymm0, qword ptr [r10 + 8*rbp]
	lea r15d, [r9 - 48]
	vpbroadcastd ymm1, r15d
	vpaddd ymm0, ymm1, ymm0
	vmovdqu ymmword ptr [rbx + 4*r14], ymm0
	popcnt ebp, ebp
	add bpl, r14b
	mov r14d, eax
	shr r14d, 16
	movzx r14d, r14b
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	lea r15d, [r9 - 40]
	vpbroadcastd ymm1, r15d
	vpaddd ymm0, ymm1, ymm0
	movzx r15d, bpl
	vmovdqu ymmword ptr [rbx + 4*r15], ymm0
	popcnt ebp, r14d
	add r15b, bpl
	mov r14d, eax
	shr r14d, 24
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	lea ebp, [r9 - 32]
	vpbroadcastd ymm1, ebp
	vpaddd ymm0, ymm1, ymm0
	movzx r15d, r15b
	vmovdqu ymmword ptr [rbx + 4*r15], ymm0
	popcnt ebp, r14d
	add r15b, bpl
	mov r14, rax
	shr r14, 32
	movzx r14d, r14b
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	lea ebp, [r9 - 24]
	vpbroadcastd ymm1, ebp
	vpaddd ymm0, ymm1, ymm0
	movzx r15d, r15b
	vmovdqu ymmword ptr [rbx + 4*r15], ymm0
	popcnt ebp, r14d
	add r15b, bpl
	mov r14, rax
	shr r14, 40
	movzx r14d, r14b
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	lea ebp, [r9 - 16]
	vpbroadcastd ymm1, ebp
	vpaddd ymm0, ymm1, ymm0
	movzx r15d, r15b
	vmovdqu ymmword ptr [rbx + 4*r15], ymm0
	popcnt ebp, r14d
	add r15b, bpl
	mov r14, rax
	shr r14, 48
	movzx r14d, r14b
	vpmovzxbd ymm0, qword ptr [r10 + 8*r14]
	lea ebp, [r9 - 8]
	vpbroadcastd ymm1, ebp
	vpaddd ymm0, ymm1, ymm0
	movzx r15d, r15b
	vmovdqu ymmword ptr [rbx + 4*r15], ymm0
	popcnt ebp, r14d
	add r15b, bpl
	movzx r14d, r15b
	shr rax, 56
	vpmovzxbd ymm0, qword ptr [r10 + 8*rax]
	vpbroadcastd ymm1, r9d
	vpaddd ymm0, ymm1, ymm0
	vmovdqu ymmword ptr [rbx + 4*r14], ymm0
	popcnt eax, eax
	add rax, r8
	add rax, r14
	add r11, 8
	add r9d, 64
	mov r8, rax
	cmp rsi, r11
	jne .LBB62_3
	jmp .LBB62_6
.LBB62_1:
	xor eax, eax
.LBB62_6:
	add rsp, 8
	pop rbx
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB62_8:
	lea rax, [rip + .Lanon.7f2c312b5472e5928991000022678349.28]
	mov rdi, r8
	mov rsi, rcx
	mov rdx, rcx
	mov rcx, rax
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB62_7:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.60]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.61]
	mov esi, 33
	vzeroupper
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
