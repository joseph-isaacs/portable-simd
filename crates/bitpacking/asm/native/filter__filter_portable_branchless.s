warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::filter::filter_portable_branchless:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 16], rdx
	mov qword ptr [rsp + 8], rdi
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 32], rcx
	cmp rsi, rcx
	jne .LBB47_27
	mov rbx, rsi
	shr rbx, 3
	je .LBB47_2
	shl rbx, 6
	xor r14d, r14d
	xor r15d, r15d
	xor r10d, r10d
	xor r12d, r12d
	xor r11d, r11d
	xor edi, edi
.LBB47_14:
	cmp rdi, r9
	jae .LBB47_23
	mov rax, qword ptr [rsp + 16]
	vmovdqu64 zmm1, zmmword ptr [rax + r15]
	mov rax, qword ptr [rsp + 8]
	vpandq zmm0, zmm1, zmmword ptr [rax + r15]
	vmovdqa64 zmm2, zmm1
	vpternlogq zmm2, zmm1, zmm1, 15
	vpaddq zmm3, zmm2, zmm2
	vpsllq zmm4, zmm2, 2
	vpternlogq zmm4, zmm3, zmm2, 150
	vpsllq zmm2, zmm4, 2
	vpxorq zmm2, zmm2, zmm3
	vpsllq zmm4, zmm2, 4
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 8
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 16
	vpxorq zmm2, zmm4, zmm2
	vpsllq zmm4, zmm2, 32
	vpxorq zmm2, zmm4, zmm2
	vpandq zmm4, zmm2, zmm1
	vpsrlq zmm5, zmm4, 1
	vpternlogq zmm5, zmm4, zmm1, 246
	vpandq zmm4, zmm2, zmm0
	vpsrlq zmm6, zmm4, 1
	vpternlogq zmm6, zmm4, zmm0, 246
	vpandnq zmm0, zmm2, zmm3
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm5
	vpsrlq zmm4, zmm3, 2
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandq zmm3, zmm3, zmm6
	vpsrlq zmm5, zmm3, 2
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm4
	vpsrlq zmm6, zmm3, 4
	vpternlogq zmm6, zmm3, zmm4, 246
	vpandq zmm3, zmm3, zmm5
	vpsrlq zmm4, zmm3, 4
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm6
	vpsrlq zmm5, zmm3, 8
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandq zmm3, zmm3, zmm4
	vpsrlq zmm6, zmm3, 8
	vpternlogq zmm6, zmm3, zmm4, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm2, zmm2, zmm0
	vpsllq zmm3, zmm2, 2
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm5
	vpsrlq zmm4, zmm3, 16
	vpternlogq zmm4, zmm3, zmm5, 246
	vpandq zmm3, zmm3, zmm6
	vpsrlq zmm5, zmm3, 16
	vpternlogq zmm5, zmm3, zmm6, 246
	vpandnq zmm0, zmm2, zmm0
	vpaddq zmm2, zmm0, zmm0
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 2
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 4
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 8
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 16
	vpxorq zmm0, zmm2, zmm0
	vpsllq zmm2, zmm0, 32
	vpxorq zmm2, zmm2, zmm0
	vpternlogq zmm2, zmm5, zmm4, 128
	vpsrlq zmm0, zmm2, 32
	vpternlogq zmm0, zmm2, zmm5, 246
	vpopcntq zmm1, zmm1
	vmovq rax, xmm0
	xor r13d, r13d
	mov ecx, r10d
	shld r13, rax, cl
	vmovd ebp, xmm1
	add ebp, r10d
	shlx rax, rax, r10
	test r10b, 64
	cmovne r13, rax
	cmovne rax, r14
	or rax, r12
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, ebp
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB47_23
	or r13, r11
	mov ecx, ebp
	and ecx, 63
	test bpl, 64
	cmovne rax, r13
	mov r12d, 0
	cmove r12, r13
	vpextrd r11d, xmm1, 2
	add r11d, ecx
	vpextrq r13, xmm0, 1
	shlx r10, r13, rcx
	or r10, rax
	mov qword ptr [r8 + 8*rdi], r10
	mov eax, r11d
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB47_23
	not cl
	shr r13
	shrx rcx, r13, rcx
	or rcx, r12
	mov eax, r11d
	and eax, 63
	test r11b, 64
	cmovne r10, rcx
	mov r12d, 0
	cmove r12, rcx
	vextracti128 xmm2, ymm1, 1
	vmovd r11d, xmm2
	add r11d, eax
	vextracti128 xmm2, ymm0, 1
	vmovq r13, xmm2
	shlx rcx, r13, rax
	or rcx, r10
	mov qword ptr [r8 + 8*rdi], rcx
	mov edx, r11d
	shr edx, 6
	add rdi, rdx
	cmp rdi, r9
	jae .LBB47_23
	not al
	shr r13
	shrx rdx, r13, rax
	or rdx, r12
	mov eax, r11d
	and eax, 63
	test r11b, 64
	cmovne rcx, rdx
	mov r12d, 0
	vextracti128 xmm2, ymm1, 1
	vpextrd r11d, xmm2, 2
	cmove r12, rdx
	add r11d, eax
	vextracti128 xmm2, ymm0, 1
	vpextrq r13, xmm2, 1
	shlx r10, r13, rax
	or r10, rcx
	mov qword ptr [r8 + 8*rdi], r10
	mov ecx, r11d
	shr ecx, 6
	add rdi, rcx
	cmp rdi, r9
	jae .LBB47_23
	not al
	shr r13
	shrx rax, r13, rax
	or rax, r12
	mov ecx, r11d
	and ecx, 63
	test r11b, 64
	cmovne r10, rax
	mov r12d, 0
	cmove r12, rax
	vextracti32x4 xmm2, zmm1, 2
	vmovd r11d, xmm2
	add r11d, ecx
	vextracti32x4 xmm3, zmm0, 2
	vmovq r13, xmm3
	shlx rax, r13, rcx
	or rax, r10
	mov qword ptr [r8 + 8*rdi], rax
	mov edx, r11d
	shr edx, 6
	add rdi, rdx
	cmp rdi, r9
	jae .LBB47_23
	not cl
	shr r13
	shrx rcx, r13, rcx
	or rcx, r12
	mov r10d, r11d
	and r10d, 63
	test r11b, 64
	cmovne rax, rcx
	mov r12d, 0
	cmove r12, rcx
	vpextrd r11d, xmm2, 2
	add r11d, r10d
	vpextrq r13, xmm3, 1
	shlx rcx, r13, r10
	or rcx, rax
	mov qword ptr [r8 + 8*rdi], rcx
	mov eax, r11d
	shr eax, 6
	add rdi, rax
	cmp rdi, r9
	jae .LBB47_23
	not r10b
	shr r13
	shrx rax, r13, r10
	or rax, r12
	mov r10d, r11d
	and r10d, 63
	test r11b, 64
	cmovne rcx, rax
	mov r12d, 0
	cmove r12, rax
	vextracti32x4 xmm1, zmm1, 3
	vmovd r11d, xmm1
	add r11d, r10d
	vextracti32x4 xmm0, zmm0, 3
	vmovq r13, xmm0
	shlx rax, r13, r10
	or rax, rcx
	mov qword ptr [r8 + 8*rdi], rax
	mov ecx, r11d
	shr ecx, 6
	add rcx, rdi
	cmp rcx, r9
	jae .LBB47_22
	not r10b
	shr r13
	shrx rdx, r13, r10
	or rdx, r12
	mov edi, r11d
	and edi, 63
	test r11b, 64
	cmovne rax, rdx
	cmovne rdx, r14
	vpextrd r10d, xmm1, 2
	add r10d, edi
	vpextrq r11, xmm0, 1
	shlx r12, r11, rdi
	or r12, rax
	not dil
	shr r11
	shrx r11, r11, rdi
	or r11, rdx
	mov qword ptr [r8 + 8*rcx], r12
	mov edi, r10d
	shr edi, 6
	add rdi, rcx
	test r10b, 64
	cmovne r12, r11
	cmovne r11, r14
	and r10d, 63
	add r15, 64
	cmp rbx, r15
	jne .LBB47_14
	mov ebx, esi
	and ebx, 7
	jne .LBB47_4
	jmp .LBB47_9
.LBB47_2:
	xor edi, edi
	xor r12d, r12d
	xor r11d, r11d
	xor r10d, r10d
	mov ebx, esi
	and ebx, 7
	je .LBB47_9
.LBB47_4:
	shl rsi, 3
	movabs rax, 9223372036854775744
	and rax, rsi
	add qword ptr [rsp + 8], rax
	add qword ptr [rsp + 16], rax
	xor r14d, r14d
	jmp .LBB47_5
.LBB47_8:
	inc r14
	mov r11, r13
	cmp rbx, r14
	je .LBB47_9
.LBB47_5:
	mov r15, r12
	mov ecx, r10d
	mov rax, qword ptr [rsp + 16]
	mov r10, qword ptr [rax + 8*r14]
	mov rax, qword ptr [rsp + 8]
	mov r13, qword ptr [rax + 8*r14]
	and r13, r10
	mov rsi, r10
	not rsi
	lea rax, [rsi + rsi]
	lea r12, [4*rsi]
	xor r12, rax
	xor r12, rsi
	shl r12, 2
	xor r12, rax
	mov rsi, r12
	shl rsi, 4
	xor rsi, r12
	mov r12, rsi
	shl r12, 8
	xor r12, rsi
	mov rsi, r12
	shl rsi, 16
	xor rsi, r12
	mov r12, rsi
	shl r12, 32
	xor r12, rsi
	mov rbp, r12
	and rbp, r10
	mov rsi, rbp
	xor rsi, r10
	shr rbp
	or rbp, rsi
	andn rax, r12, rax
	and r12, r13
	xor r13, r12
	shr r12
	or r12, r13
	lea rsi, [rax + rax]
	xor rsi, rax
	lea r13, [4*rsi]
	xor r13, rsi
	mov rsi, r13
	shl rsi, 4
	xor rsi, r13
	mov r13, rsi
	shl r13, 8
	xor r13, rsi
	mov rsi, r13
	shl rsi, 16
	xor rsi, r13
	mov r13, rsi
	shl r13, 32
	xor r13, rsi
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rsi, r13
	shr rsi, 2
	or rsi, rbp
	and r13, r12
	xor r12, r13
	shr r13, 2
	or r13, r12
	lea r12, [rax + rax]
	xor r12, rax
	lea rbp, [4*r12]
	xor rbp, r12
	mov r12, rbp
	shl r12, 4
	xor r12, rbp
	mov rbp, r12
	shl rbp, 8
	xor rbp, r12
	mov rdx, rbp
	shl rdx, 16
	xor rdx, rbp
	mov r12, rdx
	shl r12, 32
	xor r12, rdx
	andn rax, r12, rax
	and r12, rsi
	xor rsi, r12
	mov rbp, r12
	shr rbp, 4
	or rbp, rsi
	and r12, r13
	xor r13, r12
	shr r12, 4
	or r12, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea rsi, [4*rdx]
	xor rsi, rdx
	mov rdx, rsi
	shl rdx, 4
	xor rdx, rsi
	mov rsi, rdx
	shl rsi, 8
	xor rsi, rdx
	mov rdx, rsi
	shl rdx, 16
	xor rdx, rsi
	mov r13, rdx
	shl r13, 32
	xor r13, rdx
	andn rax, r13, rax
	and r13, rbp
	xor rbp, r13
	mov rsi, r13
	shr rsi, 8
	or rsi, rbp
	and r13, r12
	xor r12, r13
	shr r13, 8
	or r13, r12
	lea rdx, [rax + rax]
	xor rdx, rax
	lea r12, [4*rdx]
	xor r12, rdx
	mov rdx, r12
	shl rdx, 4
	xor rdx, r12
	mov r12, rdx
	shl r12, 8
	xor r12, rdx
	mov rdx, r12
	shl rdx, 16
	xor rdx, r12
	mov rbp, rdx
	shl rbp, 32
	xor rbp, rdx
	andn rax, rbp, rax
	and rbp, rsi
	xor rsi, rbp
	mov r12, rbp
	shr r12, 16
	or r12, rsi
	and rbp, r13
	xor r13, rbp
	shr rbp, 16
	or rbp, r13
	lea rdx, [rax + rax]
	xor rdx, rax
	lea rax, [4*rdx]
	xor rax, rdx
	mov rdx, rax
	shl rdx, 4
	xor rdx, rax
	mov rax, rdx
	shl rax, 8
	xor rax, rdx
	mov rdx, rax
	shl rdx, 16
	xor rdx, rax
	mov rax, rdx
	shl rax, 32
	xor rax, rdx
	and r12, rbp
	and r12, rax
	xor rbp, r12
	shr r12, 32
	or r12, rbp
	popcnt r10, r10
	xor r13d, r13d
	shld r13, r12, cl
	shlx r12, r12, rcx
	test cl, 64
	cmovne r13, r12
	mov eax, 0
	cmovne r12, rax
	or r13, r11
	or r12, r15
	add r10d, ecx
	cmp r10d, 63
	jbe .LBB47_8
	cmp rdi, r9
	jae .LBB47_25
	mov qword ptr [r8 + 8*rdi], r12
	inc rdi
	add r10d, -64
	mov r12, r13
	xor r13d, r13d
	jmp .LBB47_8
.LBB47_9:
	test r10d, r10d
	je .LBB47_12
	cmp rdi, r9
	jae .LBB47_24
	mov qword ptr [r8 + 8*rdi], r12
.LBB47_12:
	shl rdi, 6
	mov eax, r10d
	add rax, rdi
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB47_27:
	lea r9, [rip + .Lanon.7f2c312b5472e5928991000022678349.11]
	lea rsi, [rsp + 24]
	lea rdx, [rsp + 32]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB47_22:
	mov rdi, rcx
.LBB47_23:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.7]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB47_25:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.6]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB47_24:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.5]
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
