bitpacking::unpack::unpack3_avx2:
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
	jb .LBB46_23
	movabs r10, 9223372036854775792
	and r10, rcx
	mov r9d, ecx
	and r9d, 15
	test r10, r10
	je .LBB46_9
	lea r8, [rcx - 16]
	mov r11, r8
	shr r11, 4
	inc r11
	mov edx, r11d
	and edx, 3
	cmp r8, 48
	jae .LBB46_4
	xor r8d, r8d
	mov r14, rax
	jmp .LBB46_7
.LBB46_4:
	and r11, -4
	xor r8d, r8d
	vbroadcasti128 ymm0, xmmword ptr [rip + .LCPI46_10]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI46_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI46_11]
	vpbroadcastq xmm3, qword ptr [rip + .LCPI46_3]
	mov rbx, rdi
	mov r14, rax
.LBB46_5:
	vmovdqu xmm4, xmmword ptr [rbx]
	vinserti128 ymm4, ymm4, xmmword ptr [rbx + 3], 1
	vpshufb ymm5, ymm4, ymm0
	vpmulhuw ymm5, ymm5, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpshufb ymm4, ymm4, ymm2
	vpermq ymm4, ymm4, 232
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [r14], xmm4
	vmovdqu xmm4, xmmword ptr [rbx + 6]
	vinserti128 ymm4, ymm4, xmmword ptr [rbx + 9], 1
	vpshufb ymm5, ymm4, ymm0
	vpmulhuw ymm5, ymm5, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpshufb ymm4, ymm4, ymm2
	vpermq ymm4, ymm4, 232
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [r14 + 16], xmm4
	vmovdqu xmm4, xmmword ptr [rbx + 12]
	vinserti128 ymm4, ymm4, xmmword ptr [rbx + 15], 1
	vpshufb ymm5, ymm4, ymm0
	vpmulhuw ymm5, ymm5, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpshufb ymm4, ymm4, ymm2
	vpermq ymm4, ymm4, 232
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [r14 + 32], xmm4
	vmovdqu xmm4, xmmword ptr [rbx + 18]
	vinserti128 ymm4, ymm4, xmmword ptr [rbx + 21], 1
	vpshufb ymm5, ymm4, ymm0
	vpmulhuw ymm5, ymm5, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpshufb ymm4, ymm4, ymm2
	vpermq ymm4, ymm4, 232
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [r14 + 48], xmm4
	add r14, 64
	add r8, 4
	add rbx, 24
	cmp r11, r8
	jne .LBB46_5
	test rdx, rdx
	je .LBB46_9
.LBB46_7:
	lea r8, [r8 + 2*r8]
	lea r8, [rdi + 2*r8]
	shl edx, 4
	xor r11d, r11d
	vbroadcasti128 ymm0, xmmword ptr [rip + .LCPI46_12]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI46_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI46_11]
	vpbroadcastq xmm3, qword ptr [rip + .LCPI46_3]
.LBB46_8:
	vmovdqu xmm4, xmmword ptr [r8]
	vinserti128 ymm4, ymm4, xmmword ptr [r8 + 3], 1
	vpshufb ymm5, ymm4, ymm0
	vpmulhuw ymm5, ymm5, ymm1
	vpblendw ymm4, ymm5, ymm4, 1
	vpshufb ymm4, ymm4, ymm2
	vpermq ymm4, ymm4, 232
	vpand xmm4, xmm4, xmm3
	vmovdqu xmmword ptr [r14 + r11], xmm4
	add r8, 6
	add r11, 16
	cmp rdx, r11
	jne .LBB46_8
.LBB46_9:
	test r9, r9
	je .LBB46_22
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB46_21
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB46_23
	add rax, r10
	add rdi, rdx
	lea rdx, [r8 - 5]
	movabs rcx, -6148914691236517205
	mulx rcx, rcx, rcx
	shr rcx
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI46_6]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI46_7]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI46_8]
	vpbroadcastd xmm3, dword ptr [rip + .LCPI46_13]
	jmp .LBB46_14
.LBB46_13:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB46_22
.LBB46_14:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB46_24
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB46_17
	xor ebx, ebx
	jmp .LBB46_19
.LBB46_17:
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
	je .LBB46_13
	add r11, rbx
.LBB46_19:
	lea rbx, [rbx + 2*rbx]
.LBB46_20:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB46_20
	jmp .LBB46_13
.LBB46_22:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB46_24:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.16]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB46_23:
	lea rdi, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.23]
	lea rdx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.24]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB46_21:
	lea rcx, [rip + .Lanon.9d0b7dd9e45d7c2ebe49315d8fa047ce.13]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
