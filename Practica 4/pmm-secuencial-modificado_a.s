	.file	"pmm-secuencial-modificado_a.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"\nTiempo(seg.):%11.9f\n  Tama\303\261o:%u\n salida[0][0]=%d / / salida[%d][%d]=%d \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	xorl	%ecx, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leaq	matrix2(%rip), %rbp
	leaq	matrix1(%rip), %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%rbp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movq	%rbx, %rsi
.L2:
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	leal	(%rcx,%rax), %edx
	movl	%edx, (%rsi,%rax,4)
	movl	%edx, (%rdi,%rax,4)
	addq	$1, %rax
	cmpq	$512, %rax
	jne	.L3
	addl	$1, %ecx
	addq	$2048, %rsi
	addq	$2048, %rdi
	cmpl	$512, %ecx
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	leaq	1048576(%rbp), %r12
	call	clock_gettime@PLT
	leaq	1048576+salida(%rip), %rax
	leaq	salida(%rip), %r11
	subq	%rbp, %rax
	subq	%rbp, %r11
	addq	$1050624, %rbp
	movq	%rax, %r13
.L5:
	movq	%r12, %r10
	.p2align 4,,10
	.p2align 3
.L9:
	leaq	-1048576(%r10), %rax
	movq	%rbx, %rdx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edi, %edi
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rdx), %ecx
	addq	$8192, %rax
	addq	$16, %rdx
	imull	-8192(%rax), %ecx
	addl	%ecx, %esi
	movl	-12(%rdx), %ecx
	imull	-6144(%rax), %ecx
	addl	%ecx, %edi
	movl	-8(%rdx), %ecx
	imull	-4096(%rax), %ecx
	addl	%ecx, %r8d
	movl	-4(%rdx), %ecx
	imull	-2048(%rax), %ecx
	addl	%ecx, %r9d
	cmpq	%rax, %r10
	jne	.L6
	addl	%edi, %esi
	addl	%esi, %r8d
	addl	%r8d, %r9d
	movl	%r9d, -1048576(%r11,%r10)
	addq	$4, %r10
	cmpq	%r10, %rbp
	jne	.L9
	addq	$2048, %r11
	addq	$2048, %rbx
	cmpq	%r11, %r13
	jne	.L5
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 104
	pxor	%xmm0, %xmm0
	movl	salida(%rip), %ecx
	pxor	%xmm1, %xmm1
	leaq	.LC1(%rip), %rsi
	movl	$512, %edx
	movl	$511, %r9d
	movl	$511, %r8d
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm1
	movl	1048572+salida(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 112
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	popq	%rax
	.cfi_def_cfa_offset 104
	popq	%rdx
	.cfi_def_cfa_offset 96
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L15
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	salida,1048576,32
	.comm	matrix2,1048576,32
	.comm	matrix1,1048576,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
