	.file	"figura1-modificado_b.c"
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
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	s(%rip), %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
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
	leaq	R(%rip), %rbp
	call	clock_gettime@PLT
	leaq	40000(%rbx), %r10
	xorl	%r11d, %r11d
	.p2align 4,,10
	.p2align 3
.L3:
	movl	%r11d, %edx
	movq	%rbx, %rax
	xorl	%r9d, %r9d
	xorl	%edi, %edi
	xorl	%r8d, %r8d
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L4:
	movl	(%rax), %ecx
	addq	$16, %rax
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %esi
	movl	-8(%rax), %ecx
	leal	(%rdx,%rcx,2), %ecx
	addl	%ecx, %r8d
	movl	-12(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %edi
	movl	-4(%rax), %ecx
	leal	(%rcx,%rcx,2), %ecx
	subl	%edx, %ecx
	addl	%ecx, %r9d
	cmpq	%rax, %r10
	jne	.L4
	addl	%r8d, %esi
	addl	%r9d, %edi
	cmpl	%edi, %esi
	jge	.L5
	movl	%esi, 0(%rbp,%r11,4)
.L6:
	addq	$1, %r11
	cmpq	$40000, %r11
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
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L5:
	.cfi_restore_state
	movl	%edi, 0(%rbp,%r11,4)
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
