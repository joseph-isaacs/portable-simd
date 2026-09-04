warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::indices::bitmap_to_indices_vbmi2:
	push rax
	xor r8d, r8d
	test rsi, rsi
	je .LBB63_1
	shl rsi, 3
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI63_0]
	xor r9d, r9d
	xor eax, eax
.LBB63_3:
	mov r10, rcx
	sub r10, rax
	jb .LBB63_8
	cmp r10, 63
	jbe .LBB63_7
	mov r10, qword ptr [rdi + r9]
	popcnt r11, r10
	kmovq k1, r10
	vpcompressb zmm1 {k1} {z}, zmm0
	vpbroadcastd zmm2, r8d
	vpmovzxbd zmm3, xmm1
	vpaddd zmm3, zmm2, zmm3
	vmovdqu64 zmmword ptr [rdx + 4*rax], zmm3
	vextracti128 xmm3, ymm1, 1
	vpmovzxbd zmm3, xmm3
	vpaddd zmm3, zmm2, zmm3
	vmovdqu64 zmmword ptr [rdx + 4*rax + 64], zmm3
	vextracti32x4 xmm3, zmm1, 2
	vpmovzxbd zmm3, xmm3
	vpaddd zmm3, zmm2, zmm3
	vmovdqu64 zmmword ptr [rdx + 4*rax + 128], zmm3
	vextracti32x4 xmm1, zmm1, 3
	vpmovzxbd zmm1, xmm1
	vpaddd zmm1, zmm2, zmm1
	vmovdqu64 zmmword ptr [rdx + 4*rax + 192], zmm1
	add rax, r11
	add r9, 8
	add r8d, 64
	cmp rsi, r9
	jne .LBB63_3
	pop rcx
	vzeroupper
	ret
.LBB63_1:
	xor eax, eax
	pop rcx
	ret
.LBB63_8:
	lea r8, [rip + .Lanon.7f2c312b5472e5928991000022678349.28]
	mov rdi, rax
	mov rsi, rcx
	mov rdx, rcx
	mov rcx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB63_7:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.60]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.62]
	mov esi, 33
	vzeroupper
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
