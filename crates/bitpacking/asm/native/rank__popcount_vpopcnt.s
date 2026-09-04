warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::rank::popcount_vpopcnt:
	mov eax, esi
	and eax, 7
	lea r8, [8*rsi]
	mov rcx, r8
	and rcx, -64
	je .LBB26_1
	add r8, -64
	mov edx, r8d
	not edx
	test edx, 448
	jne .LBB26_4
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
	jmp .LBB26_6
.LBB26_1:
	xor ecx, ecx
	test rax, rax
	jne .LBB26_12
.LBB26_11:
	xor eax, eax
	add rax, rcx
	vzeroupper
	ret
.LBB26_4:
	mov r9d, r8d
	shr r9d, 6
	inc r9d
	and r9d, 7
	neg r9
	vpxor xmm0, xmm0, xmm0
	mov rdx, rdi
.LBB26_5:
	vpopcntq zmm1, zmmword ptr [rdx]
	add rdx, 64
	vpaddq zmm0, zmm1, zmm0
	inc r9
	jne .LBB26_5
.LBB26_6:
	cmp r8, 448
	jb .LBB26_9
	add rcx, rdi
.LBB26_8:
	vpopcntq zmm1, zmmword ptr [rdx]
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 64]
	vpopcntq zmm2, zmmword ptr [rdx + 128]
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 192]
	vpopcntq zmm2, zmmword ptr [rdx + 256]
	vpaddq zmm1, zmm2, zmm1
	vpopcntq zmm2, zmmword ptr [rdx + 320]
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	vpopcntq zmm1, zmmword ptr [rdx + 384]
	vpopcntq zmm2, zmmword ptr [rdx + 448]
	add rdx, 512
	vpaddq zmm1, zmm2, zmm1
	vpaddq zmm0, zmm1, zmm0
	cmp rdx, rcx
	jne .LBB26_8
.LBB26_9:
	vextracti64x4 ymm1, zmm0, 1
	vpaddq zmm0, zmm0, zmm1
	vextracti128 xmm1, ymm0, 1
	vpaddq xmm0, xmm0, xmm1
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rcx, xmm0
	test rax, rax
	je .LBB26_11
.LBB26_12:
	movabs rdx, 1152921504606846968
	and rsi, rdx
	lea rdx, [rdi + 8*rsi]
	movabs rsi, 2305843009213693951
	add rax, rsi
	mov sil, 61
	bzhi rsi, rax, rsi
	and eax, 3
	neg rax
	lea rax, [rsi + rax + 4]
	vpbroadcastq ymm0, rsi
	vpxor xmm3, xmm3, xmm3
	xor esi, esi
	vmovdqa ymm2, ymmword ptr [rip + .LCPI26_0]
.LBB26_13:
	vmovdqa ymm1, ymm3
	vpbroadcastq ymm3, rsi
	vpor ymm3, ymm3, ymm2
	vpcmpleuq k1, ymm3, ymm0
	vmovdqu64 ymm3 {k1} {z}, ymmword ptr [rdx + 8*rsi]
	vpopcntq ymm3, ymm3
	vpaddq ymm3, ymm3, ymm1
	add rsi, 4
	cmp rax, rsi
	jne .LBB26_13
	vmovdqa64 ymm1 {k1}, ymm3
	vextracti128 xmm0, ymm1, 1
	vpaddq xmm0, xmm1, xmm0
	vpshufd xmm1, xmm0, 238
	vpaddq xmm0, xmm0, xmm1
	vmovq rax, xmm0
	add rax, rcx
	vzeroupper
	ret
