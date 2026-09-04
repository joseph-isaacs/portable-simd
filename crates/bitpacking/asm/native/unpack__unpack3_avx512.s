bitpacking::unpack::unpack3_avx512:
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
	jb .LBB53_23
	movabs r10, 9223372036854775776
	and r10, rcx
	mov r9d, ecx
	and r9d, 31
	test r10, r10
	je .LBB53_9
	lea r8, [rcx - 32]
	mov r11, r8
	shr r11, 5
	inc r11
	mov edx, r11d
	and edx, 3
	cmp r8, 96
	jae .LBB53_4
	xor r8d, r8d
	mov r14, rax
	jmp .LBB53_7
.LBB53_4:
	and r11, -4
	xor r8d, r8d
	vbroadcasti32x4 zmm0, xmmword ptr [rip + .LCPI53_6]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI53_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI53_2]
	mov rbx, rdi
	mov r14, rax
.LBB53_5:
	vmovq xmm3, qword ptr [rbx]
	vmovq xmm4, qword ptr [rbx + 3]
	vinserti128 ymm3, ymm3, xmm4, 1
	vmovq xmm4, qword ptr [rbx + 6]
	vinserti32x4 zmm3, zmm3, xmm4, 2
	vmovq xmm4, qword ptr [rbx + 9]
	vinserti32x4 zmm3, zmm3, xmm4, 3
	vpshufb zmm3, zmm3, zmm0
	vpsrlvw zmm3, zmm3, zmm1
	vpmovwb ymm3, zmm3
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r14], ymm3
	vmovq xmm3, qword ptr [rbx + 12]
	vmovq xmm4, qword ptr [rbx + 15]
	vinserti128 ymm3, ymm3, xmm4, 1
	vmovq xmm4, qword ptr [rbx + 18]
	vinserti32x4 zmm3, zmm3, xmm4, 2
	vmovq xmm4, qword ptr [rbx + 21]
	vinserti32x4 zmm3, zmm3, xmm4, 3
	vpshufb zmm3, zmm3, zmm0
	vpsrlvw zmm3, zmm3, zmm1
	vpmovwb ymm3, zmm3
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r14 + 32], ymm3
	vmovq xmm3, qword ptr [rbx + 24]
	vmovq xmm4, qword ptr [rbx + 27]
	vinserti128 ymm3, ymm3, xmm4, 1
	vmovq xmm4, qword ptr [rbx + 30]
	vinserti32x4 zmm3, zmm3, xmm4, 2
	vmovq xmm4, qword ptr [rbx + 33]
	vinserti32x4 zmm3, zmm3, xmm4, 3
	vpshufb zmm3, zmm3, zmm0
	vpsrlvw zmm3, zmm3, zmm1
	vpmovwb ymm3, zmm3
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r14 + 64], ymm3
	vmovq xmm3, qword ptr [rbx + 36]
	vmovq xmm4, qword ptr [rbx + 39]
	vinserti128 ymm3, ymm3, xmm4, 1
	vmovq xmm4, qword ptr [rbx + 42]
	vinserti32x4 zmm3, zmm3, xmm4, 2
	vmovq xmm4, qword ptr [rbx + 45]
	vinserti32x4 zmm3, zmm3, xmm4, 3
	vpshufb zmm3, zmm3, zmm0
	vpsrlvw zmm3, zmm3, zmm1
	vpmovwb ymm3, zmm3
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r14 + 96], ymm3
	add r14, 128
	add r8, 4
	add rbx, 48
	cmp r11, r8
	jne .LBB53_5
	test rdx, rdx
	je .LBB53_9
.LBB53_7:
	lea r8, [r8 + 2*r8]
	lea r8, [rdi + 4*r8]
	shl edx, 5
	xor r11d, r11d
	vbroadcasti32x4 zmm0, xmmword ptr [rip + .LCPI53_6]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI53_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI53_2]
.LBB53_8:
	vmovq xmm3, qword ptr [r8]
	vmovq xmm4, qword ptr [r8 + 3]
	vinserti128 ymm3, ymm3, xmm4, 1
	vmovq xmm4, qword ptr [r8 + 6]
	vinserti32x4 zmm3, zmm3, xmm4, 2
	vmovq xmm4, qword ptr [r8 + 9]
	vinserti32x4 zmm3, zmm3, xmm4, 3
	vpshufb zmm3, zmm3, zmm0
	vpsrlvw zmm3, zmm3, zmm1
	vpmovwb ymm3, zmm3
	vpand ymm3, ymm3, ymm2
	vmovdqu ymmword ptr [r14 + r11], ymm3
	add r8, 12
	add r11, 32
	cmp rdx, r11
	jne .LBB53_8
.LBB53_9:
	test r9, r9
	je .LBB53_22
	shr rcx, 5
	shl rcx, 2
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB53_21
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 32
	cmp r8, rsi
	jb .LBB53_23
	add rax, r10
	add rdi, rdx
	lea rdx, [r8 - 5]
	movabs rcx, -6148914691236517205
	mulx rcx, rcx, rcx
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI53_4]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI53_7]
	jmp .LBB53_14
.LBB53_13:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB53_22
.LBB53_14:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB53_24
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB53_17
	xor ebx, ebx
	jmp .LBB53_19
.LBB53_17:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB53_13
	add r11, rbx
.LBB53_19:
	lea rbx, [rbx + 2*rbx]
.LBB53_20:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB53_20
	jmp .LBB53_13
.LBB53_22:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB53_24:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.17]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB53_23:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.24]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.25]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB53_21:
	lea rcx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.16]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
