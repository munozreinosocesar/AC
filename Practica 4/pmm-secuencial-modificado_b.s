	.file	"pmm-secuencial-modificado_b.c"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	matrix2(%rip), %rbp
	leaq	matrix1(%rip), %rbx
	xorl	%ecx, %ecx
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
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
	call	clock_gettime@PLT
	leaq	2048+matrix2(%rip), %r11
	leaq	1048576(%rbp), %r8
	leaq	-2048(%r11), %r9
	movq	%r9, %r10
.L5:
	leaq	1048576(%r9), %rdi
	movq	%r9, %rax
	movq	%r10, %rdx
	.p2align 4,,10
	.p2align 3
.L6:
	movl	(%rdx), %ecx
	movl	(%rax), %esi
	addq	$2048, %rax
	addq	$4, %rdx
	movl	%esi, -4(%rdx)
	movl	%ecx, -2048(%rax)
	cmpq	%rdi, %rax
	jne	.L6
	addq	$4, %r9
	addq	$2048, %r10
	cmpq	%r11, %r9
	jne	.L5
	leaq	salida(%rip), %r9
	leaq	1048576+matrix1(%rip), %r10
.L7:
	movq	%rbp, %rsi
	movq	%r9, %rdi
	.p2align 4,,10
	.p2align 3
.L11:
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L8:
	movl	(%rbx,%rax), %edx
	imull	(%rsi,%rax), %edx
	addq	$4, %rax
	addl	%edx, %ecx
	cmpq	$2048, %rax
	jne	.L8
	addq	$2048, %rsi
	movl	%ecx, (%rdi)
	addq	$4, %rdi
	cmpq	%r8, %rsi
	jne	.L11
	addq	$2048, %rbx
	addq	$2048, %r9
	cmpq	%r10, %rbx
	jne	.L7
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 88
	pxor	%xmm0, %xmm0
	movl	salida(%rip), %ecx
	pxor	%xmm1, %xmm1
	leaq	.LC1(%rip), %rsi
	movl	$512, %edx
	movl	$1, %edi
	movl	$511, %r9d
	cvtsi2sdq	%rax, %xmm0
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	movl	$511, %r8d
	cvtsi2sdq	%rax, %xmm1
	movl	1048572+salida(%rip), %eax
	pushq	%rax
	.cfi_def_cfa_offset 96
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	popq	%rax
	.cfi_def_cfa_offset 88
	popq	%rdx
	.cfi_def_cfa_offset 80
	xorl	%eax, %eax
	movq	40(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L19
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L19:
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
