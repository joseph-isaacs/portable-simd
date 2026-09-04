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
	jb .LBB55_23
	movabs r10, 9223372036854775792
	and r10, rcx
	mov r9d, ecx
	and r9d, 15
	test r10, r10
	je .LBB55_9
	lea r8, [rcx - 16]
	mov rbx, r8
	shr rbx, 4
	inc rbx
	mov edx, ebx
	and edx, 3
	cmp r8, 48
	jae .LBB55_4
	xor r11d, r11d
	mov r8, rax
	jmp .LBB55_7
.LBB55_4:
	and rbx, -4
	xor r11d, r11d
	vbroadcasti128 ymm0, xmmword ptr [rip + .LCPI55_6]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI55_1]
	vpbroadcastq xmm2, qword ptr [rip + .LCPI55_2]
	mov r14, rdi
	mov r8, rax
.LBB55_5:
	vmovdqu xmm3, xmmword ptr [r14]
	vinserti128 ymm3, ymm3, xmmword ptr [r14 + 3], 1
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	vpand xmm3, xmm2, xmm3
	vmovdqu xmmword ptr [r8], xmm3
	vmovdqu xmm3, xmmword ptr [r14 + 6]
	vinserti128 ymm3, ymm3, xmmword ptr [r14 + 9], 1
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [r8 + 16], xmm3
	vmovdqu xmm3, xmmword ptr [r14 + 12]
	vinserti128 ymm3, ymm3, xmmword ptr [r14 + 15], 1
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [r8 + 32], xmm3
	add r11, 4
	vmovdqu xmm3, xmmword ptr [r14 + 18]
	vinserti128 ymm3, ymm3, xmmword ptr [r14 + 21], 1
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [r8 + 48], xmm3
	add r8, 64
	add r14, 24
	cmp rbx, r11
	jne .LBB55_5
	test rdx, rdx
	je .LBB55_9
.LBB55_7:
	lea r11, [r11 + 2*r11]
	lea r11, [rdi + 2*r11]
	shl edx, 4
	xor ebx, ebx
	vbroadcasti128 ymm0, xmmword ptr [rip + .LCPI55_6]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI55_1]
	vpbroadcastq xmm2, qword ptr [rip + .LCPI55_2]
.LBB55_8:
	vmovdqu xmm3, xmmword ptr [r11]
	vinserti128 ymm3, ymm3, xmmword ptr [r11 + 3], 1
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [r8 + rbx], xmm3
	add r11, 6
	add rbx, 16
	cmp rdx, rbx
	jne .LBB55_8
.LBB55_9:
	test r9, r9
	je .LBB55_22
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB55_21
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB55_23
	add rax, r10
	add rdi, rdx
	lea rdx, [r8 - 5]
	movabs rcx, -6148914691236517205
	mulx rcx, rcx, rcx
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI55_4]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI55_7]
	jmp .LBB55_14
.LBB55_13:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB55_22
.LBB55_14:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB55_24
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB55_17
	xor ebx, ebx
	jmp .LBB55_19
.LBB55_17:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB55_13
	add r11, rbx
.LBB55_19:
	lea rbx, [rbx + 2*rbx]
.LBB55_20:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB55_20
	jmp .LBB55_13
.LBB55_22:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB55_24:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.18]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB55_23:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.25]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.26]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB55_21:
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.13]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
