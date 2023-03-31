	.file	"daxpy.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
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
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$4160016, %eax
	subq	%rax, %rsp
	leaq	7(%rsp), %r12
	subq	%rax, %rsp
	leaq	7(%rsp), %rcx
	shrq	$3, %r12
	movl	%r12d, %r9d
	shrq	$3, %rcx
	leaq	0(,%r12,8), %r14
	andl	$1, %r9d
	leaq	0(,%rcx,8), %r13
	je	.L9
	movq	.LC0(%rip), %rax
	movl	$519999, %r10d
	movl	$1, -100(%rbp)
	movq	%rax, 0(,%r12,8)
	movq	.LC1(%rip), %rax
	movq	%rax, 0(,%rcx,8)
.L2:
	movd	-100(%rbp), %xmm6
	movl	%r9d, %r8d
	movl	$520000, %r15d
	salq	$3, %r8
	subl	%r9d, %r15d
	xorl	%esi, %esi
	leaq	(%r14,%r8), %rbx
	pshufd	$0, %xmm6, %xmm1
	movl	%r15d, %edi
	addq	%r13, %r8
	movdqa	.LC3(%rip), %xmm5
	shrl	$2, %edi
	movq	%rbx, %rdx
	movq	%r8, %rax
	paddd	.LC2(%rip), %xmm1
	movdqa	.LC4(%rip), %xmm4
	movdqa	.LC5(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L3:
	movdqa	%xmm1, %xmm0
	addl	$1, %esi
	addq	$32, %rdx
	addq	$32, %rax
	paddd	%xmm4, %xmm0
	cvtdq2pd	%xmm0, %xmm2
	pshufd	$238, %xmm0, %xmm0
	movaps	%xmm2, -32(%rdx)
	cvtdq2pd	%xmm0, %xmm0
	movaps	%xmm0, -16(%rdx)
	movdqa	%xmm1, %xmm0
	paddd	%xmm5, %xmm1
	paddd	%xmm3, %xmm0
	cvtdq2pd	%xmm0, %xmm2
	pshufd	$238, %xmm0, %xmm0
	movups	%xmm2, -32(%rax)
	cvtdq2pd	%xmm0, %xmm0
	movups	%xmm0, -16(%rax)
	cmpl	%edi, %esi
	jb	.L3
	movl	-100(%rbp), %eax
	movl	%r15d, %edx
	andl	$-4, %edx
	subl	%edx, %r10d
	addl	%edx, %eax
	cmpl	%edx, %r15d
	je	.L4
	pxor	%xmm0, %xmm0
	leal	1(%rax), %esi
	movslq	%eax, %rdi
	leal	2(%rax), %edx
	cmpl	$1, %r10d
	cvtsi2sd	%esi, %xmm0
	movsd	%xmm0, (%r14,%rdi,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edx, %xmm0
	movsd	%xmm0, 0(%r13,%rdi,8)
	je	.L4
	movslq	%esi, %rsi
	leal	3(%rax), %edi
	cmpl	$2, %r10d
	movsd	%xmm0, (%r14,%rsi,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%edi, %xmm0
	movsd	%xmm0, 0(%r13,%rsi,8)
	je	.L4
	movslq	%edx, %rdx
	addl	$4, %eax
	movsd	%xmm0, (%r14,%rdx,8)
	pxor	%xmm0, %xmm0
	cvtsi2sd	%eax, %xmm0
	movsd	%xmm0, 0(%r13,%rdx,8)
.L4:
	leaq	-96(%rbp), %rsi
	xorl	%edi, %edi
	movq	%r8, -112(%rbp)
	movl	%r9d, -100(%rbp)
	movq	%rcx, -120(%rbp)
	call	clock_gettime@PLT
	movl	-100(%rbp), %r9d
	xorl	%eax, %eax
	movq	-112(%rbp), %r8
	testl	%r9d, %r9d
	je	.L5
	movq	-120(%rbp), %rcx
	movsd	.LC6(%rip), %xmm0
	movl	$1, %eax
	mulsd	0(,%rcx,8), %xmm0
	addsd	0(,%r12,8), %xmm0
	movsd	%xmm0, 0(,%r12,8)
.L5:
	movl	%r15d, %esi
	movapd	.LC7(%rip), %xmm1
	shrl	%esi
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L6:
	movupd	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	mulpd	%xmm1, %xmm0
	addpd	(%rbx,%rdx), %xmm0
	movaps	%xmm0, (%rbx,%rdx)
	addq	$16, %rdx
	cmpl	%esi, %ecx
	jb	.L6
	movl	%r15d, %edx
	andl	$-2, %edx
	addl	%edx, %eax
	cmpl	%r15d, %edx
	je	.L7
	movsd	.LC6(%rip), %xmm0
	cltq
	leaq	(%r14,%rax,8), %rdx
	mulsd	0(%r13,%rax,8), %xmm0
	addsd	(%rdx), %xmm0
	movsd	%xmm0, (%rdx)
.L7:
	leaq	-80(%rbp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	-72(%rbp), %rax
	subq	-88(%rbp), %rax
	leaq	.LC9(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	pxor	%xmm1, %xmm1
	movl	$520000, %ecx
	movsd	4159992(,%r12,8), %xmm2
	movl	$520000, %edx
	cvtsi2sdq	%rax, %xmm0
	movq	-80(%rbp), %rax
	subq	-96(%rbp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$3, %eax
	divsd	.LC8(%rip), %xmm0
	addsd	%xmm1, %xmm0
	movsd	0(,%r12,8), %xmm1
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	-56(%rbp), %rdi
	xorq	%fs:40, %rdi
	jne	.L22
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L9:
	.cfi_restore_state
	movl	$520000, %r10d
	movl	$0, -100(%rbp)
	jmp	.L2
.L22:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	0
	.long	1073741824
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC2:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC3:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC4:
	.long	1
	.long	1
	.long	1
	.long	1
	.align 16
.LC5:
	.long	2
	.long	2
	.long	2
	.long	2
	.section	.rodata.cst8
	.align 8
.LC6:
	.long	0
	.long	1083129856
	.section	.rodata.cst16
	.align 16
.LC7:
	.long	0
	.long	1083129856
	.long	0
	.long	1083129856
	.section	.rodata.cst8
	.align 8
.LC8:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
