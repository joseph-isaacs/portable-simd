warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::unpack::unpack3_portable_shift:
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
	jb .LBB61_22
	movabs r11, 9223372036854775792
	movabs r10, -6148914691236517205
	and r11, rcx
	je .LBB61_6
	mov rdx, rsi
	mulx r9, r9, r10
	shr r9, 2
	lea rdx, [rsi - 26]
	mulx r8, r8, r10
	shr r8, 2
	inc r8
	lea rdx, [r9 + 2*r9]
	lea r9, [rdx + rdx + 6]
	xor edx, edx
	vmovdqa ymm0, ymmword ptr [rip + .LCPI61_0]
	vbroadcasti128 ymm1, xmmword ptr [rip + .LCPI61_5]
	vpbroadcastd xmm2, dword ptr [rip + .LCPI61_6]
	xor ebx, ebx
.LBB61_3:
	cmp r9, rdx
	je .LBB61_20
	dec r8
	je .LBB61_24
	vpbroadcastq ymm3, qword ptr [rdi + rdx]
	vpshufb ymm3, ymm3, ymm0
	vpsrlvw ymm3, ymm3, ymm1
	vpmovwb xmm3, ymm3
	add rdx, 6
	vpand xmm3, xmm3, xmm2
	vmovdqu xmmword ptr [rax + rbx], xmm3
	add rbx, 16
	cmp r11, rbx
	jne .LBB61_3
.LBB61_6:
	mov r9d, ecx
	and r9d, 15
	je .LBB61_21
	shr rcx, 4
	add rcx, rcx
	lea rdx, [rcx + 2*rcx]
	mov r8, rsi
	sub r8, rdx
	jb .LBB61_18
	lea rcx, [r9 + 2*r9]
	mov esi, ecx
	shr esi, 3
	and ecx, 7
	cmp rcx, 1
	sbb rsi, -1
	or rsi, 64
	cmp r8, rsi
	jb .LBB61_22
	add rax, r11
	add rdi, rdx
	lea rdx, [r8 - 5]
	mulx rcx, rcx, r10
	shr rcx
	xor esi, esi
	vmovdqa64 zmm0, zmmword ptr [rip + .LCPI61_3]
	vpbroadcastd xmm1, dword ptr [rip + .LCPI61_6]
	jmp .LBB61_11
.LBB61_10:
	sub r9, r10
	inc rsi
	test r9, r9
	je .LBB61_21
.LBB61_11:
	cmp r9, 8
	mov r10d, 8
	cmovb r10, r9
	lea rdx, [rsi + 2*rsi]
	cmp rsi, rcx
	je .LBB61_23
	mov r11, rax
	add rax, r10
	mov rdx, qword ptr [rdi + rdx]
	cmp r9, 8
	jae .LBB61_14
	xor ebx, ebx
	jmp .LBB61_16
.LBB61_14:
	mov ebx, r10d
	and ebx, 8
	vpbroadcastq zmm2, rdx
	vpsrlvq zmm2, zmm2, zmm0
	vpmovqb xmm2, zmm2
	vpand xmm2, xmm2, xmm1
	vmovq qword ptr [r11], xmm2
	cmp r10, rbx
	je .LBB61_10
	add r11, rbx
.LBB61_16:
	lea rbx, [rbx + 2*rbx]
.LBB61_17:
	shrx r14, rdx, rbx
	and r14b, 7
	mov byte ptr [r11], r14b
	inc r11
	add rbx, 3
	cmp r11, rax
	jne .LBB61_17
	jmp .LBB61_10
.LBB61_21:
	add rsp, 8
	pop rbx
	pop r14
	vzeroupper
	ret
.LBB61_23:
	lea rsi, [rdx + 8]
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.18]
	mov rdi, rdx
	mov rdx, r8
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB61_20:
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.24]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
.LBB61_24:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.31]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.23]
	mov esi, 105
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB61_22:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.25]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.26]
	mov esi, 55
	vzeroupper
	call qword ptr [rip + core::panicking::panic_fmt@GOTPCREL]
.LBB61_18:
	lea rcx, [rip + .Lanon.7f2c312b5472e5928991000022678349.22]
	mov rdi, rdx
	mov rdx, rsi
	vzeroupper
	call qword ptr [rip + core::slice::index::slice_index_fail@GOTPCREL]
