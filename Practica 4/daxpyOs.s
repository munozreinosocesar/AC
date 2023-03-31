	.file	"daxpy.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"\nTamano:%d \nTiempo(seg.):%11.9f\n  y[0]=%f / / y[%d]=%f \n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB23:
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
	leaq	7(%rsp), %rbx
	subq	%rax, %rsp
	movl	$1, %eax
	movq	%rsp, %r13
	shrq	$3, %rbx
	leaq	0(,%rbx,8), %r12
.L2:
	cvtsi2sd	%eax, %xmm0
	leal	1(%rax), %edx
	movsd	%xmm0, -8(%r12,%rax,8)
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, -8(%r13,%rax,8)
	incq	%rax
	cmpq	$520001, %rax
	jne	.L2
	leaq	-72(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movsd	.LC0(%rip), %xmm1
	xorl	%eax, %eax
.L3:
	movsd	0(%r13,%rax), %xmm0
	mulsd	%xmm1, %xmm0
	addsd	(%r12,%rax), %xmm0
	movsd	%xmm0, (%r12,%rax)
	addq	$8, %rax
	cmpq	$4160000, %rax
	jne	.L3
	leaq	-56(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-48(%rbp), %rax
	subq	-64(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movsd	4159992(,%rbx,8), %xmm2
	movl	$520000, %ecx
	movl	$520000, %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	-56(%rbp), %rax
	subq	-72(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movb	$3, %al
	divsd	.LC1(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(,%rbx,8), %xmm1
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-40(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L4
	call	__stack_chk_fail@PLT
.L4:
	leaq	-24(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE23:
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
