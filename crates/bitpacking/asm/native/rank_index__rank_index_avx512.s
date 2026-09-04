warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::rank_index::rank_index_avx512:
	cmp rcx, rsi
	jb .LBB4_18
	mov eax, esi
	and eax, 7
	mov r8, rsi
	shr r8, 3
	je .LBB4_2
	vpxor xmm1, xmm1, xmm1
	cmp r8, 1
	jne .LBB4_5
	xor ecx, ecx
	vpxor xmm0, xmm0, xmm0
	jmp .LBB4_8
.LBB4_2:
	vpxor xmm0, xmm0, xmm0
	jmp .LBB4_9
.LBB4_5:
	movabs r9, 144115188075855870
	and r9, r8
	vpxor xmm2, xmm2, xmm2
	mov r10d, 32
	xor ecx, ecx
	vpbroadcastq zmm3, qword ptr [rip + .LCPI4_0]
	vpxor xmm0, xmm0, xmm0
.LBB4_6:
	vpopcntq zmm4, zmmword ptr [rdi + 2*r10 - 64]
	valignq zmm5, zmm4, zmm2, 7
	vpaddq zmm5, zmm5, zmm4
	valignq zmm6, zmm5, zmm2, 6
	vpaddq zmm5, zmm6, zmm5
	vinserti64x4 zmm6, zmm2, ymm5, 1
	vpaddq zmm5, zmm6, zmm5
	vpsubq zmm4, zmm0, zmm4
	vpaddq zmm4, zmm4, zmm5
	vpmovqd ymmword ptr [rdx + r10 - 32], zmm4
	vpxor xmm4, xmm4, xmm4
	vpermq zmm4, zmm3, zmm5
	vpopcntq zmm5, zmmword ptr [rdi + 2*r10]
	vpaddq zmm0, zmm4, zmm0
	valignq zmm4, zmm5, zmm2, 7
	vpaddq zmm4, zmm4, zmm5
	valignq zmm6, zmm4, zmm2, 6
	vpaddq zmm4, zmm6, zmm4
	vinserti64x4 zmm6, zmm2, ymm4, 1
	vpaddq zmm4, zmm6, zmm4
	vpsubq zmm5, zmm0, zmm5
	vpaddq zmm5, zmm5, zmm4
	vpmovqd ymmword ptr [rdx + r10], zmm5
	add rcx, 2
	vpermq zmm4, zmm3, zmm4
	vpaddq zmm0, zmm4, zmm0
	add r10, 64
	cmp r9, rcx
	jne .LBB4_6
	test r8b, 1
	je .LBB4_9
.LBB4_8:
	mov r8, rcx
	shl r8, 6
	shl rcx, 5
	vpopcntq zmm2, zmmword ptr [rdi + r8]
	valignq zmm3, zmm2, zmm1, 7
	vpaddq zmm3, zmm3, zmm2
	valignq zmm4, zmm3, zmm1, 6
	vpaddq zmm3, zmm4, zmm3
	vinserti64x4 zmm1, zmm1, ymm3, 1
	vpaddq zmm1, zmm1, zmm3
	vpsubq zmm2, zmm0, zmm2
	vpaddq zmm2, zmm2, zmm1
	vpmovqd ymmword ptr [rdx + rcx], zmm2
	vpbroadcastq zmm2, qword ptr [rip + .LCPI4_0]
	vpermq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
.LBB4_9:
	test rax, rax
	je .LBB4_17
	movabs rcx, 1152921504606846968
	and rsi, rcx
	mov rcx, qword ptr [rdi + 8*rsi]
	vmovd dword ptr [rdx + 4*rsi], xmm0
	cmp eax, 1
	je .LBB4_17
	vmovd r8d, xmm0
	popcnt rcx, rcx
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 8]
	mov dword ptr [rdx + 4*rsi + 4], ecx
	cmp eax, 2
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 16]
	mov dword ptr [rdx + 4*rsi + 8], ecx
	cmp eax, 3
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 24]
	mov dword ptr [rdx + 4*rsi + 12], ecx
	cmp eax, 4
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov r8, qword ptr [rdi + 8*rsi + 32]
	mov dword ptr [rdx + 4*rsi + 16], ecx
	cmp eax, 5
	je .LBB4_17
	popcnt r8, r8
	add ecx, r8d
	mov rdi, qword ptr [rdi + 8*rsi + 40]
	mov dword ptr [rdx + 4*rsi + 20], ecx
	cmp eax, 6
	je .LBB4_17
	popcnt rax, rdi
	add ecx, eax
	mov dword ptr [rdx + 4*rsi + 24], ecx
.LBB4_17:
	vzeroupper
	ret
.LBB4_18:
	push rax
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.32]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.35]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
