	.text
	.file	"args.c"
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rsi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	printf
	movl	-8(%rbp), %esi
	movabsq	$.L.str.1, %rdi
	movl	%eax, -24(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
	movl	$0, -20(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.LBB0_4
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdx
	movabsq	$.L.str.2, %rdi
	movb	$0, %al
	callq	printf
	movl	-20(%rbp), %esi
	movq	-16(%rbp), %rcx
	movslq	-20(%rbp), %rdx
	movq	(%rcx,%rdx,8), %rdx
	movabsq	$.L.str.3, %rdi
	movl	%eax, -28(%rbp)                 # 4-byte Spill
	movb	$0, %al
	callq	printf
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB0_1
.LBB0_4:
	movl	-4(%rbp), %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%p\n"
	.size	.L.str, 4

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"argc=%d\n"
	.size	.L.str.1, 9

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"argv[%d] = %p\n"
	.size	.L.str.2, 15

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"argv[%d]=%s\n"
	.size	.L.str.3, 13

	.ident	"Debian clang version 11.0.1-2"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym printf
