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
	jb .LBB56_22
	movabs r11, 9223372036854775792
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB56_6
	mov rdx, rsi
	mulx r9, r9, r10
	shr r9, 2
	lea rdx, [rsi - 26]
	mulx r8, r8, r10
	shr r8, 2
	inc r8
	lea rdx, [r9 + 2*r9]
	lea r9, [rdx + rdx + 6]
	xor edx, edx
	vmovdqa ymm0, ymmword ptr [rip + .LCPI56_0]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI56_5]
	vpbroadcastd xmm2, dword ptr [rip + .LCPI56_6]
	xor ebx, ebx
.LBB56_3:
	cmp r9, rdx
	je .LBB56_20
	dec r8
	je .LBB56_24
	vpbroadcastq ymm3, qword ptr [rdi + rdx]
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	add rdx, 6
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [rax + rbx], xmm3
	add rbx, 16
	cmp r11, rbx
	jne .LBB56_3
.LBB56_6:
	mov r9d, ecx
	and r9d, 15
	je .LBB56_21
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB56_18
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB56_22
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI56_3]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI56_6]
	jmp .LBB56_11
.LBB56_10:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB56_21
.LBB56_11:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB56_23
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB56_14
	xor ebx, ebx
	jmp .LBB56_16
.LBB56_14:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB56_10
	add r11, rbx
.LBB56_16:
	lea rbx, [rbx + 2*rbx]
.LBB56_17:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB56_17
	jmp .LBB56_10
.LBB56_21:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB56_23:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.17]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB56_20:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.23]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB56_24:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.30]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.22]
	mov esi, 105
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB56_22:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.24]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.25]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB56_18:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.21]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
