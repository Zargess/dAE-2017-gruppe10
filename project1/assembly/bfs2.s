	.file	"bfs2.cpp"
	.text
	.globl	_Z30binarySearchOnBFSStructureTestPiii
	.type	_Z30binarySearchOnBFSStructureTestPiii, @function
_Z30binarySearchOnBFSStructureTestPiii:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	%edx, -32(%rbp)
	movl	$0, -12(%rbp)
	movl	$0, -8(%rbp)
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
.L6:
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	je	.L2
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	jle	.L3
	movl	-12(%rbp), %eax
	addl	%eax, %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L4
.L3:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	addl	%eax, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
.L4:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jge	.L9
	movl	-12(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	jmp	.L6
.L9:
	nop
.L2:
	movl	-4(%rbp), %eax
	cmpl	-32(%rbp), %eax
	je	.L7
	movl	-8(%rbp), %eax
	jmp	.L8
.L7:
	movl	-12(%rbp), %eax
.L8:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	_Z30binarySearchOnBFSStructureTestPiii, .-_Z30binarySearchOnBFSStructureTestPiii
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
