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
	add r8, 32
	cmp rsi, r8
	jb .LBB48_3
	test rcx, rcx
	je .LBB48_12
	lea rdx, [rsi - 5]
	movabs r8, -6148914691236517205
	mulx r8, r8, r8
	shr r8
	xor r9d, r9d
	vmovdqa ymm0, ymmword ptr [rip + .LCPI48_0]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI48_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI48_2]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI48_4]
	jmp .LBB48_5
.LBB48_4:
	sub rcx, r10
	inc r9
	test rcx, rcx
	je .LBB48_12
.LBB48_5:
	cmp rcx, 8
	mov r10d, 8
	cmovb r10, rcx
	lea rdx, [r9 + 2*r9]
	cmp r9, r8
	je .LBB48_13
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp rcx, 8
	jae .LBB48_8
	xor ebx, ebx
	jmp .LBB48_10
.LBB48_8:
	mov ebx, r10d
	and ebx, 8
	vmovq xmm4, rdx
	vpbroadcastq ymm4, xmm4
	vpsrlvq ymm5, ymm4, ymm0
	vpsrlvq ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vpand ymm5, ymm5, ymm2
	vpackusdw ymm4, ymm5, ymm4
	vextracti128 xmm5, ymm4, 1
	vpackusdw xmm4, xmm4, xmm5
	vpshufd xmm4, xmm4, 216
	vpackuswb xmm4, xmm4, xmm4
	vpand xmm4, xmm4, xmm3
	vmovq qword ptr [r11], xmm4
	cmp r10, rbx
	je .LBB48_4
	add r11, rbx
.LBB48_10:
	lea rbx, [rbx + 2*rbx]
.LBB48_11:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB48_11
	jmp .LBB48_4
.LBB48_12:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB48_13:
	lea rax, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.16]
	mov rdi, rdx
	mov rdx, rsi
	mov rsi, rax
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB48_3:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.23]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.24]
	mov esi, 55
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
