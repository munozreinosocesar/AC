	.file	"daxpy.c"
	.text
	.section	.rodata
	.align 8
.LC1:
	.string	"\nTamano:%d \nTiempo(seg.):%11.9f\n  y[0]=%f / / y[%d]=%f \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
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
	subq	$152, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -164(%rbp)
	movq	%rsi, -176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %rbx
	movl	$520000, -148(%rbp)
	movl	$1000, -152(%rbp)
	movl	-148(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -136(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r14
	movl	$0, %r15d
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	cltq
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -128(%rbp)
	movl	-148(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -120(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r10
	movl	$0, %r11d
	movslq	%eax, %rdx
	movq	%rdx, %r8
	movl	$0, %r9d
	cltq
	salq	$3, %rax
	leaq	7(%rax), %rdx
	movl	$16, %eax
	subq	$1, %rax
	addq	%rdx, %rax
	movl	$16, %esi
	movl	$0, %edx
	divq	%rsi
	imulq	$16, %rax, %rax
	subq	%rax, %rsp
	movq	%rsp, %rax
	addq	$7, %rax
	shrq	$3, %rax
	salq	$3, %rax
	movq	%rax, -112(%rbp)
	movl	$0, -140(%rbp)
	jmp	.L2
.L3:
	movl	-140(%rbp), %eax
	addl	$1, %eax
	cvtsi2sd	%eax, %xmm0
	movq	-128(%rbp), %rax
	movl	-140(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	movl	-140(%rbp), %eax
	addl	$2, %eax
	cvtsi2sd	%eax, %xmm0
	movq	-112(%rbp), %rax
	movl	-140(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -140(%rbp)
.L2:
	movl	-140(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L3
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movl	$0, -144(%rbp)
	jmp	.L4
.L5:
	cvtsi2sd	-152(%rbp), %xmm0
	movq	-112(%rbp), %rax
	movl	-144(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	mulsd	%xmm1, %xmm0
	movq	-128(%rbp), %rax
	movl	-144(%rbp), %edx
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	addsd	%xmm1, %xmm0
	movq	-128(%rbp), %rax
	movl	-144(%rbp), %edx
	movslq	%edx, %rdx
	movsd	%xmm0, (%rax,%rdx,8)
	addl	$1, -144(%rbp)
.L4:
	movl	-144(%rbp), %eax
	cmpl	-148(%rbp), %eax
	jl	.L5
	leaq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	clock_gettime@PLT
	movq	-80(%rbp), %rdx
	movq	-96(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	movq	-72(%rbp), %rdx
	movq	-88(%rbp), %rax
	subq	%rax, %rdx
	movq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC0(%rip), %xmm2
	divsd	%xmm2, %xmm0
	addsd	%xmm1, %xmm0
	movsd	%xmm0, -104(%rbp)
	movl	-148(%rbp), %eax
	leal	-1(%rax), %edx
	movq	-128(%rbp), %rax
	movslq	%edx, %rdx
	movsd	(%rax,%rdx,8), %xmm1
	movq	-128(%rbp), %rax
	movsd	(%rax), %xmm0
	movl	-148(%rbp), %edx
	movq	-104(%rbp), %rcx
	movl	-148(%rbp), %eax
	movapd	%xmm1, %xmm2
	movapd	%xmm0, %xmm1
	movq	%rcx, -184(%rbp)
	movsd	-184(%rbp), %xmm0
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$3, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	%rbx, %rsp
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
