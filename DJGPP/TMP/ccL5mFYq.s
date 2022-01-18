	.file	"mbox.c"
	.section .text
	.p2align 4,,15
	.globl	_FlameDraw
_FlameDraw:
LFB188:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$60, %esp
	.cfi_def_cfa_offset 80
	movl	80(%esp), %edx
	movl	88(%esp), %ecx
	movl	88(%esp), %esi
	movl	84(%esp), %edi
	movl	24(%edx), %ebp
	movl	4(%ecx), %ebx
	movl	12(%esi), %eax
	subl	%ebp, %ebx
	subl	%ebp, %eax
	movl	%ebx, 32(%esp)
	cmpl	%eax, %ebx
	jg	L1
	movl	80(%esp), %edx
	movl	20(%edx), %ebx
	movl	8(%esi), %edx
	movl	%ebp, %esi
L7:
	movl	88(%esp), %ebp
	movl	32(%esp), %ecx
	incl	%ecx
	movl	0(%ebp), %eax
	movl	%ecx, 44(%esp)
	subl	%ebx, %eax
	leal	1(%eax), %ebp
	leal	0(%ebp,%ebp,2), %ecx
	leal	0(%ebp,%ecx,4), %ecx
	leal	0(%ebp,%ecx,4), %ecx
	movl	44(%esp), %ebp
	leal	_Scr(%ebp,%ecx,4), %ecx
	movl	%ecx, 24(%esp)
	jmp	L3
	.p2align 4,,7
L4:
	movl	28(%edi), %ecx
	movl	_Col(,%ebp,4), %ebp
	movl	%ebp, 12(%esp)
	movl	%esi, 8(%esp)
	movl	%ebx, 4(%esp)
	movl	%edi, (%esp)
	call	*36(%ecx)
L5:
	movl	88(%esp), %ebx
	movl	80(%esp), %esi
	movl	24(%esp), %eax
	addl	$212, %eax
	movl	8(%ebx), %edx
	movl	%eax, 24(%esp)
	movl	20(%esi), %ebx
	movl	28(%esp), %eax
	movl	24(%esi), %esi
L3:
	movl	%edx, %ebp
	subl	%ebx, %ebp
	cmpl	%ebp, %eax
	jg	L12
	leal	1(%eax), %edx
	movl	24(%esp), %ebp
	addl	%eax, %ebx
	movl	32(%esp), %eax
	addl	%eax, %esi
	movl	_Mouse, %eax
	movb	0(%ebp), %cl
	movl	%edx, 28(%esp)
	andl	$255, %ecx
	movl	24(%eax), %edx
	movl	%ecx, %ebp
	cmpl	%edx, %ebx
	jl	L4
	movl	28(%eax), %ecx
	cmpl	%ecx, %esi
	jl	L4
	cmpl	32(%eax), %ebx
	jg	L4
	cmpl	36(%eax), %esi
	jg	L4
	movl	44(%eax), %eax
	movl	(%eax), %eax
	movl	%eax, 36(%esp)
	movl	28(%eax), %eax
	movl	%eax, 40(%esp)
	movl	%esi, %eax
	subl	%ecx, %eax
	movl	%ebx, %ecx
	subl	%edx, %ecx
	movl	%eax, 8(%esp)
	movl	36(%esp), %edx
	movl	40(%esp), %eax
	movl	%ecx, 4(%esp)
	movl	%edx, (%esp)
	call	*32(%eax)
	movl	_Mouse, %edx
	movl	%eax, %ecx
	movl	44(%edx), %eax
	movl	(%eax), %edx
	movl	28(%edx), %eax
	cmpl	%ecx, 4(%eax)
	jne	L5
	jmp	L4
L12:
	movl	88(%esp), %eax
	movl	44(%esp), %ebp
	movl	%ebp, 32(%esp)
	movl	12(%eax), %ecx
	subl	%esi, %ecx
	cmpl	%ebp, %ecx
	jge	L7
L1:
	addl	$60, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE188:
	.p2align 4,,15
	.globl	_TimerPolll
_TimerPolll:
LFB183:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	$255, %ebx
	call	_rand
	movl	$_Scr+1058, %esi
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, _Scr+422
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, _Scr+634
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, _Scr+846
	.p2align 4,,7
L14:
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, (%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 212(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 424(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 636(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 848(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 1060(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 1272(%esi)
	call	_rand
	movl	%eax, %edx
	sarl	$31, %edx
	idivl	%ebx
	movb	%dl, 1484(%esi)
	addl	$1696, %esi
	cmpl	$_Scr+68898, %esi
	jne	L14
	movl	_cnt, %eax
	movl	$1, %ebp
	movl	%eax, 24(%esp)
	xorl	%ecx, %ecx
	.p2align 4,,7
L15:
	movl	24(%esp), %edi
	leal	2(%ecx), %ebx
	testl	%edi, %edi
	jne	L18
	movb	_Scr(%ecx), %dl
	leal	_Scr(%ebx), %esi
	andl	$255, %edx
	movl	%esi, 28(%esp)
	movl	%edx, %edi
	movb	_Scr+424(%ecx), %dl
	andl	$255, %edx
	movb	_Scr(%ebx), %bl
	movl	%edx, %esi
	andl	$255, %ebx
	addl	%edi, %esi
	movl	28(%esp), %edi
	xorl	%edx, %edx
	leal	_Scr(%ecx), %eax
	movb	424(%edi), %dl
	addl	%ebx, %esi
	subl	%ecx, %eax
	addl	%esi, %edx
	sarl	$2, %edx
	movl	$320, 20(%esp)
	movb	%dl, _Scr(%ecx)
	movb	%dl, 212(%eax,%ebp)
	movl	%edi, %edx
	leal	_Scr+212(%ecx), %eax
	addl	$212, %edx
	.p2align 4,,7
L16:
	movb	(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	xorl	%ebx, %ebx
	movb	424(%eax), %bl
	leal	(%esi,%ebx), %edi
	movb	(%edx), %bl
	andl	$255, %ebx
	leal	212(%eax), %esi
	addl	%ebx, %edi
	movb	424(%edx), %bl
	andl	$255, %ebx
	movl	%esi, 28(%esp)
	leal	(%edi,%ebx), %ebx
	movl	%eax, %edi
	sarl	$2, %ebx
	subl	%ecx, %edi
	movb	%bl, (%eax)
	movb	%bl, 212(%edi,%ebp)
	xorl	%ebx, %ebx
	movb	212(%eax), %bl
	movl	%ebx, 16(%esp)
	movb	424(%esi), %bl
	movl	16(%esp), %edi
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	212(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	leal	424(%eax), %esi
	movb	%bl, 212(%eax)
	movb	%bl, 212(%edi,%ebp)
	xorl	%ebx, %ebx
	movl	%esi, 28(%esp)
	movb	424(%eax), %bl
	movl	%ebx, 16(%esp)
	movb	424(%esi), %bl
	andl	$255, %ebx
	movl	16(%esp), %edi
	addl	%ebx, %edi
	movb	424(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	leal	636(%eax), %esi
	movb	%bl, 424(%eax)
	movb	%bl, 212(%edi,%ebp)
	xorl	%ebx, %ebx
	movl	%esi, 28(%esp)
	movb	636(%eax), %bl
	movl	%ebx, 16(%esp)
	movb	424(%esi), %bl
	andl	$255, %ebx
	movl	16(%esp), %edi
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1060(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	sarl	$2, %esi
	movl	%esi, %ebx
	leal	848(%eax), %esi
	movb	%bl, 636(%eax)
	movl	28(%esp), %edi
	subl	%ecx, %edi
	movl	%esi, 28(%esp)
	movb	%bl, 212(%edi,%ebp)
	xorl	%ebx, %ebx
	movb	848(%eax), %bl
	movl	%ebx, 16(%esp)
	movb	424(%esi), %bl
	andl	$255, %ebx
	movl	16(%esp), %edi
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1272(%edx), %bl
	andl	$255, %ebx
	addl	$1060, %edx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	movb	%bl, 848(%eax)
	addl	$1060, %eax
	subl	$5, 20(%esp)
	movb	%bl, 212(%edi,%ebp)
	jne	L16
	incl	%ecx
	incl	%ebp
	cmpl	$209, %ecx
	jne	L15
L17:
	movl	24(%esp), %ebp
	incl	%ebp
	movl	%ebp, _cnt
	cmpl	$4, %ebp
	je	L74
L27:
	movl	_ATime, %eax
	movl	_nb, %ecx
	movl	%eax, %esi
	incl	%ecx
	movl	_ATime+4, %edx
	subl	_ltime, %esi
	movl	%edx, %ebx
	movl	%ecx, _nb
	sbbl	_ltime+4, %ebx
	cmpl	$0, %ebx
	ja	L30
	cmpl	$999, %esi
	jbe	L28
L30:
	movl	%eax, _ltime
	movl	%edx, _ltime+4
	movl	$0, _nb
L28:
	movl	_c, %edi
	movl	$0, 4(%esp)
	movl	%edi, (%esp)
	call	_WidgetDraw
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L18:
	.cfi_restore_state
	cmpl	$1, 24(%esp)
	jne	L75
	leal	_Scr(%ebx), %eax
	xorl	%edx, %edx
	movl	%eax, 28(%esp)
	xorl	%eax, %eax
	movb	_Scr+424(%ecx), %al
	movb	_Scr(%ecx), %dl
	addl	%eax, %edx
	xorl	%eax, %eax
	movb	_Scr(%ebx), %al
	movl	28(%esp), %ebx
	addl	%eax, %edx
	leal	_Scr+212(%ecx), %esi
	xorl	%eax, %eax
	movl	%esi, %edi
	movb	424(%ebx), %al
	subl	%ecx, %edi
	addl	%edx, %eax
	movl	%ebx, %edx
	sarl	$2, %eax
	movl	$2, 20(%esp)
	movb	%al, _Scr+212(%ecx)
	addl	$212, %edx
	movb	%al, (%edi,%ebp)
	movl	%ecx, 28(%esp)
	leal	_Scr+424(%ecx), %eax
	.p2align 4,,7
L26:
	movb	-212(%eax), %cl
	xorl	%ebx, %ebx
	andl	$255, %ecx
	movb	212(%eax), %bl
	movl	%ecx, %esi
	xorl	%ecx, %ecx
	movb	(%edx), %cl
	addl	%ebx, %esi
	xorl	%ebx, %ebx
	addl	%ecx, %esi
	movb	424(%edx), %bl
	movl	%eax, %edi
	addl	%esi, %ebx
	movl	28(%esp), %esi
	sarl	$2, %ebx
	subl	%esi, %edi
	movb	%bl, (%eax)
	movb	%bl, (%edi,%ebp)
	leal	212(%eax), %ebx
	movb	(%eax), %cl
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	424(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	212(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	636(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 212(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	212(%eax), %cl
	leal	424(%eax), %ebx
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	636(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	424(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	848(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 424(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	424(%eax), %cl
	leal	636(%eax), %ebx
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	848(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	636(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	1060(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movl	20(%esp), %esi
	movb	%cl, 636(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	636(%eax), %cl
	addl	$5, %esi
	andl	$255, %ecx
	movl	%esi, 20(%esp)
	movl	%ecx, %edi
	movb	1060(%eax), %cl
	andl	$255, %ecx
	leal	848(%eax), %ebx
	addl	%ecx, %edi
	movb	848(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	1272(%edx), %cl
	andl	$255, %ecx
	addl	$1060, %edx
	movl	%ecx, %esi
	addl	%edi, %esi
	sarl	$2, %esi
	movl	%esi, %ecx
	movb	%cl, 848(%eax)
	movl	28(%esp), %edi
	subl	%edi, %ebx
	addl	$1060, %eax
	cmpl	$322, 20(%esp)
	movb	%cl, (%ebx,%ebp)
	jne	L26
	movl	28(%esp), %ecx
L76:
	incl	%ecx
	incl	%ebp
	cmpl	$209, %ecx
	jne	L15
	jmp	L17
	.p2align 4,,7
L75:
	cmpl	$3, 24(%esp)
	je	L20
	cmpl	$2, 24(%esp)
	je	L21
	leal	_Scr(%ebx), %edx
	leal	_Scr+424(%ecx), %eax
	movl	%edx, 28(%esp)
	movb	_Scr(%ecx), %dl
	andl	$255, %edx
	movl	%eax, %esi
	movl	%edx, %edi
	movb	_Scr+424(%ecx), %dl
	subl	%ecx, %esi
	andl	$255, %edx
	movl	%esi, 20(%esp)
	movb	_Scr(%ebx), %bl
	movl	%edx, %esi
	andl	$255, %ebx
	addl	%edi, %esi
	movl	28(%esp), %edi
	addl	%ebx, %esi
	xorl	%ebx, %ebx
	movb	424(%edi), %bl
	movl	20(%esp), %edx
	addl	%esi, %ebx
	movl	$320, 20(%esp)
	sarl	$2, %ebx
	addl	$212, %eax
	movb	%bl, -212(%edx,%ebp)
	movl	%edi, %edx
	addl	$212, %edx
	.p2align 4,,7
L22:
	movb	-424(%eax), %bl
	movl	%eax, %esi
	andl	$255, %ebx
	subl	%ecx, %esi
	movl	%ebx, %edi
	movb	(%eax), %bl
	andl	$255, %ebx
	movl	%esi, 28(%esp)
	addl	%ebx, %edi
	movb	(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	424(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	movl	%esi, %ebx
	leal	212(%eax), %esi
	movb	%bl, -212(%edi,%ebp)
	movl	%esi, %ebx
	subl	%ecx, %ebx
	movl	%ebx, 28(%esp)
	movb	-212(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	212(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	212(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	movl	%esi, %ebx
	leal	424(%eax), %esi
	movb	%bl, -212(%edi,%ebp)
	movl	%esi, %ebx
	subl	%ecx, %ebx
	movl	%ebx, 28(%esp)
	movb	(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	424(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	424(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	movl	%esi, %ebx
	leal	636(%eax), %esi
	movb	%bl, -212(%edi,%ebp)
	movl	%esi, %ebx
	subl	%ecx, %ebx
	movl	%ebx, 28(%esp)
	movb	212(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	636(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1060(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	movl	%esi, %ebx
	leal	848(%eax), %esi
	movb	%bl, -212(%edi,%ebp)
	movl	%esi, %ebx
	subl	%ecx, %ebx
	movl	%ebx, 28(%esp)
	movb	424(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	848(%eax), %bl
	andl	$255, %ebx
	addl	$1060, %eax
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1272(%edx), %bl
	andl	$255, %ebx
	addl	$1060, %edx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	movl	%esi, %ebx
	movb	%bl, -212(%edi,%ebp)
	subl	$5, 20(%esp)
	jne	L22
	incl	%ecx
	incl	%ebp
	cmpl	$209, %ecx
	jne	L15
	jmp	L17
	.p2align 4,,7
L20:
	leal	_Scr(%ebx), %edx
	leal	_Scr+212(%ecx), %eax
	movl	%edx, 28(%esp)
	movb	_Scr(%ecx), %dl
	andl	$255, %edx
	movl	%eax, %edi
	movl	%edx, %esi
	xorl	%edx, %edx
	movb	_Scr+424(%ecx), %dl
	subl	%ecx, %edi
	addl	%edx, %esi
	xorl	%edx, %edx
	movb	_Scr(%ebx), %dl
	movl	28(%esp), %ebx
	addl	%edx, %esi
	xorl	%edx, %edx
	movb	424(%ebx), %dl
	movl	$320, 20(%esp)
	addl	%esi, %edx
	leal	_Scr+424(%ecx), %eax
	sarl	$2, %edx
	movb	%dl, _Scr+212(%ecx)
	movb	%dl, (%edi,%ebp)
	movl	28(%esp), %edx
	movl	%ecx, 28(%esp)
	addl	$212, %edx
	.p2align 4,,7
L25:
	movb	-212(%eax), %cl
	xorl	%ebx, %ebx
	andl	$255, %ecx
	movb	212(%eax), %bl
	movl	%ecx, %esi
	xorl	%ecx, %ecx
	movb	(%edx), %cl
	addl	%ebx, %esi
	xorl	%ebx, %ebx
	addl	%ecx, %esi
	movb	424(%edx), %bl
	movl	28(%esp), %edi
	addl	%esi, %ebx
	movl	%eax, %esi
	sarl	$2, %ebx
	subl	%edi, %esi
	movb	%bl, (%eax)
	movb	%bl, (%esi,%ebp)
	leal	212(%eax), %ebx
	movb	(%eax), %cl
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	424(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	212(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	636(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 212(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	212(%eax), %cl
	leal	424(%eax), %ebx
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	636(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	424(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	848(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 424(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	424(%eax), %cl
	leal	636(%eax), %ebx
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	848(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	636(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	1060(%edx), %cl
	andl	$255, %ecx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 636(%eax)
	movb	%cl, (%ebx,%ebp)
	movb	636(%eax), %cl
	leal	848(%eax), %ebx
	andl	$255, %ecx
	movl	%ecx, %edi
	movb	1060(%eax), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	848(%edx), %cl
	andl	$255, %ecx
	addl	%ecx, %edi
	movb	1272(%edx), %cl
	andl	$255, %ecx
	addl	$1060, %edx
	movl	%ecx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%edi, %ebx
	movl	%esi, %ecx
	movb	%cl, 848(%eax)
	movb	%cl, (%ebx,%ebp)
	addl	$1060, %eax
	subl	$5, 20(%esp)
	jne	L25
	movl	28(%esp), %ecx
	jmp	L76
L21:
	movb	_Scr(%ecx), %al
	leal	_Scr(%ebx), %edx
	andl	$255, %eax
	movl	%edx, 28(%esp)
	movl	%eax, %esi
	xorl	%edx, %edx
	xorl	%eax, %eax
	movb	_Scr+424(%ecx), %dl
	movb	_Scr(%ebx), %al
	movl	28(%esp), %ebx
	addl	%edx, %esi
	xorl	%edx, %edx
	addl	%eax, %esi
	movb	424(%ebx), %dl
	leal	_Scr+424(%ecx), %edi
	addl	%esi, %edx
	movl	%edi, %esi
	movl	$320, 20(%esp)
	subl	%ecx, %esi
	leal	212(%edi), %eax
	sarl	$2, %edx
	movb	%dl, _Scr+424(%ecx)
	movb	%dl, -212(%esi,%ebp)
	movl	%ebx, %edx
	addl	$212, %edx
	.p2align 4,,7
L24:
	movb	-424(%eax), %bl
	movl	%eax, %esi
	andl	$255, %ebx
	subl	%ecx, %esi
	movl	%ebx, %edi
	xorl	%ebx, %ebx
	movb	(%eax), %bl
	addl	%ebx, %edi
	xorl	%ebx, %ebx
	movb	(%edx), %bl
	addl	%ebx, %edi
	xorl	%ebx, %ebx
	movb	424(%edx), %bl
	addl	%edi, %ebx
	leal	212(%eax), %edi
	sarl	$2, %ebx
	movl	%edi, 28(%esp)
	movb	%bl, (%eax)
	movb	%bl, -212(%esi,%ebp)
	movb	-212(%eax), %bl
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	212(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	212(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	leal	424(%eax), %esi
	movb	%bl, 212(%eax)
	movb	%bl, -212(%edi,%ebp)
	movb	(%eax), %bl
	movl	%esi, 28(%esp)
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	424(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	424(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	leal	636(%eax), %esi
	movb	%bl, 424(%eax)
	movb	%bl, -212(%edi,%ebp)
	movb	212(%eax), %bl
	movl	%esi, 28(%esp)
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	636(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	636(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1060(%edx), %bl
	andl	$255, %ebx
	movl	%ebx, %esi
	addl	%edi, %esi
	movl	28(%esp), %edi
	sarl	$2, %esi
	subl	%ecx, %edi
	movl	%esi, %ebx
	leal	848(%eax), %esi
	movb	%bl, 636(%eax)
	movb	%bl, -212(%edi,%ebp)
	movb	424(%eax), %bl
	movl	%esi, 28(%esp)
	andl	$255, %ebx
	movl	%ebx, %edi
	movb	848(%eax), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	848(%edx), %bl
	andl	$255, %ebx
	addl	%ebx, %edi
	movb	1272(%edx), %bl
	andl	$255, %ebx
	addl	$1060, %edx
	movl	%ebx, %esi
	addl	%edi, %esi
	sarl	$2, %esi
	movl	%esi, %ebx
	movb	%bl, 848(%eax)
	movl	28(%esp), %edi
	subl	%ecx, %edi
	addl	$1060, %eax
	subl	$5, 20(%esp)
	movb	%bl, -212(%edi,%ebp)
	jne	L24
	incl	%ecx
	incl	%ebp
	cmpl	$209, %ecx
	jne	L15
	jmp	L17
L74:
	movl	$0, _cnt
	jmp	L27
	.cfi_endproc
LFE183:
	.p2align 4,,15
	.globl	_PlaylistItemFree
_PlaylistItemFree:
LFB173:
	.cfi_startproc
	pushl	%ebx
	.cfi_def_cfa_offset 8
	.cfi_offset 3, -8
	subl	$24, %esp
	.cfi_def_cfa_offset 32
	movl	32(%esp), %ebx
	movl	96(%ebx), %eax
	movl	%eax, (%esp)
	call	_free
	movl	%ebx, 32(%esp)
	addl	$24, %esp
	.cfi_def_cfa_offset 8
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 4
	jmp	_FreeListviewItem
	.cfi_endproc
LFE173:
	.p2align 4,,15
	.globl	_SlideNotify
_SlideNotify:
LFB182:
	.cfi_startproc
	movl	12(%esp), %eax
	cmpb	$3, 8(%esp)
	je	L84
L79:
	ret
	.p2align 4,,7
L84:
	movl	_s, %edx
	testl	%edx, %edx
	je	L79
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	jmp	_SStreamSetPosMsec
	.cfi_endproc
LFE182:
LC0:
	.ascii "%d:%02d\0"
LC1:
	.ascii "???\0"
	.p2align 4,,15
	.globl	_PlaylistAddItem
_PlaylistAddItem:
LFB174:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$28, %esp
	.cfi_def_cfa_offset 48
	movl	$104, (%esp)
	movl	56(%esp), %ebp
	movl	60(%esp), %esi
	call	_malloc
	movl	%eax, %ebx
	testl	%eax, %eax
	je	L89
	xorl	%eax, %eax
	movl	$26, %ecx
	movl	%ebx, %edi
	rep stosl
	movl	$0, 8(%esp)
	movl	%ebp, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewInitItem
	testl	%esi, %esi
	jne	L91
	movl	$LC1, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewItemPushCol
L88:
	movl	52(%esp), %eax
	movl	%eax, (%esp)
	call	_TextDup
	movl	%ebp, 4(%esp)
	movl	48(%esp), %ebp
	movl	%ebx, 8(%esp)
	movl	$_PlaylistItemFree, 12(%esp)
	movl	%esi, 100(%ebx)
	movl	248(%ebp), %esi
	movl	%eax, 96(%ebx)
	movl	%esi, (%esp)
	call	_ListAdd
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	movl	%ebx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L89:
	.cfi_restore_state
	addl	$28, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L91:
	.cfi_restore_state
	movl	%esi, %edx
	movl	$60, %ecx
	movl	%esi, %eax
	movl	$-2004318071, %edi
	sarl	$31, %edx
	movl	$LC0, (%esp)
	idivl	%ecx
	movl	%esi, %eax
	movl	%edx, 8(%esp)
	imull	%edi
	movl	%esi, %ecx
	addl	%esi, %edx
	sarl	$31, %ecx
	sarl	$5, %edx
	subl	%ecx, %edx
	movl	%edx, 4(%esp)
	call	_TextArgs
	movl	%ebx, (%esp)
	movl	%eax, %edi
	movl	%eax, 4(%esp)
	call	_ListviewItemPushCol
	movl	%edi, (%esp)
	call	_free
	jmp	L88
	.cfi_endproc
LFE174:
LC2:
	.ascii "rt\0"
LC3:
	.ascii "#EXTINF:\0"
	.p2align 4,,15
	.globl	_LoadPlaylist
_LoadPlaylist:
LFB175:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$2108, %esp
	.cfi_def_cfa_offset 2128
	movl	2128(%esp), %eax
	movl	%eax, (%esp)
	call	_GetPathParent
	movl	2128(%esp), %edx
	movl	$LC2, 4(%esp)
	movl	%edx, (%esp)
	movl	%eax, 40(%esp)
	call	_FileOpen
	movl	_CurrentList, %ecx
	movl	%eax, %ebp
	testl	%ecx, %ecx
	je	L93
	movl	%ecx, (%esp)
	call	_free
L93:
	movl	$0, _CurrentList
	testl	%ebp, %ebp
	je	L92
	movl	_PlayList, %ebx
	leal	1080(%esp), %edi
	movl	%ebx, (%esp)
	leal	1072(%esp), %esi
	call	_ListviewRemoveAllItems
	xorl	%ebx, %ebx
	movl	%edi, 24(%esp)
	.p2align 4,,7
L131:
	movl	%ebp, 8(%esp)
	movl	$1024, 4(%esp)
	movl	%esi, (%esp)
	call	_FileGets
	testl	%eax, %eax
	je	L133
	movl	$8, 8(%esp)
	movl	$LC3, 4(%esp)
	movl	%esi, (%esp)
	call	_TextNCaseCompare
	testl	%eax, %eax
	jne	L96
	leal	1080(%esp), %ecx
	movl	$44, 4(%esp)
	movl	%ecx, (%esp)
	call	_TextChr
	movl	%eax, %ebx
	testl	%eax, %eax
	je	L109
	movl	24(%esp), %eax
	leal	560(%esp), %edx
	subl	%ebx, %eax
	leal	1080(%esp), %edi
	movl	%edx, (%esp)
	movl	%eax, 8(%esp)
	movl	%edi, 4(%esp)
	incl	%ebx
	call	_TextNCopy
	leal	48(%esp), %ecx
	movl	%ebx, 4(%esp)
	movl	%ecx, (%esp)
	call	_TextCopy
	movl	$1, %ebx
	jmp	L131
	.p2align 4,,7
L96:
	movl	%esi, (%esp)
	call	_TextLen
	testl	%eax, %eax
	je	L131
	movb	1072(%esp), %al
	cmpb	$35, %al
	je	L131
	cmpb	$47, %al
	je	L98
	movl	40(%esp), %edi
	movl	%esi, 4(%esp)
	movl	%edi, (%esp)
	call	_FileNameToPath
	movl	%eax, (%esp)
	movl	%eax, %edi
	call	_ResolveFileName
	movl	%edi, (%esp)
	movl	%eax, 32(%esp)
	call	_free
	testl	%ebx, %ebx
	jne	L134
	movl	$0, 28(%esp)
	movl	%esi, 36(%esp)
L99:
	movl	_PlayList, %eax
	movl	$104, (%esp)
	movl	%eax, 44(%esp)
	call	_malloc
	movl	%eax, %ebx
	testl	%eax, %eax
	je	L100
	xorl	%eax, %eax
	movl	$26, %ecx
	movl	%ebx, %edi
	rep stosl
	movl	36(%esp), %edx
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewInitItem
	movl	28(%esp), %ecx
	testl	%ecx, %ecx
	jne	L135
	movl	$LC1, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewItemPushCol
L102:
	movl	32(%esp), %edx
	movl	%edx, (%esp)
	call	_TextDup
	movl	28(%esp), %ecx
	movl	%eax, 96(%ebx)
	movl	%ecx, 100(%ebx)
	movl	44(%esp), %eax
	movl	%ebx, 8(%esp)
	movl	36(%esp), %ebx
	movl	$_PlaylistItemFree, 12(%esp)
	movl	%ebx, 4(%esp)
	movl	248(%eax), %edi
	movl	%edi, (%esp)
	call	_ListAdd
L100:
	movl	32(%esp), %edx
	xorl	%ebx, %ebx
	movl	%edx, (%esp)
	call	_free
	jmp	L131
	.p2align 4,,7
L109:
	movl	$1, %ebx
	jmp	L131
	.p2align 4,,7
L133:
	movl	%ebp, (%esp)
	call	_FileClose
	movl	40(%esp), %esi
	movl	%esi, (%esp)
	call	_free
	movl	_PlayList, %ebp
	movl	248(%ebp), %eax
	movl	(%eax), %edx
	testl	%edx, %edx
	je	L113
	movl	(%edx), %ebx
	movl	8(%ebx), %ecx
L107:
	movl	2128(%esp), %edi
	movl	%ecx, _CurrentItem
	movl	%edi, (%esp)
	movl	$1, _UsePlayList
	call	_TextDup
	movl	_PlayList, %esi
	movl	%esi, (%esp)
	movl	%eax, _CurrentList
	call	_WidgetDrawAll
	movl	_PlayList, %ebp
	movl	%ebp, (%esp)
	call	_ScrollBarRedraw
L92:
	addl	$2108, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.p2align 4,,7
L98:
	.cfi_restore_state
	testl	%ebx, %ebx
	jne	L136
	movl	$0, 28(%esp)
	movl	%esi, 32(%esp)
L103:
	movl	_PlayList, %ebx
	movl	$104, (%esp)
	movl	%ebx, 36(%esp)
	call	_malloc
	movl	%eax, %ebx
	testl	%eax, %eax
	je	L112
	xorl	%eax, %eax
	movl	$26, %ecx
	movl	%ebx, %edi
	rep stosl
	movl	32(%esp), %edx
	movl	$0, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewInitItem
	movl	28(%esp), %ecx
	testl	%ecx, %ecx
	jne	L137
	movl	$LC1, 4(%esp)
	movl	%ebx, (%esp)
	call	_ListviewItemPushCol
L105:
	movl	%esi, (%esp)
	call	_TextDup
	movl	28(%esp), %edx
	movl	%eax, 96(%ebx)
	movl	%edx, 100(%ebx)
	movl	36(%esp), %ecx
	movl	%ebx, 8(%esp)
	movl	32(%esp), %ebx
	movl	$_PlaylistItemFree, 12(%esp)
	movl	%ebx, 4(%esp)
	xorl	%ebx, %ebx
	movl	248(%ecx), %eax
	movl	%eax, (%esp)
	call	_ListAdd
	jmp	L131
	.p2align 4,,7
L134:
	leal	560(%esp), %edx
	movl	%edx, (%esp)
	call	_atoi
	leal	48(%esp), %ecx
	movl	%eax, 28(%esp)
	movl	%ecx, 36(%esp)
	jmp	L99
	.p2align 4,,7
L136:
	leal	560(%esp), %edx
	movl	%edx, (%esp)
	call	_atoi
	leal	48(%esp), %ecx
	movl	%eax, 28(%esp)
	movl	%ecx, 32(%esp)
	jmp	L103
	.p2align 4,,7
L135:
	movl	28(%esp), %eax
	movl	$-2004318071, %edi
	imull	%edi
	movl	28(%esp), %ecx
	movl	28(%esp), %edi
	addl	%ecx, %edx
	movl	28(%esp), %eax
	sarl	$31, %edi
	movl	$LC0, (%esp)
	sarl	$5, %edx
	subl	%edi, %edx
	movl	%edx, %ecx
	movl	%edx, 4(%esp)
	sall	$6, %ecx
	leal	(%eax,%edx,4), %edi
	subl	%ecx, %edi
	movl	%edi, 8(%esp)
	call	_TextArgs
	movl	%ebx, (%esp)
	movl	%eax, %edi
	movl	%eax, 4(%esp)
	call	_ListviewItemPushCol
	movl	%edi, (%esp)
	call	_free
	jmp	L102
	.p2align 4,,7
L137:
	movl	28(%esp), %eax
	movl	$-2004318071, %edi
	imull	%edi
	movl	28(%esp), %ecx
	movl	28(%esp), %edi
	addl	%ecx, %edx
	movl	28(%esp), %eax
	sarl	$31, %edi
	movl	$LC0, (%esp)
	sarl	$5, %edx
	subl	%edi, %edx
	movl	%edx, %ecx
	movl	%edx, 4(%esp)
	sall	$6, %ecx
	leal	(%eax,%edx,4), %edi
	subl	%ecx, %edi
	movl	%edi, 8(%esp)
	call	_TextArgs
	movl	%ebx, (%esp)
	movl	%eax, %edi
	movl	%eax, 4(%esp)
	call	_ListviewItemPushCol
	movl	%edi, (%esp)
	call	_free
	jmp	L105
	.p2align 4,,7
L112:
	xorl	%ebx, %ebx
	jmp	L131
	.p2align 4,,7
L113:
	xorl	%ecx, %ecx
	jmp	L107
	.cfi_endproc
LFE175:
LC4:
	.ascii "wt\0"
LC5:
	.ascii "#EXTM3U\12\0"
LC6:
	.ascii "#EXTINF:%d,%s\12\0"
LC7:
	.ascii "%s\12\12\0"
	.p2align 4,,15
	.globl	_SavePlayList
_SavePlayList:
LFB176:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	pushl	%edi
	.cfi_def_cfa_offset 12
	.cfi_offset 7, -12
	pushl	%esi
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushl	%ebx
	.cfi_def_cfa_offset 20
	.cfi_offset 3, -20
	subl	$44, %esp
	.cfi_def_cfa_offset 64
	movl	64(%esp), %ebx
	movl	$LC4, 4(%esp)
	movl	%ebx, (%esp)
	call	_FileOpen
	movl	%eax, %esi
	testl	%eax, %eax
	je	L138
	movl	_CurrentList, %eax
	testl	%eax, %eax
	je	L141
	movl	%eax, (%esp)
	call	_free
L141:
	movl	%ebx, (%esp)
	call	_TextDup
	movl	_PlayList, %edx
	movl	248(%edx), %ecx
	movl	%eax, _CurrentList
	movl	(%ecx), %edi
	testl	%edi, %edi
	je	L138
	movl	(%edi), %ebp
	movl	%ebx, (%esp)
	movl	%ebp, 28(%esp)
	call	_GetPathParent
	movl	$LC5, 4(%esp)
	movl	%esi, (%esp)
	movl	%eax, %edi
	call	_FilePrintf
	movl	28(%esp), %ebx
	.p2align 4,,7
L143:
	movl	8(%ebx), %ebp
	movl	0(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	100(%ebp), %edx
	movl	$LC6, 4(%esp)
	movl	%edx, 8(%esp)
	movl	%esi, (%esp)
	call	_FilePrintf
	movl	96(%ebp), %ecx
	movl	%ecx, 4(%esp)
	movl	%edi, (%esp)
	call	_RelativeName
	movl	$LC7, 4(%esp)
	movl	%eax, %ebp
	movl	%eax, 8(%esp)
	movl	%esi, (%esp)
	call	_FilePrintf
	movl	%ebp, (%esp)
	call	_free
	movl	(%ebx), %ebx
	cmpl	%ebx, 28(%esp)
	jne	L143
	movl	%esi, (%esp)
	call	_FileClose
	movl	%edi, 64(%esp)
	addl	$44, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	jmp	_free
	.p2align 4,,7
L138:
	.cfi_restore_state
	addl	$44, %esp
	.cfi_def_cfa_offset 20
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 12
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 8
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE176:
	.p2align 4,,15
	.globl	_PlayListUpdateElement
_PlayListUpdateElement:
LFB177:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	movl	_s, %edx
	leal	28(%esp), %eax
	movl	%edx, (%esp)
	movl	%eax, 4(%esp)
	movl	48(%esp), %ebx
	movl	$0, 28(%esp)
	call	_SStreamGetLengthMsec
	movl	$274877907, %ecx
	movl	28(%esp), %eax
	mull	%ecx
	shrl	$6, %edx
	leal	1(%edx), %ecx
	cmpl	100(%ebx), %ecx
	je	L152
	movl	%ecx, %edx
	movl	$60, %esi
	movl	%ecx, %eax
	movl	%ecx, 100(%ebx)
	sarl	$31, %edx
	movl	$LC0, (%esp)
	idivl	%esi
	movl	%ecx, %eax
	movl	$-2004318071, %esi
	movl	%edx, 8(%esp)
	imull	%esi
	addl	%edx, %ecx
	sarl	$5, %ecx
	movl	%ecx, 4(%esp)
	call	_TextArgs
	movl	%ebx, (%esp)
	movl	%eax, %esi
	movl	%eax, 8(%esp)
	movl	$1, 4(%esp)
	call	_ListviewItemSetColCaption
	movl	%esi, (%esp)
	call	_free
	movl	_PlayList, %ebx
	movl	$0, 4(%esp)
	movl	%ebx, (%esp)
	call	_WidgetDraw
L152:
	addl	$36, %esp
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
LFE177:
LC8:
	.ascii "Error!\0"
LC9:
	.ascii "%s\0"
LC10:
	.ascii "Error loading %s\0"
	.p2align 4,,15
	.globl	_SStreamLoad
_SStreamLoad:
LFB181:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp
	.cfi_def_cfa_offset 32
	movl	_btpp, %eax
	movl	_IconPlay, %edx
	movl	_s, %ecx
	movl	32(%esp), %ebx
	movl	36(%esp), %esi
	movl	%edx, 208(%eax)
	testl	%ecx, %ecx
	je	L156
	movl	%ecx, (%esp)
	call	_SStreamFree
L156:
	movl	_CurrentFile, %edx
	testl	%edx, %edx
	je	L157
	movl	%edx, (%esp)
	call	_free
L157:
	movl	_CurrentName, %eax
	testl	%eax, %eax
	je	L158
	movl	%eax, (%esp)
	call	_free
L158:
	movl	$9, 4(%esp)
	movl	%ebx, (%esp)
	movl	$0, _CurrentFile
	movl	$0, _CurrentName
	call	_LoadData2
	movl	%eax, _s
	testl	%eax, %eax
	je	L159
	testl	%esi, %esi
	je	L174
	movl	%esi, (%esp)
	call	_TextDup
	movl	%eax, _CurrentName
L162:
	movl	%eax, 8(%esp)
	movl	_l, %eax
	movl	%eax, (%esp)
	movl	$LC9, 4(%esp)
	call	_LabelSetText
	movl	%ebx, (%esp)
	call	_TextDup
	movl	_sl, %ebx
	movl	_s, %ecx
	addl	$200, %ebx
	movl	%ecx, (%esp)
	movl	%ebx, 4(%esp)
	movl	%eax, _CurrentFile
	call	_SStreamGetLengthMsec
	movl	$0, 36(%esp)
	movl	_sl, %ecx
L173:
	movl	%ecx, 32(%esp)
	addl	$20, %esp
	.cfi_remember_state
	.cfi_def_cfa_offset 12
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	jmp	_WidgetDraw
	.p2align 4,,7
L174:
	.cfi_restore_state
	movl	%ebx, (%esp)
	call	_FileGetInfo
	movl	%eax, %esi
	testl	%eax, %eax
	je	L161
	movl	(%eax), %edx
	movl	%edx, (%esp)
	call	_TextDup
	movl	%esi, (%esp)
	movl	%eax, _CurrentName
	call	_FreeFileInfo
	movl	_CurrentName, %eax
	jmp	L162
	.p2align 4,,7
L159:
	movl	_l, %ebx
	movl	%esi, 8(%esp)
	movl	$LC10, 4(%esp)
	movl	%ebx, (%esp)
	call	_LabelSetText
	movl	_sl, %esi
	movl	$0, _s
	movl	$0, 196(%esi)
	movl	$0, 200(%esi)
	movl	_btpp, %ecx
	movl	$0, 36(%esp)
	jmp	L173
	.p2align 4,,7
L161:
	movl	$LC8, (%esp)
	call	_TextDup
	movl	%eax, _CurrentName
	jmp	L162
	.cfi_endproc
LFE181:
	.p2align 4,,15
	.globl	_PlayListGoPrev
_PlayListGoPrev:
LFB179:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$36, %esp
	.cfi_def_cfa_offset 48
	movl	_CurrentItem, %eax
	testl	%eax, %eax
	je	L176
	movl	_PlayList, %ecx
	movl	%eax, 4(%esp)
	movl	248(%ecx), %esi
	movl	%esi, (%esp)
	call	_ListFoundItem
	movl	%eax, %ebx
L177:
	movl	$1, _UsePlayList
	testl	%ebx, %ebx
	je	L175
	movl	4(%ebx), %eax
	movl	8(%eax), %ecx
	movl	%ecx, _CurrentItem
	movl	(%ecx), %edx
	movl	%edx, 4(%esp)
	movl	96(%ecx), %esi
	movl	%esi, (%esp)
	call	_SStreamLoad
	movl	$0, 12(%esp)
	movl	$1, 8(%esp)
	movl	_PlayList, %edx
	movl	4(%ebx), %eax
	movl	8(%eax), %ecx
	movl	%edx, (%esp)
	movl	%ecx, 4(%esp)
	call	_ListviewSelectItem
	movl	_s, %esi
	testl	%esi, %esi
	je	L175
	movl	4(%ebx), %ebx
	leal	28(%esp), %eax
	movl	$0, 28(%esp)
	movl	8(%ebx), %ebx
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_SStreamGetLengthMsec
	movl	$274877907, %ecx
	movl	28(%esp), %eax
	mull	%ecx
	shrl	$6, %edx
	leal	1(%edx), %ecx
	cmpl	100(%ebx), %ecx
	je	L181
	movl	%ecx, %edx
	movl	$60, %esi
	movl	%ecx, %eax
	movl	%ecx, 100(%ebx)
	sarl	$31, %edx
	movl	$LC0, (%esp)
	idivl	%esi
	movl	%ecx, %eax
	movl	$-2004318071, %esi
	movl	%edx, 8(%esp)
	imull	%esi
	addl	%edx, %ecx
	sarl	$5, %ecx
	movl	%ecx, 4(%esp)
	call	_TextArgs
	movl	%ebx, (%esp)
	mo