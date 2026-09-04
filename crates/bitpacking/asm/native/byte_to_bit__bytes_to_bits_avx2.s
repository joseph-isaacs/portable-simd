warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::byte_to_bit::bytes_to_bits_avx2:
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
	je .LBB14_8
	mov r9d, r10d
	and r9d, 7
	cmp r10, 8
	jae .LBB14_3
	xor r11d, r11d
	jmp .LBB14_6
.LBB14_3:
	movabs r11, 144115188075855864
	and r10, r11
	lea rbx, [rax + 480]
	xor r11d, r11d
.LBB14_4:
	vmovdqu64 zmm0, zmmword ptr [rbx - 480]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 416]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 8], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 352]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 16], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 288]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 24], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 224]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 32], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 160]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 40], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 96]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 48], k0
	vmovdqu64 zmm0, zmmword ptr [rbx - 32]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [rdx + 8*r11 + 56], k0
	add r11, 8
	add rbx, 512
	cmp r10, r11
	jne .LBB14_4
	test r9, r9
	je .LBB14_8
.LBB14_6:
	lea r10, [rdx + 8*r11]
	shl r11, 6
	lea r11, [r11 + rax + 32]
	shl r9d, 3
	xor ebx, ebx
.LBB14_7:
	vmovdqu64 zmm0, zmmword ptr [r11 + 8*rbx - 32]
	vptestmb k0, zmm0, zmm0
	kmovq qword ptr [r10 + rbx], k0
	add rbx, 8
	cmp r9, rbx
	jne .LBB14_7
.LBB14_8:
	test r8, r8
	je .LBB14_25
	movabs r11, 9223372036854775744
	and r11, rsi
	lea r9, [rax + r11]
	cmp r8, 4
	jae .LBB14_11
	xor eax, eax
	xor r10d, r10d
	mov rsi, r9
	jmp .LBB14_21
.LBB14_11:
	cmp r8d, 16
	jae .LBB14_16
	xor r10d, r10d
	xor eax, eax
	jmp .LBB14_13
.LBB14_16:
	mov r10d, esi
	and r10d, 48
	lea rax, [r11 + rax + 12]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI14_0]
	vpxor xmm0, xmm0, xmm0
	xor r11d, r11d
	vpbroadcastq ymm2, qword ptr [rip + .LCPI14_1]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI14_2]
	vpbroadcastq ymm4, qword ptr [rip + .LCPI14_3]
	vpbroadcastq ymm5, qword ptr [rip + .LCPI14_4]
	vpxor xmm6, xmm6, xmm6
	vpxor xmm8, xmm8, xmm8
	vpxor xmm7, xmm7, xmm7
.LBB14_17:
	vpaddq ymm9, ymm1, ymm2
	vpaddq ymm10, ymm1, ymm3
	vpaddq ymm11, ymm1, ymm4
	vmovd xmm12, dword ptr [rax + r11 - 12]
	vmovd xmm13, dword ptr [rax + r11 - 8]
	vmovd xmm14, dword ptr [rax + r11 - 4]
	vmovd xmm15, dword ptr [rax + r11]
	vptestmb k0, xmm12, xmm12
	vptestmb k1, xmm13, xmm13
	vptestmb k2, xmm14, xmm14
	vptestmb k3, xmm15, xmm15
	vpmovm2q ymm12, k0
	vpsrlq ymm12, ymm12, 63
	vpmovm2q ymm13, k1
	vpsrlq ymm13, ymm13, 63
	vpsllvq ymm9, ymm13, ymm9
	vpor ymm8, ymm9, ymm8
	vpmovm2q ymm9, k2
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm10
	vpor ymm7, ymm9, ymm7
	vpmovm2q ymm9, k3
	vpsrlq ymm9, ymm9, 63
	vpsllvq ymm9, ymm9, ymm11
	vpor ymm0, ymm9, ymm0
	vpsllvq ymm9, ymm12, ymm1
	vpor ymm6, ymm9, ymm6
	add r11, 16
	vpaddq ymm1, ymm1, ymm5
	cmp r10, r11
	jne .LBB14_17
	vpor ymm1, ymm8, ymm6
	vpternlogq ymm0, ymm7, ymm1, 254
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB14_23
	test sil, 12
	je .LBB14_20
.LBB14_13:
	mov r11, r10
	mov r10d, esi
	and r10d, 60
	lea rsi, [r9 + r10]
	vmovq xmm0, rax
	vpbroadcastq ymm1, r11
	vpor ymm1, ymm1, ymmword ptr [rip + .LCPI14_0]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI14_1]
.LBB14_14:
	vmovd xmm3, dword ptr [r9 + r11]
	vptestmb k0, xmm3, xmm3
	vpmovm2q ymm3, k0
	vpsrlq ymm3, ymm3, 63
	vpsllvq ymm3, ymm3, ymm1
	vpor ymm0, ymm3, ymm0
	add r11, 4
	vpaddq ymm1, ymm1, ymm2
	cmp r10, r11
	jne .LBB14_14
	vextracti128 xmm1, ymm0, 1
	vpor xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpor xmm0, xmm0, xmm1
	vmovq rax, xmm0
	cmp r8d, r10d
	je .LBB14_23
.LBB14_21:
	add r9, r8
.LBB14_22:
	xor r8d, r8d
	cmp byte ptr [rsi], 0
	setne r8b
	shlx r8, r8, r10
	inc r10
	inc rsi
	or rax, r8
	cmp rsi, r9
	jne .LBB14_22
.LBB14_23:
	cmp rdi, rcx
	jae .LBB14_26
	mov qword ptr [rdx + 8*rdi], rax
.LBB14_25:
	pop rbx
	vzeroupper
	ret
.LBB14_20:
	lea rsi, [r9 + r10]
	jmp .LBB14_21
.LBB14_26:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.48]
	mov rsi, rcx
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
