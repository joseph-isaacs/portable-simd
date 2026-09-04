warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::indices::bitmap_to_indices_avx512:
	push rbp
	push r15
	push r14
	push rbx
	push rax
	test rsi, rsi
	je .LBB64_1
	shl rsi, 3
	mov r8d, 48
	xor eax, eax
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI64_0]
	xor r9d, r9d
.LBB64_3:
	mov r10, rcx
	sub r10, rax
	jb .LBB64_8
	cmp r10, 63
	jbe .LBB64_7
	mov r10, qword ptr [rdi + r9]
	lea r11, [rdx + 4*rax]
	lea ebx, [r8 - 48]
	vpbroadcastd zmm1, ebx
	vpord zmm1, zmm1, zmm0
	kmovd k1, r10d
	vpcompressd zmm1 {k1} {z}, zmm1
	vmovdqu64 zmmword ptr [rdx + 4*rax], zmm1
	movzx ebx, r10w
	popcnt ebx, ebx
	mov ebp, r10d
	shr ebp, 16
	lea r14d, [r8 - 32]
	vpbroadcastd zmm1, r14d
	vpord zmm1, zmm1, zmm0
	popcnt r14d, ebp
	kmovd k1, ebp
	vpcompressd zmm1 {k1} {z}, zmm1
	vmovdqu64 zmmword ptr [r11 + 4*rbx], zmm1
	mov r15, r10
	shr r15, 32
	lea ebp, [r8 - 16]
	vpbroadcastd zmm1, ebp
	movzx ebp, r15w
	kmovd k1, r15d
	vpord zmm1, zmm1, zmm0
	vpcompressd zmm1 {k1} {z}, zmm1
	add r14d, ebx
	vmovdqu64 zmmword ptr [r11 + 4*r14], zmm1
	popcnt ebx, ebp
	add ebx, r14d
	shr r10, 48
	vpbroadcastd zmm1, r8d
	vpord zmm1, zmm1, zmm0
	kmovd k1, r10d
	vpcompressd zmm1 {k1} {z}, zmm1
	vmovdqu64 zmmword ptr [r11 + 4*rbx], zmm1
	popcnt r10d, r10d
	add r10d, ebx
	add rax, r10
	add r9, 8
	add r8d, 64
	cmp rsi, r9
	jne .LBB64_3
	jmp .LBB64_6
.LBB64_1:
	xor eax, eax
.LBB64_6:
	add rsp, 8
	pop rbx
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB64_8:
	lea r8, [rip + .Lanon.7f2c312b5472e5928991000022678349.28]
	mov rdi, rax
	mov rsi, rcx
	mov rdx, rcx
	mov rcx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB64_7:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.60]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.63]
	mov esi, 33
	vzeroupper
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
