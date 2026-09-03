bitpacking::byte_to_bit::bytes_to_bits_portable32:
	push rbx
	mov rax, rdi
	mov r8d, esi
	and r8d, 63
	mov rdi, rsi
	shr rdi, 6
	cmp rcx, rdi
	mov r10, rdi
	cmovb r10, rcx
	test r10, r10
	je .LBB7_6
	mov r9d, r10d
	and r9d, 3
	cmp r10, 4
	jae .LBB7_25
	xor r11d, r11d
	jmp .LBB7_4
.LBB7_25:
	movabs r11, 144115188075855868
	and r10, r11
	lea rbx, [rax + 224]
	xor r11d, r11d
.LBB7_26:
	vmovdqu64 zmm0, zmmword ptr [rbx - 224]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 160]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 8], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 96]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 16], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 32]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 24], k0
	add r11, 4
	add rbx, 256
	cmp r10, r11
	jne .LBB7_26
	test r9, r9
	je .LBB7_6
.LBB7_4:
	lea r10, [rdx + 8*r11]
	shl r11, 6
	add r11, rax
	add r11, 32
	shl r9d, 3
	xor ebx, ebx
.LBB7_5:
	vmovdqu64 zmm0, zmmword ptr [r11 + 8*rbx - 32]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [r10 + rbx], k0
	add rbx, 8
	cmp r9, rbx
	jne .LBB7_5
.LBB7_6:
	test r8, r8
	je .LBB7_23
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp r8, 4
	jae .LBB7_9
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB7_19
.LBB7_9:
	cmp r8d, 16
	jae .LBB7_14
	xor r10d, r10d
	xor eax, eax
	jmp .LBB7_11
.LBB7_14:
	mov r10d, esi
	and r10d, 48
	add rax, r11
	add rax, 12
	vmovdqa ymm1, ymmword ptr [rip + .LCPI7_0]
	vpxor xmm0, xmm0, xmm0
	vpbroadcastq ymm2, qword ptr [rip + .LCPI7_1]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI7_2]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI7_3]
	xor r11d, r11d
	vpbroadcastq ymm5, qword ptr [rip + .LCPI7_4]
	vpxor xmm6, xmm6, xmm6
	vpxor xmm8, xmm8, xmm8
	vpxor xmm7, xmm7, xmm7
.LBB7_15:
	vpaddq ymm9, ymm1, ymm2
	vpaddq ymm10, ymm1, ymm3
	vmovd xmm11, dword ptr [rax + r11 - 12]
	vmovd xmm12, dword ptr [rax + r11 - 8]
	vmovd xmm13, dword ptr [rax + r11 - 4]
	vmovd xmm14, dword ptr [rax + r11]
	vpaddq ymm15, ymm1, ymm4
	vptestmb k0, xmm11, xmm11
	vptestmb k1, xmm12, xmm12
	vptestmb k2, xmm13, xmm13
	vptestmb k3, xmm14, xmm14
	vpmovm2q ymm11, k0
	vpsrlq ymm11, ymm11, 63
	vpmovm2q ymm12, k1
	vpsrlq ymm12, ymm12, 63
	vpsllvq ymm9, ymm12, ymm9
	vpor ymm8, ymm9, ymm8
	vpmovm2q ymm9, k2
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm10
	vpor ymm7, ymm9, ymm7
	vpmovm2q ymm9, k3
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm15
	vpor ymm0, ymm9, ymm0
	vpsllvq ymm9, ymm11, ymm1
	vpor ymm6, ymm9, ymm6
	add r11, 16
	vpaddq ymm1, ymm1, ymm5
	cmp r10, r11
	jne .LBB7_15
	vpor ymm1, ymm8, ymm6
	vpternlogq ymm0, ymm7, ymm1, 254
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB7_21
	test sil, 12
	je .LBB7_18
.LBB7_11:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vpbroadcastq ymm1, r11
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI7_0]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI7_1]
.LBB7_12:
	vmovd xmm3, dword ptr [r9 + r11]
	vptestmb k0, xmm3, xmm3
	vpmovm2q ymm3, k0
	vpsrlq ymm3, ymm3, 63
	vpsllvq ymm3, ymm3, ymm1
	vpor ymm0, ymm3, ymm0
	add r11, 4
	vpaddq ymm1, ymm1, ymm2
	cmp r10, r11
	jne .LBB7_12
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB7_21
.LBB7_19:
	add r9, r8
.LBB7_20:
	xor r8d, r8d
	cmp byte ptr [rsi], 0
	setne r8b
	shlx r8, r8, r10
	inc r10
	inc rsi
	or rax, r8
	cmp rsi, r9
	jne .LBB7_20
.LBB7_21:
	cmp rdi, rcx
	jae .LBB7_24
	mov qword ptr [rdx + 8*rdi], rax
.LBB7_23:
	pop rbx
	vzeroupper
	ret
.LBB7_18:
	lea rsi, [r9 + r10]
	jmp .LBB7_19
.LBB7_24:
	lea rdx, [rip + .Lanon.fa1c7c224075ac75ac5ae5bb0234f729.11]
	mov rsi, rcx
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
