	.file	"main.cpp"
	.section	.text.unlikely._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
.LCOLDB0:
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LHOTB0:
	.align 2
	.p2align 4,,15
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1210:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1210:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.unlikely._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LCOLDE0:
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LHOTE0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	_Z18binarySearchSimplePiii
	.type	_Z18binarySearchSimplePiii, @function
_Z18binarySearchSimplePiii:
.LFB8095:
	.cfi_startproc
	movl	%esi, %eax
	leal	-1(%rsi), %r8d
	shrl	$31, %eax
	addl	%esi, %eax
	sarl	%eax
	movslq	%eax, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%ecx, %edx
	je	.L3
	testl	%r8d, %r8d
	js	.L9
	xorl	%r10d, %r10d
	xorl	%r9d, %r9d
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L13:
	leal	-1(%rax), %r8d
.L7:
	leal	(%r9,%r8), %eax
	movl	%eax, %esi
	shrl	$31, %esi
	addl	%esi, %eax
	sarl	%eax
	movslq	%eax, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%edx, %ecx
	je	.L12
	cmpl	%r8d, %r9d
	jg	.L10
.L5:
	cmpl	%ecx, %edx
	jl	.L13
	leal	1(%rax), %r9d
	movl	%eax, %r10d
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L10:
	movl	%r10d, %eax
.L3:
	rep ret
	.p2align 4,,10
	.p2align 3
.L12:
	rep ret
.L9:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE8095:
	.size	_Z18binarySearchSimplePiii, .-_Z18binarySearchSimplePiii
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	_Z26binarySearchOnBFSStructurePiii
	.type	_Z26binarySearchOnBFSStructurePiii, @function
_Z26binarySearchOnBFSStructurePiii:
.LFB8100:
	.cfi_startproc
	xorl	%r8d, %r8d
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movslq	%eax, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%edx, %ecx
	je	.L16
.L20:
	cmpl	%esi, %eax
	jge	.L19
	cmpl	%edx, %ecx
	jle	.L17
	leal	1(%rax,%rax), %eax
	movslq	%eax, %rcx
	movl	(%rdi,%rcx,4), %ecx
	cmpl	%edx, %ecx
	jne	.L20
.L16:
	rep ret
	.p2align 4,,10
	.p2align 3
.L17:
	leal	2(%rax,%rax), %r8d
	movl	%r8d, %eax
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L19:
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE8100:
	.size	_Z26binarySearchOnBFSStructurePiii, .-_Z26binarySearchOnBFSStructurePiii
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.text.unlikely
.LCOLDB3:
	.text
.LHOTB3:
	.p2align 4,,15
	.globl	_Z27binarySearchOnBFSStructure2Piii
	.type	_Z27binarySearchOnBFSStructure2Piii, @function
_Z27binarySearchOnBFSStructure2Piii:
.LFB8101:
	.cfi_startproc
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	testl	%esi, %esi
	movl	(%rdi), %r8d
	jle	.L22
	cmpl	%edx, %r8d
	jne	.L23
	jmp	.L22
	.p2align 4,,10
	.p2align 3
.L29:
	cmpl	%esi, %ecx
	jge	.L22
.L23:
	addl	%ecx, %ecx
	cmpl	%r8d, %edx
	leal	1(%rcx), %r10d
	leal	2(%rcx), %r9d
	movl	%r10d, %ecx
	cmovge	%r9d, %eax
	cmovge	%r9d, %ecx
	movslq	%ecx, %r8
	movl	(%rdi,%r8,4), %r8d
	cmpl	%r8d, %edx
	jne	.L29
.L22:
	cmpl	%r8d, %edx
	cmove	%ecx, %eax
	ret
	.cfi_endproc
.LFE8101:
	.size	_Z27binarySearchOnBFSStructure2Piii, .-_Z27binarySearchOnBFSStructure2Piii
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
.LCOLDB6:
	.text
.LHOTB6:
	.p2align 4,,15
	.globl	_Z17getSequentialListi
	.type	_Z17getSequentialListi, @function
_Z17getSequentialListi:
.LFB8090:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	%edi, %rdi
	movabsq	$2287828610704211968, %rax
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	cmpq	%rax, %rdi
	ja	.L31
	movq	%rdi, %rbx
	salq	$2, %rdi
	call	_Znam
	testl	%ebx, %ebx
	jle	.L51
	movq	%rax, %rdx
	andl	$15, %edx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%ebx, %edx
	cmova	%ebx, %edx
	cmpl	$7, %ebx
	jg	.L53
	movl	%ebx, %edx
.L33:
	cmpl	$1, %edx
	movl	$0, (%rax)
	je	.L45
	cmpl	$2, %edx
	movl	$1, 4(%rax)
	je	.L46
	cmpl	$3, %edx
	movl	$2, 8(%rax)
	je	.L47
	cmpl	$4, %edx
	movl	$3, 12(%rax)
	je	.L48
	cmpl	$5, %edx
	movl	$4, 16(%rax)
	je	.L49
	cmpl	$6, %edx
	movl	$5, 20(%rax)
	je	.L50
	movl	$6, 24(%rax)
	movl	$7, %ecx
.L35:
	cmpl	%edx, %ebx
	je	.L51
.L34:
	movl	%ebx, %r8d
	leal	-1(%rbx), %edi
	movl	%edx, %r10d
	subl	%edx, %r8d
	leal	-4(%r8), %esi
	subl	%edx, %edi
	shrl	$2, %esi
	addl	$1, %esi
	cmpl	$2, %edi
	leal	0(,%rsi,4), %r9d
	jbe	.L37
	movl	%ecx, 12(%rsp)
	leaq	(%rax,%r10,4), %rdi
	xorl	%edx, %edx
	movd	12(%rsp), %xmm2
	movdqa	.LC5(%rip), %xmm1
	pshufd	$0, %xmm2, %xmm0
	paddd	.LC4(%rip), %xmm0
.L39:
	addl	$1, %edx
	addq	$16, %rdi
	movaps	%xmm0, -16(%rdi)
	paddd	%xmm1, %xmm0
	cmpl	%edx, %esi
	ja	.L39
	addl	%r9d, %ecx
	cmpl	%r9d, %r8d
	je	.L51
.L37:
	movslq	%ecx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%edx, %ebx
	jle	.L51
	addl	$2, %ecx
	movslq	%edx, %rsi
	cmpl	%ecx, %ebx
	movl	%edx, (%rax,%rsi,4)
	jle	.L51
	movslq	%ecx, %rdx
	movl	%ecx, (%rax,%rdx,4)
.L51:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L53:
	.cfi_restore_state
	testl	%edx, %edx
	jne	.L33
	xorl	%ecx, %ecx
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L46:
	movl	$2, %ecx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L47:
	movl	$3, %ecx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L48:
	movl	$4, %ecx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L49:
	movl	$5, %ecx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L50:
	movl	$6, %ecx
	jmp	.L35
	.p2align 4,,10
	.p2align 3
.L45:
	movl	$1, %ecx
	jmp	.L35
.L31:
	call	__cxa_throw_bad_array_new_length
	.cfi_endproc
.LFE8090:
	.size	_Z17getSequentialListi, .-_Z17getSequentialListi
	.section	.text.unlikely
.LCOLDE6:
	.text
.LHOTE6:
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"basic_string::_M_construct null not valid"
	.section	.text.unlikely
	.align 2
.LCOLDB8:
	.text
.LHOTB8:
	.align 2
	.p2align 4,,15
	.type	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27, @function
_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27:
.LFB8444:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leaq	16(%rdi), %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%r13, (%rdi)
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	testq	%rsi, %rsi
	je	.L55
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	movq	%rsi, %r12
	call	strlen
	cmpq	$15, %rax
	movq	%rax, %rbp
	movq	%rax, (%rsp)
	ja	.L67
	cmpq	$1, %rax
	je	.L68
	testq	%rax, %rax
	jne	.L69
.L59:
	movq	(%rsp), %rax
	movq	(%rbx), %rdx
	movq	%rax, 8(%rbx)
	movb	$0, (%rdx,%rax)
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L70
	addq	$24, %rsp
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
.L67:
	.cfi_restore_state
	movq	%rbx, %rdi
	xorl	%edx, %edx
	movq	%rsp, %rsi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
	movq	%rax, %rdi
	movq	%rax, (%rbx)
	movq	(%rsp), %rax
	movq	%rax, 16(%rbx)
.L57:
	movq	%rbp, %rdx
	movq	%r12, %rsi
	call	memcpy
	jmp	.L59
.L68:
	movzbl	(%r12), %eax
	movb	%al, 16(%rbx)
	jmp	.L59
.L55:
	movl	$.LC7, %edi
	call	_ZSt19__throw_logic_errorPKc
.L69:
	movq	%r13, %rdi
	jmp	.L57
.L70:
	call	__stack_chk_fail
	.cfi_endproc
.LFE8444:
	.size	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27, .-_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27
	.section	.text.unlikely
.LCOLDE8:
	.text
.LHOTE8:
	.section	.text.unlikely
.LCOLDB9:
	.text
.LHOTB9:
	.p2align 4,,15
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34:
.LFB8452:
	.cfi_startproc
	movq	_ZSt4cout(%rip), %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L78
	cmpb	$0, 56(%rbx)
	je	.L73
	movzbl	67(%rbx), %eax
.L74:
	movl	$_ZSt4cout, %edi
	movsbl	%al, %esi
	call	_ZNSo3putEc
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	_ZNSo5flushEv
.L73:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movq	48(%rax), %rdx
	movl	$10, %eax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rdx
	je	.L74
	movl	$10, %esi
	movq	%rbx, %rdi
	call	*%rdx
	jmp	.L74
.L78:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE8452:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34
	.section	.text.unlikely
.LCOLDE9:
	.text
.LHOTE9:
	.section	.text.unlikely
.LCOLDB10:
	.text
.LHOTB10:
	.p2align 4,,15
	.globl	_Z9getRandomii
	.type	_Z9getRandomii, @function
_Z9getRandomii:
.LFB8089:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movslq	%edi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movabsq	$2287828610704211968, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	cmpq	%rax, %rdi
	ja	.L80
	movq	%rdi, %r12
	salq	$2, %rdi
	movl	%esi, %ebp
	call	_Znam
	xorl	%edi, %edi
	movq	%rax, %r13
	call	time
	movl	%eax, %edi
	call	srand
	testl	%r12d, %r12d
	jle	.L84
	leal	-1(%r12), %eax
	movq	%r13, %rbx
	leaq	4(%r13,%rax,4), %r12
	.p2align 4,,10
	.p2align 3
.L83:
	call	rand
	cltd
	addq	$4, %rbx
	idivl	%ebp
	movl	%edx, -4(%rbx)
	cmpq	%r12, %rbx
	jne	.L83
.L84:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L80:
	.cfi_restore_state
	call	__cxa_throw_bad_array_new_length
	.cfi_endproc
.LFE8089:
	.size	_Z9getRandomii, .-_Z9getRandomii
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.text.unlikely
.LCOLDB11:
	.text
.LHOTB11:
	.p2align 4,,15
	.globl	_Z12giveMeMediani
	.type	_Z12giveMeMediani, @function
_Z12giveMeMediani:
.LFB8091:
	.cfi_startproc
	movl	%edi, %eax
	shrl	$31, %eax
	addl	%edi, %eax
	sarl	%eax
	andl	$1, %edi
	je	.L89
	leal	1(%rax), %eax
	ret
	.p2align 4,,10
	.p2align 3
.L89:
	rep ret
	.cfi_endproc
.LFE8091:
	.size	_Z12giveMeMediani, .-_Z12giveMeMediani
	.section	.text.unlikely
.LCOLDE11:
	.text
.LHOTE11:
	.section	.text.unlikely
.LCOLDB15:
	.text
.LHOTB15:
	.p2align 4,,15
	.globl	_Z24giveMeCompleteTreeMediani
	.type	_Z24giveMeCompleteTreeMediani, @function
_Z24giveMeCompleteTreeMediani:
.LFB8092:
	.cfi_startproc
	pxor	%xmm3, %xmm3
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebp
	cvtsi2sd	%edi, %xmm3
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movapd	%xmm3, %xmm0
	movsd	%xmm3, 8(%rsp)
	call	log2
	call	floor
	addsd	.LC14(%rip), %xmm0
	cvttsd2si	%xmm0, %ecx
	testl	%ecx, %ecx
	je	.L95
	subl	$1, %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	pxor	%xmm0, %xmm0
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	sarl	%eax
	cvtsi2sd	%eax, %xmm0
	call	floor
	movapd	%xmm0, %xmm2
	subsd	.LC14(%rip), %xmm2
.L91:
	pxor	%xmm1, %xmm1
	subl	%ebx, %ebp
	leal	-1(%rbx), %eax
	cvtsi2sd	%ebp, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L94
	movsd	8(%rsp), %xmm4
	subsd	%xmm0, %xmm4
	cvttsd2si	%xmm4, %eax
.L94:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L95:
	.cfi_restore_state
	movsd	.LC12(%rip), %xmm2
	movl	$1, %ebx
	pxor	%xmm0, %xmm0
	jmp	.L91
	.cfi_endproc
.LFE8092:
	.size	_Z24giveMeCompleteTreeMediani, .-_Z24giveMeCompleteTreeMediani
	.section	.text.unlikely
.LCOLDE15:
	.text
.LHOTE15:
	.section	.text.unlikely
.LCOLDB16:
	.text
.LHOTB16:
	.p2align 4,,15
	.globl	_Z21createNewBFSStructureiiib
	.type	_Z21createNewBFSStructureiiib, @function
_Z21createNewBFSStructureiiib:
.LFB8096:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pxor	%xmm3, %xmm3
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	subl	%edi, %r14d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	addl	$1, %r14d
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%ecx, %r13d
	cvtsi2sd	%r14d, %xmm3
	movl	%edi, %r15d
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%esi, %r12d
	movl	%edx, %ebp
	movapd	%xmm3, %xmm0
	movsd	%xmm3, 8(%rsp)
	call	log2
	call	floor
	addsd	.LC14(%rip), %xmm0
	cvttsd2si	%xmm0, %ecx
	testl	%ecx, %ecx
	je	.L107
	subl	$1, %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	pxor	%xmm0, %xmm0
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	sarl	%eax
	cvtsi2sd	%eax, %xmm0
	call	floor
	movapd	%xmm0, %xmm2
	subsd	.LC14(%rip), %xmm2
.L99:
	pxor	%xmm1, %xmm1
	subl	%ebx, %r14d
	subl	$1, %ebx
	cvtsi2sd	%r14d, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L102
	movsd	8(%rsp), %xmm4
	subsd	%xmm0, %xmm4
	cvttsd2si	%xmm4, %ebx
.L102:
	leal	(%rbp,%rbp), %edx
	movq	points(%rip), %rax
	addl	%r15d, %ebx
	leal	1(%rdx), %ebp
	addl	$2, %edx
	testb	%r13b, %r13b
	cmove	%edx, %ebp
	movslq	%ebx, %rdx
	cmpl	%ebx, %r15d
	movl	(%rax,%rdx,4), %ecx
	movq	bfsStructure(%rip), %rax
	movslq	%ebp, %rdx
	movl	%ecx, (%rax,%rdx,4)
	jl	.L110
.L105:
	cmpl	%ebx, %r12d
	jg	.L111
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L107:
	.cfi_restore_state
	movsd	.LC12(%rip), %xmm2
	movl	$1, %ebx
	pxor	%xmm0, %xmm0
	jmp	.L99
	.p2align 4,,10
	.p2align 3
.L111:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leal	1(%rbx), %edi
	movl	%ebp, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	%r12d, %esi
	xorl	%ecx, %ecx
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	_Z21createNewBFSStructureiiib
	.p2align 4,,10
	.p2align 3
.L110:
	.cfi_restore_state
	leal	-1(%rbx), %esi
	movl	$1, %ecx
	movl	%ebp, %edx
	movl	%r15d, %edi
	call	_Z21createNewBFSStructureiiib
	jmp	.L105
	.cfi_endproc
.LFE8096:
	.size	_Z21createNewBFSStructureiiib, .-_Z21createNewBFSStructureiiib
	.section	.text.unlikely
.LCOLDE16:
	.text
.LHOTE16:
	.section	.text.unlikely
.LCOLDB17:
	.text
.LHOTB17:
	.p2align 4,,15
	.globl	_Z14createBFSArrayi
	.type	_Z14createBFSArrayi, @function
_Z14createBFSArrayi:
.LFB8099:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movabsq	$2287828610704211968, %rax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movslq	%edi, %r12
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	cmpq	%rax, %r12
	ja	.L113
	movq	%r12, %rbp
	salq	$2, %r12
	movq	%r12, %rdi
	call	_Znam
	testl	%ebp, %ebp
	jle	.L168
	movq	%rax, %rdx
	andl	$15, %edx
	shrq	$2, %rdx
	negq	%rdx
	andl	$3, %edx
	cmpl	%ebp, %edx
	cmova	%ebp, %edx
	cmpl	$7, %ebp
	jg	.L169
	movl	%ebp, %edx
.L116:
	cmpl	$1, %edx
	movl	$0, (%rax)
	je	.L150
	cmpl	$2, %edx
	movl	$1, 4(%rax)
	je	.L151
	cmpl	$3, %edx
	movl	$2, 8(%rax)
	je	.L152
	cmpl	$4, %edx
	movl	$3, 12(%rax)
	je	.L153
	cmpl	$5, %edx
	movl	$4, 16(%rax)
	je	.L154
	cmpl	$6, %edx
	movl	$5, 20(%rax)
	je	.L155
	movl	$6, 24(%rax)
	movl	$7, %ecx
.L118:
	cmpl	%edx, %ebp
	je	.L168
.L117:
	movl	%ebp, %r8d
	leal	-1(%rbp), %r13d
	movl	%edx, %edi
	subl	%edx, %r8d
	leal	-4(%r8), %esi
	movl	%r13d, %ebx
	subl	%edx, %ebx
	shrl	$2, %esi
	addl	$1, %esi
	cmpl	$2, %ebx
	leal	0(,%rsi,4), %r9d
	jbe	.L120
	movl	%ecx, 8(%rsp)
	leaq	(%rax,%rdi,4), %rdi
	xorl	%edx, %edx
	movd	8(%rsp), %xmm7
	movdqa	.LC5(%rip), %xmm1
	pshufd	$0, %xmm7, %xmm0
	paddd	.LC4(%rip), %xmm0
.L122:
	movdqa	%xmm0, %xmm2
	addl	$1, %edx
	movaps	%xmm0, (%rdi)
	addq	$16, %rdi
	cmpl	%esi, %edx
	paddd	%xmm1, %xmm2
	jnb	.L121
	movdqa	%xmm2, %xmm0
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L121:
	addl	%r9d, %ecx
	cmpl	%r8d, %r9d
	je	.L125
.L120:
	movslq	%ecx, %rdx
	movl	%ecx, (%rax,%rdx,4)
	leal	1(%rcx), %edx
	cmpl	%edx, %ebp
	jle	.L125
	addl	$2, %ecx
	movslq	%edx, %rsi
	cmpl	%ecx, %ebp
	movl	%edx, (%rax,%rsi,4)
	jle	.L125
	movslq	%ecx, %rdx
	movl	%ecx, (%rax,%rdx,4)
.L125:
	pxor	%xmm5, %xmm5
	movq	%rax, points(%rip)
	xorl	%ebx, %ebx
	cvtsi2sd	%ebp, %xmm5
	movsd	%xmm5, 8(%rsp)
	movapd	%xmm5, %xmm0
	jmp	.L115
	.p2align 4,,10
	.p2align 3
.L170:
	movsd	8(%rsp), %xmm0
	addl	$1, %ebx
.L115:
	call	log2
	call	ceil
	pxor	%xmm1, %xmm1
	cvtsi2sd	%ebx, %xmm1
	ucomisd	%xmm1, %xmm0
	ja	.L170
	movq	%r12, %rdi
	call	_Znam
	testl	%ebp, %ebp
	movq	%rax, %rcx
	jle	.L131
	movl	%r13d, %eax
	movq	%rcx, %rdi
	movl	$255, %esi
	leaq	4(,%rax,4), %rdx
	call	memset
	movq	%rax, %rcx
.L131:
	movsd	8(%rsp), %xmm0
	movq	%rcx, bfsStructure(%rip)
	call	log2
	call	floor
	addsd	.LC14(%rip), %xmm0
	cvttsd2si	%xmm0, %ecx
	testl	%ecx, %ecx
	jne	.L129
	pxor	%xmm0, %xmm0
	movl	$1, %ebx
	movsd	.LC12(%rip), %xmm2
.L130:
	pxor	%xmm1, %xmm1
	subl	%ebx, %ebp
	subl	$1, %ebx
	cvtsi2sd	%ebp, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L134
	movsd	8(%rsp), %xmm6
	subsd	%xmm0, %xmm6
	cvttsd2si	%xmm6, %ebx
.L134:
	pxor	%xmm3, %xmm3
	movq	points(%rip), %rdx
	movslq	%ebx, %rax
	leal	-1(%rbx), %r12d
	cvtsi2sd	%ebx, %xmm3
	movl	(%rdx,%rax,4), %edx
	movq	bfsStructure(%rip), %rax
	movl	%edx, (%rax)
	movapd	%xmm3, %xmm0
	movsd	%xmm3, 8(%rsp)
	call	log2
	call	floor
	addsd	.LC14(%rip), %xmm0
	cvttsd2si	%xmm0, %ecx
	testl	%ecx, %ecx
	je	.L156
	subl	$1, %ecx
	movl	$1, %ebp
	sall	%cl, %ebp
	pxor	%xmm0, %xmm0
	movl	%ebp, %eax
	shrl	$31, %eax
	addl	%ebp, %eax
	sarl	%eax
	cvtsi2sd	%eax, %xmm0
	call	floor
	movapd	%xmm0, %xmm2
	subsd	.LC14(%rip), %xmm2
.L135:
	pxor	%xmm1, %xmm1
	movl	%ebx, %eax
	subl	%ebp, %eax
	subl	$1, %ebp
	cvtsi2sd	%eax, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L138
	movsd	8(%rsp), %xmm7
	subsd	%xmm0, %xmm7
	cvttsd2si	%xmm7, %ebp
.L138:
	movq	points(%rip), %rdx
	movslq	%ebp, %rax
	testl	%ebp, %ebp
	movl	(%rdx,%rax,4), %edx
	movq	bfsStructure(%rip), %rax
	movl	%edx, 4(%rax)
	jg	.L171
.L139:
	cmpl	%ebp, %r12d
	jle	.L140
	leal	1(%rbp), %edi
	xorl	%ecx, %ecx
	movl	$1, %edx
	movl	%r12d, %esi
	call	_Z21createNewBFSStructureiiib
.L140:
	pxor	%xmm4, %xmm4
	movl	%r13d, %r12d
	subl	%ebx, %r12d
	leal	1(%rbx), %ebp
	cvtsi2sd	%r12d, %xmm4
	movapd	%xmm4, %xmm0
	movsd	%xmm4, 8(%rsp)
	call	log2
	call	floor
	addsd	.LC14(%rip), %xmm0
	cvttsd2si	%xmm0, %ecx
	testl	%ecx, %ecx
	je	.L157
	subl	$1, %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	pxor	%xmm0, %xmm0
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	sarl	%eax
	cvtsi2sd	%eax, %xmm0
	call	floor
	movapd	%xmm0, %xmm2
	subsd	.LC14(%rip), %xmm2
.L141:
	pxor	%xmm1, %xmm1
	subl	%ebx, %r12d
	subl	$1, %ebx
	cvtsi2sd	%r12d, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L144
	movsd	8(%rsp), %xmm6
	subsd	%xmm0, %xmm6
	cvttsd2si	%xmm6, %ebx
.L144:
	movq	points(%rip), %rax
	addl	%ebp, %ebx
	movslq	%ebx, %rdx
	cmpl	%ebx, %ebp
	movl	(%rax,%rdx,4), %edx
	movq	bfsStructure(%rip), %rax
	movl	%edx, 8(%rax)
	jl	.L172
.L145:
	cmpl	%ebx, %r13d
	jle	.L146
	leal	1(%rbx), %edi
	xorl	%ecx, %ecx
	movl	$2, %edx
	movl	%r13d, %esi
	call	_Z21createNewBFSStructureiiib
.L146:
	movq	points(%rip), %rdi
	testq	%rdi, %rdi
	je	.L147
	call	_ZdaPv
.L147:
	movq	bfsStructure(%rip), %rax
	addq	$24, %rsp
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
	.p2align 4,,10
	.p2align 3
.L157:
	.cfi_restore_state
	movsd	.LC12(%rip), %xmm2
	movl	$1, %ebx
	pxor	%xmm0, %xmm0
	jmp	.L141
	.p2align 4,,10
	.p2align 3
.L156:
	movsd	.LC12(%rip), %xmm2
	movl	$1, %ebp
	pxor	%xmm0, %xmm0
	jmp	.L135
	.p2align 4,,10
	.p2align 3
.L129:
	subl	$1, %ecx
	movl	$1, %ebx
	sall	%cl, %ebx
	pxor	%xmm0, %xmm0
	movl	%ebx, %eax
	shrl	$31, %eax
	addl	%ebx, %eax
	sarl	%eax
	cvtsi2sd	%eax, %xmm0
	call	floor
	movapd	%xmm0, %xmm2
	subsd	.LC14(%rip), %xmm2
	jmp	.L130
	.p2align 4,,10
	.p2align 3
.L168:
	leal	-1(%rbp), %r13d
	jmp	.L125
	.p2align 4,,10
	.p2align 3
.L169:
	testl	%edx, %edx
	jne	.L116
	xorl	%ecx, %ecx
	jmp	.L117
	.p2align 4,,10
	.p2align 3
.L172:
	leal	-1(%rbx), %esi
	movl	$1, %ecx
	movl	$2, %edx
	movl	%ebp, %edi
	call	_Z21createNewBFSStructureiiib
	jmp	.L145
	.p2align 4,,10
	.p2align 3
.L171:
	leal	-1(%rbp), %esi
	movl	$1, %ecx
	movl	$1, %edx
	xorl	%edi, %edi
	call	_Z21createNewBFSStructureiiib
	jmp	.L139
.L150:
	movl	$1, %ecx
	jmp	.L118
.L151:
	movl	$2, %ecx
	jmp	.L118
.L152:
	movl	$3, %ecx
	jmp	.L118
.L153:
	movl	$4, %ecx
	jmp	.L118
.L154:
	movl	$5, %ecx
	jmp	.L118
.L155:
	movl	$6, %ecx
	jmp	.L118
.L113:
	call	__cxa_throw_bad_array_new_length
	.cfi_endproc
.LFE8099:
	.size	_Z14createBFSArrayi, .-_Z14createBFSArrayi
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
.LCOLDB18:
	.text
.LHOTB18:
	.p2align 4,,15
	.globl	_Z15initializeArrayi
	.type	_Z15initializeArrayi, @function
_Z15initializeArrayi:
.LFB8097:
	.cfi_startproc
	movslq	%edi, %rdi
	movabsq	$2287828610704211968, %rax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	%rax, %rdi
	ja	.L174
	movq	%rdi, %rbx
	salq	$2, %rdi
	call	_Znam
	testl	%ebx, %ebx
	movq	%rax, %rcx
	jle	.L177
	leal	-1(%rbx), %eax
	movq	%rcx, %rdi
	movl	$255, %esi
	leaq	4(,%rax,4), %rdx
	call	memset
	movq	%rax, %rcx
.L177:
	movq	%rcx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L174:
	.cfi_restore_state
	call	__cxa_throw_bad_array_new_length
	.cfi_endproc
.LFE8097:
	.size	_Z15initializeArrayi, .-_Z15initializeArrayi
	.section	.text.unlikely
.LCOLDE18:
	.text
.LHOTE18:
	.section	.text.unlikely
.LCOLDB19:
	.text
.LHOTB19:
	.p2align 4,,15
	.globl	_Z13getOutputSizei
	.type	_Z13getOutputSizei, @function
_Z13getOutputSizei:
.LFB8098:
	.cfi_startproc
	pxor	%xmm2, %xmm2
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%ebp, %ebp
	xorl	%ebx, %ebx
	cvtsi2sd	%edi, %xmm2
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movsd	%xmm2, 8(%rsp)
	movapd	%xmm2, %xmm0
	jmp	.L182
	.p2align 4,,10
	.p2align 3
.L186:
	leal	2(%rbp,%rbp), %ebp
	movsd	8(%rsp), %xmm0
	addl	$1, %ebx
.L182:
	call	log2
	call	ceil
	pxor	%xmm1, %xmm1
	cvtsi2sd	%ebx, %xmm1
	ucomisd	%xmm1, %xmm0
	ja	.L186
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE8098:
	.size	_Z13getOutputSizei, .-_Z13getOutputSizei
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.text.unlikely
.LCOLDB20:
	.text
.LHOTB20:
	.p2align 4,,15
	.globl	_Z30binarySearchOnBFSStructureTestPiii
	.type	_Z30binarySearchOnBFSStructureTestPiii, @function
_Z30binarySearchOnBFSStructureTestPiii:
.LFB8102:
	.cfi_startproc
	movl	(%rdi), %r8d
	xorl	%eax, %eax
	cmpl	%edx, %r8d
	je	.L188
	xorl	%ecx, %ecx
	jmp	.L191
	.p2align 4,,10
	.p2align 3
.L195:
	leal	1(%rcx,%rcx), %ecx
	cmpl	%esi, %ecx
	jge	.L188
.L196:
	movslq	%ecx, %r8
	movl	(%rdi,%r8,4), %r8d
	cmpl	%r8d, %edx
	je	.L194
.L191:
	cmpl	%r8d, %edx
	jl	.L195
	leal	2(%rcx,%rcx), %ecx
	cmpl	%esi, %ecx
	movl	%ecx, %eax
	jl	.L196
.L188:
	rep ret
	.p2align 4,,10
	.p2align 3
.L194:
	movl	%ecx, %eax
	ret
	.cfi_endproc
.LFE8102:
	.size	_Z30binarySearchOnBFSStructureTestPiii, .-_Z30binarySearchOnBFSStructureTestPiii
	.section	.text.unlikely
.LCOLDE20:
	.text
.LHOTE20:
	.section	.text.unlikely
.LCOLDB21:
	.text
.LHOTB21:
	.p2align 4,,15
	.globl	_Z12handle_errorPKc
	.type	_Z12handle_errorPKc, @function
_Z12handle_errorPKc:
.LFB8103:
	.cfi_startproc
	testq	%rdi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L206
	movq	%rdi, %rbx
	call	strlen
	movq	%rbx, %rsi
	movq	%rax, %rdx
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.L199:
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L207
	cmpb	$0, 56(%rbx)
	je	.L201
	movsbl	67(%rbx), %esi
.L202:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	_ZNSo5flushEv
	.p2align 4,,10
	.p2align 3
.L201:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L202
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L202
	.p2align 4,,10
	.p2align 3
.L206:
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rdi
	addq	$_ZSt4cout, %rdi
	movl	32(%rdi), %esi
	orl	$1, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	jmp	.L199
.L207:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE8103:
	.size	_Z12handle_errorPKc, .-_Z12handle_errorPKc
	.section	.text.unlikely
.LCOLDE21:
	.text
.LHOTE21:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC22:
	.string	"Papi init error"
.LC23:
	.string	"Could not create event set."
.LC24:
	.string	"Could not add event."
	.section	.text.unlikely
.LCOLDB25:
	.text
.LHOTB25:
	.p2align 4,,15
	.globl	_Z8initPapiv
	.type	_Z8initPapiv, @function
_Z8initPapiv:
.LFB8104:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$84213760, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$-1, 4(%rsp)
	call	PAPI_library_init
	cmpl	$84213760, %eax
	jne	.L255
	leaq	4(%rsp), %rdi
	call	PAPI_create_eventset
	testl	%eax, %eax
	jne	.L256
.L210:
	movl	4(%rsp), %edi
	movl	$-2147483602, %esi
	call	PAPI_add_event
	testl	%eax, %eax
	jne	.L257
.L214:
	movl	4(%rsp), %edi
	movl	$-2147483648, %esi
	call	PAPI_add_event
	testl	%eax, %eax
	jne	.L258
.L218:
	movl	4(%rsp), %edi
	movl	$-2147483598, %esi
	call	PAPI_add_event
	testl	%eax, %eax
	jne	.L259
.L221:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L260
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L259:
	.cfi_restore_state
	movl	$20, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L215
	cmpb	$0, 56(%rbx)
	je	.L222
	movsbl	67(%rbx), %esi
.L223:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L221
	.p2align 4,,10
	.p2align 3
.L257:
	movl	$20, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L215
	cmpb	$0, 56(%rbx)
	je	.L216
	movsbl	67(%rbx), %esi
.L217:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L214
	.p2align 4,,10
	.p2align 3
.L256:
	movl	$27, %edx
	movl	$.LC23, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L215
	cmpb	$0, 56(%rbx)
	je	.L212
	movsbl	67(%rbx), %esi
.L213:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L210
	.p2align 4,,10
	.p2align 3
.L258:
	movl	$20, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L215
	cmpb	$0, 56(%rbx)
	je	.L219
	movsbl	67(%rbx), %esi
.L220:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L218
	.p2align 4,,10
	.p2align 3
.L212:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L213
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L213
	.p2align 4,,10
	.p2align 3
.L216:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L217
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L217
	.p2align 4,,10
	.p2align 3
.L219:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L220
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L222:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L223
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L223
.L215:
	call	_ZSt16__throw_bad_castv
.L260:
	call	__stack_chk_fail
.L255:
	movl	$_ZSt4cout, %edi
	movl	$15, %edx
	movl	$.LC22, %esi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE8104:
	.size	_Z8initPapiv, .-_Z8initPapiv
	.section	.text.unlikely
.LCOLDE25:
	.text
.LHOTE25:
	.section	.rodata.str1.1
.LC26:
	.string	"Start does not work."
.LC27:
	.string	"main.cpp"
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"query == list[(*function)(list, n, query)]"
	.section	.rodata.str1.1
.LC29:
	.string	"Read did not work."
	.section	.rodata.str1.8
	.align 8
.LC30:
	.string	"Could not stop papi.... sad face"
	.section	.text.unlikely
.LCOLDB31:
	.text
.LHOTB31:
	.p2align 4,,15
	.globl	_Z16queryTimeAndPapiPFiPiiiES_S_i
	.type	_Z16queryTimeAndPapiPFiPiiiES_S_i, @function
_Z16queryTimeAndPapiPFiPiiiES_S_i:
.LFB8105:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%ecx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rsi, %rbx
	movl	$16, %edi
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%ecx, 4(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	call	_Znam
	movl	0(%rbp), %edx
	movl	n(%rip), %esi
	movq	%rbx, %rdi
	movq	%rax, %r13
	call	*%r12
	call	_ZNSt6chrono3_V212system_clock3nowEv
	movl	%r14d, %edi
	movq	%rax, 8(%rsp)
	call	PAPI_start
	testl	%eax, %eax
	jne	.L308
.L262:
	leaq	4(%rbp), %r15
	addq	$800000, %rbp
	.p2align 4,,10
	.p2align 3
.L272:
	movl	(%r15), %r14d
	movl	n(%rip), %esi
	movq	%rbx, %rdi
	movl	%r14d, %edx
	call	*%r12
	cltq
	cmpl	(%rbx,%rax,4), %r14d
	jne	.L309
	addq	$4, %r15
	cmpq	%rbp, %r15
	jne	.L272
	movl	4(%rsp), %edi
	leaq	16(%rsp), %rsi
	call	PAPI_read
	testl	%eax, %eax
	jne	.L310
.L273:
	movl	4(%rsp), %edi
	leaq	16(%rsp), %rsi
	call	PAPI_stop
	testl	%eax, %eax
	jne	.L311
.L276:
	call	_ZNSt6chrono3_V212system_clock3nowEv
	subq	8(%rsp), %rax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	%eax, 0(%r13)
	movq	16(%rsp), %rax
	movl	%eax, 4(%r13)
	movq	24(%rsp), %rax
	movl	%eax, 8(%r13)
	movq	32(%rsp), %rax
	movl	%eax, 12(%r13)
	movq	%r13, %rax
	jne	.L312
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L311:
	.cfi_restore_state
	movl	$32, %edx
	movl	$.LC30, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L268
	cmpb	$0, 56(%rbx)
	je	.L277
	movsbl	67(%rbx), %esi
.L278:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L276
.L308:
	movl	$20, %edx
	movl	$.LC26, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %r15
	testq	%r15, %r15
	je	.L268
	cmpb	$0, 56(%r15)
	je	.L264
	movsbl	67(%r15), %esi
.L265:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movl	4(%rsp), %edi
	call	PAPI_start
	movl	%eax, %edi
	call	PAPI_strerror
	testq	%rax, %rax
	movq	%rax, %r15
	je	.L313
	movq	%rax, %rdi
	call	strlen
	movq	%r15, %rsi
	movq	%rax, %rdx
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.L267:
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %r15
	testq	%r15, %r15
	je	.L268
	cmpb	$0, 56(%r15)
	je	.L269
	movsbl	67(%r15), %esi
.L270:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L262
.L310:
	movl	$18, %edx
	movl	$.LC29, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %rbx
	testq	%rbx, %rbx
	je	.L268
	cmpb	$0, 56(%rbx)
	je	.L274
	movsbl	67(%rbx), %esi
.L275:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L273
.L264:
	movq	%r15, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r15), %rdx
	movl	$10, %esi
	movq	48(%rdx), %rdx
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rdx
	je	.L265
	movq	%r15, %rdi
	call	*%rdx
	movsbl	%al, %esi
	jmp	.L265
.L274:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L275
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L275
.L277:
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L278
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L278
.L269:
	movq	%r15, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%r15), %rdx
	movl	$10, %esi
	movq	48(%rdx), %rdx
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rdx
	je	.L270
	movq	%r15, %rdi
	call	*%rdx
	movsbl	%al, %esi
	jmp	.L270
.L309:
	movl	$_ZZ16queryTimeAndPapiPFiPiiiES_S_iE19__PRETTY_FUNCTION__, %ecx
	movl	$302, %edx
	movl	$.LC27, %esi
	movl	$.LC28, %edi
	call	__assert_fail
.L313:
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rdi
	addq	$_ZSt4cout, %rdi
	movl	32(%rdi), %esi
	orl	$1, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
	jmp	.L267
.L312:
	call	__stack_chk_fail
.L268:
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE8105:
	.size	_Z16queryTimeAndPapiPFiPiiiES_S_i, .-_Z16queryTimeAndPapiPFiPiiiES_S_i
	.section	.text.unlikely
.LCOLDE31:
	.text
.LHOTE31:
	.section	.text.unlikely
.LCOLDB32:
	.text
.LHOTB32:
	.p2align 4,,15
	.globl	_Z22printArraySequentiallyi
	.type	_Z22printArraySequentiallyi, @function
_Z22printArraySequentiallyi:
.LFB8110:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L325
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	leal	-1(%rdi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	xorl	%ebp, %ebp
	leaq	4(,%rax,4), %r13
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L320
	.p2align 4,,10
	.p2align 3
.L328:
	movsbl	67(%rbx), %esi
.L318:
	movq	%r12, %rdi
	addq	$4, %rbp
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	cmpq	%rbp, %r13
	je	.L326
.L320:
	movq	bfsStructure(%rip), %rax
	movl	$_ZSt4cout, %edi
	movl	(%rax,%rbp), %esi
	call	_ZNSolsEi
	movq	%rax, %r12
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r12,%rax), %rbx
	testq	%rbx, %rbx
	je	.L327
	cmpb	$0, 56(%rbx)
	jne	.L328
	movq	%rbx, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	(%rbx), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L318
	movq	%rbx, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L318
	.p2align 4,,10
	.p2align 3
.L326:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 8
.L325:
	rep ret
.L327:
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -40
	.cfi_offset 6, -32
	.cfi_offset 12, -24
	.cfi_offset 13, -16
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE8110:
	.size	_Z22printArraySequentiallyi, .-_Z22printArraySequentiallyi
	.section	.text.unlikely
.LCOLDE32:
	.text
.LHOTE32:
	.section	.text.unlikely
.LCOLDB33:
	.text
.LHOTB33:
	.p2align 4,,15
	.globl	_Z25generateListsOfQueryListsv
	.type	_Z25generateListsOfQueryListsv, @function
_Z25generateListsOfQueryListsv:
.LFB8111:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movabsq	$1143914305352105984, %rdx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movslq	iterations(%rip), %rax
	cmpq	%rdx, %rax
	ja	.L330
	leaq	0(,%rax,8), %rdi
	xorl	%r13d, %r13d
	call	_Znam
	movq	%rax, 8(%rsp)
	movq	%rax, %r14
	movl	iterations(%rip), %eax
	movl	n(%rip), %ebx
	testl	%eax, %eax
	je	.L335
	.p2align 4,,10
	.p2align 3
.L337:
	movl	$800000, %edi
	call	_Znam
	movq	%rax, %r12
	xorl	%edi, %edi
	leaq	800000(%r12), %rbp
	movq	%r12, %r15
	call	time
	movl	%eax, %edi
	call	srand
	.p2align 4,,10
	.p2align 3
.L332:
	call	rand
	cltd
	addq	$4, %r15
	idivl	%ebx
	movl	%edx, -4(%r15)
	cmpq	%rbp, %r15
	jne	.L332
	pxor	%xmm0, %xmm0
	movq	%r12, (%r14)
	addl	$1, %r13d
	addq	$8, %r14
	cvtsi2sd	%ebx, %xmm0
	mulsd	multFactor(%rip), %xmm0
	call	ceil
	cmpl	%r13d, iterations(%rip)
	cvttsd2si	%xmm0, %ebx
	jne	.L337
.L335:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L330:
	.cfi_restore_state
	call	__cxa_throw_bad_array_new_length
	.cfi_endproc
.LFE8111:
	.size	_Z25generateListsOfQueryListsv, .-_Z25generateListsOfQueryListsv
	.section	.text.unlikely
.LCOLDE33:
	.text
.LHOTE33:
	.section	.rodata.str1.1
.LC34:
	.string	"basic_string::append"
.LC35:
	.string	"data/"
.LC36:
	.string	".txt"
.LC37:
	.string	","
.LC38:
	.string	"\n"
	.section	.text.unlikely
.LCOLDB39:
	.text
.LHOTB39:
	.p2align 4,,15
	.globl	_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8112:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8112
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$648, %rsp
	.cfi_def_cfa_offset 704
	movq	%fs:40, %rax
	movq	%rax, 632(%rsp)
	xorl	%eax, %eax
	leaq	8(%rsi), %rax
	movq	%rax, 8(%rsp)
	leaq	136(%rsi), %rax
	movq	%rax, 40(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 24(%rsp)
.L363:
	leaq	360(%rsp), %rdi
	movl	n(%rip), %ebx
	call	_ZNSt8ios_baseC2Ev
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+8(%rip), %rax
	movb	$0, 584(%rsp)
	leaq	112(%rsp), %rdi
	movq	$_ZTVSt9basic_iosIcSt11char_traitsIcEE+16, 360(%rsp)
	movq	$0, 576(%rsp)
	xorl	%esi, %esi
	movb	$0, 585(%rsp)
	movq	$0, 592(%rsp)
	addq	-24(%rax), %rdi
	movq	%rax, 112(%rsp)
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+16(%rip), %rax
	movq	$0, 600(%rsp)
	movq	$0, 608(%rsp)
	movq	$0, 616(%rsp)
	movq	%rax, (%rdi)
.LEHB0:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE0:
	leaq	112(%rsp), %rax
	movq	$_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24, 112(%rsp)
	movq	$_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64, 360(%rsp)
	leaq	8(%rax), %rdi
.LEHB1:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEEC1Ev
.LEHE1:
	leaq	112(%rsp), %rax
	leaq	120(%rsp), %rsi
	leaq	248(%rax), %rdi
.LEHB2:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E
.LEHE2:
	movq	16(%rsp), %rax
	leaq	48(%rsp), %rdi
	movq	$0, 56(%rsp)
	movb	$0, 64(%rsp)
	movq	%rax, 48(%rsp)
	movq	8(%rsp), %rax
	movq	(%rax), %rax
	leaq	5(%rax), %rsi
	movq	%rax, 32(%rsp)
.LEHB3:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE7reserveEm
	movabsq	$9223372036854775807, %rax
	subq	56(%rsp), %rax
	cmpq	$4, %rax
	jbe	.L385
	leaq	48(%rsp), %rdi
	movl	$5, %edx
	movl	$.LC35, %esi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
	movq	8(%rsp), %rax
	leaq	48(%rsp), %rdi
	movq	-8(%rax), %rsi
	movq	(%rax), %rdx
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE3:
	movabsq	$9223372036854775807, %rax
	subq	56(%rsp), %rax
	cmpq	$3, %rax
	jbe	.L386
	leaq	48(%rsp), %rdi
	movl	$4, %edx
	movl	$.LC36, %esi
.LEHB4:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE4:
	movq	24(%rsp), %rcx
	leaq	16(%rax), %rdx
	movq	%rcx, 80(%rsp)
	movq	(%rax), %rcx
	cmpq	%rdx, %rcx
	je	.L387
	movq	%rcx, 80(%rsp)
	movq	16(%rax), %rcx
	movq	%rcx, 96(%rsp)
.L351:
	movq	8(%rax), %rcx
	movb	$0, 16(%rax)
	movq	%rcx, 88(%rsp)
	movq	%rdx, (%rax)
	movl	$48, %edx
	movq	$0, 8(%rax)
	leaq	112(%rsp), %rax
	movq	80(%rsp), %rsi
	leaq	8(%rax), %rdi
.LEHB5:
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE4openEPKcSt13_Ios_Openmode
	testq	%rax, %rax
	leaq	112(%rsp), %rdi
	movq	112(%rsp), %rax
	je	.L388
	addq	-24(%rax), %rdi
	xorl	%esi, %esi
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE5:
.L355:
	movq	80(%rsp), %rdi
	cmpq	24(%rsp), %rdi
	je	.L354
	call	_ZdlPv
.L354:
	movq	48(%rsp), %rdi
	cmpq	16(%rsp), %rdi
	je	.L356
	call	_ZdlPv
.L356:
	movl	iterations(%rip), %eax
	testl	%eax, %eax
	jle	.L359
	xorl	%r12d, %r12d
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L360:
	movq	(%r15), %rax
	leaq	112(%rsp), %rdi
	movl	%ebx, %esi
	movl	(%rax,%r12), %r14d
.LEHB6:
	call	_ZNSolsEi
	movl	$1, %edx
	movl	$.LC37, %esi
	movq	%rax, %rdi
	movq	%rax, %r13
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r14d, %esi
	movq	%r13, %rdi
	call	_ZNSolsEi
	movl	$1, %edx
	movl	$.LC38, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	pxor	%xmm0, %xmm0
	addl	$1, %ebp
	addq	$4, %r12
	cvtsi2sd	%ebx, %xmm0
	mulsd	multFactor(%rip), %xmm0
	call	ceil
	cmpl	%ebp, iterations(%rip)
	cvttsd2si	%xmm0, %ebx
	jg	.L360
.L359:
	leaq	112(%rsp), %rax
	leaq	8(%rax), %rdi
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
.LEHE6:
	testq	%rax, %rax
	je	.L389
.L364:
	leaq	120(%rsp), %rdi
	movq	$_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+24, 112(%rsp)
	movq	$_ZTVSt14basic_ofstreamIcSt11char_traitsIcEE+64, 360(%rsp)
	movq	$_ZTVSt13basic_filebufIcSt11char_traitsIcEE+16, 120(%rsp)
	addq	$8, %r15
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEE5closeEv
	leaq	224(%rsp), %rdi
	call	_ZNSt12__basic_fileIcED1Ev
	leaq	176(%rsp), %rdi
	movq	$_ZTVSt15basic_streambufIcSt11char_traitsIcEE+16, 120(%rsp)
	call	_ZNSt6localeD1Ev
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+8(%rip), %rax
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+16(%rip), %rcx
	leaq	360(%rsp), %rdi
	movq	-24(%rax), %rax
	movq	%rcx, 112(%rsp,%rax)
	movq	$_ZTVSt9basic_iosIcSt11char_traitsIcEE+16, 360(%rsp)
	call	_ZNSt8ios_baseD2Ev
	addq	$32, 8(%rsp)
	movq	8(%rsp), %rax
	cmpq	%rax, 40(%rsp)
	jne	.L363
	movq	632(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L390
	addq	$648, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L387:
	.cfi_restore_state
	movq	16(%rax), %rsi
	movq	24(%rax), %rdi
	movq	%rsi, 96(%rsp)
	movq	%rdi, 104(%rsp)
	jmp	.L351
.L389:
	movq	112(%rsp), %rax
	leaq	112(%rsp), %rdi
	addq	-24(%rax), %rdi
	movl	32(%rdi), %esi
	orl	$4, %esi
.LEHB7:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE7:
	jmp	.L364
.L388:
	addq	-24(%rax), %rdi
	movl	32(%rdi), %esi
	orl	$4, %esi
.LEHB8:
	call	_ZNSt9basic_iosIcSt11char_traitsIcEE5clearESt12_Ios_Iostate
.LEHE8:
	jmp	.L355
.L370:
	movq	%rax, %rbx
.L348:
	leaq	112(%rsp), %rdi
	call	_ZNSt14basic_ofstreamIcSt11char_traitsIcEED1Ev
	movq	%rbx, %rdi
.LEHB9:
	call	_Unwind_Resume
.LEHE9:
.L372:
	movq	80(%rsp), %rdi
	leaq	96(%rsp), %rdx
	movq	%rax, %rbx
	cmpq	%rdx, %rdi
	je	.L367
	call	_ZdlPv
.L367:
	movq	48(%rsp), %rdi
	leaq	64(%rsp), %rdx
	cmpq	%rdx, %rdi
	je	.L348
.L380:
	call	_ZdlPv
	jmp	.L348
.L371:
	movq	%rax, %rbx
	jmp	.L367
.L386:
	movl	$.LC34, %edi
.LEHB10:
	call	_ZSt20__throw_length_errorPKc
.LEHE10:
.L385:
	movl	$.LC34, %edi
.LEHB11:
	call	_ZSt20__throw_length_errorPKc
.LEHE11:
.L373:
	movq	48(%rsp), %rdi
	movq	%rax, %rbx
	leaq	64(%rsp), %rax
	cmpq	%rax, %rdi
	jne	.L380
	jmp	.L348
.L376:
	leaq	120(%rsp), %rdi
	movq	%rax, %rbx
	call	_ZNSt13basic_filebufIcSt11char_traitsIcEED1Ev
	movq	%rbx, %rax
.L342:
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+8(%rip), %rcx
	movq	%rax, %rbx
	movq	-24(%rcx), %rdx
	movq	_ZTTSt14basic_ofstreamIcSt11char_traitsIcEE+16(%rip), %rcx
	movq	%rcx, 112(%rsp,%rdx)
.L343:
	leaq	360(%rsp), %rdi
	movq	$_ZTVSt9basic_iosIcSt11char_traitsIcEE+16, 360(%rsp)
	call	_ZNSt8ios_baseD2Ev
	movq	%rbx, %rdi
.LEHB12:
	call	_Unwind_Resume
.LEHE12:
.L375:
	jmp	.L342
.L374:
	movq	%rax, %rbx
	jmp	.L343
.L390:
	call	__stack_chk_fail
	.cfi_endproc
.LFE8112:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA8112:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8112-.LLSDACSB8112
.LLSDACSB8112:
	.uleb128 .LEHB0-.LFB8112
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L374-.LFB8112
	.uleb128 0
	.uleb128 .LEHB1-.LFB8112
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L375-.LFB8112
	.uleb128 0
	.uleb128 .LEHB2-.LFB8112
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L376-.LFB8112
	.uleb128 0
	.uleb128 .LEHB3-.LFB8112
	.uleb128 .LEHE3-.LEHB3
	.uleb128 .L373-.LFB8112
	.uleb128 0
	.uleb128 .LEHB4-.LFB8112
	.uleb128 .LEHE4-.LEHB4
	.uleb128 .L371-.LFB8112
	.uleb128 0
	.uleb128 .LEHB5-.LFB8112
	.uleb128 .LEHE5-.LEHB5
	.uleb128 .L372-.LFB8112
	.uleb128 0
	.uleb128 .LEHB6-.LFB8112
	.uleb128 .LEHE6-.LEHB6
	.uleb128 .L370-.LFB8112
	.uleb128 0
	.uleb128 .LEHB7-.LFB8112
	.uleb128 .LEHE7-.LEHB7
	.uleb128 .L370-.LFB8112
	.uleb128 0
	.uleb128 .LEHB8-.LFB8112
	.uleb128 .LEHE8-.LEHB8
	.uleb128 .L372-.LFB8112
	.uleb128 0
	.uleb128 .LEHB9-.LFB8112
	.uleb128 .LEHE9-.LEHB9
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB10-.LFB8112
	.uleb128 .LEHE10-.LEHB10
	.uleb128 .L371-.LFB8112
	.uleb128 0
	.uleb128 .LEHB11-.LFB8112
	.uleb128 .LEHE11-.LEHB11
	.uleb128 .L373-.LFB8112
	.uleb128 0
	.uleb128 .LEHB12-.LFB8112
	.uleb128 .LEHE12-.LEHB12
	.uleb128 0
	.uleb128 0
.LLSDACSE8112:
	.text
	.size	_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text.unlikely
.LCOLDE39:
	.text
.LHOTE39:
	.section	.rodata.str1.1
.LC40:
	.string	"iteration: "
.LC41:
	.string	"n: "
.LC42:
	.string	"Could not reset papi...."
.LC43:
	.string	"Papi reset counter"
	.section	.rodata.str1.8
	.align 8
.LC44:
	.string	"------------------------------------------"
	.section	.rodata.str1.1
.LC45:
	.string	"times"
.LC46:
	.string	"BM"
.LC47:
	.string	"L1"
.LC48:
	.string	"L2"
	.section	.text.unlikely
.LCOLDB49:
	.text
.LHOTB49:
	.p2align 4,,15
	.globl	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.type	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, @function
_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE:
.LFB8113:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8113
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movabsq	$2287828610704211968, %rbx
	subq	$248, %rsp
	.cfi_def_cfa_offset 304
	movq	%rdi, 24(%rsp)
	movslq	iterations(%rip), %rdi
	movq	%fs:40, %rax
	movq	%rax, 232(%rsp)
	xorl	%eax, %eax
	movq	%rsi, 32(%rsp)
	movq	%r8, 48(%rsp)
	cmpq	%rbx, %rdi
	ja	.L392
	salq	$2, %rdi
	movl	%edx, %r12d
	movq	%rcx, %r15
.LEHB13:
	call	_Znam
	movslq	iterations(%rip), %rdi
	movq	%rax, (%rsp)
	cmpq	%rbx, %rdi
	ja	.L392
	salq	$2, %rdi
	call	_Znam
	movslq	iterations(%rip), %rdi
	movq	%rax, 8(%rsp)
	cmpq	%rbx, %rdi
	ja	.L392
	salq	$2, %rdi
	call	_Znam
	movslq	iterations(%rip), %rdi
	movq	%rax, 16(%rsp)
	cmpq	%rbx, %rdi
	ja	.L392
	salq	$2, %rdi
	call	_Znam
	movl	iterations(%rip), %edx
	movq	%rax, %r14
	movl	n(%rip), %eax
	testl	%edx, %edx
	movl	%eax, 60(%rsp)
	jle	.L394
	xorl	%ebx, %ebx
	movl	%eax, %edi
	jmp	.L395
	.p2align 4,,10
	.p2align 3
.L553:
	movsbl	67(%r13), %esi
.L401:
	movq	%rdx, %rdi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movl	n(%rip), %r13d
	movl	$3, %edx
	movl	$.LC41, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%r13d, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movq	%rax, %rdx
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rdx,%rax), %r13
	testq	%r13, %r13
	je	.L402
	cmpb	$0, 56(%r13)
	je	.L403
	movsbl	67(%r13), %esi
.L404:
	movq	%rdx, %rdi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movq	(%r15,%rbx,8), %rdx
	movq	32(%rsp), %rdi
	movl	%r12d, %ecx
	movq	%rbp, %rsi
	call	_Z16queryTimeAndPapiPFiPiiiES_S_i
	movl	(%rax), %ecx
	movl	4(%rax), %r8d
	movq	%rax, %r13
	movl	8(%rax), %edi
	movl	12(%rax), %esi
	movl	$1125899907, %eax
	pxor	%xmm0, %xmm0
	imull	%ecx
	movq	(%rsp), %rax
	sarl	$31, %ecx
	cvtsi2sd	n(%rip), %xmm0
	mulsd	multFactor(%rip), %xmm0
	sarl	$18, %edx
	subl	%ecx, %edx
	movl	$351843721, %ecx
	movl	%edx, (%rax,%rbx,4)
	movl	%r8d, %eax
	sarl	$31, %r8d
	imull	%ecx
	movq	8(%rsp), %rax
	sarl	$14, %edx
	subl	%r8d, %edx
	movl	%edx, (%rax,%rbx,4)
	movl	%edi, %eax
	sarl	$31, %edi
	imull	%ecx
	movq	16(%rsp), %rax
	sarl	$14, %edx
	subl	%edi, %edx
	movl	%edx, (%rax,%rbx,4)
	movl	%esi, %eax
	sarl	$31, %esi
	imull	%ecx
	sarl	$14, %edx
	subl	%esi, %edx
	movl	%edx, (%r14,%rbx,4)
	call	ceil
	cvttsd2si	%xmm0, %eax
	movq	%r13, %rdi
	movl	%eax, n(%rip)
	call	_ZdaPv
	movl	%r12d, %edi
	call	PAPI_reset
	testl	%eax, %eax
	jne	.L552
.L405:
	movl	$18, %edx
	movl	$.LC43, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %r13
	testq	%r13, %r13
	je	.L402
	cmpb	$0, 56(%r13)
	je	.L408
	movsbl	67(%r13), %esi
.L409:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	movl	$42, %edx
	movl	$.LC44, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %r13
	testq	%r13, %r13
	je	.L402
	cmpb	$0, 56(%r13)
	je	.L410
	movsbl	67(%r13), %esi
.L411:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	testq	%rbp, %rbp
	je	.L412
	movq	%rbp, %rdi
	call	_ZdaPv
.L412:
	leal	1(%rbx), %eax
	addq	$1, %rbx
	cmpl	%eax, iterations(%rip)
	jle	.L394
	movl	n(%rip), %edi
.L395:
	movq	24(%rsp), %rax
	call	*%rax
	movl	$11, %edx
	movl	$.LC40, %esi
	movl	$_ZSt4cout, %edi
	movq	%rax, %rbp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%ebx, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movq	%rax, %rdx
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%rdx,%rax), %r13
	testq	%r13, %r13
	je	.L402
	cmpb	$0, 56(%r13)
	jne	.L553
	movq	%r13, %rdi
	movq	%rdx, 40(%rsp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	40(%rsp), %rdx
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L401
	movq	%r13, %rdi
	call	*%rax
	movq	40(%rsp), %rdx
	movsbl	%al, %esi
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L403:
	movq	%r13, %rdi
	movq	%rdx, 40(%rsp)
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	40(%rsp), %rdx
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L404
	movq	%r13, %rdi
	call	*%rax
	movq	40(%rsp), %rdx
	movsbl	%al, %esi
	jmp	.L404
	.p2align 4,,10
	.p2align 3
.L408:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L409
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L409
	.p2align 4,,10
	.p2align 3
.L410:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L411
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L411
	.p2align 4,,10
	.p2align 3
.L552:
	movl	$24, %edx
	movl	$.LC42, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	_ZSt4cout(%rip), %rax
	movq	-24(%rax), %rax
	movq	_ZSt4cout+240(%rax), %r13
	testq	%r13, %r13
	je	.L402
	cmpb	$0, 56(%r13)
	je	.L406
	movsbl	67(%r13), %esi
.L407:
	movl	$_ZSt4cout, %edi
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	jmp	.L405
	.p2align 4,,10
	.p2align 3
.L406:
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%r13), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L407
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L407
	.p2align 4,,10
	.p2align 3
.L394:
	movl	60(%rsp), %eax
	movl	$32, %edi
	leaq	96(%rsp), %rbx
	movl	%eax, n(%rip)
	call	_Znam
	movq	%rax, %r12
	movq	(%rsp), %rax
	movq	%r14, 24(%r12)
	movq	%rax, (%r12)
	movq	8(%rsp), %rax
	movq	%rax, 8(%r12)
	movq	16(%rsp), %rax
	movq	%rax, 16(%r12)
	leaq	16(%rbx), %rax
	movq	%rax, 96(%rsp)
	movq	48(%rsp), %rax
	movq	(%rax), %r13
	movq	8(%rax), %rbp
	movq	%r13, %rax
	addq	%rbp, %rax
	je	.L398
	testq	%r13, %r13
	jne	.L398
	movl	$.LC7, %edi
	call	_ZSt19__throw_logic_errorPKc
.LEHE13:
	.p2align 4,,10
	.p2align 3
.L398:
	cmpq	$15, %rbp
	movq	%rbp, 88(%rsp)
	ja	.L554
	cmpq	$1, %rbp
	je	.L555
	testq	%rbp, %rbp
	leaq	16(%rbx), %rax
	jne	.L556
.L415:
	movq	%rbp, 104(%rsp)
	movb	$0, (%rax,%rbp)
	movabsq	$9223372036854775807, %rax
	subq	104(%rsp), %rax
	cmpq	$4, %rax
	jbe	.L557
	movl	$5, %edx
	movl	$.LC45, %esi
	movq	%rbx, %rdi
.LEHB14:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE14:
	leaq	48(%rbx), %rax
	movq	%rax, 128(%rsp)
	movq	48(%rsp), %rax
	movq	(%rax), %r13
	movq	8(%rax), %rbp
	movq	%r13, %rax
	addq	%rbp, %rax
	je	.L419
	testq	%r13, %r13
	jne	.L419
	movl	$.LC7, %edi
.LEHB15:
	call	_ZSt19__throw_logic_errorPKc
.LEHE15:
	.p2align 4,,10
	.p2align 3
.L419:
	cmpq	$15, %rbp
	movq	%rbp, 72(%rsp)
	ja	.L558
	cmpq	$1, %rbp
	je	.L559
	testq	%rbp, %rbp
	leaq	48(%rbx), %rax
	jne	.L560
.L427:
	movq	%rbp, 136(%rsp)
	movb	$0, (%rax,%rbp)
	movabsq	$9223372036854775807, %rax
	subq	136(%rsp), %rax
	cmpq	$1, %rax
	jbe	.L561
	leaq	32(%rbx), %rdi
	movl	$2, %edx
	movl	$.LC46, %esi
.LEHB16:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE16:
	leaq	80(%rbx), %rax
	movq	%rax, 160(%rsp)
	movq	48(%rsp), %rax
	movq	(%rax), %r13
	movq	8(%rax), %rbp
	movq	%r13, %rax
	addq	%rbp, %rax
	je	.L431
	testq	%r13, %r13
	jne	.L431
	movl	$.LC7, %edi
.LEHB17:
	call	_ZSt19__throw_logic_errorPKc
.LEHE17:
	.p2align 4,,10
	.p2align 3
.L431:
	cmpq	$15, %rbp
	movq	%rbp, 80(%rsp)
	ja	.L562
	cmpq	$1, %rbp
	je	.L563
	testq	%rbp, %rbp
	leaq	80(%rbx), %rax
	jne	.L564
.L438:
	movq	%rbp, 168(%rsp)
	movb	$0, (%rax,%rbp)
	movabsq	$9223372036854775807, %rax
	subq	168(%rsp), %rax
	cmpq	$1, %rax
	jbe	.L565
	leaq	64(%rbx), %rdi
	movl	$2, %edx
	movl	$.LC47, %esi
.LEHB18:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE18:
	leaq	112(%rbx), %rax
	movq	%rax, 192(%rsp)
	movq	48(%rsp), %rax
	movq	(%rax), %r13
	movq	8(%rax), %rbp
	movq	%r13, %rax
	addq	%rbp, %rax
	je	.L442
	testq	%r13, %r13
	jne	.L442
	movl	$.LC7, %edi
.LEHB19:
	call	_ZSt19__throw_logic_errorPKc
.LEHE19:
	.p2align 4,,10
	.p2align 3
.L442:
	cmpq	$15, %rbp
	movq	%rbp, 88(%rsp)
	ja	.L566
	cmpq	$1, %rbp
	je	.L567
	testq	%rbp, %rbp
	leaq	112(%rbx), %rax
	jne	.L568
.L449:
	movq	%rbp, 200(%rsp)
	movb	$0, (%rax,%rbp)
	movabsq	$9223372036854775807, %rax
	subq	200(%rsp), %rax
	cmpq	$1, %rax
	jbe	.L569
	leaq	96(%rbx), %rdi
	movl	$2, %edx
	movl	$.LC48, %esi
.LEHB20:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_appendEPKcm
.LEHE20:
	movq	%rbx, %rsi
	movq	%r12, %rdi
.LEHB21:
	call	_Z18writeResultsToFilePPiPNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE21:
	movq	(%rsp), %rdi
	leaq	128(%rbx), %rbp
	call	_ZdaPv
	movq	8(%rsp), %rdi
	call	_ZdaPv
	movq	16(%rsp), %rdi
	call	_ZdaPv
	movq	%r14, %rdi
	call	_ZdaPv
	movq	%r12, %rdi
	call	_ZdaPv
.L457:
	subq	$32, %rbp
	movq	0(%rbp), %rdi
	leaq	16(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L456
	call	_ZdlPv
.L456:
	cmpq	%rbx, %rbp
	jne	.L457
	movq	232(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L570
	addq	$248, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L554:
	.cfi_restore_state
	leaq	88(%rsp), %rsi
	movq	%rbx, %rdi
	xorl	%edx, %edx
.LEHB22:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE22:
	movq	%rax, %rdi
	movq	%rax, 96(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 112(%rsp)
.L413:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	memcpy
	movq	88(%rsp), %rbp
	movq	96(%rsp), %rax
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L558:
	leaq	32(%rbx), %rdi
	leaq	72(%rsp), %rsi
	xorl	%edx, %edx
.LEHB23:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE23:
	movq	%rax, %rdi
	movq	%rax, 128(%rsp)
	movq	72(%rsp), %rax
	movq	%rax, 144(%rsp)
.L425:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	memcpy
	movq	72(%rsp), %rbp
	movq	128(%rsp), %rax
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L566:
	leaq	96(%rbx), %rdi
	leaq	88(%rsp), %rsi
	xorl	%edx, %edx
.LEHB24:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE24:
	movq	%rax, %rdi
	movq	%rax, 192(%rsp)
	movq	88(%rsp), %rax
	movq	%rax, 208(%rsp)
.L447:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	memcpy
	movq	88(%rsp), %rbp
	movq	192(%rsp), %rax
	jmp	.L449
	.p2align 4,,10
	.p2align 3
.L562:
	leaq	64(%rbx), %rdi
	leaq	80(%rsp), %rsi
	xorl	%edx, %edx
.LEHB25:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
.LEHE25:
	movq	%rax, %rdi
	movq	%rax, 160(%rsp)
	movq	80(%rsp), %rax
	movq	%rax, 176(%rsp)
.L436:
	movq	%rbp, %rdx
	movq	%r13, %rsi
	call	memcpy
	movq	80(%rsp), %rbp
	movq	160(%rsp), %rax
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L559:
	movzbl	0(%r13), %eax
	movb	%al, 144(%rsp)
	leaq	48(%rbx), %rax
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L555:
	movzbl	0(%r13), %eax
	movb	%al, 112(%rsp)
	leaq	16(%rbx), %rax
	jmp	.L415
	.p2align 4,,10
	.p2align 3
.L563:
	movzbl	0(%r13), %eax
	movb	%al, 176(%rsp)
	leaq	80(%rbx), %rax
	jmp	.L438
	.p2align 4,,10
	.p2align 3
.L567:
	movzbl	0(%r13), %eax
	movb	%al, 208(%rsp)
	leaq	112(%rbx), %rax
	jmp	.L449
	.p2align 4,,10
	.p2align 3
.L492:
.L545:
	leaq	96(%rbx), %rbp
	movq	%rax, %r12
.L515:
	subq	$32, %rbp
	movq	0(%rbp), %rdi
	leaq	16(%rbp), %rdx
	cmpq	%rdx, %rdi
	je	.L458
	call	_ZdlPv
.L458:
	cmpq	%rbx, %rbp
	jne	.L515
	movq	%r12, %rdi
.LEHB26:
	call	_Unwind_Resume
	.p2align 4,,10
	.p2align 3
.L490:
.L544:
	leaq	64(%rbx), %rbp
	movq	%rax, %r12
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L488:
.L543:
	leaq	32(%rbx), %rbp
	movq	%rax, %r12
	jmp	.L515
	.p2align 4,,10
	.p2align 3
.L568:
	movq	%rax, %rdi
	jmp	.L447
.L556:
	movq	%rax, %rdi
	jmp	.L413
.L560:
	movq	%rax, %rdi
	jmp	.L425
.L564:
	movq	%rax, %rdi
	jmp	.L436
.L402:
	call	_ZSt16__throw_bad_castv
.LEHE26:
.L491:
	jmp	.L545
.L557:
	movl	$.LC34, %edi
.LEHB27:
	call	_ZSt20__throw_length_errorPKc
.LEHE27:
.L483:
	leaq	128(%rbx), %rbp
	movq	%rax, %r12
.L453:
	subq	$32, %rbp
	movq	0(%rbp), %rdi
	leaq	16(%rbp), %rax
	cmpq	%rax, %rdi
	je	.L460
	call	_ZdlPv
.L460:
	cmpq	%rbx, %rbp
	jne	.L453
	movq	%r12, %rdi
.LEHB28:
	call	_Unwind_Resume
.L487:
	movq	192(%rsp), %rdi
	movq	%rax, %rbp
	leaq	112(%rbx), %rax
	cmpq	%rax, %rdi
	je	.L455
	call	_ZdlPv
.L455:
	movq	%rbp, %rax
	jmp	.L545
.L392:
	call	__cxa_throw_bad_array_new_length
.LEHE28:
.L570:
	call	__stack_chk_fail
.L561:
	movl	$.LC34, %edi
.LEHB29:
	call	_ZSt20__throw_length_errorPKc
.LEHE29:
.L565:
	movl	$.LC34, %edi
.LEHB30:
	call	_ZSt20__throw_length_errorPKc
.LEHE30:
.L485:
	movq	128(%rsp), %rdi
	movq	%rax, %rbp
	leaq	48(%rbx), %rax
	cmpq	%rax, %rdi
	je	.L433
	call	_ZdlPv
.L433:
	movq	%rbp, %rax
	leaq	32(%rbx), %rbp
	movq	%rax, %r12
	jmp	.L515
.L486:
	movq	160(%rsp), %rdi
	movq	%rax, %rbp
	leaq	80(%rbx), %rax
	cmpq	%rax, %rdi
	je	.L444
	call	_ZdlPv
.L444:
	movq	%rbp, %rax
	leaq	64(%rbx), %rbp
	movq	%rax, %r12
	jmp	.L515
.L569:
	movl	$.LC34, %edi
.LEHB31:
	call	_ZSt20__throw_length_errorPKc
.LEHE31:
.L484:
	movq	96(%rsp), %rdi
	addq	$16, %rbx
	movq	%rax, %rbp
	cmpq	%rbx, %rdi
	je	.L421
	call	_ZdlPv
.L421:
	movq	%rbp, %rdi
.LEHB32:
	call	_Unwind_Resume
.LEHE32:
.L489:
	jmp	.L544
.L493:
	jmp	.L543
	.cfi_endproc
.LFE8113:
	.section	.gcc_except_table
.LLSDA8113:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8113-.LLSDACSB8113
.LLSDACSB8113:
	.uleb128 .LEHB13-.LFB8113
	.uleb128 .LEHE13-.LEHB13
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB14-.LFB8113
	.uleb128 .LEHE14-.LEHB14
	.uleb128 .L484-.LFB8113
	.uleb128 0
	.uleb128 .LEHB15-.LFB8113
	.uleb128 .LEHE15-.LEHB15
	.uleb128 .L488-.LFB8113
	.uleb128 0
	.uleb128 .LEHB16-.LFB8113
	.uleb128 .LEHE16-.LEHB16
	.uleb128 .L485-.LFB8113
	.uleb128 0
	.uleb128 .LEHB17-.LFB8113
	.uleb128 .LEHE17-.LEHB17
	.uleb128 .L490-.LFB8113
	.uleb128 0
	.uleb128 .LEHB18-.LFB8113
	.uleb128 .LEHE18-.LEHB18
	.uleb128 .L486-.LFB8113
	.uleb128 0
	.uleb128 .LEHB19-.LFB8113
	.uleb128 .LEHE19-.LEHB19
	.uleb128 .L492-.LFB8113
	.uleb128 0
	.uleb128 .LEHB20-.LFB8113
	.uleb128 .LEHE20-.LEHB20
	.uleb128 .L487-.LFB8113
	.uleb128 0
	.uleb128 .LEHB21-.LFB8113
	.uleb128 .LEHE21-.LEHB21
	.uleb128 .L483-.LFB8113
	.uleb128 0
	.uleb128 .LEHB22-.LFB8113
	.uleb128 .LEHE22-.LEHB22
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB23-.LFB8113
	.uleb128 .LEHE23-.LEHB23
	.uleb128 .L493-.LFB8113
	.uleb128 0
	.uleb128 .LEHB24-.LFB8113
	.uleb128 .LEHE24-.LEHB24
	.uleb128 .L491-.LFB8113
	.uleb128 0
	.uleb128 .LEHB25-.LFB8113
	.uleb128 .LEHE25-.LEHB25
	.uleb128 .L489-.LFB8113
	.uleb128 0
	.uleb128 .LEHB26-.LFB8113
	.uleb128 .LEHE26-.LEHB26
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB27-.LFB8113
	.uleb128 .LEHE27-.LEHB27
	.uleb128 .L484-.LFB8113
	.uleb128 0
	.uleb128 .LEHB28-.LFB8113
	.uleb128 .LEHE28-.LEHB28
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB29-.LFB8113
	.uleb128 .LEHE29-.LEHB29
	.uleb128 .L485-.LFB8113
	.uleb128 0
	.uleb128 .LEHB30-.LFB8113
	.uleb128 .LEHE30-.LEHB30
	.uleb128 .L486-.LFB8113
	.uleb128 0
	.uleb128 .LEHB31-.LFB8113
	.uleb128 .LEHE31-.LEHB31
	.uleb128 .L487-.LFB8113
	.uleb128 0
	.uleb128 .LEHB32-.LFB8113
	.uleb128 .LEHE32-.LEHB32
	.uleb128 0
	.uleb128 0
.LLSDACSE8113:
	.text
	.size	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE, .-_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
	.section	.text.unlikely
.LCOLDE49:
	.text
.LHOTE49:
	.section	.rodata.str1.1
.LC50:
	.string	"BFS2"
.LC51:
	.string	"BFS"
.LC52:
	.string	"Simple"
.LC53:
	.string	"Main is Done"
	.section	.text.unlikely
.LCOLDB54:
	.section	.text.startup,"ax",@progbits
.LHOTB54:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB8114:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA8114
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$56, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
.LEHB33:
	call	_Z8initPapiv
	movl	%eax, %ebp
	call	_Z25generateListsOfQueryListsv
	movl	$.LC50, %esi
	movq	%rax, %rbx
	movq	%rsp, %rdi
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27
.LEHE33:
	movq	%rsp, %r8
	movq	%rbx, %rcx
	movl	%ebp, %edx
	movl	$_Z27binarySearchOnBFSStructure2Piii, %esi
	movl	$_Z14createBFSArrayi, %edi
.LEHB34:
	call	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE34:
	movq	(%rsp), %rdi
	leaq	16(%rsp), %rax
	cmpq	%rax, %rdi
	je	.L572
	call	_ZdlPv
.L572:
	movl	$.LC51, %esi
	movq	%rsp, %rdi
.LEHB35:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27
.LEHE35:
	movq	%rsp, %r8
	movq	%rbx, %rcx
	movl	%ebp, %edx
	movl	$_Z26binarySearchOnBFSStructurePiii, %esi
	movl	$_Z14createBFSArrayi, %edi
.LEHB36:
	call	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE36:
	movq	(%rsp), %rdi
	leaq	16(%rsp), %rax
	cmpq	%rax, %rdi
	je	.L573
	call	_ZdlPv
.L573:
	movl	$.LC52, %esi
	movq	%rsp, %rdi
.LEHB37:
	call	_ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEC2EPKcRKS3_.isra.27
.LEHE37:
	movq	%rsp, %r8
	movq	%rbx, %rcx
	movl	%ebp, %edx
	movl	$_Z18binarySearchSimplePiii, %esi
	movl	$_Z17getSequentialListi, %edi
.LEHB38:
	call	_Z19runExperimentNtimesPFPiiEPFiS_iiEiPS_NSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEE
.LEHE38:
	movq	(%rsp), %rdi
	leaq	16(%rsp), %rax
	cmpq	%rax, %rdi
	je	.L574
	call	_ZdlPv
.L574:
	testq	%rbx, %rbx
	je	.L575
	movq	%rbx, %rdi
	call	_ZdaPv
.L575:
	movl	$12, %edx
	movl	$.LC53, %esi
	movl	$_ZSt4cout, %edi
.LEHB39:
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.constprop.34
	xorl	%eax, %eax
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L595
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L595:
	.cfi_restore_state
	call	__stack_chk_fail
.L585:
	movq	(%rsp), %rdi
	leaq	16(%rsp), %rdx
	movq	%rax, %rbx
	cmpq	%rdx, %rdi
	je	.L581
.L591:
	call	_ZdlPv
.L581:
	movq	%rbx, %rdi
	call	_Unwind_Resume
.LEHE39:
.L584:
.L593:
	movq	(%rsp), %rdi
	movq	%rax, %rbx
	leaq	16(%rsp), %rax
	cmpq	%rax, %rdi
	jne	.L591
	jmp	.L581
.L583:
	jmp	.L593
	.cfi_endproc
.LFE8114:
	.section	.gcc_except_table
.LLSDA8114:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE8114-.LLSDACSB8114
.LLSDACSB8114:
	.uleb128 .LEHB33-.LFB8114
	.uleb128 .LEHE33-.LEHB33
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB34-.LFB8114
	.uleb128 .LEHE34-.LEHB34
	.uleb128 .L583-.LFB8114
	.uleb128 0
	.uleb128 .LEHB35-.LFB8114
	.uleb128 .LEHE35-.LEHB35
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB36-.LFB8114
	.uleb128 .LEHE36-.LEHB36
	.uleb128 .L584-.LFB8114
	.uleb128 0
	.uleb128 .LEHB37-.LFB8114
	.uleb128 .LEHE37-.LEHB37
	.uleb128 0
	.uleb128 0
	.uleb128 .LEHB38-.LFB8114
	.uleb128 .LEHE38-.LEHB38
	.uleb128 .L585-.LFB8114
	.uleb128 0
	.uleb128 .LEHB39-.LFB8114
	.uleb128 .LEHE39-.LEHB39
	.uleb128 0
	.uleb128 0
.LLSDACSE8114:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE54:
	.section	.text.startup
.LHOTE54:
	.section	.text.unlikely
.LCOLDB55:
	.section	.text.startup
.LHOTB55:
	.p2align 4,,15
	.type	_GLOBAL__sub_I_points, @function
_GLOBAL__sub_I_points:
.LFB8416:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE8416:
	.size	_GLOBAL__sub_I_points, .-_GLOBAL__sub_I_points
	.section	.text.unlikely
.LCOLDE55:
	.section	.text.startup
.LHOTE55:
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_points
	.section	.rodata
	.align 32
	.type	_ZZ16queryTimeAndPapiPFiPiiiES_S_iE19__PRETTY_FUNCTION__, @object
	.size	_ZZ16queryTimeAndPapiPFiPiiiES_S_iE19__PRETTY_FUNCTION__, 64
_ZZ16queryTimeAndPapiPFiPiiiES_S_iE19__PRETTY_FUNCTION__:
	.string	"int* queryTimeAndPapi(int (*)(int*, int, int), int*, int*, int)"
	.globl	iterations
	.data
	.align 4
	.type	iterations, @object
	.size	iterations, 4
iterations:
	.long	60
	.globl	n
	.align 4
	.type	n, @object
	.size	n, 4
n:
	.long	10
	.globl	multFactor
	.align 8
	.type	multFactor, @object
	.size	multFactor, 8
multFactor:
	.long	3435973837
	.long	1073007820
	.globl	highestIndex
	.bss
	.align 4
	.type	highestIndex, @object
	.size	highestIndex, 4
highestIndex:
	.zero	4
	.globl	bfsStructure
	.align 8
	.type	bfsStructure, @object
	.size	bfsStructure, 8
bfsStructure:
	.zero	8
	.globl	points
	.align 8
	.type	points, @object
	.size	points, 8
points:
	.zero	8
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC4:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC5:
	.long	4
	.long	4
	.long	4
	.long	4
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC12:
	.long	0
	.long	-1074790400
	.align 8
.LC14:
	.long	0
	.long	1072693248
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 5.3.1-14ubuntu2) 5.3.1 20160413"
	.section	.note.GNU-stack,"",@progbits
