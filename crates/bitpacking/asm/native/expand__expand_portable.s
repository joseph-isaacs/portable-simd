warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
 `release` profile [optimized + debuginfo] target(s) in 0.02s
bitpacking::expand::expand_portable:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 120
	mov qword ptr [rsp + 48], r8
	mov qword ptr [rsp + 40], rdx
	mov qword ptr [rsp], rdi
	cmp r9, rcx
	jb .LBB35_57
	mov r14, -1
	mov eax, ecx
	and eax, 7
	mov qword ptr [rsp + 56], rax
	mov qword ptr [rsp + 64], rcx
	shr rcx, 3
	mov qword ptr [rsp + 16], rsi
	je .LBB35_2
	shl rcx, 6
	xor r15d, r15d
	mov al, 4
	kmovd k1, eax
	mov al, 8
	kmovd k2, eax
	mov al, 16
	kmovd k3, eax
	mov al, 32
	kmovd k4, eax
	mov al, 64
	kmovd k5, eax
	mov al, -128
	kmovd k6, eax
	xor edx, edx
	xor eax, eax
	xor r13d, r13d
	xor r12d, r12d
	xor r11d, r11d
	mov qword ptr [rsp + 72], rcx
	jmp .LBB35_8
.LBB35_51:
	mov rsi, qword ptr [rsp + 16]
	mov r13, qword ptr [rsp + 8]
.LBB35_56:
	test r10b, 64
	shrx rdi, rbx, r10
	mov r11, rdi
	cmovne r11, r15
	mov r12, rdx
	mov ecx, r10d
	shrd r12, rbx, cl
	test r10b, 64
	shlx rcx, r14, r10
	cmovne rcx, r15
	cmovne r12, rdi
	andn rcx, rcx, rdx
	sub eax, r10d
	vpbroadcastq zmm1 {k6}, rcx
	vmovdqa64 zmm2, zmm0
	vpternlogq zmm2, zmm0, zmm0, 15
	vpaddq zmm4, zmm2, zmm2
	vpsllq zmm3, zmm2, 2
	vpternlogq zmm3, zmm4, zmm2, 150
	vpsllq zmm2, zmm3, 2
	vpxorq zmm2, zmm2, zmm4
	vpsllq zmm3, zmm2, 4
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 8
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 16
	vpxorq zmm2, zmm3, zmm2
	vpsllq zmm3, zmm2, 32
	vpxorq zmm2, zmm3, zmm2
	vpandq zmm3, zmm2, zmm0
	vpsrlq zmm5, zmm3, 1
	vpternlogq zmm5, zmm3, zmm0, 246
	vpandnq zmm6, zmm2, zmm4
	vpaddq zmm4, zmm6, zmm6
	vpxorq zmm4, zmm4, zmm6
	vpsllq zmm7, zmm4, 2
	vpxorq zmm4, zmm7, zmm4
	vpsllq zmm7, zmm4, 4
	vpxorq zmm4, zmm7, zmm4
	vpsllq zmm7, zmm4, 8
	vpxorq zmm4, zmm7, zmm4
	vpsllq zmm7, zmm4, 16
	vpxorq zmm4, zmm7, zmm4
	vpsllq zmm7, zmm4, 32
	vpxorq zmm7, zmm7, zmm4
	vpandq zmm4, zmm7, zmm5
	vpsrlq zmm8, zmm4, 2
	vpternlogq zmm8, zmm4, zmm5, 246
	vpandnq zmm5, zmm7, zmm6
	vpaddq zmm6, zmm5, zmm5
	vpxorq zmm6, zmm6, zmm5
	vpsllq zmm7, zmm6, 2
	vpxorq zmm6, zmm7, zmm6
	vpsllq zmm7, zmm6, 4
	vpxorq zmm6, zmm7, zmm6
	vpsllq zmm7, zmm6, 8
	vpxorq zmm6, zmm7, zmm6
	vpsllq zmm7, zmm6, 16
	vpxorq zmm6, zmm7, zmm6
	vpsllq zmm7, zmm6, 32
	vpxorq zmm6, zmm7, zmm6
	vpandq zmm7, zmm6, zmm8
	vpsrlq zmm9, zmm7, 4
	vpternlogq zmm9, zmm7, zmm8, 246
	vpandnq zmm5, zmm6, zmm5
	vpaddq zmm6, zmm5, zmm5
	vpxorq zmm6, zmm6, zmm5
	vpsllq zmm8, zmm6, 2
	vpxorq zmm6, zmm8, zmm6
	vpsllq zmm8, zmm6, 4
	vpxorq zmm6, zmm8, zmm6
	vpsllq zmm8, zmm6, 8
	vpxorq zmm6, zmm8, zmm6
	vpsllq zmm8, zmm6, 16
	vpxorq zmm6, zmm8, zmm6
	vpsllq zmm8, zmm6, 32
	vpxorq zmm6, zmm8, zmm6
	vpandq zmm8, zmm6, zmm9
	vpsrlq zmm10, zmm8, 8
	vpternlogq zmm10, zmm8, zmm9, 246
	vpandnq zmm5, zmm6, zmm5
	vpaddq zmm6, zmm5, zmm5
	vpxorq zmm6, zmm6, zmm5
	vpsllq zmm9, zmm6, 2
	vpxorq zmm6, zmm9, zmm6
	vpsllq zmm9, zmm6, 4
	vpxorq zmm6, zmm9, zmm6
	vpsllq zmm9, zmm6, 8
	vpxorq zmm6, zmm9, zmm6
	vpsllq zmm9, zmm6, 16
	vpxorq zmm6, zmm9, zmm6
	vpsllq zmm9, zmm6, 32
	vpxorq zmm6, zmm9, zmm6
	vpandq zmm9, zmm6, zmm10
	vpxorq zmm10, zmm9, zmm10
	vpsrlq zmm11, zmm9, 16
	vpandnq zmm5, zmm6, zmm5
	vpaddq zmm6, zmm5, zmm5
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 2
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 4
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 8
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 16
	vpxorq zmm5, zmm6, zmm5
	vpsllq zmm6, zmm5, 32
	vpxorq zmm5, zmm6, zmm5
	vpternlogq zmm5, zmm10, zmm11, 224
	vpsllq zmm6, zmm1, 32
	vpternlogq zmm6, zmm5, zmm1, 226
	vpsllq zmm1, zmm6, 16
	vpternlogq zmm1, zmm9, zmm6, 226
	vpsllq zmm5, zmm1, 8
	vpternlogq zmm5, zmm8, zmm1, 226
	vpsllq zmm1, zmm5, 4
	vpternlogq zmm1, zmm7, zmm5, 226
	vpsllq zmm5, zmm1, 2
	vpternlogq zmm5, zmm4, zmm1, 226
	vpaddq zmm1, zmm5, zmm5
	vpandnq zmm3, zmm3, zmm5
	vpandq zmm1, zmm1, zmm2
	vpternlogq zmm1, zmm0, zmm3, 200
	mov rcx, qword ptr [rsp + 48]
	mov rdx, qword ptr [rsp + 32]
	vmovdqu64 zmmword ptr [rcx + rdx], zmm1
	add rdx, 64
	mov rcx, qword ptr [rsp + 72]
	cmp rcx, rdx
	je .LBB35_3
.LBB35_8:
	mov rcx, qword ptr [rsp + 40]
	vmovdqu64 zmm0, zmmword ptr [rcx + rdx]
	vpopcntq zmm1, zmm0
	vmovd r10d, xmm1
	cmp eax, r10d
	mov qword ptr [rsp + 32], rdx
	jae .LBB35_19
	cmp r13, rsi
	jae .LBB35_10
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*r13]
	jmp .LBB35_18
.LBB35_10:
	xor edx, edx
.LBB35_18:
	inc r13
	xor edi, edi
	mov ecx, eax
	shld rdi, rdx, cl
	shlx rcx, rdx, rax
	test al, 64
	cmovne rdi, rcx
	cmovne rcx, r15
	or r11, rdi
	or r12, rcx
	add eax, 64
.LBB35_19:
	test r10b, 64
	shrx rdx, r11, r10
	mov rdi, rdx
	cmovne rdi, r15
	mov r9, r12
	mov ecx, r10d
	shrd r9, r11, cl
	test r10b, 64
	shlx rcx, r14, r10
	cmovne rcx, r15
	mov qword ptr [rsp + 112], rcx
	cmovne r9, rdx
	sub eax, r10d
	vpextrd r10d, xmm1, 2
	cmp eax, r10d
	jae .LBB35_24
	cmp r13, rsi
	jae .LBB35_21
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*r13]
	jmp .LBB35_23
.LBB35_21:
	xor edx, edx
.LBB35_23:
	inc r13
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdx, cl
	shlx rcx, rdx, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r15
	or rdi, r8
	or r9, rcx
	add eax, 64
.LBB35_24:
	test r10b, 64
	shrx r8, rdi, r10
	mov rdx, r8
	cmovne rdx, r15
	mov r11, r9
	mov ecx, r10d
	shrd r11, rdi, cl
	test r10b, 64
	shlx rcx, r14, r10
	cmovne rcx, r15
	mov qword ptr [rsp + 96], rcx
	cmovne r11, r8
	sub eax, r10d
	vextracti128 xmm2, ymm1, 1
	vmovd r10d, xmm2
	cmp eax, r10d
	mov qword ptr [rsp + 24], r9
	jae .LBB35_29
	cmp r13, rsi
	jae .LBB35_26
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rcx + 8*r13]
	jmp .LBB35_28
.LBB35_26:
	xor edi, edi
.LBB35_28:
	inc r13
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdi, cl
	shlx rcx, rdi, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r15
	or rdx, r8
	or r11, rcx
	add eax, 64
.LBB35_29:
	test r10b, 64
	shrx r8, rdx, r10
	mov r9, r8
	cmovne r9, r15
	mov rdi, r11
	mov ecx, r10d
	shrd rdi, rdx, cl
	test r10b, 64
	shlx rcx, r14, r10
	cmovne rcx, r15
	mov qword ptr [rsp + 88], rcx
	cmovne rdi, r8
	sub eax, r10d
	vextracti128 xmm2, ymm1, 1
	vpextrd r10d, xmm2, 2
	cmp eax, r10d
	mov qword ptr [rsp + 104], r11
	jae .LBB35_34
	cmp r13, rsi
	jae .LBB35_31
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*r13]
	jmp .LBB35_33
.LBB35_31:
	xor edx, edx
.LBB35_33:
	inc r13
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdx, cl
	shlx rcx, rdx, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r15
	or r9, r8
	or rdi, rcx
	add eax, 64
.LBB35_34:
	test r10b, 64
	shrx r11, r9, r10
	mov rdx, r11
	cmovne rdx, r15
	mov r8, rdi
	mov ecx, r10d
	shrd r8, r9, cl
	test r10b, 64
	shlx rcx, r14, r10
	cmovne rcx, r15
	mov qword ptr [rsp + 80], rcx
	cmovne r8, r11
	sub eax, r10d
	vextracti32x4 xmm2, zmm1, 2
	vmovd r10d, xmm2
	cmp eax, r10d
	jae .LBB35_39
	cmp r13, rsi
	jae .LBB35_36
	mov rcx, qword ptr [rsp]
	mov r9, qword ptr [rcx + 8*r13]
	jmp .LBB35_38
.LBB35_36:
	xor r9d, r9d
.LBB35_38:
	inc r13
	xor r11d, r11d
	mov ecx, eax
	shld r11, r9, cl
	shlx rcx, r9, rax
	test al, 64
	cmovne r11, rcx
	cmovne rcx, r15
	or rdx, r11
	or r8, rcx
	add eax, 64
.LBB35_39:
	xor ebp, ebp
	test r10b, 64
	shrx r11, rdx, r10
	mov r15, r11
	cmovne r15, rbp
	mov r9, r8
	mov ecx, r10d
	shrd r9, rdx, cl
	test r10b, 64
	shlx rbx, r14, r10
	cmovne rbx, rbp
	cmovne r9, r11
	sub eax, r10d
	vpextrd r10d, xmm2, 2
	cmp eax, r10d
	jae .LBB35_40
	cmp r13, rsi
	jae .LBB35_42
	mov rcx, qword ptr [rsp]
	mov rdx, qword ptr [rcx + 8*r13]
	jmp .LBB35_44
.LBB35_40:
	mov qword ptr [rsp + 8], r13
	mov rsi, -1
	xor ebp, ebp
	jmp .LBB35_45
.LBB35_42:
	xor edx, edx
.LBB35_44:
	mov rsi, -1
	inc r13
	mov qword ptr [rsp + 8], r13
	xor r11d, r11d
	mov ecx, eax
	shld r11, rdx, cl
	shlx rcx, rdx, rax
	test al, 64
	cmovne r11, rcx
	mov ebp, 0
	cmovne rcx, rbp
	or r15, r11
	or r9, rcx
	add eax, 64
.LBB35_45:
	test r10b, 64
	shrx r13, r15, r10
	mov r14, r13
	cmovne r14, rbp
	mov r11, r9
	mov ecx, r10d
	shrd r11, r15, cl
	test r10b, 64
	shlx rdx, rsi, r10
	cmovne rdx, rbp
	cmovne r11, r13
	sub eax, r10d
	vextracti32x4 xmm2, zmm1, 3
	vmovd r10d, xmm2
	cmp eax, r10d
	mov r15d, 0
	jae .LBB35_50
	mov rsi, qword ptr [rsp + 8]
	cmp rsi, qword ptr [rsp + 16]
	jae .LBB35_47
	mov rcx, qword ptr [rsp]
	mov r15, qword ptr [rcx + 8*rsi]
	jmp .LBB35_49
.LBB35_47:
	xor r15d, r15d
.LBB35_49:
	inc rsi
	mov qword ptr [rsp + 8], rsi
	xor r13d, r13d
	mov ecx, eax
	shld r13, r15, cl
	shlx rcx, r15, rax
	test al, 64
	cmovne r13, rcx
	mov r15d, 0
	cmovne rcx, r15
	or r14, r13
	or r11, rcx
	add eax, 64
.LBB35_50:
	mov rcx, qword ptr [rsp + 112]
	andn rcx, rcx, r12
	vmovq xmm1, rcx
	mov rcx, qword ptr [rsp + 96]
	andn rcx, rcx, qword ptr [rsp + 24]
	vpinsrq xmm3, xmm1, rcx, 1
	mov rcx, qword ptr [rsp + 88]
	andn rcx, rcx, qword ptr [rsp + 104]
	vinserti32x4 zmm1, zmm1, xmm3, 0
	vpbroadcastq zmm1 {k1}, rcx
	mov rcx, qword ptr [rsp + 80]
	andn rcx, rcx, rdi
	vpbroadcastq zmm1 {k2}, rcx
	andn rdi, rbx, r8
	andn r8, rdx, r9
	test r10b, 64
	shrx r9, r14, r10
	mov rbx, r9
	cmovne rbx, r15
	mov rdx, r11
	mov ecx, r10d
	shrd rdx, r14, cl
	vpbroadcastq zmm1 {k3}, rdi
	vpbroadcastq zmm1 {k4}, r8
	test r10b, 64
	cmovne rdx, r9
	mov r14, -1
	shlx rcx, r14, r10
	cmovne rcx, r15
	andn rcx, rcx, r11
	sub eax, r10d
	vpbroadcastq zmm1 {k5}, rcx
	vpextrd r10d, xmm2, 2
	cmp eax, r10d
	jae .LBB35_51
	mov rsi, qword ptr [rsp + 16]
	mov r13, qword ptr [rsp + 8]
	cmp r13, rsi
	jae .LBB35_53
	mov rcx, qword ptr [rsp]
	mov rdi, qword ptr [rcx + 8*r13]
	jmp .LBB35_55
.LBB35_53:
	xor edi, edi
.LBB35_55:
	inc r13
	xor r8d, r8d
	mov ecx, eax
	shld r8, rdi, cl
	shlx rcx, rdi, rax
	test al, 64
	cmovne r8, rcx
	cmovne rcx, r15
	or rbx, r8
	or rdx, rcx
	add eax, 64
	jmp .LBB35_56
.LBB35_2:
	xor r12d, r12d
	xor r11d, r11d
	xor r13d, r13d
	xor eax, eax
.LBB35_3:
	cmp qword ptr [rsp + 56], 0
	je .LBB35_16
	mov rdx, qword ptr [rsp + 64]
	shl rdx, 3
	movabs rcx, 9223372036854775744
	and rcx, rdx
	add qword ptr [rsp + 40], rcx
	add qword ptr [rsp + 48], rcx
	xor edx, edx
	jmp .LBB35_5
.LBB35_6:
	mov qword ptr [rsp + 8], r13
	xor r10d, r10d
.LBB35_15:
	test r9b, 64
	shrx rsi, r11, r9
	mov rcx, rsi
	cmovne rcx, r10
	mov qword ptr [rsp + 24], rcx
	mov r8, r12
	mov ecx, r9d
	shrd r8, r11, cl
	test r9b, 64
	mov rcx, r14
	not rcx
	mov rdx, -1
	shlx rdi, rdx, r9
	cmovne rdi, r10
	cmovne r8, rsi
	lea r11, [rcx + rcx]
	lea rsi, [4*rcx]
	xor rsi, r11
	xor rsi, rcx
	shl rsi, 2
	xor rsi, r11
	mov rcx, rsi
	shl rcx, 4
	xor rcx, rsi
	mov rsi, rcx
	shl rsi, 8
	xor rsi, rcx
	mov r10, rsi
	shl r10, 16
	xor r10, rsi
	mov rcx, r10
	shl rcx, 32
	xor rcx, r10
	mov rsi, rcx
	and rsi, r14
	mov r10, rsi
	xor r10, r14
	mov r15, rsi
	shr r15
	or r15, r10
	andn r10, rcx, r11
	lea r11, [r10 + r10]
	xor r11, r10
	lea rbx, [4*r11]
	xor rbx, r11
	mov r11, rbx
	shl r11, 4
	xor r11, rbx
	mov rbx, r11
	shl rbx, 8
	xor rbx, r11
	mov r13, rbx
	shl r13, 16
	xor r13, rbx
	mov r11, r13
	shl r11, 32
	xor r11, r13
	andn r10, r11, r10
	and r11, r15
	xor r15, r11
	mov rbp, r11
	shr rbp, 2
	or rbp, r15
	lea rbx, [r10 + r10]
	xor rbx, r10
	lea r15, [4*rbx]
	xor r15, rbx
	mov rbx, r15
	shl rbx, 4
	xor rbx, r15
	mov r15, rbx
	shl r15, 8
	xor r15, rbx
	mov rbx, r15
	shl rbx, 16
	xor rbx, r15
	mov r13, rbx
	shl r13, 32
	xor r13, rbx
	andn rbx, r13, r10
	and r13, rbp
	xor rbp, r13
	mov r15, r13
	shr r15, 4
	or r15, rbp
	lea r10, [rbx + rbx]
	xor r10, rbx
	lea rbp, [4*r10]
	xor rbp, r10
	mov r10, rbp
	shl r10, 4
	xor r10, rbp
	mov rbp, r10
	shl rbp, 8
	xor rbp, r10
	mov r10, rbp
	shl r10, 16
	xor r10, rbp
	mov rdx, r10
	shl rdx, 32
	xor rdx, r10
	andn rbx, rdx, rbx
	and rdx, r15
	xor r15, rdx
	mov rbp, rdx
	shr rbp, 8
	or rbp, r15
	lea r10, [rbx + rbx]
	xor r10, rbx
	lea r15, [4*r10]
	xor r15, r10
	mov r10, r15
	shl r10, 4
	xor r10, r15
	mov r15, r10
	shl r15, 8
	xor r15, r10
	mov r10, r15
	shl r10, 16
	xor r10, r15
	mov r15, r10
	shl r15, 32
	xor r15, r10
	andn r10, r15, rbx
	and r15, rbp
	xor rbp, r15
	mov rbx, r15
	shr rbx, 16
	or rbx, rbp
	lea rbp, [r10 + r10]
	xor rbp, r10
	lea r10, [4*rbp]
	xor r10, rbp
	mov rbp, r10
	shl rbp, 4
	xor rbp, r10
	mov r10, rbp
	shl r10, 8
	xor r10, rbp
	mov rbp, r10
	shl rbp, 16
	xor rbp, r10
	mov r10, rbp
	shl r10, 32
	xor r10, rbp
	and r10, rbx
	andn rdi, rdi, r12
	andn rbx, r10, rdi
	shl rdi, 32
	and rdi, r10
	or rdi, rbx
	andn r10, r15, rdi
	shl rdi, 16
	and rdi, r15
	or rdi, r10
	andn r10, rdx, rdi
	shl rdi, 8
	and rdi, rdx
	or rdi, r10
	andn rdx, r13, rdi
	shl rdi, 4
	and rdi, r13
	or rdi, rdx
	andn rdx, r11, rdi
	shl rdi, 2
	and rdi, r11
	or rdi, rdx
	sub eax, r9d
	andn rdx, rsi, rdi
	add rdi, rdi
	and rdi, rcx
	or rdi, rdx
	and rdi, r14
	mov rcx, qword ptr [rsp + 48]
	mov rdx, qword ptr [rsp + 32]
	mov qword ptr [rcx + 8*rdx], rdi
	inc rdx
	mov r12, r8
	mov r11, qword ptr [rsp + 24]
	cmp qword ptr [rsp + 56], rdx
	mov r13, qword ptr [rsp + 8]
	je .LBB35_16
.LBB35_5:
	mov rcx, qword ptr [rsp + 40]
	mov r14, qword ptr [rcx + 8*rdx]
	popcnt r9, r14
	cmp eax, r9d
	mov qword ptr [rsp + 32], rdx
	jae .LBB35_6
	cmp r13, qword ptr [rsp + 16]
	mov r10d, 0
	jae .LBB35_12
	mov rcx, qword ptr [rsp]
	mov rsi, qword ptr [rcx + 8*r13]
	jmp .LBB35_14
.LBB35_12:
	xor esi, esi
.LBB35_14:
	inc r13
	mov qword ptr [rsp + 8], r13
	xor edi, edi
	mov ecx, eax
	shld rdi, rsi, cl
	shlx rcx, rsi, rax
	test al, 64
	cmovne rdi, rcx
	cmovne rcx, r10
	or r11, rdi
	or r12, rcx
	add eax, 64
	jmp .LBB35_15
.LBB35_16:
	add rsp, 120
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB35_57:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.0]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.58]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
