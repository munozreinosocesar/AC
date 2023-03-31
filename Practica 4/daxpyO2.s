	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"\nTamano:%d \nTiempo(seg.):%11.9f\n  y[0]=%f / / y[%d]=%f \n"
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	.cfi_offset 3, -40
	movq	%fs:40, %rax
	movq	%rax, -40(%rbp)
	xorl	%eax, %eax
	movl	$4160016, %eax
	subq	%rax, %rsp
	leaq	7(%rsp), %r12
	subq	%rax, %rsp
	movl	$1, %eax
	movq	%rsp, %r13
	shrq	$3, %r12
	leaq	0(,%r12,8), %rbx
	.p2align 4,,10
	.p2align 3
.L2:
	pxor	%xmm0, %xmm0
	leal	1(%rax), %edx
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, -8(%rbx,%rax,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, -8(%r13,%rax,8)
	addq	$1, %rax
	cmpq	$520001, %rax
	jne	.L2
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movsd	.LC0(%rip), %xmm1
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	0(%r13,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%rbx,%rax), %xmm0
	movsd	%xmm0, (%rbx,%rax)
	addq	$8, %rax
	cmpq	$4160000, %rax
	jne	.L3
	leaq	-64(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-56(%rbp), %rax
	subq	-72(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$520000, %ecx
	pxor	%xmm1, %xmm1
	movl	$520000, %edx
	movsd	4159992(,%r12,8), %xmm2
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-64(%rbp), %rax
	subq	-80(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(,%r12,8), %xmm1
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-40(%rbp), %rcx
	xorq	%fs:40, %rcx
	jne	.L9
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L9:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1083129856
	.align 8
.LC1:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
