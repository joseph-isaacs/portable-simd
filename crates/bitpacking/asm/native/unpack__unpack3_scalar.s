bitpacking::unpack::unpack3_scalar:
	push r14
	push rbx
	push rax
	mov rax, rdx
	lea rdx, [rcx + 2*rcx]
	mov r8, rdx
	shr r8, 3
	and edx, 7
	cmp rdx, 1
	sbb r8, -1
	add r8, 64
	cmp rsi, r8
	jb .LBB59_3
	test rcx, rcx
	je .LBB59_12
	lea rdx, [rsi - 5]
	movabs r8, -6148914691236517205
	mulx r8, r8, r8
	shr r8
	xor r9d, r9d
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI59_0]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI59_2]
	jmp .LBB59_5
.LBB59_4:
	sub rcx, r10
	inc r9
	test rcx, rcx
	je .LBB59_12
.LBB59_5:
	cmp rcx, 8
	mov r10d, 8
	cmovb r10, rcx
	lea rdx, [r9 + 2*r9]
	cmp r9, r8
	je .LBB59_13
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp rcx, 8
	jae .LBB59_8
	xor ebx, ebx
	jmp .LBB59_10
.LBB59_8:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB59_4
	add r11, rbx
.LBB59_10:
	lea rbx, [rbx + 2*rbx]
.LBB59_11:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB59_11
	jmp .LBB59_4
.LBB59_12:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB59_13:
	lea rax, [rdx + 8]
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.18]
	mov rdi, rdx
	mov rdx, rsi
	mov rsi, rax
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB59_3:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.25]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.26]
	mov esi, 55
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
