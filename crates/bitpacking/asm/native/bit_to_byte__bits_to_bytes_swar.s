warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::bit_to_byte::bits_to_bytes_swar:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB9_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB9_9
	cmp rcx, 4
	jae .LBB9_4
	xor eax, eax
	jmp .LBB9_7
.LBB9_4:
	movabs rax, 144115188075855868
	and rax, rcx
	lea rsi, [8*rcx]
	and rsi, -32
	xor r8d, r8d
	vpxor xmm0, xmm0, xmm0
	vmovdqa64 zmm1, zmmword ptr [rip + .LCPI9_0]
	vmovdqa64 zmm2, zmmword ptr [rip + .LCPI9_1]
	vmovdqa64 zmm3, zmmword ptr [rip + .LCPI9_2]
	vmovdqa64 zmm4, zmmword ptr [rip + .LCPI9_3]
	vpbroadcastq zmm5, qword ptr [rip + .LCPI9_4]
	vpbroadcastq zmm6, qword ptr [rip + .LCPI9_5]
	vpbroadcastq zmm7, qword ptr [rip + .LCPI9_6]
.LBB9_5:
	vbroadcasti64x4 zmm8, ymmword ptr [rdi + r8]
	vmovdqa64 zmm9, zmm8
	vpermt2b zmm9, zmm1, zmm0
	vmovdqa64 zmm10, zmm8
	vpermt2b zmm10, zmm2, zmm0
	vmovdqa64 zmm11, zmm8
	vpermt2b zmm11, zmm3, zmm0
	vpermt2b zmm8, zmm4, zmm0
	vpmullq zmm8, zmm8, zmm5
	vpmullq zmm11, zmm11, zmm5
	vpmullq zmm10, zmm10, zmm5
	vpmullq zmm9, zmm9, zmm5
	vpandq zmm9, zmm9, zmm6
	vpandq zmm10, zmm10, zmm6
	vpandq zmm11, zmm11, zmm6
	vpandq zmm8, zmm8, zmm6
	vpaddq zmm8, zmm8, zmm7
	vpaddq zmm11, zmm11, zmm7
	vpaddq zmm10, zmm10, zmm7
	vpaddq zmm9, zmm9, zmm7
	vpsrlq zmm9, zmm9, 7
	vpsrlq zmm10, zmm10, 7
	vpsrlq zmm11, zmm11, 7
	vpsrlq zmm8, zmm8, 7
	vpandq zmm8, zmm8, zmm5
	vpandq zmm11, zmm11, zmm5
	vpandq zmm10, zmm10, zmm5
	vpandq zmm9, zmm9, zmm5
	vmovdqu64 zmmword ptr [rdx + 8*r8 + 192], zmm9
	vmovdqu64 zmmword ptr [rdx + 8*r8 + 128], zmm10
	vmovdqu64 zmmword ptr [rdx + 8*r8 + 64], zmm11
	vmovdqu64 zmmword ptr [rdx + 8*r8], zmm8
	add r8, 32
	cmp rsi, r8
	jne .LBB9_5
	cmp rcx, rax
	je .LBB9_9
.LBB9_7:
	mov rsi, rax
	shl rsi, 6
	lea rdx, [rsi + rdx + 32]
	vmovdqa ymm0, ymmword ptr [rip + .LCPI9_7]
	vpbroadcastq ymm1, qword ptr [rip + .LCPI9_4]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI9_5]
	vpbroadcastq ymm3, qword ptr [rip + .LCPI9_6]
	vmovdqa ymm4, ymmword ptr [rip + .LCPI9_8]
.LBB9_8:
	vpbroadcastq ymm5, qword ptr [rdi + 8*rax]
	vpshufb ymm6, ymm5, ymm0
	vpmullq ymm6, ymm6, ymm1
	vpand ymm6, ymm6, ymm2
	vpaddq ymm6, ymm6, ymm3
	vpsrlq ymm6, ymm6, 7
	vpand ymm6, ymm6, ymm1
	vmovdqu ymmword ptr [rdx - 32], ymm6
	vpshufb ymm5, ymm5, ymm4
	vpmullq ymm5, ymm5, ymm1
	vpand ymm5, ymm5, ymm2
	vpaddq ymm5, ymm5, ymm3
	vpsrlq ymm5, ymm5, 7
	vpand ymm5, ymm5, ymm1
	vmovdqu ymmword ptr [rdx], ymm5
	inc rax
	add rdx, 64
	cmp rcx, rax
	jne .LBB9_8
.LBB9_9:
	pop rax
	vzeroupper
	ret
.LBB9_10:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.38]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.42]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
