warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::rank_index::rank_index_avx2:
	cmp rcx, rsi
	jb .LBB3_14
	mov eax, esi
	and eax, 3
	mov r8, rsi
	shr r8, 2
	je .LBB3_2
	vpxor xmm0, xmm0, xmm0
	cmp r8, 1
	jne .LBB3_5
	xor ecx, ecx
	vpxor xmm1, xmm1, xmm1
	jmp .LBB3_8
.LBB3_2:
	vpxor xmm1, xmm1, xmm1
	jmp .LBB3_9
.LBB3_5:
	movabs r9, 288230376151711742
	and r9, r8
	vpxor xmm2, xmm2, xmm2
	mov r10d, 16
	xor ecx, ecx
	vpbroadcastd ymm3, dword ptr [rip + .LCPI3_3]
	vbroadcasti128 ymm4, xmmword ptr [rip + .LCPI3_4]
	vmovdqa ymm5, ymmword ptr [rip + .LCPI3_2]
	vpxor xmm1, xmm1, xmm1
.LBB3_6:
	vmovdqu ymm6, ymmword ptr [rdi + 2*r10 - 32]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm3
	vpshufb ymm6, ymm4, ymm6
	vpand ymm7, ymm7, ymm3
	vpshufb ymm7, ymm4, ymm7
	vpaddb ymm6, ymm7, ymm6
	vpsadbw ymm6, ymm6, ymm2
	vpslldq ymm7, ymm6, 8
	vpaddq ymm7, ymm6, ymm7
	vmovdqa ymm8, ymm7
	vpermt2q ymm8, ymm5, ymm2
	vpaddq ymm7, ymm8, ymm7
	vpsubq ymm6, ymm1, ymm6
	vpaddq ymm6, ymm6, ymm7
	vpmovqd xmmword ptr [rdx + r10 - 16], ymm6
	vxorps xmm6, xmm6, xmm6
	vpermq ymm6, ymm7, 255
	vpaddq ymm1, ymm6, ymm1
	vmovdqu ymm6, ymmword ptr [rdi + 2*r10]
	vpsrlw ymm7, ymm6, 4
	vpand ymm6, ymm6, ymm3
	vpshufb ymm6, ymm4, ymm6
	vpand ymm7, ymm7, ymm3
	vpshufb ymm7, ymm4, ymm7
	vpaddb ymm6, ymm7, ymm6
	vpsadbw ymm6, ymm6, ymm2
	vpslldq ymm7, ymm6, 8
	vpaddq ymm7, ymm6, ymm7
	vmovdqa ymm8, ymm7
	vpermt2q ymm8, ymm5, ymm2
	vpaddq ymm7, ymm8, ymm7
	vpsubq ymm6, ymm1, ymm6
	vpaddq ymm6, ymm6, ymm7
	vpmovqd xmmword ptr [rdx + r10], ymm6
	add rcx, 2
	vxorps xmm6, xmm6, xmm6
	vpermq ymm6, ymm7, 255
	vpaddq ymm1, ymm6, ymm1
	add r10, 32
	cmp r9, rcx
	jne .LBB3_6
	test r8b, 1
	je .LBB3_9
.LBB3_8:
	mov r8, rcx
	shl r8, 5
	shl rcx, 4
	vmovdqu ymm2, ymmword ptr [rdi + r8]
	vpsrlw ymm3, ymm2, 4
	vpbroadcastd ymm4, dword ptr [rip + .LCPI3_3]
	vpand ymm2, ymm2, ymm4
	vbroadcasti128 ymm5, xmmword ptr [rip + .LCPI3_4]
	vpshufb ymm2, ymm5, ymm2
	vpand ymm3, ymm3, ymm4
	vpshufb ymm3, ymm5, ymm3
	vpaddb ymm2, ymm3, ymm2
	vpsadbw ymm2, ymm2, ymm0
	vpslldq ymm3, ymm2, 8
	vpaddq ymm3, ymm2, ymm3
	vmovdqa ymm4, ymmword ptr [rip + .LCPI3_2]
	vpermi2q ymm4, ymm3, ymm0
	vpaddq ymm0, ymm3, ymm4
	vpsubq ymm2, ymm1, ymm2
	vpaddq ymm2, ymm2, ymm0
	vpmovqd xmmword ptr [rdx + rcx], ymm2
	vpermq ymm0, ymm0, 255
	vpaddq ymm1, ymm0, ymm1
.LBB3_9:
	test rax, rax
	je .LBB3_13
	movabs rcx, 1152921504606846972
	and rsi, rcx
	mov rcx, qword ptr [rdi + 8*rsi]
	vmovd dword ptr [rdx + 4*rsi], xmm1
	cmp eax, 1
	je .LBB3_13
	vmovd r8d, xmm1
	popcnt rcx, rcx
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB3_13
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 8], ecx
.LBB3_13:
	vzeroupper
	ret
.LBB3_14:
	push rax
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.32]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.34]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
