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
	add r8, 64
	cmp rsi, r8
	jb .LBB58_23
	movabs r10, 9223372036854775776
	and r10, rcx
	mov r9d, ecx
	and r9d, 31
	test r10, r10
	je .LBB58_9
	lea r8, [rcx - 32]
	mov r11, r8
	shr r11, 5
	inc r11
	mov edx, r11d
	and edx, 3
	cmp r8, 96
	jae .LBB58_4
	xor r8d, r8d
	mov r14, rax
	jmp .LBB58_7
.LBB58_4:
	and r11, -4
	xor r8d, r8d
	vbroadcasti32x4 zmm0, xmmword ptr [rip + .LCPI58_6]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI58_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI58_2]
	mov rbx, rdi
	mov r14, rax
.LBB58_5:
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
	jne .LBB58_5
	test rdx, rdx
	je .LBB58_9
.LBB58_7:
	lea r8, [r8 + 2*r8]
	lea r8, [rdi + 4*r8]
	shl edx, 5
	xor r11d, r11d
	vbroadcasti32x4 zmm0, xmmword ptr [rip + .LCPI58_6]
	vbroadcasti32x4 zmm1, xmmword ptr [rip + .LCPI58_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI58_2]
.LBB58_8:
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
	jne .LBB58_8
.LBB58_9:
	test r9, r9
	je .LBB58_22
	shr rcx, 5
	shl rcx, 2
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB58_21
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB58_23
	add rax, r10
	add rdi, rdx
	lea rdx, [r8 - 5]
	movabs rcx, -6148914691236517205
	mulx rcx, rcx, rcx
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI58_4]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI58_7]
	jmp .LBB58_14
.LBB58_13:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB58_22
.LBB58_14:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB58_24
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB58_17
	xor ebx, ebx
	jmp .LBB58_19
.LBB58_17:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB58_13
	add r11, rbx
.LBB58_19:
	lea rbx, [rbx + 2*rbx]
.LBB58_20:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB58_20
	jmp .LBB58_13
.LBB58_22:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB58_24:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.18]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB58_23:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.25]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.26]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB58_21:
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.17]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
