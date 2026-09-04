warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::expand::expand_scalar:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 56
	mov qword ptr [rsp + 48], r8
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp + 24], rsi
	mov qword ptr [rsp + 16], rdi
	cmp r9, rcx
	jb .LBB34_11
	test rcx, rcx
	je .LBB34_10
	xor r15d, r15d
	xor r9d, r9d
	xor eax, eax
	xor edi, edi
	mov qword ptr [rsp + 8], 0
	mov qword ptr [rsp + 32], rcx
	jmp .LBB34_3
.LBB34_4:
	xor r8d, r8d
.LBB34_9:
	test r10b, 64
	shrx rdx, rdi, r10
	mov r13, rdx
	cmovne r13, r8
	mov rbp, rax
	mov ecx, r10d
	shrd rbp, rdi, cl
	test r10b, 64
	mov rcx, -1
	shlx rcx, rcx, r10
	cmovne rcx, r8
	cmovne rbp, rdx
	andn rcx, rcx, rax
	sub r9d, r10d
	mov rax, r12
	not rax
	lea rdi, [rax + rax]
	lea rdx, [4*rax]
	xor rdx, rax
	xor rdx, rdi
	shl rdx, 2
	xor rdx, rdi
	mov rax, rdx
	shl rax, 4
	xor rax, rdx
	mov rdx, rax
	shl rdx, 8
	xor rdx, rax
	mov rax, rdx
	shl rax, 16
	xor rax, rdx
	mov r10, rax
	shl r10, 32
	xor r10, rax
	mov rbx, r10
	and rbx, r12
	mov rdx, rbx
	xor rdx, r12
	mov rax, rbx
	shr rax
	or rax, rdx
	andn rdx, r10, rdi
	lea rsi, [rdx + rdx]
	xor rsi, rdx
	lea rdi, [4*rsi]
	xor rdi, rsi
	mov rsi, rdi
	shl rsi, 4
	xor rsi, rdi
	mov rdi, rsi
	shl rdi, 8
	xor rdi, rsi
	mov rsi, rdi
	shl rsi, 16
	xor rsi, rdi
	mov rdi, rsi
	shl rdi, 32
	xor rdi, rsi
	andn rsi, rdi, rdx
	and rdi, rax
	xor rax, rdi
	mov r8, rdi
	shr r8, 2
	or r8, rax
	lea rax, [rsi + rsi]
	xor rax, rsi
	lea rdx, [4*rax]
	xor rdx, rax
	mov rax, rdx
	shl rax, 4
	xor rax, rdx
	mov rdx, rax
	shl rdx, 8
	xor rdx, rax
	mov r11, rdx
	shl r11, 16
	xor r11, rdx
	mov rax, r11
	shl rax, 32
	xor rax, r11
	andn rdx, rax, rsi
	and rax, r8
	xor r8, rax
	mov r11, rax
	shr r11, 4
	or r11, r8
	lea rsi, [rdx + rdx]
	xor rsi, rdx
	lea r8, [4*rsi]
	xor r8, rsi
	mov rsi, r8
	shl rsi, 4
	xor rsi, r8
	mov r8, rsi
	shl r8, 8
	xor r8, rsi
	mov rsi, r8
	shl rsi, 16
	xor rsi, r8
	mov r14, rsi
	shl r14, 32
	xor r14, rsi
	andn rdx, r14, rdx
	and r14, r11
	xor r11, r14
	mov r8, r14
	shr r8, 8
	or r8, r11
	lea rsi, [rdx + rdx]
	xor rsi, rdx
	lea r11, [4*rsi]
	xor r11, rsi
	mov rsi, r11
	shl rsi, 4
	xor rsi, r11
	mov r11, rsi
	shl r11, 8
	xor r11, rsi
	mov rsi, r11
	shl rsi, 16
	xor rsi, r11
	mov r11, rsi
	shl r11, 32
	xor r11, rsi
	andn rdx, r11, rdx
	and r11, r8
	xor r8, r11
	mov rsi, r11
	shr rsi, 16
	or rsi, r8
	lea r8, [rdx + rdx]
	xor r8, rdx
	lea rdx, [4*r8]
	xor rdx, r8
	mov r8, rdx
	shl r8, 4
	xor r8, rdx
	mov rdx, r8
	shl rdx, 8
	xor rdx, r8
	mov r8, rdx
	shl r8, 16
	xor r8, rdx
	mov rdx, r8
	shl rdx, 32
	xor rdx, r8
	and rdx, rsi
	andn rsi, rdx, rcx
	shl rcx, 32
	and rcx, rdx
	or rcx, rsi
	andn rdx, r11, rcx
	shl rcx, 16
	and rcx, r11
	or rcx, rdx
	andn rdx, r14, rcx
	shl rcx, 8
	and rcx, r14
	or rcx, rdx
	andn rdx, rax, rcx
	shl rcx, 4
	and rcx, rax
	or rcx, rdx
	andn rax, rdi, rcx
	shl rcx, 2
	and rcx, rdi
	or rcx, rax
	andn rax, rbx, rcx
	add rcx, rcx
	and rcx, r10
	or rcx, rax
	and rcx, r12
	mov rax, qword ptr [rsp + 48]
	mov qword ptr [rax + 8*r15], rcx
	inc r15
	mov rax, rbp
	mov rdi, r13
	cmp qword ptr [rsp + 32], r15
	je .LBB34_10
.LBB34_3:
	mov rcx, qword ptr [rsp + 40]
	mov r12, qword ptr [rcx + 8*r15]
	popcnt r10, r12
	cmp r9d, r10d
	jae .LBB34_4
	mov rcx, qword ptr [rsp + 8]
	cmp rcx, qword ptr [rsp + 24]
	mov r8d, 0
	jae .LBB34_6
	mov rcx, qword ptr [rsp + 16]
	mov rdx, qword ptr [rsp + 8]
	mov rdx, qword ptr [rcx + 8*rdx]
	mov rcx, qword ptr [rsp + 8]
	jmp .LBB34_8
.LBB34_6:
	xor edx, edx
.LBB34_8:
	inc rcx
	mov qword ptr [rsp + 8], rcx
	xor esi, esi
	mov ecx, r9d
	shld rsi, rdx, cl
	shlx rcx, rdx, r9
	test r9b, 64
	cmovne rsi, rcx
	cmovne rcx, r8
	or rdi, rsi
	or rax, rcx
	add r9d, 64
	jmp .LBB34_9
.LBB34_10:
	add rsp, 56
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	ret
.LBB34_11:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.0]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.2]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
