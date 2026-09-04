warning: function `popcount_epi64_avx512` is never used
  --> src/rank.rs:77:22
   |
77 | pub(crate) unsafe fn popcount_epi64_avx512(v: core::arch::x86_64::__m512i) -> core::arch::x86_64::__m512i {
   |                      ^^^^^^^^^^^^^^^^^^^^^
   |
   = note: `#[warn(dead_code)]` (part of `#[warn(unused)]`) on by default
warning: `bitpacking` (lib) generated 1 warning
bitpacking::select::select_naive:
	test rsi, rsi
	je .LBB50_1
	shl rsi, 3
	xor eax, eax
	xor ecx, ecx
	xor r9d, r9d
	mov r10, rdx
.LBB50_3:
	mov r8, qword ptr [rdi + r9]
	popcnt r11, r8
	sub r10, r11
	jb .LBB50_6
	add r9, 8
	add rcx, -64
	mov rdx, r10
	cmp rsi, r9
	jne .LBB50_3
	ret
.LBB50_1:
	xor eax, eax
	ret
.LBB50_6:
	test rdx, rdx
	je .LBB50_12
	lea esi, [rdx - 1]
	mov eax, edx
	and eax, 7
	cmp esi, 7
	jb .LBB50_11
	and edx, -8
.LBB50_9:
	blsr rsi, r8
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr rsi, rsi
	blsr r8, rsi
	add edx, -8
	jne .LBB50_9
	test eax, eax
	je .LBB50_12
.LBB50_11:
	blsr r8, r8
	dec eax
	jne .LBB50_11
.LBB50_12:
	tzcnt rdx, r8
	sub rdx, rcx
	mov eax, 1
	ret
