	.file	"bitmask_repro.186758fa66f080eb-cgu.0"
	.section	.rodata.cst32,"aM",@progbits,32
	.p2align	5, 0x0
.LCPI0_0:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	2
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
	.byte	11
.LCPI0_2:
	.zero	32,1
.LCPI0_3:
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	13
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI0_1:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2, 0x0
.LCPI0_4:
	.zero	4,1
	.section	.text.bits_to_bytes,"ax",@progbits
	.globl	bits_to_bytes
	.p2align	4
	.type	bits_to_bytes,@function
bits_to_bytes:
	.cfi_startproc
	movq	%rdi, %rax
	vmovq	%rsi, %xmm0
	vpbroadcastq	%xmm0, %ymm0
	vpshufb	.LCPI0_0(%rip), %ymm0, %ymm1
	vpbroadcastq	.LCPI0_1(%rip), %ymm2
	vpand	%ymm2, %ymm1, %ymm1
	vpcmpeqb	%ymm2, %ymm1, %ymm1
	vpbroadcastd	.LCPI0_4(%rip), %ymm3
	vpshufb	.LCPI0_3(%rip), %ymm0, %ymm0
	vpand	%ymm3, %ymm1, %ymm1
	vpand	%ymm2, %ymm0, %ymm0
	vpcmpeqb	%ymm2, %ymm0, %ymm0
	vpand	%ymm3, %ymm0, %ymm0
	vmovdqa	%ymm0, 32(%rdi)
	vmovdqa	%ymm1, (%rdi)
	vzeroupper
	retq
.Lfunc_end0:
	.size	bits_to_bytes, .Lfunc_end0-bits_to_bytes
	.cfi_endproc

	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4, 0x0
.LCPI1_0:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
.LCPI1_2:
	.zero	16,1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3, 0x0
.LCPI1_1:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	128
	.section	.text.bits_to_bytes16,"ax",@progbits
	.globl	bits_to_bytes16
	.p2align	4
	.type	bits_to_bytes16,@function
bits_to_bytes16:
	.cfi_startproc
	vmovd	%esi, %xmm0
	vpshufb	.LCPI1_0(%rip), %xmm0, %xmm0
	movq	%rdi, %rax
	vpbroadcastq	.LCPI1_1(%rip), %xmm1
	vpand	%xmm1, %xmm0, %xmm0
	vpcmpeqb	%xmm1, %xmm0, %xmm0
	vpand	.LCPI1_2(%rip), %xmm0, %xmm0
	vmovdqa	%xmm0, (%rdi)
	retq
.Lfunc_end1:
	.size	bits_to_bytes16, .Lfunc_end1-bits_to_bytes16
	.cfi_endproc

	.section	.text.bytes_to_bits,"ax",@progbits
	.globl	bytes_to_bits
	.p2align	4
	.type	bytes_to_bits,@function
bytes_to_bits:
	.cfi_startproc
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpeqb	(%rdi), %ymm0, %ymm1
	vpmovmskb	%ymm1, %ecx
	vpcmpeqb	32(%rdi), %ymm0, %ymm0
	vpmovmskb	%ymm0, %eax
	shlq	$32, %rax
	orq	%rcx, %rax
	notq	%rax
	vzeroupper
	retq
.Lfunc_end2:
	.size	bytes_to_bits, .Lfunc_end2-bytes_to_bits
	.cfi_endproc

	.section	.text.bytes_to_bits16,"ax",@progbits
	.globl	bytes_to_bits16
	.p2align	4
	.type	bytes_to_bits16,@function
bytes_to_bits16:
	.cfi_startproc
	vpxor	%xmm0, %xmm0, %xmm0
	vpcmpeqb	(%rdi), %xmm0, %xmm0
	vpmovmskb	%xmm0, %eax
	xorl	$65535, %eax
	retq
.Lfunc_end3:
	.size	bytes_to_bits16, .Lfunc_end3-bytes_to_bits16
	.cfi_endproc

	.ident	"rustc version 1.97.0-nightly (52b6e2c20 2026-04-27)"
	.section	".note.GNU-stack","",@progbits
