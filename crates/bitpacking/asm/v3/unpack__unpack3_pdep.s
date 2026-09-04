bitpacking::unpack::unpack3_pdep:
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
	jb .LBB47_19
	movabs r11, 9223372036854775800
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB47_5
	lea rdx, [rsi - 5]
	mulx r8, r8, r10
	shr r8
	xor edx, edx
	movabs r9, 506381209866536711
	xor ebx, ebx
.LBB47_3:
	sub r8, 1
	jb .LBB47_21
	mov r14, qword ptr [rdi + rdx]
	pdep r14, r14, r9
	mov qword ptr [rax + rbx], r14
	add rdx, 3
	add rbx, 8
	cmp r11, rbx
	jne .LBB47_3
.LBB47_5:
	mov r9d, ecx
	and r9d, 7
	je .LBB47_18
	shr rcx, 3
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB47_17
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB47_19
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI47_0]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI47_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI47_2]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI47_4]
	jmp .LBB47_10
.LBB47_9:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB47_18
.LBB47_10:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB47_20
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB47_13
	xor ebx, ebx
	jmp .LBB47_15
.LBB47_13:
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
	je .LBB47_9
	add r11, rbx
.LBB47_15:
	lea rbx, [rbx + 2*rbx]
.LBB47_16:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB47_16
	jmp .LBB47_9
.LBB47_18:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB47_21:
	lea rax, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.15]
	mov rdi, rdx
	mov rdx, rsi
	mov rsi, rax
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB47_20:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.16]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB47_19:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.23]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.24]
	mov esi, 55
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB47_17:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.14]
	mov rdi, rdx
	mov rdx, rsi
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
