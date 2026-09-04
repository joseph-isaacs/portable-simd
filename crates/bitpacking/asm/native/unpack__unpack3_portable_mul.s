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
	jb .LBB55_22
	movabs r11, 9223372036854775792
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB55_6
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
	vmovdqa ymm0, ymmword ptr [rip + .LCPI55_0]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI55_5]
	vpbroadcastd xmm2, dword ptr [rip + .LCPI55_6]
	xor ebx, ebx
.LBB55_3:
	cmp r9, rdx
	je .LBB55_20
	dec r8
	je .LBB55_24
	vpbroadcastq ymm3, qword ptr [rdi + rdx]
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	add rdx, 6
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [rax + rbx], xmm3
	add rbx, 16
	cmp r11, rbx
	jne .LBB55_3
.LBB55_6:
	mov r9d, ecx
	and r9d, 15
	je .LBB55_21
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB55_18
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB55_22
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI55_3]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI55_6]
	jmp .LBB55_11
.LBB55_10:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB55_21
.LBB55_11:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB55_23
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB55_14
	xor ebx, ebx
	jmp .LBB55_16
.LBB55_14:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB55_10
	add r11, rbx
.LBB55_16:
	lea rbx, [rbx + 2*rbx]
.LBB55_17:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB55_17
	jmp .LBB55_10
.LBB55_21:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB55_23:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.17]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB55_20:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.20]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB55_24:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.30]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.19]
	mov esi, 105
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB55_22:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.24]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.25]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB55_18:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.18]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
