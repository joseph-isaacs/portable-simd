bitpacking::bit_to_byte::bits_to_bytes_portable_int:
	push rax
	mov rax, rsi
	shl rax, 6
	cmp rcx, rax
	jb .LBB13_10
	shr rcx, 6
	cmp rcx, rsi
	cmovae rcx, rsi
	test rcx, rcx
	je .LBB13_7
	mov eax, ecx
	and eax, 7
	cmp rcx, 8
	jae .LBB13_8
	xor esi, esi
	jmp .LBB13_5
.LBB13_8:
	movabs rsi, 144115188075855864
	and rcx, rsi
	lea r8, [rdx + 448]
	xor esi, esi
	vpbroadcastd zmm0, dword ptr [rip + .LCPI13_1]
.LBB13_9:
	kmovq k1, qword ptr [rdi + 8*rsi]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 448], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 8]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 384], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 16]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 320], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 24]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 256], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 32]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 192], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 40]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 128], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 48]
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8 - 64], zmm1
	kmovq k1, qword ptr [rdi + 8*rsi + 56]
	add rsi, 8
	vmovdqu8 zmm1 {k1} {z}, zmm0
	vmovdqu64 zmmword ptr [r8], zmm1
	add r8, 512
	cmp rcx, rsi
	jne .LBB13_9
	test rax, rax
	je .LBB13_7
.LBB13_5:
	lea rcx, [rdi + 8*rsi]
	shl rsi, 6
	add rdx, rsi
	shl eax, 3
	xor esi, esi
.LBB13_6:
	kmovq k1, qword ptr [rcx + rsi]
	vmovdqu8 zmm0 {k1} {z}, zmmword ptr [rip + .LCPI13_0]
	vmovdqu64 zmmword ptr [rdx + 8*rsi], zmm0
	add rsi, 8
	cmp rax, rsi
	jne .LBB13_6
.LBB13_7:
	pop rax
	vzeroupper
	ret
.LBB13_10:
	lea rdi, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.37]
	lea rdx, [rip + .Lanon.d29534ef304efb84a2a169aa7d971929.45]
	mov esi, 46
	call qword ptr [rip + core::panicking::panic@GOTPCREL]
