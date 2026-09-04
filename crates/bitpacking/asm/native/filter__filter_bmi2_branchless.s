warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::filter::filter_bmi2_branchless:
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 16
	mov qword ptr [rsp], rsi
	mov qword ptr [rsp + 8], rcx
	cmp rsi, rcx
	jne .LBB45_14
	xor r10d, r10d
	test rsi, rsi
	je .LBB45_2
	xor ecx, ecx
	xor eax, eax
	xor r11d, r11d
	xor r14d, r14d
	xor ebx, ebx
.LBB45_4:
	cmp rax, r9
	jae .LBB45_13
	mov r15, qword ptr [rdi + 8*rbx]
	mov r12, qword ptr [rdx + 8*rbx]
	pext r13, r15, r12
	inc rbx
	popcnt r15, r12
	add r15d, ecx
	xor r12d, r12d
	shld r12, r13, cl
	shlx r13, r13, rcx
	test cl, 64
	cmovne r12, r13
	cmovne r13, r10
	or r12, r14
	or r11, r13
	mov qword ptr [r8 + 8*rax], r11
	mov ecx, r15d
	shr ecx, 6
	add rax, rcx
	test r15b, 64
	mov r14, r12
	cmovne r14, r10
	cmovne r11, r12
	mov ecx, r15d
	and ecx, 63
	cmp rsi, rbx
	jne .LBB45_4
	test ecx, ecx
	je .LBB45_7
	cmp rax, r9
	jae .LBB45_11
	mov qword ptr [r8 + 8*rax], r11
	mov r10d, ecx
	jmp .LBB45_10
.LBB45_2:
	xor eax, eax
	jmp .LBB45_10
.LBB45_7:
	xor r10d, r10d
.LBB45_10:
	shl rax, 6
	or rax, r10
	add rsp, 16
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	ret
.LBB45_14:
	lea r9, [rip + .Lanon.7f2c312b5472e5928991000022678349.4]
	mov rsi, rsp
	lea rdx, [rsp + 8]
	xor edi, edi
	xor ecx, ecx
	call qword ptr [rip + core::panicking::assert_failed::<usize, usize>@GOTPCREL]
.LBB45_13:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.7]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
.LBB45_11:
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.5]
	mov rdi, rax
	mov rsi, r9
	call qword ptr [rip + core::panicking::panic_bounds_check@GOTPCREL]
