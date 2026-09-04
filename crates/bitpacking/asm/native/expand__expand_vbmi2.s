bitpacking::expand::expand_vbmi2:
	push rbp
	push r15
	push r14
	push r13
	push r12
	push rbx
	sub rsp, 40
	mov qword ptr [rsp + 16], rsi
	mov qword ptr [rsp + 8], rdi
	cmp r9, rcx
	jb .LBB33_4
	test rcx, rcx
	je .LBB33_24
	cmp rcx, 1
	jne .LBB33_5
	xor ebp, ebp
	xor eax, eax
	xor r13d, r13d
	xor ebx, ebx
	jmp .LBB33_18
.LBB33_5:
	movabs rsi, 1152921504606846974
	mov qword ptr [rsp + 24], rcx
	and rsi, rcx
	mov qword ptr [rsp + 32], rsi
	xor r15d, r15d
	xor r12d, r12d
	xor eax, eax
	xor r13d, r13d
	xor r11d, r11d
	xor ebx, ebx
	jmp .LBB33_6
.LBB33_14:
	mov rcx, qword ptr [rsp + 8]
	mov r11, qword ptr [rcx + 8*rbx]
.LBB33_15:
	inc rbx
	xor r13d, r13d
	mov ecx, eax
	shld r13, r11, cl
	shlx rcx, r11, rax
	test al, 64
	cmovne r13, rcx
	cmovne rcx, r15
	or rdi, r13
	or r9, rcx
	add eax, 64
.LBB33_16:
	lea rbp, [r12 + 2]
	test r10b, 64
	shrx rsi, rdi, r10
	mov r11, rsi
	cmovne r11, r15
	mov r13, r9
	mov ecx, r10d
	shrd r13, rdi, cl
	test r10b, 64
	mov rcx, -1
	shlx rcx, rcx, r10
	cmovne rcx, r15
	cmovne r13, rsi
	andn rcx, rcx, r9
	sub eax, r10d
	kmovq k0, rcx
	vpmovm2b zmm0, k0
	kmovq k1, r14
	vpexpandb zmm0 {k1} {z}, zmm0
	vpmovb2m k0, zmm0
	kmovq qword ptr [r8 + 8*r12 + 8], k0
	mov r12, rbp
	cmp qword ptr [rsp + 32], rbp
	je .LBB33_17
.LBB33_6:
	mov r14, qword ptr [rdx + 8*r12]
	popcnt r10, r14
	cmp eax, r10d
	jae .LBB33_11
	cmp rbx, qword ptr [rsp + 16]
	jae .LBB33_8
	mov rcx, qword ptr [rsp + 8]
	mov rdi, qword ptr [rcx + 8*rbx]
	jmp .LBB33_10
.LBB33_8:
	xor edi, edi
.LBB33_10:
	inc rbx
	xor r9d, r9d
	mov ecx, eax
	shld r9, rdi, cl
	shlx rcx, rdi, rax
	test al, 64
	cmovne r9, rcx
	cmovne rcx, r15
	or r11, r9
	or r13, rcx
	add eax, 64
.LBB33_11:
	test r10b, 64
	shrx rbp, r11, r10
	mov rdi, rbp
	cmovne rdi, r15
	mov r9, r13
	mov ecx, r10d
	shrd r9, r11, cl
	test r10b, 64
	mov rcx, -1
	shlx rcx, rcx, r10
	cmovne rcx, r15
	cmovne r9, rbp
	andn rcx, rcx, r13
	sub eax, r10d
	kmovq k0, rcx
	vpmovm2b zmm0, k0
	kmovq k1, r14
	vpexpandb zmm0 {k1} {z}, zmm0
	vpmovb2m k0, zmm0
	kmovq qword ptr [r8 + 8*r12], k0
	mov r14, qword ptr [rdx + 8*r12 + 8]
	popcnt r10, r14
	cmp eax, r10d
	jae .LBB33_16
	cmp rbx, qword ptr [rsp + 16]
	jb .LBB33_14
	xor r11d, r11d
	jmp .LBB33_15
.LBB33_17:
	test byte ptr [rsp + 24], 1
	je .LBB33_24
.LBB33_18:
	mov rcx, qword ptr [rdx + 8*rbp]
	popcnt rdx, rcx
	cmp eax, edx
	jae .LBB33_23
	cmp rbx, qword ptr [rsp + 16]
	jae .LBB33_20
	mov rsi, qword ptr [rsp + 8]
	mov rsi, qword ptr [rsi + 8*rbx]
	jmp .LBB33_22
.LBB33_20:
	xor esi, esi
.LBB33_22:
	xor edi, edi
	shlx rsi, rsi, rax
	test al, 64
	cmovne rsi, rdi
	or r13, rsi
.LBB33_23:
	mov rax, -1
	shlx rax, rax, rdx
	xor esi, esi
	test dl, 64
	cmove rsi, rax
	andn rax, rsi, r13
	kmovq k0, rax
	vpmovm2b zmm0, k0
	kmovq k1, rcx
	vpexpandb zmm0 {k1} {z}, zmm0
	vpmovb2m k0, zmm0
	kmovq qword ptr [r8 + 8*rbp], k0
.LBB33_24:
	add rsp, 40
	pop rbx
	pop r12
	pop r13
	pop r14
	pop r15
	pop rbp
	vzeroupper
	ret
.LBB33_4:
	lea rdi, [rip + .Lanon.7f2c312b5472e5928991000022678349.0]
	lea rdx, [rip + .Lanon.7f2c312b5472e5928991000022678349.2]
	mov esi, 41
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
