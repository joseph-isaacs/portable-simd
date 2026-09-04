bitpacking::unpack::unpack3_vbmi:
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
	jb .LBB57_23
	movabs r10, 9223372036854775744
	and r10, rcx
	mov r9d, ecx
	and r9d, 63
	test r10, r10
	je .LBB57_9
	lea r8, [rcx - 64]
	mov rbx, r8
	shr rbx, 6
	inc rbx
	mov edx, ebx
	and edx, 7
	cmp r8, 448
	jae .LBB57_4
	xor r11d, r11d
	mov r8, rax
	jmp .LBB57_7
.LBB57_4:
	and rbx, -8
	xor r11d, r11d
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI57_0]
	vpbroadcastq zmm1, qword ptr [rip + .LCPI57_1]
	vpbroadcastq zmm2, qword ptr [rip + .LCPI57_2]
	mov r14, rdi
	mov r8, rax
.LBB57_5:
	vpermb zmm3, zmm0, zmmword ptr [r14]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 24]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 64], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 48]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 128], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 72]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 192], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 96]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 256], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 120]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 320], zmm3
	vpermb zmm3, zmm0, zmmword ptr [r14 + 144]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 384], zmm3
	add r11, 8
	vpermb zmm3, zmm0, zmmword ptr [r14 + 168]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + 448], zmm3
	add r8, 512
	add r14, 192
	cmp rbx, r11
	jne .LBB57_5
	test rdx, rdx
	je .LBB57_9
.LBB57_7:
	lea r11, [r11 + 2*r11]
	lea r11, [rdi + 8*r11]
	shl edx, 6
	xor ebx, ebx
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI57_0]
	vpbroadcastq zmm1, qword ptr [rip + .LCPI57_1]
	vpbroadcastq zmm2, qword ptr [rip + .LCPI57_2]
.LBB57_8:
	vpermb zmm3, zmm0, zmmword ptr [r11]
	vpmultishiftqb zmm3, zmm1, zmm3
	vpandq zmm3, zmm3, zmm2
	vmovdqu64 zmmword ptr [r8 + rbx], zmm3
	add r11, 24
	add rbx, 64
	cmp rdx, rbx
	jne .LBB57_8
.LBB57_9:
	test r9, r9
	je .LBB57_22
	shr rcx, 6
	shl rcx, 3
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB57_21
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB57_23
	add rax, r10
	add rdi, rdx
	lea rdx, [r8 - 5]
	movabs rcx, -6148914691236517205
	mulx rcx, rcx, rcx
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI57_4]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI57_6]
	jmp .LBB57_14
.LBB57_13:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB57_22
.LBB57_14:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB57_24
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB57_17
	xor ebx, ebx
	jmp .LBB57_19
.LBB57_17:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB57_13
	add r11, rbx
.LBB57_19:
	lea rbx, [rbx + 2*rbx]
.LBB57_20:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB57_20
	jmp .LBB57_13
.LBB57_22:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB57_24:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.18]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB57_23:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.25]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.26]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB57_21:
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.16]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
