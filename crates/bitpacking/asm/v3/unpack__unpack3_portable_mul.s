bitpacking::unpack::unpack3_portable_mul:
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
	jb .LBB49_22
	movabs r11, 9223372036854775792
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB49_6
	mov rdx, rsi
	mulx r9, r9, r10
	shr r9, 2
	lea rdx, [rsi - 26]
	mulx r8, r8, r10
	shr r8, 2
	inc r8
	lea rdx, [r9 + 2*r9]
	lea r9, [2*rdx + 6]
	xor edx, edx
	vmovdqa ymm0, ymmword ptr [rip + .LCPI49_0]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI49_8]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI49_9]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI49_10]
	xor ebx, ebx
.LBB49_3:
	cmp r9, rdx
	je .LBB49_20
	dec r8
	je .LBB49_24
	vbroadcasti128 ymm4, xmmword ptr [rdi + rdx]
	add rdx, 6
	vpshufb ymm4, ymm4, ymm0
	vpmulhuw ymm5, ymm4, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpand ymm4, ymm4, ymm2
	vextracti128 xmm5, ymm4, 1
	vpackuswb xmm4, xmm4, xmm5
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [rax + rbx], xmm4
	add rbx, 16
	cmp r11, rbx
	jne .LBB49_3
.LBB49_6:
	mov r9d, ecx
	and r9d, 15
	je .LBB49_21
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB49_18
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB49_22
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI49_4]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI49_5]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI49_6]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI49_10]
	jmp .LBB49_11
.LBB49_10:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB49_21
.LBB49_11:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB49_23
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB49_14
	xor ebx, ebx
	jmp .LBB49_16
.LBB49_14:
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
	je .LBB49_10
	add r11, rbx
.LBB49_16:
	lea rbx, [rbx + 2*rbx]
.LBB49_17:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB49_17
	jmp .LBB49_10
.LBB49_21:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB49_23:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.16]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB49_20:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.19]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB49_24:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.29]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.18]
	mov esi, 105
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB49_22:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.23]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.24]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB49_18:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.17]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
