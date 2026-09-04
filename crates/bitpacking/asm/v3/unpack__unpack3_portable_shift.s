bitpacking::unpack::unpack3_portable_shift:
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
	jb .LBB50_22
	movabs r11, 9223372036854775792
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB50_6
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
	vmovdqa ymm0, ymmword ptr [rip + .LCPI50_0]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI50_8]
	vpbroadcastd ymm2, dword ptr [rip + .LCPI50_9]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI50_10]
	xor ebx, ebx
.LBB50_3:
	cmp r9, rdx
	je .LBB50_20
	dec r8
	je .LBB50_24
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
	jne .LBB50_3
.LBB50_6:
	mov r9d, ecx
	and r9d, 15
	je .LBB50_21
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB50_18
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB50_22
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI50_4]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI50_5]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI50_6]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI50_10]
	jmp .LBB50_11
.LBB50_10:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB50_21
.LBB50_11:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB50_23
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB50_14
	xor ebx, ebx
	jmp .LBB50_16
.LBB50_14:
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
	je .LBB50_10
	add r11, rbx
.LBB50_16:
	lea rbx, [rbx + 2*rbx]
.LBB50_17:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB50_17
	jmp .LBB50_10
.LBB50_21:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB50_23:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.16]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB50_20:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.22]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB50_24:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.29]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.21]
	mov esi, 105
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB50_22:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.23]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.24]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB50_18:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.20]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
