	.file	"figura1-modificado_a.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC1:
	.string	"\nTiempo(seg.):%11.9f\n  R[0]=%d / / R[39999]=%d \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB41:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	s(%rip), %rbx
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	movq	%rbx, %rdx
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L2:
	movl	%eax, (%rdx)
	addl	$1, %eax
	addq	$8, %rdx
	movl	%eax, -4(%rdx)
	cmpl	$5000, %eax
	jne	.L2
	movq	%rsp, %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	leaq	R(%rip), %r10
	leaq	40000(%rbx), %r8
	xorl	%r9d, %r9d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r9d, %edi
	movq	%rbx, %rax
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %edx
	addq	$8, %rax
	leal	(%rdi,%rdx,2), %edx
	addl	%edx, %ecx
	movl	-4(%rax), %edx
	leal	(%rdx,%rdx,2), %edx
	subl	%edi, %edx
	addl	%edx, %esi
	cmpq	%rax, %r8
	jne	.L4
	cmpl	%esi, %ecx
	jge	.L5
	movl	%ecx, (%r10,%r9,4)
.L6:
	addq	$1, %r9
	cmpq	$40000, %r9
	jne	.L3
	leaq	16(%rsp), %rsi
	xorl	%edi, %edi
	call	clock_gettime@PLT
	movq	24(%rsp), %rax
	subq	8(%rsp), %rax
	leaq	.LC1(%rip), %rsi
	pxor	%xmm0, %xmm0
	movl	159996+R(%rip), %ecx
	pxor	%xmm1, %xmm1
	movl	R(%rip), %edx
	movl	$1, %edi
	cvtsi2sdq	%rax, %xmm0
	movq	16(%rsp), %rax
	subq	(%rsp), %rax
	cvtsi2sdq	%rax, %xmm1
	movl	$1, %eax
	divsd	.LC0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	call	__printf_chk@PLT
	xorl	%eax, %eax
	movq	40(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L13
	addq	$48, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movl	%esi, (%r10,%r9,4)
	jmp	.L6
.L13:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	main, .-main
	.comm	R,160000,32
	.comm	s,40000,32
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1104006501
	.ident	"GCC: (Ubuntu 7.3.0-16ubuntu3) 7.3.0"
	.section	.note.GNU-stack,"",@progbits
