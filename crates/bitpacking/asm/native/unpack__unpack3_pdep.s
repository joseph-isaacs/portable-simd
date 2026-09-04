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
	add r8, 32
	cmp rsi, r8
	jb .LBB52_19
	movabs r11, 9223372036854775800
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB52_5
	lea rdx, [rsi - 5]
	mulx r8, r8, r10
	shr r8
	xor edx, edx
	movabs r9, 506381209866536711
	xor ebx, ebx
.LBB52_3:
	sub r8, 1
	jb .LBB52_21
	mov r14, qword ptr [rdi + rdx]
	pdep r14, r14, r9
	mov qword ptr [rax + rbx], r14
	add rdx, 3
	add rbx, 8
	cmp r11, rbx
	jne .LBB52_3
.LBB52_5:
	mov r9d, ecx
	and r9d, 7
	je .LBB52_18
	shr rcx, 3
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB52_17
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB52_19
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI52_0]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI52_2]
	jmp .LBB52_10
.LBB52_9:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB52_18
.LBB52_10:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB52_20
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB52_13
	xor ebx, ebx
	jmp .LBB52_15
.LBB52_13:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB52_9
	add r11, rbx
.LBB52_15:
	lea rbx, [rbx + 2*rbx]
.LBB52_16:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB52_16
	jmp .LBB52_9
.LBB52_18:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB52_21:
	lea rax, [rdx + 8]
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.15]
	mov rdi, rdx
	mov rdx, rsi
	mov rsi, rax
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB52_20:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.17]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB52_19:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.24]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.25]
	mov esi, 55
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB52_17:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.14]
	mov rdi, rdx
	mov rdx, rsi
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
