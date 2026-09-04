warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::filter::filter_vbmi2:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rcx
	cmp rsi, rcx
	jne .LBB38_16
	xor r10d, r10d
	test rsi, rsi
	je .LBB38_2
	xor r11d, r11d
	xor eax, eax
	xor r14d, r14d
	xor r12d, r12d
	xor ebx, ebx
	jmp .LBB38_4
.LBB38_7:
	inc rbx
	mov r12, r15
	cmp rsi, rbx
	je .LBB38_8
.LBB38_4:
	mov r13, r14
	mov ecx, r11d
	kmovq k0, qword ptr [rdi + 8*rbx]
	mov r14, qword ptr [rdx + 8*rbx]
	vpmovm2b zmm0, k0
	popcnt r11, r14
	kmovq k1, r14
	vpcompressb zmm0 {k1} {z}, zmm0
	vpmovb2m k0, zmm0
	kmovq r14, k0
	xor r15d, r15d
	shld r15, r14, cl
	shlx r14, r14, rcx
	test cl, 64
	cmovne r15, r14
	cmovne r14, r10
	or r15, r12
	or r14, r13
	add r11d, ecx
	cmp r11d, 63
	jbe .LBB38_7
	cmp rax, r9
	jae .LBB38_15
	mov qword ptr [r8 + 8*rax], r14
	inc rax
	add r11d, -64
	mov r14, r15
	xor r15d, r15d
	jmp .LBB38_7
.LBB38_8:
	test r11d, r11d
	je .LBB38_9
	cmp rax, r9
	jae .LBB38_13
	mov qword ptr [r8 + 8*rax], r14
	mov r10d, r11d
	jmp .LBB38_12
.LBB38_2:
	xor eax, eax
	jmp .LBB38_12
.LBB38_9:
	xor r10d, r10d
.LBB38_12:
	shl rax, 6
	add rax, r10
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	vzeroupper
	ret
.LBB38_16:
	lea r9, [rip + .Lanon.7f2c312b5472e5928991000022678349.4]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB38_15:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.6]
	mov rdi, rax
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB38_13:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.5]
	mov rdi, rax
	mov rsi, r9
	vzeroupper
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
