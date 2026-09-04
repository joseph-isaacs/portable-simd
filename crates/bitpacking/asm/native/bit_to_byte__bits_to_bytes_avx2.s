warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::bit_to_byte::bits_to_bytes_avx2:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB7_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB7_9
	mov eax, ecx
	and eax, 3
	cmp rcx, 4
	jae .LBB7_4
	xor esi, esi
	jmp .LBB7_7
.LBB7_4:
	movabs rsi, 144115188075855868
	and rcx, rsi
	lea r8, [rdx + 224]
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI7_0]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI7_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI7_2]
	vpbroadcastd ymm3, dword ptr [rip + .LCPI7_4]
.LBB7_5:
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi]
	vpshufb ymm5, ymm4, ymm0
	vpshufb ymm4, ymm4, ymm1
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 224], ymm5
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8 - 192], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 8]
	vpshufb ymm5, ymm4, ymm0
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 160], ymm5
	vpshufb ymm4, ymm4, ymm1
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8 - 128], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 16]
	vpshufb ymm5, ymm4, ymm0
	vpshufb ymm4, ymm4, ymm1
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 96], ymm5
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8 - 64], ymm4
	vpbroadcastq ymm4, qword ptr [rdi + 8*rsi + 24]
	add rsi, 4
	vpshufb ymm5, ymm4, ymm0
	vpshufb ymm4, ymm4, ymm1
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [r8 - 32], ymm5
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [r8], ymm4
	add r8, 256
	cmp rcx, rsi
	jne .LBB7_5
	test rax, rax
	je .LBB7_9
.LBB7_7:
	lea rcx, [rdi + 8*rsi]
	shl rsi, 6
	lea rdx, [rsi + rdx + 32]
	shl eax, 3
	xor esi, esi
	vmovdqa ymm0, ymmword ptr [rip + .LCPI7_0]
	vmovdqa ymm1, ymmword ptr [rip + .LCPI7_1]
	vpbroadcastq ymm2, qword ptr [rip + .LCPI7_2]
	vpbroadcastd ymm3, dword ptr [rip + .LCPI7_4]
.LBB7_8:
	vpbroadcastq ymm4, qword ptr [rcx + rsi]
	vpshufb ymm5, ymm4, ymm0
	vpshufb ymm4, ymm4, ymm1
	vpand ymm5, ymm5, ymm2
	vpcmpeqb ymm5, ymm5, ymm2
	vpand ymm5, ymm5, ymm3
	vmovdqu ymmword ptr [rdx + 8*rsi - 32], ymm5
	vpand ymm4, ymm4, ymm2
	vpcmpeqb ymm4, ymm4, ymm2
	vpand ymm4, ymm4, ymm3
	vmovdqu ymmword ptr [rdx + 8*rsi], ymm4
	add rsi, 8
	cmp rax, rsi
	jne .LBB7_8
.LBB7_9:
	pop rax
	vzeroupper
	ret
.LBB7_10:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.38]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.40]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
