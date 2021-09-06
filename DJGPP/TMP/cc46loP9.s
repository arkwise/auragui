	.file	"widget.c"
	.section .text
	.p2align 4,,15
.globl ___WidgetDropAccept
___WidgetDropAccept:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %ecx
	movl	160(%ecx), %edx
	testl	%edx, %edx
	je	L3
	pushl	%eax
	pushl	%eax
	movl	12(%ebp), %eax
	pushl	%eax
	movl	_DragSupportedMethods, %eax
	pushl	%eax
	movl	_DragData, %eax
	pushl	%eax
	movl	_DragDataType, %eax
	pushl	%eax
	movl	_DragCaller, %eax
	pushl	%eax
	pushl	%ecx
	call	*%edx
	addl	$32, %esp
L3:
	leave
	ret
	.p2align 4,,15
.globl _TopWidgetUnderPoint
_TopWidgetUnderPoint:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %ebx
	movl	12(%ebp), %ecx
	movl	16(%ebp), %esi
	movl	92(%ebx), %edx
	testl	%edx, %edx
	je	L7
L12:
	movl	88(%edx), %edx
	movl	%edx, %eax
	.p2align 4,,7
L10:
	cmpl	20(%eax), %ecx
	jl	L8
	cmpl	%esi, 24(%eax)
	jg	L8
	cmpl	28(%eax), %ecx
	jg	L8
	cmpl	%esi, 32(%eax)
	jl	L8
	testb	$1, 104(%eax)
	jne	L15
	.p2align 4,,7
L8:
	movl	88(%eax), %eax
	cmpl	%eax, %edx
	jne	L10
L7:
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
L15:
	movl	92(%eax), %edx
	movl	%eax, %ebx
	testl	%edx, %edx
	jne	L12
	jmp	L7
	.p2align 4,,15
.globl _WidgetCheckVisible
_WidgetCheckVisible:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	.p2align 4,,7
L19:
	testb	$1, 104(%eax)
	je	L22
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L19
	movb	$1, %al
	popl	%ebp
	ret
	.p2align 4,,7
L22:
	xorl	%eax, %eax
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetDraw
_WidgetDraw:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	8(%ebp), %edx
	movl	%edx, %eax
	.p2align 4,,7
L25:
	testb	$1, 104(%eax)
	je	L27
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L25
	subl	$12, %esp
	movl	_screen, %ecx
	movl	12(%ebp), %eax
	pushl	$0
	pushl	%ecx
	pushl	$0
	pushl	%eax
	pushl	%edx
	call	*124(%edx)
	addl	$32, %esp
L27:
	leave
	ret
	.p2align 4,,15
.globl _RemoveWidgetEx
_RemoveWidgetEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	12(%ebp), %ecx
	movl	8(%ebp), %ebx
	movl	88(%ecx), %edx
	cmpl	%ecx, %edx
	je	L33
	movl	84(%ecx), %eax
	cmpl	%ecx, 92(%ebx)
	movl	%eax, 84(%edx)
	movl	84(%ecx), %eax
	movl	%edx, 88(%eax)
	je	L34
	movl	$0, 96(%ecx)
	popl	%ebx
	popl	%ebp
	ret
	.p2align 4,,7
L34:
	movl	%eax, 92(%ebx)
	movl	$0, 96(%ecx)
	popl	%ebx
	popl	%ebp
	ret
	.p2align 4,,7
L33:
	movl	$0, 92(%ebx)
	movl	$0, 96(%ecx)
	popl	%ebx
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetRemove
_WidgetRemove:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	popl	%ebp
	movl	144(%eax), %ecx
	jmp	*%ecx
	.p2align 4,,15
.globl _WidgetInsert
_WidgetInsert:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	popl	%ebp
	movl	140(%eax), %ecx
	jmp	*%ecx
	.p2align 4,,15
.globl _WidgetGetIndex
_WidgetGetIndex:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	movl	8(%ebp), %ebx
	movl	96(%ebx), %eax
	testl	%eax, %eax
	jne	L47
L40:
	orl	$-1, %eax
L42:
	popl	%ebx
	popl	%ebp
	ret
	.p2align 4,,7
L47:
	movl	92(%eax), %eax
	testl	%eax, %eax
	je	L40
	movl	88(%eax), %ecx
	xorl	%eax, %eax
	cmpl	%ecx, %ebx
	je	L42
	movl	88(%ecx), %edx
	movl	$1, %eax
	cmpl	%ecx, %edx
	jne	L43
	jmp	L40
	.p2align 4,,7
L48:
	incl	%eax
L43:
	cmpl	%edx, %ebx
	je	L42
	movl	88(%edx), %edx
	cmpl	%ecx, %edx
	jne	L48
	jmp	L40
	.p2align 4,,15
.globl _WidgetSetFocusExNoNotify
_WidgetSetFocusExNoNotify:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx
	movl	152(%ecx), %eax
	testl	%eax, %eax
	je	L50
	movl	%eax, %ecx
L50:
	movl	104(%ecx), %edx
	testb	$16, %dl
	je	L53
	movl	_FocusedWidget, %eax
	testl	%eax, %eax
	je	L52
	movl	104(%eax), %edx
	andl	$-9, %edx
	movl	%edx, 104(%eax)
	movl	104(%ecx), %edx
L52:
	orl	$8, %edx
	movl	%ecx, _FocusedWidget
	movl	%edx, 104(%ecx)
L53:
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetMakeSync
_WidgetMakeSync:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %eax
	popl	%ebp
	movl	%eax, _LookFor
	ret
	.p2align 4,,15
.globl _WidgetUnMakeSync
_WidgetUnMakeSync:
	pushl	%ebp
	movl	$0, _LookFor
	movl	%esp, %ebp
	popl	%ebp
	ret
	.p2align 4,,15
.globl _IntialiseWidget
_IntialiseWidget:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	16(%ebp), %ebx
	movl	32(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	12(%ebp), %eax
	movl	%ecx, -20(%ebp)
	movl	%edx, -16(%ebp)
	movl	24(%ebp), %edi
	movl	20(%ebp), %esi
	testl	%ebx, %ebx
	je	L59
	testl	%eax, %eax
	je	L62
L60:
	movl	-20(%ebp), %edx
	movl	%eax, (%ebx)
	movl	%edx, 16(%ebx)
	movl	%edx, 32(%ebx)
	subl	$12, %esp
	movl	-16(%ebp), %eax
	movl	%edx, %ecx
	movl	-16(%ebp), %edx
	movl	%eax, 12(%ebx)
	movl	%eax, 28(%ebx)
	movl	%esi, 4(%ebx)
	movl	%edi, 8(%ebx)
	movl	%esi, 20(%ebx)
	movl	%edi, 24(%ebx)
	subl	%edi, %ecx
	subl	%esi, %edx
	leal	52(%ebx), %eax
	pushl	%ecx
	pushl	%edx
	pushl	$0
	pushl	$0
	pushl	%eax
	call	_RectAssign
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%esi, 68(%ebx)
	movl	%edi, 72(%ebx)
	movl	%ecx, 76(%ebx)
	movl	%edx, 80(%ebx)
	movl	%esi, 36(%ebx)
	movl	%edi, 40(%ebx)
	movl	%ecx, 44(%ebx)
	movl	%edx, 48(%ebx)
	movl	$1, 104(%ebx)
	movl	%eax, 108(%ebx)
	movl	$_WidgetRefresh, 124(%ebx)
	movl	$__WidgetRemove, 144(%ebx)
	movl	$__WidgetInsert, 140(%ebx)
	movl	$__WidgetSetFirstEx, 148(%ebx)
	addl	$32, %esp
L59:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L62:
	movl	_StdWidgetClass, %eax
	jmp	L60
	.p2align 4,,15
.globl _StartMaskDraw
_StartMaskDraw:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	16(%ebp), %edx
	movl	12(%edx), %eax
	movl	4(%edx), %ecx
	incl	%eax
	movl	(%edx), %ebx
	subl	%ecx, %eax
	pushl	%eax
	movl	8(%edx), %eax
	movl	_StartRect+4, %edx
	incl	%eax
	subl	%ebx, %eax
	pushl	%eax
	movl	_StartRect, %eax
	pushl	%ecx
	subl	%edx, %ecx
	pushl	%ebx
	subl	%eax, %ebx
	pushl	%ecx
	movl	_StartLogo, %ecx
	pushl	%ebx
	movl	12(%ebp), %ebx
	pushl	%ebx
	pushl	%ecx
	call	_blit
	addl	$32, %esp
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,15
.globl _WidgetSetTooltipText
_WidgetSetTooltipText:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	movl	104(%ebx), %eax
	testb	$1, %ah
	jne	L66
	movl	156(%ebx), %edx
	testl	%edx, %edx
	je	L66
	subl	$12, %esp
	pushl	%edx
	call	_free
	movl	104(%ebx), %eax
	addl	$16, %esp
L66:
	subl	$12, %esp
	andb	$254, %ah
	movl	%eax, 104(%ebx)
	movl	12(%ebp), %eax
	pushl	%eax
	call	_TextDup
	movl	%eax, 156(%ebx)
	addl	$16, %esp
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,15
.globl _FreeWidget
_FreeWidget:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	movl	132(%ebx), %eax
	testl	%eax, %eax
	je	L69
	subl	$12, %esp
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
L69:
	testb	$1, 105(%ebx)
	jne	L70
	movl	156(%ebx), %eax
	testl	%eax, %eax
	je	L70
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L70:
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L71
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L71:
	movl	%ebx, 8(%ebp)
	movl	-4(%ebp), %ebx
	leave
	jmp	_free
	.p2align 4,,15
.globl _ToolTipDraw
_ToolTipDraw:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	16(%ebp), %ebx
	pushl	$255
	pushl	$255
	pushl	$255
	call	_makecol
	popl	%edx
	popl	%ecx
	movl	12(%ebp), %ecx
	movl	28(%ecx), %edx
	pushl	%eax
	movl	12(%ebx), %eax
	pushl	%eax
	movl	8(%ebx), %edi
	pushl	%edi
	movl	4(%ebx), %esi
	pushl	%esi
	movl	(%ebx), %eax
	pushl	%eax
	pushl	%ecx
	call	*60(%edx)
	addl	$28, %esp
	pushl	$0
	pushl	$0
	pushl	$0
	call	_makecol
	popl	%edx
	popl	%ecx
	movl	12(%ebp), %ecx
	movl	28(%ecx), %edx
	pushl	%eax
	movl	8(%ebp), %eax
	movl	32(%eax), %ebx
	pushl	%ebx
	movl	28(%eax), %edi
	pushl	%edi
	movl	24(%eax), %esi
	pushl	%esi
	movl	20(%eax), %ebx
	pushl	%ebx
	pushl	%ecx
	call	*188(%edx)
	movl	8(%ebp), %edx
	movl	196(%edx), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L77
	subl	$12, %esp
	movl	_default_font, %ecx
	movl	24(%edx), %ebx
	pushl	%ecx
	call	_text_height
	movl	8(%ebp), %edx
	incl	%eax
	addl	$16, %esp
	movl	%eax, -16(%ebp)
	movl	196(%edx), %esi
	testl	%esi, %esi
	je	L77
	leal	2(%ebx), %edi
	jmp	L76
	.p2align 4,,7
L78:
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	$0
	call	_makecol
	movl	8(%ebp), %edx
	pushl	$0
	pushl	%eax
	pushl	%ebx
	pushl	%esi
	pushl	%edi
	movl	12(%ebp), %esi
	movl	20(%edx), %ecx
	movl	_default_font, %eax
	addl	$2, %ecx
	pushl	%ecx
	pushl	%eax
	pushl	%esi
	movl	%ebx, %esi
	call	_DrawTextEx
	addl	$48, %esp
	incl	%esi
	je	L77
	movl	-16(%ebp), %ebx
	addl	%ebx, %edi
L76:
	pushl	%eax
	pushl	%eax
	pushl	$10
	pushl	%esi
	call	_TextChr
	addl	$16, %esp
	movl	%eax, %ebx
	testl	%eax, %eax
	jne	L78
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	$0
	call	_makecol
	addl	$12, %esp
	movl	8(%ebp), %ecx
	pushl	$-1
	pushl	%eax
	pushl	%edi
	movl	20(%ecx), %eax
	movl	12(%ebp), %edi
	addl	$2, %eax
	pushl	%eax
	pushl	%esi
	movl	_default_font, %esi
	pushl	%esi
	pushl	%edi
	call	_textout_ex
	addl	$32, %esp
L77:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,15
.globl _SwitchTextMode
_SwitchTextMode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_buffer, %eax
	testl	%eax, %eax
	je	L80
	subl	$12, %esp
	pushl	%eax
	call	_destroy_bitmap
	movl	$0, _buffer
	addl	$16, %esp
L80:
	call	___MouseStop
	call	___KeyboardStop
	leave
	jmp	___ScreenTextMode
LC0:
	.ascii "Executing %x\0"
LC1:
	.ascii "Return Message %x\0"
	.p2align 4,,15
.globl _WidgetExecute
_WidgetExecute:
	pushl	%ebp
	xorl	%eax, %eax
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	movl	104(%ebx), %edx
	testl	%edx, %edx
	js	L84
	orl	$-2147483648, %edx
	movl	%edx, 104(%ebx)
	pushl	%eax
	pushl	%eax
	pushl	%ebx
	pushl	$LC0
	call	_DebugMessage
	movl	112(%ebx), %eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L85
	.p2align 4,,7
L88:
	call	_PollEvents
	call	_TimersPoll
	call	_PollTasks
	movl	112(%ebx), %edx
	testl	%edx, %edx
	je	L88
L85:
	movl	104(%ebx), %eax
	andl	$2147483647, %eax
	movl	%eax, 104(%ebx)
	pushl	%eax
	pushl	%eax
	movl	112(%ebx), %ecx
	pushl	%ecx
	pushl	$LC1
	call	_DebugMessage
	movl	112(%ebx), %eax
	addl	$16, %esp
	movl	$0, 112(%ebx)
L84:
	movl	-4(%ebp), %ebx
	leave
	ret
LC2:
	.ascii "Catch message( %x, %x )\0"
	.p2align 4,,15
.globl _WidgetSendEventEx
_WidgetSendEventEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L96
L91:
	movl	120(%ebx), %edx
	testl	%edx, %edx
	je	L93
	leal	12(%ebp), %eax
	pushl	%ecx
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	call	*%edx
	addl	$16, %esp
	movl	$1, %edx
	testl	%eax, %eax
	jne	L92
L93:
	movl	116(%ebx), %ecx
	xorl	%edx, %edx
	testl	%ecx, %ecx
	je	L92
	pushl	%edx
	pushl	%edx
	leal	12(%ebp), %edx
	pushl	%edx
	pushl	%ebx
	call	*%ecx
	addl	$16, %esp
	testl	%eax, %eax
	setne	%bl
	xorl	%edx, %edx
	movb	%bl, %dl
L92:
	movl	%edx, %eax
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,7
L96:
	cmpl	$1, 12(%ebp)
	jne	L91
	movl	16(%ebp), %ecx
	pushl	%eax
	pushl	%ecx
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	16(%ebp), %edx
	addl	$16, %esp
	movl	%edx, 112(%ebx)
	movl	$1, %edx
	jmp	L92
	.p2align 4,,15
.globl _WidgetGenerateCacheExSubs
_WidgetGenerateCacheExSubs:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	12(%ebp), %eax
	movl	20(%ebp), %ebx
	movl	24(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	92(%eax), %eax
	movl	16(%ebp), %edi
	movl	%ebx, -24(%ebp)
	movl	%ecx, -20(%ebp)
	movl	%edx, -16(%ebp)
	testl	%eax, %eax
	je	L101
	movl	88(%eax), %esi
	movl	%esi, %ebx
	.p2align 4,,7
L100:
	testb	$1, 104(%ebx)
	je	L99
	cmpl	44(%ebx), %edi
	jg	L99
	movl	-24(%ebp), %eax
	cmpl	48(%ebx), %eax
	jg	L99
	movl	-20(%ebp), %edx
	cmpl	36(%ebx), %edx
	jl	L99
	movl	-16(%ebp), %ecx
	cmpl	%ecx, 40(%ebx)
	jle	L103
	.p2align 4,,7
L99:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L100
L101:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L103:
	subl	$12, %esp
	movl	48(%ebx), %edx
	pushl	%edx
	movl	44(%ebx), %eax
	pushl	%eax
	movl	8(%ebp), %eax
	movl	40(%ebx), %ecx
	pushl	%ecx
	movl	36(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	_RemoveZoneInList
	movl	88(%ebx), %ebx
	addl	$32, %esp
	cmpl	%ebx, %esi
	jne	L100
	jmp	L101
	.p2align 4,,15
.globl _WidgetGenerateCacheExBrothers
_WidgetGenerateCacheExBrothers:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	12(%ebp), %esi
	movl	32(%ebp), %eax
	movl	24(%ebp), %ecx
	movl	28(%ebp), %edx
	movl	%eax, -16(%ebp)
	movl	96(%esi), %eax
	movl	20(%ebp), %edi
	movl	%ecx, -24(%ebp)
	movl	%edx, -20(%ebp)
	testl	%eax, %eax
	je	L108
	movl	92(%eax), %eax
	movl	88(%eax), %ebx
	cmpl	%ebx, %esi
	je	L108
	.p2align 4,,7
L109:
	testb	$1, 104(%ebx)
	je	L106
	cmpl	44(%ebx), %edi
	jg	L106
	movl	-24(%ebp), %edx
	cmpl	%edx, 48(%ebx)
	jl	L106
	movl	-20(%ebp), %ecx
	cmpl	%ecx, 36(%ebx)
	jg	L106
	movl	-16(%ebp), %eax
	cmpl	%eax, 40(%ebx)
	jle	L111
	.p2align 4,,7
L106:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L109
L108:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L111:
	subl	$12, %esp
	movl	48(%ebx), %ecx
	pushl	%ecx
	movl	44(%ebx), %edx
	pushl	%edx
	movl	8(%ebp), %edx
	movl	40(%ebx), %eax
	pushl	%eax
	movl	36(%ebx), %ecx
	pushl	%ecx
	pushl	%edx
	call	_RemoveZoneInList
	movl	88(%ebx), %ebx
	addl	$32, %esp
	cmpl	%ebx, %esi
	jne	L109
	jmp	L108
	.p2align 4,,15
.globl _WidgetRefreshAbsolutePosEx
_WidgetRefreshAbsolutePosEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %ebx
	movl	96(%ebx), %eax
	testl	%eax, %eax
	je	L113
	pushl	%ecx
	movl	24(%eax), %edi
	pushl	%edi
	movl	20(%eax), %esi
	pushl	%esi
	movl	64(%eax), %ecx
	pushl	%ecx
	leal	-28(%ebp), %ecx
	movl	60(%eax), %edx
	pushl	%edx
	movl	56(%eax), %edi
	pushl	%edi
	movl	52(%eax), %esi
	pushl	%esi
	pushl	%ecx
	call	_RectMove
	addl	$28, %esp
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	pushl	%edx
	pushl	%eax
	movl	16(%ebx), %edi
	leal	20(%ebx), %eax
	pushl	%edi
	movl	12(%ebx), %esi
	pushl	%esi
	movl	8(%ebx), %ecx
	pushl	%ecx
	movl	4(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	_RectMove
	movl	96(%ebx), %eax
	movl	20(%ebx), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L114
	movl	24(%ebx), %ecx
	cmpl	80(%eax), %ecx
	jle	L117
L114:
	subl	$12, %esp
	leal	36(%ebx), %edx
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%edx
	call	_RectAssign
	addl	$32, %esp
L113:
	pushl	%edi
	movl	24(%ebx), %ecx
	pushl	%ecx
	movl	20(%ebx), %edx
	pushl	%edx
	leal	-28(%ebp), %edx
	movl	64(%ebx), %eax
	pushl	%eax
	movl	60(%ebx), %edi
	pushl	%edi
	movl	56(%ebx), %esi
	pushl	%esi
	movl	52(%ebx), %ecx
	pushl	%ecx
	pushl	%edx
	call	_RectMove
	addl	$20, %esp
	movl	48(%ebx), %eax
	movl	-16(%ebp), %edx
	pushl	%eax
	movl	-20(%ebp), %eax
	movl	44(%ebx), %edi
	pushl	%edi
	movl	-24(%ebp), %edi
	movl	40(%ebx), %esi
	pushl	%esi
	movl	-28(%ebp), %esi
	movl	36(%ebx), %ecx
	pushl	%ecx
	leal	68(%ebx), %ecx
	pushl	%edx
	pushl	%eax
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	call	_RectIntersept
	addl	$48, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L117:
	movl	28(%ebx), %esi
	cmpl	68(%eax), %esi
	jl	L114
	movl	32(%ebx), %edi
	cmpl	72(%eax), %edi
	jl	L114
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%ebx), %eax
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_RectIntersept
	addl	$48, %esp
	jmp	L113
	.p2align 4,,15
.globl _WidgetRefreshAbsolutePos
_WidgetRefreshAbsolutePos:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %ebx
	movl	96(%ebx), %eax
	testl	%eax, %eax
	je	L119
	pushl	%ecx
	movl	24(%eax), %edi
	pushl	%edi
	movl	20(%eax), %esi
	pushl	%esi
	movl	64(%eax), %ecx
	pushl	%ecx
	leal	-28(%ebp), %ecx
	movl	60(%eax), %edx
	pushl	%edx
	movl	56(%eax), %edi
	pushl	%edi
	movl	52(%eax), %esi
	pushl	%esi
	pushl	%ecx
	call	_RectMove
	addl	$28, %esp
	movl	-24(%ebp), %edx
	movl	-28(%ebp), %eax
	pushl	%edx
	pushl	%eax
	movl	16(%ebx), %edi
	leal	20(%ebx), %eax
	pushl	%edi
	movl	12(%ebx), %esi
	pushl	%esi
	movl	8(%ebx), %ecx
	pushl	%ecx
	movl	4(%ebx), %edx
	pushl	%edx
	pushl	%eax
	call	_RectMove
	movl	96(%ebx), %eax
	movl	20(%ebx), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L120
	movl	24(%ebx), %ecx
	cmpl	80(%eax), %ecx
	jg	L120
	movl	28(%ebx), %esi
	cmpl	68(%eax), %esi
	jge	L126
	.p2align 4,,7
L120:
	subl	$12, %esp
	leal	36(%ebx), %edx
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%edx
	call	_RectAssign
	addl	$32, %esp
L119:
	pushl	%eax
	movl	24(%ebx), %ecx
	pushl	%ecx
	movl	20(%ebx), %edx
	pushl	%edx
	leal	-28(%ebp), %edx
	movl	64(%ebx), %eax
	pushl	%eax
	movl	60(%ebx), %edi
	pushl	%edi
	movl	56(%ebx), %esi
	pushl	%esi
	movl	52(%ebx), %ecx
	pushl	%ecx
	pushl	%edx
	call	_RectMove
	addl	$20, %esp
	movl	48(%ebx), %eax
	movl	-16(%ebp), %edx
	pushl	%eax
	movl	-20(%ebp), %eax
	movl	44(%ebx), %edi
	pushl	%edi
	movl	-24(%ebp), %edi
	movl	40(%ebx), %esi
	pushl	%esi
	movl	-28(%ebp), %esi
	movl	36(%ebx), %ecx
	pushl	%ecx
	leal	68(%ebx), %ecx
	pushl	%edx
	pushl	%eax
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	call	_RectIntersept
	movl	92(%ebx), %esi
	addl	$48, %esp
	testl	%esi, %esi
	je	L123
	movl	%esi, %ebx
	.p2align 4,,7
L122:
	subl	$12, %esp
	pushl	%ebx
	call	_WidgetRefreshAbsolutePos
	movl	88(%ebx), %ebx
	addl	$16, %esp
	cmpl	%ebx, %esi
	jne	L122
L123:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L126:
	movl	32(%ebx), %edi
	cmpl	72(%eax), %edi
	jl	L120
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%ebx), %eax
	pushl	%edi
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_RectIntersept
	addl	$48, %esp
	jmp	L119
	.p2align 4,,15
.globl _WidgetPostCenter
_WidgetPostCenter:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %ecx
	movl	96(%ecx), %edx
	movl	4(%ecx), %eax
	movl	12(%ecx), %ebx
	subl	%eax, %ebx
	movl	52(%edx), %esi
	movl	60(%edx), %eax
	subl	%esi, %eax
	movl	_GSScreenHeight, %esi
	subl	%ebx, %eax
	movl	%esi, 16(%ecx)
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	leal	-33(%esi), %eax
	sarl	%edx
	movl	%eax, 8(%ecx)
	addl	%edx, %ebx
	movl	%edx, 4(%ecx)
	movl	%ebx, 12(%ecx)
	popl	%ebx
	popl	%esi
	popl	%ebp
	jmp	_WidgetRefreshAbsolutePos
	.p2align 4,,15
.globl _WidgetPreCenter
_WidgetPreCenter:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %ecx
	movl	96(%ecx), %edx
	movl	4(%ecx), %edi
	movl	12(%ecx), %esi
	movl	8(%ecx), %ebx
	subl	%edi, %esi
	movl	16(%ecx), %edi
	subl	%ebx, %edi
	movl	56(%edx), %eax
	movl	64(%edx), %ebx
	subl	%eax, %ebx
	movl	60(%edx), %eax
	subl	52(%edx), %eax
	subl	%edi, %ebx
	subl	%esi, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%eax, %edx
	movl	%ebx, %eax
	shrl	$31, %eax
	sarl	%edx
	addl	%ebx, %eax
	sarl	%eax
	addl	%edx, %esi
	addl	%eax, %edi
	movl	%edx, 4(%ecx)
	movl	%eax, 8(%ecx)
	movl	%esi, 12(%ecx)
	movl	%edi, 16(%ecx)
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_WidgetRefreshAbsolutePos
	.p2align 4,,15
.globl _WidgetSetChildArea
_WidgetSetChildArea:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	24(%ebp), %ecx
	movl	20(%ebp), %eax
	movl	%ecx, 64(%edx)
	movl	%eax, 60(%edx)
	movl	16(%ebp), %ecx
	movl	12(%ebp), %eax
	movl	%ecx, 56(%edx)
	movl	%eax, 52(%edx)
	popl	%ebp
	jmp	_WidgetRefreshAbsolutePos
	.p2align 4,,15
.globl __WidgetInsertBefore
__WidgetInsertBefore:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	movl	16(%ebp), %ecx
	movl	92(%esi), %edx
	testl	%edx, %edx
	je	L139
	testl	%ecx, %ecx
	je	L136
	movl	84(%ecx), %edx
	movl	%ecx, 88(%ebx)
	movl	%edx, 84(%ebx)
	movl	84(%ecx), %eax
	movl	%ebx, 84(%ecx)
	movl	%ebx, 88(%eax)
L135:
	subl	$12, %esp
	movl	%esi, 96(%ebx)
	pushl	%ebx
	call	_WidgetRefreshAbsolutePos
	movl	136(%ebx), %eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L138
	subl	$12, %esp
	pushl	%ebx
	call	*%eax
	movl	$0, 136(%ebx)
	addl	$16, %esp
L138:
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.p2align 4,,7
L139:
	movl	%ebx, 88(%ebx)
	movl	%ebx, 84(%ebx)
	movl	%ebx, 92(%esi)
	jmp	L135
	.p2align 4,,7
L136:
	movl	88(%edx), %eax
	movl	%edx, 84(%ebx)
	movl	%eax, 88(%ebx)
	movl	%ebx, 92(%esi)
	movl	88(%edx), %ecx
	movl	%ebx, 88(%edx)
	movl	%ebx, 84(%ecx)
	jmp	L135
	.p2align 4,,15
.globl _WidgetUnOSD
_WidgetUnOSD:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_OSD, %eax
	testl	%eax, %eax
	je	L141
	movl	_OSDIsRect, %edx
	testl	%edx, %edx
	jne	L143
L141:
	movl	$0, _OSD
	movl	$0, _OSDIsRect
	leave
	ret
	.p2align 4,,7
L143:
	call	_MouseHide
	subl	$12, %esp
	pushl	$-1
	call	_xor_mode
	movl	_screen, %edx
	movl	4(%edx), %ecx
	decl	%ecx
	movl	%ecx, (%esp)
	movl	(%edx), %eax
	decl	%eax
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%edx
	call	_set_clip_rect
	addl	$24, %esp
	movl	_screen, %eax
	movl	_OSDColor, %ecx
	movl	28(%eax), %edx
	pushl	%ecx
	movl	_OSDRect+12, %ecx
	pushl	%ecx
	movl	_OSDRect+8, %ecx
	pushl	%ecx
	movl	_OSDRect+4, %ecx
	pushl	%ecx
	movl	_OSDRect, %ecx
	pushl	%ecx
	pushl	%eax
	call	*188(%edx)
	addl	$20, %esp
	pushl	$0
	call	_xor_mode
	call	_MouseShow
	addl	$16, %esp
	jmp	L141
	.p2align 4,,15
.globl _WidgetSetOSDRect
_WidgetSetOSDRect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	movl	12(%ebp), %edi
	movl	%ebx, -16(%ebp)
	movl	16(%ebp), %esi
	movl	20(%ebp), %ebx
	call	_MouseHide
	subl	$12, %esp
	pushl	$-1
	call	_xor_mode
	movl	_screen, %ecx
	movl	4(%ecx), %eax
	decl	%eax
	movl	%eax, (%esp)
	movl	(%ecx), %edx
	decl	%edx
	pushl	%edx
	pushl	$0
	pushl	$0
	pushl	%ecx
	call	_set_clip_rect
	movl	_OSD, %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L145
	movl	_OSDIsRect, %ecx
	testl	%ecx, %ecx
	jne	L148
L145:
	movl	%edi, _OSDRect+4
	movl	-16(%ebp), %edi
	movl	$1, _OSD
	movl	$1, _OSDIsRect
	movl	%ebx, _OSDRect+12
	movl	%esi, _OSDRect+8
	movl	%edi, _OSDRect
L146:
	movl	_screen, %eax
	pushl	%ebx
	pushl	%ebx
	movl	_OSDColor, %ebx
	movl	28(%eax), %edx
	pushl	%ebx
	movl	_OSDRect+12, %edi
	pushl	%edi
	movl	_OSDRect+8, %ecx
	pushl	%ecx
	movl	_OSDRect+4, %esi
	pushl	%esi
	movl	_OSDRect, %ebx
	pushl	%ebx
	pushl	%eax
	call	*188(%edx)
	addl	$20, %esp
	pushl	$0
	call	_xor_mode
	addl	$16, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_MouseShow
	.p2align 4,,7
L148:
	movl	_screen, %eax
	pushl	%edx
	pushl	%edx
	movl	_OSDColor, %ecx
	movl	28(%eax), %edx
	pushl	%ecx
	movl	_OSDRect+12, %ecx
	pushl	%ecx
	movl	_OSDRect+8, %ecx
	pushl	%ecx
	movl	_OSDRect+4, %ecx
	pushl	%ecx
	movl	_OSDRect, %ecx
	pushl	%ecx
	pushl	%eax
	call	*188(%edx)
	movl	%esi, _OSDRect+8
	movl	-16(%ebp), %esi
	movl	%ebx, _OSDRect+12
	movl	%edi, _OSDRect+4
	movl	%esi, _OSDRect
	addl	$32, %esp
	jmp	L146
	.p2align 4,,15
.globl _DrawOSDOnRect
_DrawOSDOnRect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$20, %esp
	movl	12(%ebp), %eax
	movl	16(%ebp), %ecx
	movl	20(%ebp), %ebx
	movl	24(%ebp), %edx
	cmpl	$0, _OSDIsRect
	je	L155
	cmpl	%eax, _OSDRect+8
	jl	L155
	cmpl	%ecx, _OSDRect+12
	jl	L155
	cmpl	%ebx, _OSDRect
	jg	L155
	cmpl	%edx, _OSDRect+4
	jle	L156
	.p2align 4,,7
L155:
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,7
L156:
	subl	$12, %esp
	pushl	_OSDRect+12
	pushl	_OSDRect+8
	pushl	_OSDRect+4
	pushl	_OSDRect
	pushl	%edx
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	leal	-20(%ebp), %eax
	pushl	%eax
	call	_RectIntersept
	addl	$36, %esp
	pushl	$-1
	call	_xor_mode
	movl	-20(%ebp), %edx
	addl	$16, %esp
	cmpl	_OSDRect, %edx
	je	L157
L151:
	movl	-12(%ebp), %edx
	cmpl	_OSDRect+8, %edx
	je	L158
L152:
	movl	-16(%ebp), %edx
	cmpl	_OSDRect+4, %edx
	je	L159
L153:
	movl	-8(%ebp), %edx
	cmpl	_OSDRect+12, %edx
	je	L160
L154:
	subl	$12, %esp
	pushl	$0
	call	_xor_mode
	addl	$16, %esp
	jmp	L155
L157:
	subl	$12, %esp
	movl	8(%ebp), %ecx
	movl	_OSDColor, %ebx
	movl	28(%ecx), %eax
	pushl	%ebx
	movl	-8(%ebp), %ebx
	pushl	%ebx
	movl	-16(%ebp), %ebx
	pushl	%ebx
	pushl	%edx
	pushl	%ecx
	call	*40(%eax)
	addl	$32, %esp
	jmp	L151
L160:
	subl	$12, %esp
	movl	8(%ebp), %ecx
	movl	_OSDColor, %ebx
	movl	28(%ecx), %eax
	pushl	%ebx
	movl	-12(%ebp), %ebx
	pushl	%ebx
	pushl	%edx
	movl	-20(%ebp), %edx
	pushl	%edx
	pushl	%ecx
	call	*44(%eax)
	addl	$32, %esp
	jmp	L154
L159:
	subl	$12, %esp
	movl	8(%ebp), %ecx
	movl	_OSDColor, %ebx
	movl	28(%ecx), %eax
	pushl	%ebx
	movl	-12(%ebp), %ebx
	pushl	%ebx
	pushl	%edx
	movl	-20(%ebp), %edx
	pushl	%edx
	pushl	%ecx
	call	*44(%eax)
	addl	$32, %esp
	jmp	L153
L158:
	subl	$12, %esp
	movl	8(%ebp), %ecx
	movl	_OSDColor, %ebx
	movl	28(%ecx), %eax
	pushl	%ebx
	movl	-8(%ebp), %ebx
	pushl	%ebx
	movl	-16(%ebp), %ebx
	pushl	%ebx
	pushl	%edx
	pushl	%ecx
	call	*40(%eax)
	addl	$32, %esp
	jmp	L152
	.p2align 4,,15
.globl _WidgetDrawFromBuffer
_WidgetDrawFromBuffer:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$12, %esp
	movl	8(%ebp), %ebx
	movl	12(%ebp), %eax
	movl	24(%ebp), %edi
	testb	$1, 104(%ebx)
	je	L179
	testl	%eax, %eax
	je	L179
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
	testl	%eax, %eax
	je	L179
	testl	%edi, %edi
	je	L163
	movl	16(%ebp), %ecx
	movl	4(%edi), %edx
	subl	$12, %esp
	movl	(%edi), %esi
	movl	4(%ecx), %eax
	movl	%edx, %ecx
	addl	48(%ebx), %ecx
	decl	%eax
	cmpl	%ecx, %eax
	jg	L182
	movl	16(%ebp), %ecx
	pushl	%eax
	movl	(%ecx), %eax
	movl	%esi, %ecx
	addl	44(%ebx), %ecx
	decl	%eax
	cmpl	%ecx, %eax
	jg	L183
L165:
	pushl	%eax
	movl	40(%ebx), %ecx
	addl	%ecx, %edx
	movl	%esi, %ecx
	movl	%edx, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %edx
	pushl	%edx
	movl	16(%ebp), %edx
	movl	36(%ebx), %esi
	addl	%esi, %ecx
	movl	%ecx, %ebx
	xorl	$-1, %ebx
	sarl	$31, %ebx
	andl	%ebx, %ecx
	pushl	%ecx
	pushl	%edx
	call	_set_clip_rect
	movl	-16(%ebp), %esi
	addl	$32, %esp
	.p2align 4,,7
L168:
	movl	8(%esi), %edx
	movl	12(%edx), %eax
	movl	4(%edx), %ecx
	incl	%eax
	movl	(%edx), %ebx
	subl	%ecx, %eax
	pushl	%eax
	movl	8(%edx), %eax
	incl	%eax
	subl	%ebx, %eax
	pushl	%eax
	movl	%ecx, %eax
	movl	4(%edi), %edx
	addl	%edx, %eax
	pushl	%eax
	movl	%ebx, %eax
	movl	(%edi), %edx
	addl	%edx, %eax
	movl	20(%ebp), %edx
	pushl	%eax
	pushl	%ecx
	pushl	%ebx
	movl	16(%ebp), %ebx
	pushl	%ebx
	pushl	%edx
	call	_blit
	movl	(%esi), %esi
	addl	$32, %esp
	cmpl	%esi, -16(%ebp)
	jne	L168
L179:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L183:
	movl	%ecx, %eax
	jmp	L165
	.p2align 4,,7
L182:
	movl	%ecx, %eax
	movl	16(%ebp), %ecx
	pushl	%eax
	movl	(%ecx), %eax
	movl	%esi, %ecx
	addl	44(%ebx), %ecx
	decl	%eax
	cmpl	%ecx, %eax
	jle	L165
	jmp	L183
	.p2align 4,,7
L163:
	movl	16(%ebp), %edi
	movl	48(%ebx), %edx
	subl	$12, %esp
	movl	4(%edi), %eax
	decl	%eax
	cmpl	%edx, %eax
	jg	L184
L169:
	movl	16(%ebp), %esi
	pushl	%eax
	movl	44(%ebx), %edx
	movl	(%esi), %eax
	decl	%eax
	cmpl	%edx, %eax
	jg	L185
L170:
	pushl	%eax
	movl	16(%ebp), %ecx
	movl	40(%ebx), %edi
	movl	%edi, %esi
	xorl	$-1, %esi
	sarl	$31, %esi
	andl	%esi, %edi
	pushl	%edi
	movl	36(%ebx), %edx
	movl	%edx, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %edx
	pushl	%edx
	pushl	%ecx
	call	_set_clip_rect
	movl	-16(%ebp), %ebx
	movl	%ebx, -20(%ebp)
	addl	$32, %esp
	jmp	L178
	.p2align 4,,7
L187:
	movl	12(%ebx), %eax
	movl	4(%ebx), %ecx
	movl	(%ebx), %edx
L175:
	incl	%eax
	leal	1(%edi), %esi
	subl	%ecx, %eax
	subl	%edx, %esi
	pushl	%eax
	movl	16(%ebp), %eax
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	pushl	%ecx
	pushl	%edx
	movl	20(%ebp), %edx
	pushl	%eax
	pushl	%edx
	call	_blit
	movl	-20(%ebp), %ecx
	movl	(%ecx), %ebx
	addl	$32, %esp
	movl	%ebx, -20(%ebp)
	cmpl	%ebx, -16(%ebp)
	je	L179
L178:
	movl	-20(%ebp), %edx
	movl	_OSD, %ecx
	testl	%ecx, %ecx
	movl	8(%edx), %ebx
	jne	L186
L173:
	movl	_Mouse, %esi
	movl	8(%ebx), %edi
	cmpl	%edi, 24(%esi)
	jg	L187
	movl	12(%ebx), %eax
	cmpl	%eax, 28(%esi)
	jle	L176
	movl	4(%ebx), %ecx
	movl	(%ebx), %edx
	jmp	L175
	.p2align 4,,7
L186:
	subl	$12, %esp
	movl	12(%ebx), %edx
	movl	20(%ebp), %eax
	pushl	%edx
	movl	8(%ebx), %ecx
	pushl	%ecx
	movl	4(%ebx), %esi
	pushl	%esi
	movl	(%ebx), %edi
	pushl	%edi
	pushl	%eax
	call	_DrawOSDOnRect
	addl	$32, %esp
	jmp	L173
	.p2align 4,,7
L176:
	movl	(%ebx), %edx
	cmpl	%edx, 32(%esi)
	jge	L177
	movl	4(%ebx), %ecx
	jmp	L175
	.p2align 4,,7
L177:
	movl	4(%ebx), %ecx
	cmpl	%ecx, 36(%esi)
	jl	L175
	subl	$12, %esp
	pushl	%eax
	movl	20(%ebp), %eax
	movl	8(%ebx), %esi
	pushl	%esi
	pushl	%ecx
	movl	(%ebx), %edi
	pushl	%edi
	pushl	%eax
	call	__MouseRecap
	movl	12(%ebx), %eax
	movl	4(%ebx), %ecx
	movl	8(%ebx), %edi
	movl	(%ebx), %edx
	addl	$32, %esp
	jmp	L175
	.p2align 4,,7
L185:
	movl	%edx, %eax
	jmp	L170
	.p2align 4,,7
L184:
	movl	%edx, %eax
	jmp	L169
LC3:
	.ascii "Drag n Drop: DragStop\0"
	.p2align 4,,15
.globl _DragStop
_DragStop:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	pushl	$LC3
	call	_DebugMessage
	addl	$16, %esp
	testb	$4, _WorkingFlags
	jne	L191
	leave
	ret
	.p2align 4,,7
L191:
	pushl	%eax
	pushl	%eax
	movl	_DragData, %eax
	pushl	%eax
	movl	_DragDataType, %ecx
	pushl	%ecx
	call	_FreeData2
	movl	$0, _DragCaller
	movl	$0, _DragData
	movl	$0, _DragDataType
	movl	$0, _DragSupportedMethods
	popl	%ecx
	movl	_cursor_pointer, %edx
	pushl	%edx
	call	_MouseSetCursor
	movl	_WorkingFlags, %eax
	addl	$16, %esp
	andl	$-5, %eax
	movl	%eax, _WorkingFlags
	leave
	ret
	.p2align 4,,15
.globl _GetTopWidgetUnderMouse
_GetTopWidgetUnderMouse:
	pushl	%ebp
	movl	_Mouse, %eax
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	_DeskTop, %edx
	movl	4(%eax), %ebx
	movl	(%eax), %eax
L201:
	movl	92(%edx), %ecx
	testl	%ecx, %ecx
	je	L193
	movl	%edx, %esi
	movl	88(%ecx), %edx
	movl	%edx, %ecx
	.p2align 4,,7
L196:
	cmpl	%eax, 20(%edx)
	jg	L194
	cmpl	24(%edx), %ebx
	jl	L194
	cmpl	%eax, 28(%edx)
	jl	L194
	cmpl	32(%edx), %ebx
	jg	L194
	testb	$1, 104(%edx)
	jne	L201
	.p2align 4,,7
L194:
	movl	88(%edx), %edx
	cmpl	%edx, %ecx
	jne	L196
	movl	%esi, %edx
L193:
	movl	%edx, %eax
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetGenerateCache
_WidgetGenerateCache:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	16(%ebp), %eax
	movl	12(%ebp), %edi
	testl	%eax, %eax
	je	L203
	movl	8(%ebp), %edi
	subl	$12, %esp
	addl	$36, %edi
	movl	8(%ebp), %ecx
	movl	12(%edi), %edx
	pushl	%edx
	movl	8(%edi), %esi
	pushl	%esi
	movl	4(%edi), %ebx
	pushl	%ebx
	movl	36(%ecx), %edx
	pushl	%edx
	pushl	%eax
	call	_NewListFromRectListIntersept
	addl	$32, %esp
	movl	%eax, -32(%ebp)
L204:
	movl	8(%ebp), %esi
	movl	8(%edi), %eax
	movl	(%edi), %ecx
	movl	4(%edi), %ebx
	movl	%eax, -40(%ebp)
	movl	12(%edi), %edx
	movl	92(%esi), %eax
	movl	%ecx, -44(%ebp)
	movl	%ebx, -36(%ebp)
	movl	%edx, -48(%ebp)
	testl	%eax, %eax
	je	L208
	movl	88(%eax), %esi
	movl	%esi, %ebx
	.p2align 4,,7
L210:
	testb	$1, 104(%ebx)
	je	L209
	movl	-44(%ebp), %edx
	cmpl	%edx, 44(%ebx)
	jl	L209
	movl	-36(%ebp), %eax
	cmpl	%eax, 48(%ebx)
	jl	L209
	movl	-40(%ebp), %ecx
	cmpl	%ecx, 36(%ebx)
	jg	L209
	movl	-48(%ebp), %edx
	cmpl	%edx, 40(%ebx)
	jle	L221
	.p2align 4,,7
L209:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L210
L225:
	movl	(%edi), %eax
	movl	4(%edi), %edx
	movl	8(%edi), %ebx
	movl	12(%edi), %esi
	movl	%eax, -44(%ebp)
	movl	%edx, -36(%ebp)
	movl	%ebx, -40(%ebp)
	movl	%esi, -48(%ebp)
L208:
	movl	8(%ebp), %esi
L220:
	movl	96(%esi), %edx
	testl	%edx, %edx
	je	L207
L224:
	movl	92(%edx), %ecx
	movl	88(%ecx), %ebx
	cmpl	%ebx, %esi
	je	L222
	.p2align 4,,7
L217:
	testb	$1, 104(%ebx)
	je	L213
	movl	-44(%ebp), %edx
	cmpl	%edx, 44(%ebx)
	jl	L213
	movl	-36(%ebp), %eax
	cmpl	%eax, 48(%ebx)
	jl	L213
	movl	-40(%ebp), %ecx
	cmpl	%ecx, 36(%ebx)
	jg	L213
	movl	-48(%ebp), %edx
	cmpl	%edx, 40(%ebx)
	jle	L223
	.p2align 4,,7
L213:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L217
	movl	96(%esi), %esi
	testl	%esi, %esi
	je	L207
	movl	8(%edi), %edx
	movl	(%edi), %ecx
	movl	4(%edi), %eax
	movl	%edx, -40(%ebp)
	movl	12(%edi), %ebx
	movl	96(%esi), %edx
	movl	%ecx, -44(%ebp)
	movl	%eax, -36(%ebp)
	movl	%ebx, -48(%ebp)
	testl	%edx, %edx
	jne	L224
L207:
	movl	-32(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L223:
	subl	$12, %esp
	movl	48(%ebx), %ecx
	pushl	%ecx
	movl	44(%ebx), %eax
	pushl	%eax
	movl	-32(%ebp), %eax
	movl	40(%ebx), %edx
	pushl	%edx
	movl	36(%ebx), %ecx
	pushl	%ecx
	pushl	%eax
	call	_RemoveZoneInList
	addl	$32, %esp
	jmp	L213
L222:
	movl	%edx, %esi
	jmp	L220
L203:
	testl	%edi, %edi
	je	L205
	subl	$12, %esp
	movl	12(%edi), %ebx
	pushl	%ebx
	movl	8(%edi), %ecx
	pushl	%ecx
	movl	4(%edi), %esi
	pushl	%esi
	movl	8(%ebp), %esi
	movl	(%edi), %eax
	pushl	%eax
	movl	48(%esi), %edx
	pushl	%edx
	leal	-28(%ebp), %edx
	movl	44(%esi), %ebx
	pushl	%ebx
	movl	40(%esi), %ecx
	pushl	%ecx
	movl	36(%esi), %eax
	pushl	%eax
	pushl	%edx
	call	_RectIntersept
	addl	$48, %esp
	movl	-16(%ebp), %esi
	movl	-20(%ebp), %ebx
	movl	-24(%ebp), %ecx
	movl	-28(%ebp), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%eax
	call	_NewListFromRect
	addl	$16, %esp
	movl	%eax, -32(%ebp)
	jmp	L204
L221:
	subl	$12, %esp
	movl	48(%ebx), %ecx
	pushl	%ecx
	movl	44(%ebx), %eax
	pushl	%eax
	movl	-32(%ebp), %eax
	movl	40(%ebx), %edx
	pushl	%edx
	movl	36(%ebx), %ecx
	pushl	%ecx
	pushl	%eax
	call	_RemoveZoneInList
	movl	88(%ebx), %ebx
	addl	$32, %esp
	cmpl	%ebx, %esi
	jne	L210
	jmp	L225
L205:
	movl	8(%ebp), %edx
	movl	36(%edx), %eax
	movl	44(%edx), %edi
	subl	%edi, %eax
	incl	%eax
	je	L226
L206:
	movl	8(%ebp), %eax
	movl	48(%eax), %ecx
	pushl	%ecx
	movl	44(%eax), %edi
	pushl	%edi
	movl	40(%eax), %ebx
	pushl	%ebx
	movl	36(%eax), %edx
	pushl	%edx
	call	_NewListFromRect
	movl	8(%ebp), %edi
	movl	%eax, -32(%ebp)
	addl	$36, %edi
	addl	$16, %esp
	jmp	L204
L226:
	movl	40(%edx), %ecx
	movl	48(%edx), %esi
	subl	%esi, %ecx
	movl	$0, -32(%ebp)
	incl	%ecx
	jne	L206
	jmp	L207
	.p2align 4,,15
.globl _WidgetRefresh
_WidgetRefresh:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %eax
	testb	$1, 104(%eax)
	jne	L278
L270:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L278:
	pushl	%ebx
	movl	16(%ebp), %ecx
	pushl	%ecx
	movl	12(%ebp), %edx
	pushl	%edx
	pushl	%eax
	call	_WidgetGenerateCache
	addl	$16, %esp
	movl	%eax, -36(%ebp)
	testl	%eax, %eax
	je	L270
	movl	(%eax), %ebx
	movl	%ebx, -32(%ebp)
	testl	%ebx, %ebx
	je	L229
	movl	8(%ebp), %esi
	movl	128(%esi), %eax
	testl	%eax, %eax
	je	L279
	movl	-32(%ebp), %esi
	cmpl	(%esi), %esi
	je	L280
	movl	8(%ebp), %esi
	movl	104(%esi), %eax
L247:
	testb	$4, %al
	je	L255
	testb	$2, %al
	jne	L255
	movl	24(%ebp), %ebx
	testl	%ebx, %ebx
	je	L281
L255:
	movl	_buffer, %ebx
	testl	%ebx, %ebx
	je	L229
	movl	8(%ebp), %ecx
	movl	12(%ebp), %edx
	testl	%edx, %edx
	movl	20(%ecx), %ebx
	movl	%ebx, -28(%ebp)
	leal	-28(%ebp), %ebx
	movl	24(%ecx), %esi
	movl	%esi, -24(%ebp)
	movl	28(%ecx), %eax
	movl	%eax, -20(%ebp)
	movl	32(%ecx), %edi
	movl	%edi, -16(%ebp)
	je	L264
	movl	12(%ebp), %edi
	subl	$12, %esp
	movl	12(%edi), %edx
	pushl	%edx
	movl	8(%edi), %esi
	pushl	%esi
	movl	4(%edi), %eax
	pushl	%eax
	movl	(%edi), %edx
	pushl	%edx
	movl	48(%ecx), %esi
	pushl	%esi
	movl	44(%ecx), %eax
	pushl	%eax
	movl	40(%ecx), %edi
	pushl	%edi
	movl	36(%ecx), %edx
	pushl	%edx
	pushl	%ebx
	call	_RectIntersept
	addl	$48, %esp
L264:
	movl	_buffer, %ecx
	movl	8(%ebp), %esi
	subl	$12, %esp
	movl	4(%ecx), %eax
	movl	48(%esi), %edx
	decl	%eax
	cmpl	%edx, %eax
	jle	L265
	movl	%edx, %eax
	movl	8(%ebp), %esi
L265:
	pushl	%eax
	movl	(%ecx), %eax
	movl	44(%esi), %edx
	decl	%eax
	cmpl	%edx, %eax
	jle	L266
	movl	%edx, %eax
	movl	8(%ebp), %esi
L266:
	pushl	%eax
	movl	8(%ebp), %eax
	movl	40(%eax), %edx
	movl	%edx, %edi
	xorl	$-1, %edi
	sarl	$31, %edi
	andl	%edi, %edx
	pushl	%edx
	movl	36(%esi), %edi
	movl	%edi, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %edi
	pushl	%edi
	pushl	%ecx
	call	_set_clip_rect
	addl	$28, %esp
	pushl	%ebx
	movl	_buffer, %ebx
	pushl	%ebx
	pushl	%esi
	call	*128(%esi)
	movl	20(%ebp), %edx
	movl	28(%edx), %ecx
	addl	$16, %esp
	movl	16(%ecx), %eax
	testl	%eax, %eax
	je	L269
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L269:
	pushl	%edx
	pushl	%edx
	movl	12(%ebp), %esi
	pushl	%esi
	movl	24(%ebp), %eax
	pushl	%eax
	movl	_buffer, %edi
	pushl	%edi
	movl	20(%ebp), %edx
	pushl	%edx
	movl	-36(%ebp), %ebx
	pushl	%ebx
	movl	8(%ebp), %ecx
	pushl	%ecx
	call	_WidgetDrawFromBuffer
	movl	20(%ebp), %ecx
	addl	$32, %esp
	movl	28(%ecx), %esi
	movl	20(%esi), %eax
	testl	%eax, %eax
	je	L229
	subl	$12, %esp
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
L229:
	subl	$12, %esp
	movl	-36(%ebp), %ecx
	pushl	%ecx
	call	_FreeList
	addl	$16, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L281:
	movl	20(%ebp), %esi
	movl	28(%esi), %edx
	movl	16(%edx), %eax
	testl	%eax, %eax
	je	L256
	subl	$12, %esp
	pushl	%esi
	call	*%eax
	addl	$16, %esp
L256:
	movl	-32(%ebp), %esi
	.p2align 4,,7
L263:
	movl	20(%ebp), %ecx
	movl	8(%esi), %ebx
	subl	$12, %esp
	movl	4(%ecx), %eax
	movl	12(%ebx), %edx
	decl	%eax
	cmpl	%edx, %eax
	jle	L257
	movl	%edx, %eax
L257:
	pushl	%eax
	movl	20(%ebp), %edi
	movl	8(%ebx), %edx
	movl	(%edi), %eax
	decl	%eax
	cmpl	%edx, %eax
	jle	L258
	movl	%edx, %eax
L258:
	pushl	%eax
	movl	4(%ebx), %edi
	movl	%edi, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %edi
	pushl	%edi
	movl	(%ebx), %edx
	movl	%edx, %ecx
	xorl	$-1, %ecx
	sarl	$31, %ecx
	andl	%ecx, %edx
	pushl	%edx
	movl	20(%ebp), %eax
	pushl	%eax
	call	_set_clip_rect
	addl	$28, %esp
	pushl	%ebx
	movl	20(%ebp), %edi
	pushl	%edi
	movl	8(%ebp), %ecx
	pushl	%ecx
	movl	8(%ebp), %edx
	call	*128(%edx)
	movl	_OSD, %eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L282
L261:
	movl	_Mouse, %edx
	movl	24(%edx), %ecx
	cmpl	8(%ebx), %ecx
	jg	L262
	movl	28(%edx), %edi
	cmpl	12(%ebx), %edi
	jg	L262
	movl	32(%edx), %eax
	cmpl	(%ebx), %eax
	jl	L262
	movl	36(%edx), %ecx
	cmpl	4(%ebx), %ecx
	jl	L262
	subl	$12, %esp
	movl	12(%ebx), %ecx
	pushl	%ecx
	movl	8(%ebx), %eax
	pushl	%eax
	movl	4(%ebx), %edi
	pushl	%edi
	movl	(%ebx), %edx
	pushl	%edx
	movl	20(%ebp), %ebx
	pushl	%ebx
	call	__MouseRecap
	addl	$32, %esp
	.p2align 4,,7
L262:
	movl	(%esi), %esi
	cmpl	%esi, -32(%ebp)
	jne	L263
L277:
	movl	20(%ebp), %edx
	movl	28(%edx), %esi
	movl	20(%esi), %eax
	testl	%eax, %eax
	je	L229
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	jmp	L229
	.p2align 4,,7
L282:
	subl	$12, %esp
	movl	12(%ebx), %edx
	pushl	%edx
	movl	8(%ebx), %eax
	pushl	%eax
	movl	4(%ebx), %edi
	pushl	%edi
	movl	(%ebx), %ecx
	pushl	%ecx
	movl	20(%ebp), %edx
	pushl	%edx
	call	_DrawOSDOnRect
	addl	$32, %esp
	jmp	L261
	.p2align 4,,7
L280:
	movl	8(%ebp), %edx
	movl	104(%edx), %eax
	testb	$2, %al
	jne	L247
	movl	24(%ebp), %ecx
	testl	%ecx, %ecx
	jne	L247
	movl	20(%ebp), %esi
	movl	-32(%ebp), %edi
	movl	28(%esi), %eax
	movl	8(%edi), %ebx
	movl	16(%eax), %eax
	testl	%eax, %eax
	je	L248
	subl	$12, %esp
	pushl	%esi
	call	*%eax
	addl	$16, %esp
L248:
	movl	20(%ebp), %esi
	movl	12(%ebx), %edx
	subl	$12, %esp
	movl	4(%esi), %eax
	decl	%eax
	cmpl	%edx, %eax
	jle	L249
	movl	%edx, %eax
L249:
	pushl	%eax
	movl	20(%ebp), %edx
	movl	(%edx), %eax
	movl	8(%ebx), %edx
	decl	%eax
	cmpl	%edx, %eax
	jle	L250
	movl	%edx, %eax
L250:
	pushl	%eax
	movl	4(%ebx), %edi
	movl	%edi, %esi
	xorl	$-1, %esi
	sarl	$31, %esi
	andl	%esi, %edi
	pushl	%edi
	movl	(%ebx), %ecx
	movl	%ecx, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %ecx
	pushl	%ecx
	movl	20(%ebp), %edx
	pushl	%edx
	call	_set_clip_rect
	addl	$28, %esp
	pushl	%ebx
	movl	20(%ebp), %esi
	pushl	%esi
	movl	8(%ebp), %edi
	pushl	%edi
	movl	8(%ebp), %eax
	call	*128(%eax)
	movl	_OSD, %ecx
	addl	$16, %esp
	testl	%ecx, %ecx
	jne	L283
L253:
	movl	_Mouse, %edx
	movl	24(%edx), %ecx
	cmpl	8(%ebx), %ecx
	jg	L277
	movl	28(%edx), %eax
	cmpl	12(%ebx), %eax
	jg	L277
	movl	32(%edx), %edi
	cmpl	(%ebx), %edi
	jl	L277
	movl	36(%edx), %esi
	cmpl	4(%ebx), %esi
	jl	L277
	subl	$12, %esp
	movl	12(%ebx), %edi
	pushl	%edi
	movl	8(%ebx), %eax
	pushl	%eax
	movl	4(%ebx), %ecx
	pushl	%ecx
	movl	(%ebx), %edx
	pushl	%edx
	movl	20(%ebp), %ebx
	pushl	%ebx
	call	__MouseRecap
	addl	$32, %esp
	jmp	L277
	.p2align 4,,7
L279:
	movl	20(%ebp), %esi
	movl	28(%esi), %edi
	movl	16(%edi), %eax
	testl	%eax, %eax
	je	L231
	subl	$12, %esp
	pushl	%esi
	call	*%eax
	addl	$16, %esp
L231:
	movl	24(%ebp), %edx
	testl	%edx, %edx
	je	L232
	movl	24(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	8(%ebp), %esi
	subl	$12, %esp
	movl	4(%eax), %edx
	movl	(%eax), %ebx
	movl	48(%esi), %edi
	movl	4(%ecx), %eax
	movl	%edx, %ecx
	decl	%eax
	addl	%edi, %ecx
	cmpl	%ecx, %eax
	jle	L233
	movl	%ecx, %eax
	movl	8(%ebp), %esi
L233:
	pushl	%eax
	movl	20(%ebp), %ecx
	movl	44(%esi), %edi
	movl	(%ecx), %eax
	movl	%ebx, %ecx
	decl	%eax
	addl	%edi, %ecx
	cmpl	%ecx, %eax
	jle	L234
	movl	%ecx, %eax
L234:
	pushl	%eax
	movl	8(%ebp), %eax
	movl	40(%eax), %esi
	addl	%esi, %edx
	movl	%ebx, %esi
	movl	%edx, %ecx
	xorl	$-1, %ecx
	sarl	$31, %ecx
	andl	%ecx, %edx
	pushl	%edx
	movl	8(%ebp), %edi
	movl	36(%edi), %eax
	addl	%eax, %esi
	movl	%esi, %edx
	xorl	$-1, %edx
	sarl	$31, %edx
	andl	%edx, %esi
	pushl	%esi
	movl	20(%ebp), %ebx
	pushl	%ebx
	call	_set_clip_rect
	movl	-32(%ebp), %edi
	addl	$32, %esp
	.p2align 4,,7
L237:
	movl	24(%ebp), %esi
	movl	8(%edi), %ebx
	movl	4(%esi), %edx
	movl	(%esi), %ecx
	pushl	%esi
	pushl	%esi
	movl	20(%ebp), %eax
	movl	28(%eax), %esi
	movl	8(%ebp), %eax
	movl	100(%eax), %eax
	pushl	%eax
	movl	%edx, %eax
	addl	12(%ebx), %eax
	pushl	%eax
	movl	%ecx, %eax
	addl	8(%ebx), %eax
	pushl	%eax
	movl	4(%ebx), %eax
	addl	%eax, %edx
	pushl	%edx
	movl	(%ebx), %edx
	addl	%edx, %ecx
	pushl	%ecx
	movl	20(%ebp), %ebx
	pushl	%ebx
	call	*60(%esi)
	movl	(%edi), %edi
	addl	$32, %esp
	cmpl	%edi, -32(%ebp)
	jne	L237
L238:
	movl	20(%ebp), %esi
	movl	28(%esi), %ebx
	movl	20(%ebx), %eax
	testl	%eax, %eax
	je	L229
	subl	$12, %esp
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	jmp	L229
L232:
	movl	20(%ebp), %edi
	movl	8(%ebp), %ecx
	subl	$12, %esp
	movl	4(%edi), %eax
	movl	48(%ecx), %edx
	decl	%eax
	cmpl	%edx, %eax
	jle	L239
	movl	%edx, %eax
	movl	8(%ebp), %ecx
L239:
	pushl	%eax
	movl	20(%ebp), %ebx
	movl	44(%ecx), %edx
	movl	(%ebx), %eax
	decl	%eax
	cmpl	%edx, %eax
	jle	L240
	movl	%edx, %eax
L240:
	pushl	%eax
	movl	8(%ebp), %esi
	movl	40(%esi), %edi
	movl	%edi, %ebx
	xorl	$-1, %ebx
	sarl	$31, %ebx
	andl	%ebx, %edi
	pushl	%edi
	movl	36(%esi), %edx
	movl	%edx, %eax
	xorl	$-1, %eax
	sarl	$31, %eax
	andl	%eax, %edx
	pushl	%edx
	movl	20(%ebp), %ecx
	pushl	%ecx
	call	_set_clip_rect
	movl	-32(%ebp), %esi
	addl	$32, %esp
	jmp	L245
	.p2align 4,,7
L243:
	movl	_Mouse, %edx
	movl	24(%edx), %edi
	cmpl	8(%ebx), %edi
	jg	L244
	movl	28(%edx), %ecx
	cmpl	12(%ebx), %ecx
	jg	L244
	movl	32(%edx), %eax
	cmpl	(%ebx), %eax
	jl	L244
	movl	36(%edx), %edi
	cmpl	4(%ebx), %edi
	jge	L284
	.p2align 4,,7
L244:
	movl	(%esi), %esi
	cmpl	%esi, -32(%ebp)
	je	L238
L245:
	movl	8(%esi), %ebx
	pushl	%edi
	pushl	%edi
	movl	8(%ebp), %ecx
	movl	20(%ebp), %edx
	movl	100(%ecx), %edi
	movl	28(%edx), %eax
	pushl	%edi
	movl	12(%ebx), %ecx
	pushl	%ecx
	movl	8(%ebx), %edi
	pushl	%edi
	movl	4(%ebx), %ecx
	pushl	%ecx
	movl	(%ebx), %edi
	pushl	%edi
	pushl	%edx
	call	*60(%eax)
	movl	_OSD, %ecx
	addl	$32, %esp
	testl	%ecx, %ecx
	je	L243
	subl	$12, %esp
	movl	12(%ebx), %eax
	pushl	%eax
	movl	8(%ebx), %ecx
	pushl	%ecx
	movl	4(%ebx), %edi
	pushl	%edi
	movl	(%ebx), %edx
	pushl	%edx
	movl	20(%ebp), %eax
	pushl	%eax
	call	_DrawOSDOnRect
	addl	$32, %esp
	jmp	L243
L283:
	subl	$12, %esp
	movl	12(%ebx), %esi
	pushl	%esi
	movl	8(%ebx), %edi
	pushl	%edi
	movl	4(%ebx), %eax
	pushl	%eax
	movl	(%ebx), %ecx
	pushl	%ecx
	movl	20(%ebp), %edx
	pushl	%edx
	call	_DrawOSDOnRect
	addl	$32, %esp
	jmp	L253
L284:
	subl	$12, %esp
	movl	12(%ebx), %edi
	pushl	%edi
	movl	8(%ebx), %eax
	pushl	%eax
	movl	4(%ebx), %ecx
	pushl	%ecx
	movl	(%ebx), %edx
	pushl	%edx
	movl	20(%ebp), %ebx
	pushl	%ebx
	call	__MouseRecap
	addl	$32, %esp
	jmp	L244
	.p2align 4,,15
.globl _WidgetGetName
_WidgetGetName:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	8(%ebp), %ebx
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L286
	movl	12(%ebp), %ecx
	pushl	%esi
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L287
L286:
	movl	92(%ebx), %eax
	testl	%eax, %eax
	je	L288
	movl	88(%eax), %eax
	movl	%eax, -68(%ebp)
	movl	%eax, -72(%ebp)
L321:
	movl	-72(%ebp), %edx
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L289
	movl	12(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L290
L289:
	movl	-72(%ebp), %ebx
	movl	92(%ebx), %eax
	testl	%eax, %eax
	je	L291
	movl	88(%eax), %esi
	movl	%esi, -64(%ebp)
	movl	%esi, -60(%ebp)
	movl	%esi, %edx
L320:
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L292
	movl	12(%ebp), %ecx
	pushl	%esi
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L293
L292:
	movl	-60(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L294
	movl	88(%eax), %eax
	movl	%eax, -56(%ebp)
	movl	%eax, -52(%ebp)
	movl	%eax, %edx
L319:
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L295
	movl	12(%ebp), %edi
	pushl	%ecx
	pushl	%ecx
	pushl	%edi
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L296
L295:
	movl	-52(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L297
	movl	88(%eax), %ebx
	movl	%ebx, -48(%ebp)
	movl	%ebx, -44(%ebp)
	movl	%ebx, %edx
L318:
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L298
	movl	12(%ebp), %esi
	pushl	%edi
	pushl	%edi
	pushl	%esi
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L299
L298:
	movl	-44(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L300
	movl	88(%eax), %ecx
	movl	%ecx, -40(%ebp)
	movl	%ecx, -36(%ebp)
	movl	%ecx, %edx
L317:
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L301
	movl	12(%ebp), %edx
	pushl	%ebx
	pushl	%ebx
	pushl	%edx
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L302
L301:
	movl	-36(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L303
	movl	88(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	%eax, -28(%ebp)
	movl	%eax, %edx
L316:
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L304
	movl	12(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L305
L304:
	movl	-28(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L306
	movl	88(%eax), %ebx
	movl	%ebx, -24(%ebp)
	movl	%ebx, -20(%ebp)
L315:
	movl	-20(%ebp), %esi
	movl	176(%esi), %eax
	testl	%eax, %eax
	je	L307
	movl	12(%ebp), %ecx
	pushl	%esi
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L308
L307:
	movl	-20(%ebp), %edx
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L309
	movl	88(%eax), %eax
	movl	%eax, -16(%ebp)
	movl	%eax, %edi
L314:
	movl	176(%edi), %eax
	testl	%eax, %eax
	je	L310
	movl	12(%ebp), %ebx
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	call	_TextCompare
	addl	$16, %esp
	testl	%eax, %eax
	je	L333
L310:
	movl	92(%edi), %eax
	testl	%eax, %eax
	je	L311
	movl	88(%eax), %esi
	movl	%esi, %ebx
	.p2align 4,,7
L313:
	movl	12(%ebp), %ecx
	pushl	%eax
	pushl	%eax
	pushl	%ecx
	pushl	%ebx
	call	_WidgetGetName
	addl	$16, %esp
	testl	%eax, %eax
	jne	L332
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L313
L311:
	movl	88(%edi), %edi
	cmpl	%edi, -16(%ebp)
	jne	L314
L309:
	movl	-20(%ebp), %esi
	movl	88(%esi), %edi
	movl	%edi, -20(%ebp)
	cmpl	%edi, -24(%ebp)
	jne	L315
	movl	-28(%ebp), %edx
L306:
	movl	88(%edx), %edx
	movl	%edx, -28(%ebp)
	cmpl	%edx, -32(%ebp)
	jne	L316
	movl	-36(%ebp), %edx
L303:
	movl	88(%edx), %edx
	movl	%edx, -36(%ebp)
	cmpl	%edx, -40(%ebp)
	jne	L317
	movl	-44(%ebp), %edx
L300:
	movl	88(%edx), %edx
	movl	%edx, -44(%ebp)
	cmpl	%edx, -48(%ebp)
	jne	L318
	movl	-52(%ebp), %edx
L297:
	movl	88(%edx), %edx
	movl	%edx, -52(%ebp)
	cmpl	%edx, -56(%ebp)
	jne	L319
L294:
	movl	-60(%ebp), %ecx
	movl	88(%ecx), %edx
	movl	%edx, -60(%ebp)
	cmpl	%edx, -64(%ebp)
	jne	L320
L291:
	movl	-72(%ebp), %eax
	movl	-68(%ebp), %esi
	movl	88(%eax), %edx
	movl	%edx, -72(%ebp)
	cmpl	%esi, %edx
	jne	L321
L288:
	xorl	%ebx, %ebx
	jmp	L287
	.p2align 4,,7
L333:
	movl	%edi, -36(%ebp)
L302:
	movl	-36(%ebp), %eax
	movl	%eax, -44(%ebp)
L299:
	movl	-44(%ebp), %ebx
	movl	%ebx, -52(%ebp)
L296:
	movl	-52(%ebp), %edi
	movl	%edi, -60(%ebp)
L293:
	movl	-60(%ebp), %ebx
L287:
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L308:
	movl	-20(%ebp), %eax
L332:
	movl	%eax, -36(%ebp)
	jmp	L302
	.p2align 4,,7
L305:
	movl	-28(%ebp), %edx
	movl	%edx, -36(%ebp)
	jmp	L302
L290:
	movl	-72(%ebp), %ebx
	jmp	L287
	.p2align 4,,15
.globl _WidgetSendEvent
_WidgetSendEvent:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$140, %esp
	movl	12(%ebp), %edx
	movl	16(%ebp), %eax
	movl	8(%ebp), %ebx
	movl	%eax, -68(%ebp)
	movl	%edx, -64(%ebp)
	cmpl	$1, %edx
	je	L335
	cmpl	$-49146, %eax
	je	L336
	cmpl	$4, %edx
	je	L337
	leal	-48(%ebp), %esi
	leal	12(%ebp), %edi
	movl	%esi, -120(%ebp)
	movl	%edi, -108(%ebp)
	.p2align 4,,7
L344:
	movl	-68(%ebp), %eax
	movl	-64(%ebp), %edx
	movl	%eax, 16(%ebp)
	movl	%edx, 12(%ebp)
	movl	-120(%ebp), %edi
	movl	-108(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %ecx
	testl	%ecx, %ecx
	js	L377
L338:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L340
	leal	-48(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L340:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L342
	leal	-48(%ebp), %esi
	pushl	%edi
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L342:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L344
L343:
	xorl	%eax, %eax
L380:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L377:
	cmpl	$1, -48(%ebp)
	jne	L338
L339:
	pushl	%esi
	movl	-44(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-44(%ebp), %ecx
	addl	$16, %esp
	movl	%ecx, 112(%ebx)
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L335:
	cmpl	$-49146, -68(%ebp)
	je	L363
	leal	-48(%ebp), %eax
	leal	12(%ebp), %edx
	movl	%eax, -136(%ebp)
	movl	%edx, -116(%ebp)
	.p2align 4,,7
L352:
	movl	-68(%ebp), %edx
	movl	$1, 12(%ebp)
	movl	%edx, 16(%ebp)
	movl	-136(%ebp), %edi
	movl	-116(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L378
L355:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L356
	pushl	%ecx
	pushl	%ecx
	leal	-48(%ebp), %ecx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L356:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L357
	leal	-48(%ebp), %esi
	pushl	%edx
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L357:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L352
	jmp	L343
	.p2align 4,,7
L378:
	cmpl	$1, -48(%ebp)
	jne	L355
	jmp	L339
L337:
	movl	-68(%ebp), %eax
	leal	-48(%ebp), %edx
	movl	%eax, 16(%ebp)
	movl	$4, 12(%ebp)
	leal	12(%ebp), %esi
	movl	$9, %ecx
	movl	%edx, %edi
	movl	%edx, -140(%ebp)
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L375
L358:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L360
	leal	-48(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L360:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L343
	leal	-48(%ebp), %edx
	pushl	%edi
	pushl	%edi
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L343
	.p2align 4,,7
L341:
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L345:
	movl	$-49146, 16(%ebp)
	leal	-48(%ebp), %edi
	movl	$4, 12(%ebp)
	leal	12(%ebp), %esi
	movl	$9, %ecx
	movl	%edi, -128(%ebp)
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	jns	L358
	.p2align 4,,7
L375:
	cmpl	$1, -48(%ebp)
	jne	L358
	jmp	L339
L363:
	leal	-48(%ebp), %edx
	movl	$-49146, 16(%ebp)
	movl	$1, 12(%ebp)
	leal	12(%ebp), %esi
	movl	$9, %ecx
	movl	%edx, %edi
	rep movsl
	movl	104(%ebx), %ecx
	movl	%edx, -132(%ebp)
	testl	%ecx, %ecx
	jns	L358
	jmp	L375
L336:
	cmpl	$4, -64(%ebp)
	je	L345
	leal	-48(%ebp), %edx
	leal	12(%ebp), %edi
	movl	%edx, -124(%ebp)
	movl	%edi, -112(%ebp)
	.p2align 4,,7
L349:
	movl	-64(%ebp), %edx
	movl	$-49146, 16(%ebp)
	movl	%edx, 12(%ebp)
	movl	-124(%ebp), %edi
	movl	-112(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L379
L346:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L347
	pushl	%ecx
	pushl	%ecx
	leal	-48(%ebp), %ecx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L347:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L348
	leal	-48(%ebp), %esi
	pushl	%edx
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L341
L348:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L349
	xorl	%eax, %eax
	jmp	L380
	.p2align 4,,7
L379:
	cmpl	$1, -48(%ebp)
	jne	L346
	jmp	L339
	.p2align 4,,15
.globl _WidgetSendPEvent
_WidgetSendPEvent:
	pushl	%ebp
	movl	$9, %edx
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$156, %esp
	leal	-48(%ebp), %eax
	movl	%eax, %edi
	movl	12(%ebp), %esi
	movl	%edx, %ecx
	movl	8(%ebp), %ebx
	rep movsl
	movl	-48(%ebp), %edi
	movl	-44(%ebp), %esi
	movl	%eax, -144(%ebp)
	movl	%esi, -100(%ebp)
	movl	%edi, -96(%ebp)
	cmpl	$1, %edi
	je	L382
	cmpl	$-49146, %esi
	je	L383
	cmpl	$4, %edi
	je	L384
	leal	-84(%ebp), %edx
	movl	%edx, -148(%ebp)
	.p2align 4,,7
L391:
	movl	-100(%ebp), %edx
	movl	-96(%ebp), %eax
	movl	%edx, -44(%ebp)
	movl	%eax, -48(%ebp)
	movl	-148(%ebp), %edi
	movl	-144(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %ecx
	testl	%ecx, %ecx
	js	L427
L385:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L387
	leal	-84(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L387:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L389
	pushl	%esi
	pushl	%esi
	leal	-84(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L389:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L391
L390:
	xorl	%ebx, %ebx
L407:
	subl	$12, %esp
	movl	12(%ebp), %esi
	pushl	%esi
	call	_free
	leal	-12(%ebp), %esp
	movl	%ebx, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L427:
	cmpl	$1, -84(%ebp)
	jne	L385
L386:
	movl	-80(%ebp), %eax
	pushl	%esi
	pushl	%eax
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-80(%ebp), %edx
	addl	$16, %esp
	movl	%edx, 112(%ebx)
	.p2align 4,,7
L388:
	movl	$1, %ebx
	jmp	L407
	.p2align 4,,7
L382:
	leal	-84(%ebp), %esi
	movl	%esi, -164(%ebp)
	cmpl	$-49146, -100(%ebp)
	je	L428
	.p2align 4,,7
L410:
	movl	-100(%ebp), %edx
	movl	$1, -48(%ebp)
	movl	%edx, -44(%ebp)
	movl	-164(%ebp), %edi
	movl	-144(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L429
L402:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L403
	pushl	%ecx
	pushl	%ecx
	leal	-84(%ebp), %ecx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L403:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L404
	leal	-84(%ebp), %esi
	pushl	%edx
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L404:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L410
	jmp	L390
	.p2align 4,,7
L429:
	cmpl	$1, -84(%ebp)
	jne	L402
	jmp	L386
L384:
	movl	-100(%ebp), %eax
	leal	-84(%ebp), %edi
	movl	%eax, -44(%ebp)
	movl	$4, -48(%ebp)
	movl	%edi, -168(%ebp)
L425:
	movl	-144(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L430
L405:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L406
	leal	-84(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L406:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L390
	leal	-84(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L390
	jmp	L388
	.p2align 4,,7
L430:
	cmpl	$1, -84(%ebp)
	jne	L405
	jmp	L386
L428:
	movl	$-49146, -44(%ebp)
	movl	$1, -48(%ebp)
	movl	%esi, %edi
	movl	%esi, -160(%ebp)
	jmp	L425
L383:
	cmpl	$4, -96(%ebp)
	je	L392
	leal	-84(%ebp), %edi
	movl	%edi, -152(%ebp)
	.p2align 4,,7
L396:
	movl	-96(%ebp), %edx
	movl	$-49146, -44(%ebp)
	movl	%edx, -48(%ebp)
	movl	-152(%ebp), %edi
	movl	-144(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L431
L393:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L394
	leal	-84(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L394:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L395
	leal	-84(%ebp), %esi
	pushl	%edi
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L388
L395:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L396
	jmp	L390
	.p2align 4,,7
L431:
	cmpl	$1, -84(%ebp)
	jne	L393
	jmp	L386
L392:
	leal	-84(%ebp), %eax
	movl	$-49146, -44(%ebp)
	movl	$4, -48(%ebp)
	movl	%eax, -156(%ebp)
	movl	%eax, %edi
	jmp	L425
	.p2align 4,,15
.globl _WidgetSendSEvent
_WidgetSendSEvent:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$172, %esp
	movl	_Mouse, %eax
	movl	_KState, %ecx
	movl	(%eax), %edx
	movl	8(%eax), %edi
	movl	4(%eax), %ebx
	movl	12(%eax), %esi
	movl	%edx, -28(%ebp)
	movl	_KState+4, %eax
	movl	12(%ebp), %edx
	movl	%ecx, -36(%ebp)
	movl	%eax, -32(%ebp)
	movl	%ebx, -24(%ebp)
	leal	-84(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	%edx, -48(%ebp)
	movl	16(%ebp), %ebx
	movl	$9, %edx
	movl	%edi, -20(%ebp)
	movl	%esi, -16(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%eax, %edi
	movl	%ebx, -44(%ebp)
	leal	-48(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	%eax, -180(%ebp)
	movl	-84(%ebp), %ecx
	movl	-80(%ebp), %eax
	movl	%ecx, -128(%ebp)
	movl	%eax, -132(%ebp)
	cmpl	$1, %ecx
	je	L433
	cmpl	$-49146, %eax
	je	L434
	cmpl	$4, %ecx
	je	L435
	leal	-120(%ebp), %ebx
	.p2align 4,,7
L442:
	movl	-132(%ebp), %eax
	movl	-128(%ebp), %edx
	movl	%eax, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	8(%ebp), %edi
	movl	104(%edi), %esi
	testl	%esi, %esi
	js	L473
L436:
	movl	8(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L438
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L438:
	movl	8(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L440
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L440:
	movl	8(%ebp), %esi
	movl	96(%esi), %ecx
	movl	%ecx, 8(%ebp)
	testl	%ecx, %ecx
	jne	L442
L441:
	xorl	%eax, %eax
L478:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L473:
	cmpl	$1, -120(%ebp)
	jne	L436
L437:
	pushl	%eax
	movl	-116(%ebp), %esi
	pushl	%esi
	movl	8(%ebp), %ecx
	pushl	%ecx
	pushl	$LC2
	call	_DebugMessage
	movl	8(%ebp), %edx
	movl	-116(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%edx)
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L433:
	leal	-120(%ebp), %esi
	movl	$9, %ebx
	movl	%esi, -184(%ebp)
	cmpl	$-49146, -132(%ebp)
	je	L474
	.p2align 4,,7
L461:
	movl	-132(%ebp), %edx
	movl	$1, -84(%ebp)
	movl	%edx, -80(%ebp)
	movl	-184(%ebp), %edi
	movl	-180(%ebp), %esi
	movl	%ebx, %ecx
	rep movsl
	movl	8(%ebp), %eax
	movl	104(%eax), %edx
	testl	%edx, %edx
	js	L475
L453:
	movl	8(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L454
	pushl	%ecx
	pushl	%ecx
	leal	-120(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L454:
	movl	8(%ebp), %esi
	movl	116(%esi), %eax
	testl	%eax, %eax
	je	L455
	leal	-120(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L455:
	movl	8(%ebp), %esi
	movl	96(%esi), %eax
	movl	%eax, 8(%ebp)
	testl	%eax, %eax
	jne	L461
	jmp	L441
	.p2align 4,,7
L475:
	cmpl	$1, -120(%ebp)
	jne	L453
	jmp	L437
L435:
	movl	-132(%ebp), %ebx
	movl	%edx, %ecx
	movl	%ebx, -80(%ebp)
	leal	-120(%ebp), %ebx
	movl	$4, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	rep movsl
	movl	8(%ebp), %ecx
	movl	104(%ecx), %edx
	testl	%edx, %edx
	js	L476
L456:
	movl	8(%ebp), %ecx
	movl	120(%ecx), %eax
	testl	%eax, %eax
	je	L458
	pushl	%esi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L458:
	movl	8(%ebp), %esi
	movl	116(%esi), %eax
	testl	%eax, %eax
	je	L441
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L441
	.p2align 4,,7
L439:
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L476:
	cmpl	$1, -120(%ebp)
	jne	L456
	jmp	L437
L474:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	movl	%esi, %ebx
L471:
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	8(%ebp), %edi
	movl	104(%edi), %esi
	testl	%esi, %esi
	js	L477
L451:
	movl	8(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L452
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L452:
	movl	8(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L441
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
	xorl	%eax, %eax
	jmp	L478
L477:
	cmpl	$1, -120(%ebp)
	jne	L451
	jmp	L437
L434:
	cmpl	$4, -128(%ebp)
	je	L443
	leal	-120(%ebp), %ebx
	.p2align 4,,7
L447:
	movl	-128(%ebp), %eax
	movl	$-49146, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	8(%ebp), %edx
	movl	104(%edx), %edi
	testl	%edi, %edi
	js	L479
L444:
	movl	8(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L445
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L445:
	movl	8(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L446
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L439
L446:
	movl	8(%ebp), %ecx
	movl	96(%ecx), %edx
	movl	%edx, 8(%ebp)
	testl	%edx, %edx
	jne	L447
	xorl	%eax, %eax
	jmp	L478
	.p2align 4,,7
L479:
	cmpl	$1, -120(%ebp)
	jne	L444
	jmp	L437
L443:
	movl	$-49146, -80(%ebp)
	movl	$4, -84(%ebp)
	leal	-120(%ebp), %ebx
	jmp	L471
	.p2align 4,,15
.globl _WidgetSendEEvent
_WidgetSendEEvent:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	36(%ebp), %edx
	movl	32(%ebp), %ecx
	movl	40(%ebp), %eax
	movl	24(%ebp), %edi
	movl	28(%ebp), %esi
	movl	%edx, -24(%ebp)
	movl	12(%ebp), %edx
	movl	%edi, -36(%ebp)
	movl	%esi, -32(%ebp)
	movl	44(%ebp), %edi
	movl	%ecx, -28(%ebp)
	movl	%eax, -20(%ebp)
	movl	20(%ebp), %esi
	movl	16(%ebp), %ecx
	movl	%edx, -48(%ebp)
	leal	-84(%ebp), %eax
	movl	$9, %edx
	movl	%edi, -16(%ebp)
	movl	%esi, -40(%ebp)
	movl	%ecx, -44(%ebp)
	leal	-48(%ebp), %esi
	movl	%eax, %edi
	movl	%edx, %ecx
	movl	8(%ebp), %ebx
	rep movsl
	movl	-84(%ebp), %edi
	movl	-80(%ebp), %esi
	movl	%eax, -176(%ebp)
	movl	%esi, -132(%ebp)
	movl	%edi, -128(%ebp)
	cmpl	$1, %edi
	je	L481
	cmpl	$-49146, %esi
	je	L482
	cmpl	$4, %edi
	je	L483
	leal	-120(%ebp), %eax
	movl	%eax, -180(%ebp)
	.p2align 4,,7
L490:
	movl	-132(%ebp), %edx
	movl	-128(%ebp), %eax
	movl	%edx, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	-180(%ebp), %edi
	movl	-176(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edx
	testl	%edx, %edx
	js	L526
L484:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L486
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L486:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L488
	pushl	%esi
	pushl	%esi
	leal	-120(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L488:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L490
L489:
	xorl	%eax, %eax
L531:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L526:
	cmpl	$1, -120(%ebp)
	jne	L484
L485:
	pushl	%esi
	movl	-116(%ebp), %eax
	pushl	%eax
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-116(%ebp), %edx
	addl	$16, %esp
	movl	%edx, 112(%ebx)
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L481:
	leal	-120(%ebp), %esi
	movl	%esi, -196(%ebp)
	cmpl	$-49146, -132(%ebp)
	je	L527
	.p2align 4,,7
L509:
	movl	-132(%ebp), %edx
	movl	$1, -84(%ebp)
	movl	%edx, -80(%ebp)
	movl	-196(%ebp), %edi
	movl	-176(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L528
L501:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L502
	pushl	%ecx
	pushl	%ecx
	leal	-120(%ebp), %ecx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L502:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L503
	leal	-120(%ebp), %esi
	pushl	%edx
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L503:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L509
	jmp	L489
	.p2align 4,,7
L528:
	cmpl	$1, -120(%ebp)
	jne	L501
	jmp	L485
L483:
	movl	-132(%ebp), %eax
	leal	-120(%ebp), %edi
	movl	%eax, -80(%ebp)
	movl	$4, -84(%ebp)
	movl	%edi, -200(%ebp)
L524:
	movl	-176(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L529
L504:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L506
	leal	-120(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L506:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L489
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L489
	.p2align 4,,7
L487:
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L529:
	cmpl	$1, -120(%ebp)
	jne	L504
	jmp	L485
L527:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	movl	%esi, %edi
	movl	%esi, -192(%ebp)
	jmp	L524
L482:
	cmpl	$4, -128(%ebp)
	je	L491
	leal	-120(%ebp), %edi
	movl	%edi, -184(%ebp)
	.p2align 4,,7
L495:
	movl	-128(%ebp), %edx
	movl	$-49146, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	-184(%ebp), %edi
	movl	-176(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %eax
	testl	%eax, %eax
	js	L530
L492:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L493
	leal	-120(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L493:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L494
	leal	-120(%ebp), %esi
	pushl	%edi
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L487
L494:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L495
	xorl	%eax, %eax
	jmp	L531
	.p2align 4,,7
L530:
	cmpl	$1, -120(%ebp)
	jne	L492
	jmp	L485
L491:
	leal	-120(%ebp), %eax
	movl	$-49146, -80(%ebp)
	movl	$4, -84(%ebp)
	movl	%eax, -188(%ebp)
	movl	%eax, %edi
	jmp	L524
	.p2align 4,,15
.globl _CreateWidget
_CreateWidget:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$40, %esp
	movl	24(%ebp), %esi
	movl	20(%ebp), %ebx
	movl	%esi, -16(%ebp)
	movl	%ebx, -20(%ebp)
	pushl	$196
	movl	16(%ebp), %esi
	movl	12(%ebp), %ebx
	call	_malloc
	movl	%eax, -28(%ebp)
	movl	$49, %ecx
	xorl	%eax, %eax
	movl	-28(%ebp), %edi
	rep stosl
	movl	-28(%ebp), %edx
	addl	$16, %esp
	movl	_StdWidgetClass, %eax
	testl	%edx, %edx
	je	L534
	movl	-28(%ebp), %edx
	subl	$12, %esp
	movl	-16(%ebp), %ecx
	movl	-20(%ebp), %edi
	movl	%ecx, 16(%edx)
	movl	%ecx, 32(%edx)
	subl	%esi, %ecx
	movl	%eax, (%edx)
	movl	%edi, 12(%edx)
	movl	%edi, 28(%edx)
	movl	%ebx, 4(%edx)
	movl	%esi, 8(%edx)
	movl	%ebx, 20(%edx)
	movl	%esi, 24(%edx)
	movl	%edi, %eax
	pushl	%ecx
	movl	%edx, %ecx
	subl	%ebx, %eax
	addl	$52, %ecx
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%ecx
	call	_RectAssign
	movl	-28(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	8(%ebp), %ecx
	addl	$32, %esp
	movl	%edi, 76(%edx)
	movl	-16(%ebp), %edi
	movl	%ebx, 68(%edx)
	movl	%esi, 72(%edx)
	movl	%edi, 80(%edx)
	movl	%ebx, 36(%edx)
	movl	%esi, 40(%edx)
	movl	%eax, 44(%edx)
	movl	%edi, 48(%edx)
	movl	$1, 104(%edx)
	movl	%ecx, 108(%edx)
	movl	$_WidgetRefresh, 124(%edx)
	movl	$__WidgetRemove, 144(%edx)
	movl	$__WidgetInsert, 140(%edx)
	movl	$__WidgetSetFirstEx, 148(%edx)
L534:
	movl	-28(%ebp), %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 2
LC4:
	.ascii "Widget :: Could not init double buffer, disabling widgets\0"
LC5:
	.ascii "888888\0"
LC6:
	.ascii "/USER/COLOR/OSD\0"
LC7:
	.ascii "SYSTEM/CURSORS/drag.bmp\0"
LC8:
	.ascii "SYSTEM/CURSORS/nodrag.bmp\0"
LC9:
	.ascii "SYSTEM/CURSORS/dragcopy.bmp\0"
LC10:
	.ascii "_WidgetInsert\0"
LC11:
	.ascii "_WidgetRemove\0"
LC12:
	.ascii "_WidgetSetFirstEx\0"
LC13:
	.ascii "WidgetInsert\0"
LC14:
	.ascii "WidgetRemove\0"
LC15:
	.ascii "CreatePropType\0"
LC16:
	.ascii "DeskTop\0"
LC17:
	.ascii "Desktop\0"
LC18:
	.ascii "IntialiseWidget\0"
LC19:
	.ascii "CreateWidget\0"
LC20:
	.ascii "WidgetDrawOnRect\0"
LC21:
	.ascii "WidgetMove\0"
LC22:
	.ascii "WidgetSetOSDRect\0"
LC23:
	.ascii "WidgetUnOSD\0"
LC24:
	.ascii "MasterWidget\0"
LC25:
	.ascii "WidgetResize\0"
LC26:
	.ascii "WidgetResizeToSize\0"
LC27:
	.ascii "WidgetMoveToPoint\0"
LC28:
	.ascii "WidgetSetMetrics\0"
LC29:
	.ascii "WidgetSendEvent\0"
LC30:
	.ascii "WidgetDispose\0"
LC31:
	.ascii "WidgetDrawAll\0"
LC32:
	.ascii "WidgetExecute\0"
LC33:
	.ascii "WidgetSetFirst\0"
LC34:
	.ascii "WidgetSetFocusEx\0"
LC35:
	.ascii "WidgetSetFocus\0"
LC36:
	.ascii "FocusedWidget\0"
LC37:
	.ascii "WidgetPreCenter\0"
LC38:
	.ascii "WidgetPostCenter\0"
LC39:
	.ascii "WidgetUnMakeSync\0"
LC40:
	.ascii "WidgetMakeSync\0"
LC41:
	.ascii "WidgetSetChildArea\0"
LC42:
	.ascii "WidgetSendPEvent\0"
LC43:
	.ascii "DisposeStartupLogo\0"
LC44:
	.ascii "WidgetSetRect\0"
LC45:
	.ascii "WidgetSetFocusExNoNotify\0"
LC46:
	.ascii "WidgetDraw\0"
LC47:
	.ascii "WidgetSendSEvent\0"
LC48:
	.ascii "WidgetSendEEvent\0"
LC49:
	.ascii "SwitchGraphicsMode\0"
LC50:
	.ascii "SwitchTextMode\0"
LC51:
	.ascii "WidgetSetTooltipText\0"
LC52:
	.ascii "DragStart\0"
LC53:
	.ascii "WidgetGetIndex\0"
LC54:
	.ascii "StdWidgetClass\0"
LC55:
	.ascii "CreateWidgetClass\0"
LC56:
	.ascii "WidgetIsClassId\0"
LC57:
	.ascii "GetWidgetClass\0"
LC58:
	.ascii "WClassRegisterProp\0"
LC59:
	.ascii "GetPropType\0"
LC60:
	.ascii "NewiWidget\0"
LC61:
	.ascii "InsertiWidgetBefore\0"
LC62:
	.ascii "ComplieiWidget\0"
LC63:
	.ascii "FreeiWidget\0"
LC64:
	.ascii "DisposeAllAppWidgets\0"
LC65:
	.ascii "DuplicateBool\0"
LC66:
	.ascii "DuplicateInt\0"
LC67:
	.ascii "WidgetCheckVisible\0"
LC68:
	.ascii "WidgetClasses\0"
LC69:
	.ascii "WidgetGetName\0"
LC70:
	.ascii "CreateVSpliter\0"
LC71:
	.ascii "CreateHSpliter\0"
	.p2align 4,,15
.globl _LibMain
_LibMain:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$52, %esp
	movl	_GSScreenHeight, %edi
	pushl	%edi
	movl	_GSScreenWidth, %esi
	pushl	%esi
	call	_create_system_bitmap
	addl	$16, %esp
	movl	%eax, _buffer
	testl	%eax, %eax
	je	L549
	subl	$12, %esp
	pushl	%eax
	call	_clear_bitmap
	call	_WClassInstall
	call	_iWidgetInstall
	popl	%ecx
	popl	%ebx
	pushl	$LC5
	pushl	$LC6
	call	_KeyGetText
	movl	%eax, (%esp)
	call	_GetColorFromHex
	movl	_GSScreenHeight, %edi
	decl	%edi
	movl	%eax, _OSDColor
	movl	%edi, (%esp)
	leal	-28(%ebp), %edx
	movl	_GSScreenWidth, %ecx
	decl	%ecx
	pushl	%ecx
	pushl	$0
	pushl	$0
	pushl	%edx
	call	_RectAssign
	movl	-16(%ebp), %esi
	movl	-20(%ebp), %ebx
	addl	$20, %esp
	movl	%esi, -40(%ebp)
	movl	%ebx, -44(%ebp)
	movl	-24(%ebp), %esi
	movl	-28(%ebp), %ebx
	pushl	$196
	call	_malloc
	movl	%eax, -56(%ebp)
	movl	$49, %ecx
	xorl	%eax, %eax
	movl	-56(%ebp), %edi
	rep stosl
	movl	-56(%ebp), %edx
	addl	$16, %esp
	movl	_StdWidgetClass, %eax
	testl	%edx, %edx
	je	L540
	movl	-56(%ebp), %edx
	movl	-40(%ebp), %ecx
	subl	$12, %esp
	movl	-44(%ebp), %edi
	movl	%ecx, 16(%edx)
	movl	%ecx, 32(%edx)
	subl	%esi, %ecx
	movl	%eax, (%edx)
	movl	%ebx, 4(%edx)
	movl	%esi, 8(%edx)
	movl	%edi, 12(%edx)
	movl	%ebx, 20(%edx)
	movl	%esi, 24(%edx)
	movl	%edi, 28(%edx)
	movl	%edi, %eax
	pushl	%ecx
	movl	%edx, %ecx
	subl	%ebx, %eax
	addl	$52, %ecx
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%ecx
	call	_RectAssign
	movl	-56(%ebp), %edx
	movl	-40(%ebp), %ecx
	movl	-44(%ebp), %eax
	addl	$32, %esp
	movl	%ebx, 68(%edx)
	movl	%esi, 72(%edx)
	movl	%edi, 76(%edx)
	movl	%ecx, 80(%edx)
	movl	%ebx, 36(%edx)
	movl	%esi, 40(%edx)
	movl	%eax, 44(%edx)
	movl	%ecx, 48(%edx)
	movl	$1, 104(%edx)
	movl	$_Me, 108(%edx)
	movl	$_WidgetRefresh, 124(%edx)
	movl	$__WidgetRemove, 144(%edx)
	movl	$__WidgetInsert, 140(%edx)
	movl	$__WidgetSetFirstEx, 148(%edx)
L540:
	movl	_StartRect+12, %esi
	movl	_StartRect+8, %ebx
	subl	$12, %esp
	movl	-56(%ebp), %edx
	movl	%esi, -32(%ebp)
	movl	%ebx, -36(%ebp)
	movl	%edx, _DeskTop
	movl	_StartRect+4, %esi
	movl	_StartRect, %ebx
	pushl	$196
	call	_malloc
	movl	$49, %ecx
	movl	%eax, -56(%ebp)
	xorl	%eax, %eax
	movl	-56(%ebp), %edi
	addl	$16, %esp
	rep stosl
	movl	-56(%ebp), %edi
	movl	_StdWidgetClass, %eax
	testl	%edi, %edi
	je	L542
	movl	-56(%ebp), %edx
	movl	-32(%ebp), %ecx
	subl	$12, %esp
	movl	-36(%ebp), %edi
	movl	%ecx, 16(%edx)
	movl	%ecx, 32(%edx)
	subl	%esi, %ecx
	movl	%eax, (%edx)
	movl	%edi, 12(%edx)
	movl	%edi, 28(%edx)
	movl	%ebx, 4(%edx)
	movl	%esi, 8(%edx)
	movl	%ebx, 20(%edx)
	movl	%esi, 24(%edx)
	movl	%edi, %eax
	pushl	%ecx
	movl	%edx, %ecx
	subl	%ebx, %eax
	addl	$52, %ecx
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%ecx
	call	_RectAssign
	movl	-56(%ebp), %ecx
	movl	-36(%ebp), %eax
	addl	$32, %esp
	movl	%edi, 76(%ecx)
	movl	-32(%ebp), %edi
	movl	%ebx, 68(%ecx)
	movl	%esi, 72(%ecx)
	movl	%edi, 80(%ecx)
	movl	%ebx, 36(%ecx)
	movl	%esi, 40(%ecx)
	movl	%eax, 44(%ecx)
	movl	%edi, 48(%ecx)
	movl	$1, 104(%ecx)
	movl	$_Me, 108(%ecx)
	movl	$_WidgetRefresh, 124(%ecx)
	movl	$__WidgetRemove, 144(%ecx)
	movl	$__WidgetInsert, 140(%ecx)
	movl	$__WidgetSetFirstEx, 148(%ecx)
L542:
	movl	-56(%ebp), %esi
	movl	_DeskTop, %ebx
	movl	%esi, _StartMask
	movl	$_StartMaskDraw, 128(%esi)
	pushl	%ecx
	pushl	%ecx
	pushl	%esi
	pushl	%ebx
	call	*140(%ebx)
	movl	_DeskTop, %edx
	addl	$16, %esp
	movl	%edx, %eax
	.p2align 4,,7
L544:
	testb	$1, 104(%eax)
	je	L543
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L544
	subl	$12, %esp
	pushl	$0
	movl	_screen, %edi
	pushl	%edi
	pushl	$0
	pushl	$0
	pushl	%edx
	call	*124(%edx)
	addl	$32, %esp
	movl	_DeskTop, %edx
L543:
	movl	32(%edx), %esi
	movl	$0, _OSD
	pushl	%esi
	movl	28(%edx), %ebx
	pushl	%ebx
	movl	24(%edx), %ecx
	pushl	%ecx
	movl	20(%edx), %eax
	pushl	%eax
	call	_set_mouse_range
	movl	$_WidgetEventHandler, (%esp)
	call	_InstallEventHandler
	movl	_ATime, %edx
	movl	_ATime+4, %edi
	movl	%edx, _LastMouseMove
	movl	%edx, _LastNotified
	movl	%edi, _LastMouseMove+4
	movl	%edi, _LastNotified+4
	movl	$0, (%esp)
	pushl	$_WidgetTimer
	pushl	$0
	pushl	$50
	pushl	$_Me
	call	_NewTimer
	addl	$20, %esp
	movl	%eax, _WidgetTimerId
	pushl	$LC7
	call	_LoadImage
	addl	$12, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	call	_NewCursor
	movl	%eax, _DragCur
	movl	$LC8, (%esp)
	call	_LoadImage
	addl	$12, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	call	_NewCursor
	movl	%eax, _NoDragCur
	movl	$LC9, (%esp)
	call	_LoadImage
	addl	$12, %esp
	pushl	$0
	pushl	$0
	pushl	%eax
	call	_NewCursor
	movl	%eax, _DragCopyCur
	call	_InitSpliters
	addl	$12, %esp
	pushl	$_Me
	pushl	$__WidgetInsert
	pushl	$LC10
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$__WidgetRemove
	pushl	$LC11
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$__WidgetSetFirstEx
	pushl	$LC12
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetInsert
	pushl	$LC13
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetRemove
	pushl	$LC14
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_CreatePropType
	pushl	$LC15
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DeskTop
	pushl	$LC16
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DeskTop
	pushl	$LC17
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_IntialiseWidget
	pushl	$LC18
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_CreateWidget
	pushl	$LC19
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetDrawOnRect
	pushl	$LC20
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetMove
	pushl	$LC21
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetOSDRect
	pushl	$LC22
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetUnOSD
	pushl	$LC23
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_MasterWidget
	pushl	$LC24
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetResize
	pushl	$LC25
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetResizeToSize
	pushl	$LC26
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetMoveToPoint
	pushl	$LC27
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetMetrics
	pushl	$LC28
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSendEvent
	pushl	$LC29
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetDispose
	pushl	$LC30
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetDrawAll
	pushl	$LC31
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetExecute
	pushl	$LC32
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetFirst
	pushl	$LC33
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetFocusEx
	pushl	$LC34
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetFocus
	pushl	$LC35
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_FocusedWidget
	pushl	$LC36
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetPreCenter
	pushl	$LC37
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetPostCenter
	pushl	$LC38
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetUnMakeSync
	pushl	$LC39
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetMakeSync
	pushl	$LC40
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetChildArea
	pushl	$LC41
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSendPEvent
	pushl	$LC42
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DisposeStartupLogo
	pushl	$LC43
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetRect
	pushl	$LC44
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetFocusExNoNotify
	pushl	$LC45
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetDraw
	pushl	$LC46
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSendSEvent
	pushl	$LC47
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSendEEvent
	pushl	$LC48
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_SwitchGraphicsMode
	pushl	$LC49
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_SwitchTextMode
	pushl	$LC50
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetSetTooltipText
	pushl	$LC51
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DragStart
	pushl	$LC52
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetGetIndex
	pushl	$LC53
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_StdWidgetClass
	pushl	$LC54
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_CreateWidgetClass
	pushl	$LC55
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetIsClassId
	pushl	$LC56
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_GetWidgetClass
	pushl	$LC57
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WClassRegisterProp
	pushl	$LC58
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_GetPropType
	pushl	$LC59
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_NewiWidget
	pushl	$LC60
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_InsertiWidgetBefore
	pushl	$LC61
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_ComplieiWidget
	pushl	$LC62
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_FreeiWidget
	pushl	$LC63
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DisposeAllAppWidgets
	pushl	$LC64
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DuplicateBool
	pushl	$LC65
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_DuplicateInt
	pushl	$LC66
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetCheckVisible
	pushl	$LC67
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetClasses
	pushl	$LC68
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_WidgetGetName
	pushl	$LC69
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_CreateVSpliter
	pushl	$LC70
	call	_AddSymbol
	addl	$12, %esp
	pushl	$_Me
	pushl	$_CreateHSpliter
	pushl	$LC71
	call	_AddSymbol
	popl	%ebx
	popl	%esi
	pushl	$_DisposeAllAppWidgets
	pushl	$0
	call	_InstallAppExtender
	addl	$16, %esp
	movl	%eax, _WidgetExtender
	leal	-12(%ebp), %esp
	movl	$1, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L549:
	subl	$12, %esp
	pushl	$LC4
	call	_DebugError
	addl	$16, %esp
	leal	-12(%ebp), %esp
	xorl	%eax, %eax
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetDrawOnRectEx
_WidgetDrawOnRectEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	subl	$16, %esp
	movl	8(%ebp), %ebx
	movl	36(%ebx), %eax
	cmpl	20(%ebp), %eax
	jg	L556
	movl	40(%ebx), %edx
	cmpl	24(%ebp), %edx
	jg	L556
	movl	44(%ebx), %ecx
	cmpl	12(%ebp), %ecx
	jl	L556
	movl	48(%ebx), %esi
	cmpl	16(%ebp), %esi
	jl	L556
	testb	$1, 104(%ebx)
	jne	L560
	.p2align 4,,7
L556:
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.p2align 4,,7
L560:
	subl	$12, %esp
	movl	_screen, %edx
	leal	12(%ebp), %eax
	pushl	$0
	pushl	%edx
	pushl	$0
	pushl	%eax
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %esi
	addl	$32, %esp
	testl	%esi, %esi
	je	L556
	movl	%esi, %ebx
	.p2align 4,,7
L555:
	cmpl	28(%ebp), %ebx
	je	L552
	movl	12(%ebp), %ecx
	movl	20(%ebp), %eax
	movl	%ecx, -24(%ebp)
	movl	16(%ebp), %edx
	movl	24(%ebp), %ecx
	movl	%eax, -16(%ebp)
	movl	%edx, -20(%ebp)
	movl	%ecx, -12(%ebp)
	movl	%ebx, %eax
	.p2align 4,,7
L553:
	testb	$1, 104(%eax)
	je	L552
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L553
	movl	28(%ebp), %edx
	pushl	%eax
	pushl	%eax
	movl	-12(%ebp), %eax
	pushl	%edx
	movl	-16(%ebp), %ecx
	pushl	%eax
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	%ebx
	call	_WidgetDrawOnRectEx
	addl	$32, %esp
L552:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L555
	jmp	L556
	.p2align 4,,15
.globl __WidgetSetFirstEx
__WidgetSetFirstEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%esi
	pushl	%ebx
	movl	12(%ebp), %ebx
	movl	8(%ebp), %esi
	movl	88(%ebx), %edx
	cmpl	%edx, %ebx
	je	L568
	movl	84(%ebx), %eax
	cmpl	92(%esi), %ebx
	movl	%eax, 84(%edx)
	movl	84(%ebx), %eax
	movl	%edx, 88(%eax)
	je	L569
L563:
	movl	92(%esi), %ecx
	movl	$0, 96(%ebx)
	movl	88(%ecx), %edx
	testl	%edx, %edx
	je	L564
	movl	84(%edx), %eax
	movl	%edx, 88(%ebx)
	movl	%eax, 84(%ebx)
	movl	84(%edx), %ecx
	movl	%ebx, 84(%edx)
	movl	%ebx, 88(%ecx)
L565:
	subl	$12, %esp
	movl	%esi, 96(%ebx)
	pushl	%ebx
	call	_WidgetRefreshAbsolutePos
	movl	136(%ebx), %eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L567
	subl	$12, %esp
	pushl	%ebx
	call	*%eax
	movl	$0, 136(%ebx)
	addl	$16, %esp
L567:
	leal	-8(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%ebp
	ret
	.p2align 4,,7
L569:
	movl	%eax, 92(%esi)
	jmp	L563
	.p2align 4,,7
L568:
	movl	$0, 92(%esi)
	jmp	L563
	.p2align 4,,7
L564:
	movl	$0, 88(%ebx)
	movl	%ecx, 84(%ebx)
	movl	88(%ecx), %edx
	movl	%ebx, 92(%esi)
	movl	%ebx, 88(%ecx)
	movl	%ebx, 84(%edx)
	jmp	L565
	.p2align 4,,15
.globl _WidgetDrawAllEx
_WidgetDrawAllEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %ebx
	testb	$1, 104(%ebx)
	jne	L616
L596:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L616:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %eax
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %ebx
	addl	$32, %esp
	movl	%ebx, -24(%ebp)
	testl	%ebx, %ebx
	je	L596
	movl	%ebx, %edi
	.p2align 4,,7
L591:
	movl	%edi, %eax
	.p2align 4,,7
L573:
	testb	$1, 104(%eax)
	je	L572
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L573
	testb	$1, 104(%edi)
	jne	L617
L572:
	movl	88(%edi), %edi
	cmpl	%edi, -24(%ebp)
	jne	L591
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L617:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %edx
	pushl	%edx
	pushl	$0
	pushl	$0
	pushl	%edi
	call	*124(%edi)
	movl	92(%edi), %eax
	addl	$32, %esp
	movl	%eax, -40(%ebp)
	testl	%eax, %eax
	je	L572
	movl	%eax, -20(%ebp)
	.p2align 4,,7
L576:
	testb	$1, 104(%eax)
	je	L575
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L576
	movl	-20(%ebp), %ebx
	testb	$1, 104(%ebx)
	jne	L618
L575:
	movl	-20(%ebp), %ecx
	movl	88(%ecx), %eax
	movl	%eax, -20(%ebp)
	cmpl	%eax, -40(%ebp)
	jne	L576
	jmp	L572
	.p2align 4,,7
L618:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %eax
	pushl	%eax
	pushl	$0
	pushl	$0
	movl	-20(%ebp), %esi
	pushl	%esi
	movl	-20(%ebp), %ebx
	call	*124(%ebx)
	movl	-20(%ebp), %ecx
	movl	92(%ecx), %eax
	addl	$32, %esp
	movl	%eax, -36(%ebp)
	testl	%eax, %eax
	je	L575
	movl	%eax, -16(%ebp)
	.p2align 4,,7
L579:
	testb	$1, 104(%eax)
	je	L578
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L579
	movl	-16(%ebp), %esi
	testb	$1, 104(%esi)
	jne	L619
L578:
	movl	-16(%ebp), %edx
	movl	88(%edx), %eax
	movl	%eax, -16(%ebp)
	cmpl	%eax, -36(%ebp)
	jne	L579
	jmp	L575
	.p2align 4,,7
L619:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %esi
	pushl	%esi
	pushl	$0
	pushl	$0
	movl	-16(%ebp), %ebx
	pushl	%ebx
	movl	-16(%ebp), %ecx
	call	*124(%ecx)
	movl	-16(%ebp), %edx
	movl	92(%edx), %eax
	addl	$32, %esp
	movl	%eax, -32(%ebp)
	testl	%eax, %eax
	je	L578
	movl	%eax, %esi
	.p2align 4,,7
L588:
	movl	%esi, %eax
	.p2align 4,,7
L582:
	testb	$1, 104(%eax)
	je	L581
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L582
	testb	$1, 104(%esi)
	jne	L620
L581:
	movl	88(%esi), %esi
	cmpl	%esi, -32(%ebp)
	jne	L588
	jmp	L578
	.p2align 4,,7
L620:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %eax
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%esi
	call	*124(%esi)
	movl	92(%esi), %eax
	addl	$32, %esp
	movl	%eax, -28(%ebp)
	testl	%eax, %eax
	je	L581
	movl	%eax, %ebx
	.p2align 4,,7
L587:
	movl	%ebx, %eax
	.p2align 4,,7
L585:
	testb	$1, 104(%eax)
	je	L584
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L585
	subl	$12, %esp
	pushl	%ebx
	call	_WidgetDrawAllEx
	addl	$16, %esp
L584:
	movl	88(%ebx), %ebx
	cmpl	%ebx, -28(%ebp)
	jne	L587
	jmp	L581
	.p2align 4,,15
.globl _WidgetDrawAll
_WidgetDrawAll:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %edx
	movl	%edx, %eax
	.p2align 4,,7
L623:
	testb	$1, 104(%eax)
	je	L625
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L623
	movl	%edx, 8(%ebp)
	popl	%ebp
	jmp	_WidgetDrawAllEx
	.p2align 4,,7
L625:
	popl	%ebp
	ret
	.p2align 4,,15
.globl _SwitchGraphicsMode
_SwitchGraphicsMode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	call	___ScreenRestartGraphics
	call	___KeyboardRestart
	call	___MouseRestart
	pushl	%edx
	pushl	%edx
	movl	_GSScreenHeight, %edx
	pushl	%edx
	movl	_GSScreenWidth, %eax
	pushl	%eax
	call	_create_system_bitmap
	movl	_DeskTop, %edx
	movl	%eax, _buffer
	addl	$16, %esp
	movl	%edx, %eax
	.p2align 4,,7
L629:
	testb	$1, 104(%eax)
	je	L628
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L629
	subl	$12, %esp
	pushl	%edx
	call	_WidgetDrawAllEx
	addl	$16, %esp
L628:
	leave
	jmp	_MouseShow
	.p2align 4,,15
.globl _WidgetSetRect
_WidgetSetRect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	8(%ebp), %edi
	movl	12(%ebp), %ebx
	movl	24(%ebp), %esi
	movl	16(%ebp), %ecx
	movl	52(%edi), %eax
	movl	%eax, -28(%ebp)
	movl	56(%edi), %edx
	movl	%edx, -24(%ebp)
	movl	60(%edi), %eax
	movl	%eax, -20(%ebp)
	movl	64(%edi), %edx
	movl	%edx, -16(%ebp)
	addl	4(%edi), %eax
	movl	%ebx, 4(%edi)
	addl	20(%ebp), %eax
	subl	12(%edi), %eax
	subl	%ebx, %eax
	movl	%eax, 60(%edi)
	movl	8(%edi), %eax
	addl	%eax, %edx
	movl	16(%edi), %eax
	addl	%esi, %edx
	movl	%ecx, 8(%edi)
	subl	%eax, %edx
	movl	20(%ebp), %eax
	subl	%ecx, %edx
	movl	%eax, 12(%edi)
	movl	96(%edi), %eax
	movl	%edx, 64(%edi)
	movl	%esi, 16(%edi)
	testl	%eax, %eax
	je	L635
	pushl	%ecx
	movl	24(%eax), %esi
	pushl	%esi
	movl	20(%eax), %edx
	pushl	%edx
	movl	64(%eax), %ecx
	pushl	%ecx
	leal	-44(%ebp), %ecx
	movl	60(%eax), %ebx
	pushl	%ebx
	movl	56(%eax), %esi
	pushl	%esi
	movl	52(%eax), %edx
	pushl	%edx
	pushl	%ecx
	call	_RectMove
	addl	$28, %esp
	movl	-40(%ebp), %ebx
	movl	-44(%ebp), %esi
	pushl	%ebx
	pushl	%esi
	movl	16(%edi), %eax
	leal	20(%edi), %esi
	pushl	%eax
	movl	12(%edi), %edx
	pushl	%edx
	movl	8(%edi), %ecx
	pushl	%ecx
	movl	4(%edi), %ebx
	pushl	%ebx
	pushl	%esi
	call	_RectMove
	movl	96(%edi), %eax
	movl	20(%edi), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L636
	movl	24(%edi), %ecx
	cmpl	80(%eax), %ecx
	jle	L640
L636:
	subl	$12, %esp
	leal	36(%edi), %ebx
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%ebx
	call	_RectAssign
	addl	$32, %esp
L635:
	pushl	%eax
	movl	24(%edi), %edx
	pushl	%edx
	movl	20(%edi), %ecx
	pushl	%ecx
	leal	-44(%ebp), %ecx
	movl	64(%edi), %ebx
	pushl	%ebx
	movl	60(%edi), %eax
	pushl	%eax
	movl	56(%edi), %esi
	pushl	%esi
	movl	52(%edi), %edx
	pushl	%edx
	pushl	%ecx
	call	_RectMove
	addl	$20, %esp
	movl	48(%edi), %ebx
	movl	-32(%ebp), %ecx
	pushl	%ebx
	movl	-36(%ebp), %ebx
	movl	44(%edi), %eax
	pushl	%eax
	movl	-40(%ebp), %eax
	movl	40(%edi), %esi
	pushl	%esi
	movl	-44(%ebp), %esi
	movl	36(%edi), %edx
	pushl	%edx
	leal	68(%edi), %edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	%esi
	pushl	%edx
	call	_RectIntersept
	movl	92(%edi), %ecx
	addl	$48, %esp
	testl	%ecx, %ecx
	je	L638
	subl	$12, %esp
	movl	64(%edi), %ebx
	movl	-16(%ebp), %ecx
	pushl	%ebx
	movl	-20(%ebp), %ebx
	movl	60(%edi), %eax
	pushl	%eax
	movl	-24(%ebp), %eax
	movl	56(%edi), %esi
	pushl	%esi
	movl	-28(%ebp), %esi
	movl	52(%edi), %edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	pushl	%eax
	pushl	%esi
	pushl	%edi
	call	__WidgetAutosize
	addl	$48, %esp
L638:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L640:
	movl	28(%edi), %ebx
	cmpl	68(%eax), %ebx
	jl	L636
	movl	32(%edi), %esi
	cmpl	72(%eax), %esi
	jl	L636
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%edi), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_RectIntersept
	addl	$48, %esp
	jmp	L635
	.p2align 4,,15
.globl _WidgetSelect
_WidgetSelect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$268, %esp
	leal	-84(%ebp), %eax
	movl	%eax, -240(%ebp)
	movl	8(%ebp), %edx
	.p2align 4,,7
L697:
	movl	104(%edx), %eax
	testb	$64, %al
	je	L642
	testb	%al, %al
	jns	L729
	.p2align 4,,7
L642:
	movl	8(%ebp), %ebx
	movl	96(%ebx), %eax
	testl	%eax, %eax
	je	L698
L736:
	movl	92(%eax), %edi
	movl	%edi, -128(%ebp)
	testl	%edi, %edi
	je	L669
	leal	-48(%ebp), %ecx
	movl	%edi, -148(%ebp)
	movl	%ecx, -244(%ebp)
	jmp	L696
	.p2align 4,,7
L670:
	movl	-148(%ebp), %ecx
	movl	88(%ecx), %ebx
	movl	%ebx, -148(%ebp)
	cmpl	%ebx, -128(%ebp)
	je	L730
L696:
	movl	8(%ebp), %esi
	cmpl	%esi, -148(%ebp)
	je	L670
	movl	-148(%ebp), %ecx
	movl	104(%ecx), %edx
	movl	%edx, %edi
	andl	$192, %edi
	cmpl	$192, %edi
	jne	L670
	movl	_Mouse, %eax
	andb	$127, %dl
	movl	%edx, 104(%ecx)
	movl	%edx, -248(%ebp)
	movl	(%eax), %edx
	movl	4(%eax), %ecx
	movl	8(%eax), %ebx
	movl	12(%eax), %esi
	movl	_KState, %edi
	movl	_KState+4, %eax
	movl	%edx, -28(%ebp)
	movl	$9, %edx
	movl	%edi, -36(%ebp)
	movl	%eax, -32(%ebp)
	movl	%ecx, -24(%ebp)
	movl	%esi, -16(%ebp)
	movl	%ebx, -20(%ebp)
	movl	$0, -40(%ebp)
	movl	$-49147, -44(%ebp)
	movl	$1, -48(%ebp)
	movl	-240(%ebp), %edi
	movl	-244(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	-84(%ebp), %ecx
	movl	-80(%ebp), %eax
	movl	%eax, -136(%ebp)
	movl	%ecx, -132(%ebp)
	cmpl	$1, %ecx
	je	L671
	cmpl	$-49146, %eax
	je	L672
	cmpl	$4, %ecx
	je	L673
	leal	-120(%ebp), %esi
	movl	-148(%ebp), %ebx
	movl	%esi, -264(%ebp)
	.p2align 4,,7
L678:
	movl	-136(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	%eax, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	-264(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %ecx
	testl	%ecx, %ecx
	js	L731
L674:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L676
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L676:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L677
	pushl	%esi
	pushl	%esi
	leal	-120(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L677:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L678
	jmp	L670
	.p2align 4,,7
L731:
	cmpl	$1, -120(%ebp)
	jne	L674
L675:
	movl	-116(%ebp), %edx
	pushl	%edi
	pushl	%edx
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-116(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%ebx)
	jmp	L670
	.p2align 4,,7
L730:
	movl	8(%ebp), %esi
	movl	96(%esi), %eax
L669:
	movl	%eax, 8(%ebp)
	movl	%eax, %edx
	jmp	L697
	.p2align 4,,7
L671:
	cmpl	$-49146, -136(%ebp)
	je	L732
	leal	-120(%ebp), %esi
	movl	-148(%ebp), %ebx
	movl	%esi, -272(%ebp)
	.p2align 4,,7
L693:
	movl	-136(%ebp), %eax
	movl	$1, -84(%ebp)
	movl	%eax, -80(%ebp)
	movl	-272(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L733
L690:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L691
	leal	-120(%ebp), %edx
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L691:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L692
	leal	-120(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L692:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L693
	jmp	L670
	.p2align 4,,7
L733:
	cmpl	$1, -120(%ebp)
	jne	L690
	jmp	L675
L673:
	movl	-136(%ebp), %ebx
	movl	%ebx, -80(%ebp)
L726:
	movl	$4, -84(%ebp)
L728:
	leal	-120(%ebp), %ebx
	movl	-240(%ebp), %esi
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep movsl
	movl	-248(%ebp), %esi
	testl	%esi, %esi
	js	L734
L694:
	movl	-148(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L695
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L695:
	movl	-148(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L670
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	jmp	L670
	.p2align 4,,7
L729:
	orb	$-128, %al
	movl	_KState, %edi
	movl	%eax, 104(%edx)
	movl	%eax, -248(%ebp)
	movl	_Mouse, %eax
	movl	$0, -112(%ebp)
	movl	(%eax), %edx
	movl	4(%eax), %ecx
	movl	8(%eax), %ebx
	movl	12(%eax), %esi
	movl	%edx, -100(%ebp)
	movl	_KState+4, %eax
	movl	$9, %edx
	movl	%edi, -108(%ebp)
	movl	%eax, -104(%ebp)
	movl	%ecx, -96(%ebp)
	movl	%esi, -88(%ebp)
	movl	%ebx, -92(%ebp)
	movl	$-49148, -116(%ebp)
	movl	$1, -120(%ebp)
	leal	-120(%ebp), %esi
	movl	-240(%ebp), %edi
	movl	%edx, %ecx
	rep movsl
	movl	-84(%ebp), %ecx
	movl	-80(%ebp), %eax
	movl	%eax, -144(%ebp)
	movl	%ecx, -140(%ebp)
	cmpl	$1, %ecx
	je	L643
	cmpl	$-49146, %eax
	je	L644
	cmpl	$4, %ecx
	je	L645
	leal	-48(%ebp), %esi
	movl	8(%ebp), %ebx
	movl	%esi, -252(%ebp)
	.p2align 4,,7
L650:
	movl	-144(%ebp), %eax
	movl	-140(%ebp), %edx
	movl	%eax, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	-252(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %ecx
	testl	%ecx, %ecx
	js	L735
L646:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L648
	leal	-48(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L648:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L649
	pushl	%esi
	pushl	%esi
	leal	-48(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L649:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L650
	jmp	L642
	.p2align 4,,7
L735:
	cmpl	$1, -48(%ebp)
	jne	L646
L647:
	movl	-44(%ebp), %edx
	pushl	%edi
	pushl	%edx
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-44(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%ebx)
	movl	8(%ebp), %ebx
	movl	96(%ebx), %eax
	testl	%eax, %eax
	jne	L736
	.p2align 4,,7
L698:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L734:
	cmpl	$1, -120(%ebp)
	jne	L694
	movl	-148(%ebp), %ebx
	jmp	L675
L732:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	jmp	L728
L643:
	cmpl	$-49146, -144(%ebp)
	je	L737
	leal	-48(%ebp), %esi
	movl	8(%ebp), %ebx
	movl	%esi, -260(%ebp)
	.p2align 4,,7
L665:
	movl	-144(%ebp), %eax
	movl	$1, -84(%ebp)
	movl	%eax, -80(%ebp)
	movl	-260(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L738
L662:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L663
	leal	-48(%ebp), %edx
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L663:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L664
	leal	-48(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L664:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L665
	jmp	L642
	.p2align 4,,7
L738:
	cmpl	$1, -48(%ebp)
	jne	L662
	jmp	L647
L645:
	movl	-144(%ebp), %ebx
	movl	$4, -84(%ebp)
	movl	%ebx, -80(%ebp)
L723:
	leal	-48(%ebp), %ebx
	movl	-240(%ebp), %esi
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep movsl
	movl	-248(%ebp), %esi
	testl	%esi, %esi
	js	L739
L666:
	movl	8(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L667
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L667:
	movl	8(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L642
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	jmp	L642
L737:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	jmp	L723
L739:
	cmpl	$1, -48(%ebp)
	jne	L666
	movl	8(%ebp), %ebx
	jmp	L647
L672:
	cmpl	$4, -132(%ebp)
	je	L679
	leal	-120(%ebp), %edi
	movl	-148(%ebp), %ebx
	movl	%edi, -268(%ebp)
	.p2align 4,,7
L683:
	movl	-132(%ebp), %eax
	movl	$-49146, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	-268(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edx
	testl	%edx, %edx
	js	L740
L680:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L681
	pushl	%edx
	pushl	%edx
	leal	-120(%ebp), %edx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L681:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L682
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L670
L682:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L683
	jmp	L670
	.p2align 4,,7
L740:
	cmpl	$1, -120(%ebp)
	jne	L680
	jmp	L675
L679:
	movl	$-49146, -80(%ebp)
	jmp	L726
L644:
	cmpl	$4, -140(%ebp)
	je	L651
	leal	-48(%ebp), %edi
	movl	8(%ebp), %ebx
	movl	%edi, -256(%ebp)
L655:
	movl	-140(%ebp), %eax
	movl	$-49146, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	-256(%ebp), %edi
	movl	-240(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edx
	testl	%edx, %edx
	js	L741
L652:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L653
	pushl	%edx
	pushl	%edx
	leal	-48(%ebp), %edx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L653:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L654
	leal	-48(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L642
L654:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L655
	jmp	L642
	.p2align 4,,7
L741:
	cmpl	$1, -48(%ebp)
	jne	L652
	jmp	L647
L651:
	movl	$-49146, -80(%ebp)
	movl	$4, -84(%ebp)
	jmp	L723
	.p2align 4,,15
.globl _WidgetUnSelectAllSubs
_WidgetUnSelectAllSubs:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$204, %esp
	movl	8(%ebp), %eax
	movl	92(%eax), %eax
	movl	%eax, -128(%ebp)
	testl	%eax, %eax
	je	L771
	leal	-84(%ebp), %ecx
	leal	-48(%ebp), %edx
	movl	%eax, -140(%ebp)
	movl	%ecx, -188(%ebp)
	movl	%edx, -192(%ebp)
	jmp	L770
	.p2align 4,,7
L744:
	movl	-140(%ebp), %ecx
	movl	88(%ecx), %ebx
	movl	%ebx, -140(%ebp)
	cmpl	%ebx, -128(%ebp)
	je	L771
L770:
	movl	-140(%ebp), %ecx
	movl	104(%ecx), %edx
	movl	%edx, %ebx
	andl	$192, %ebx
	cmpl	$192, %ebx
	jne	L744
	movl	_Mouse, %eax
	andb	$127, %dl
	movl	%edx, 104(%ecx)
	movl	%edx, -196(%ebp)
	movl	(%eax), %edx
	movl	4(%eax), %ecx
	movl	8(%eax), %ebx
	movl	12(%eax), %esi
	movl	_KState, %edi
	movl	_KState+4, %eax
	movl	%edx, -28(%ebp)
	movl	$9, %edx
	movl	%edi, -36(%ebp)
	movl	%eax, -32(%ebp)
	movl	%ecx, -24(%ebp)
	movl	%esi, -16(%ebp)
	movl	%ebx, -20(%ebp)
	movl	$0, -40(%ebp)
	movl	$-49147, -44(%ebp)
	movl	$1, -48(%ebp)
	movl	-188(%ebp), %edi
	movl	-192(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	-84(%ebp), %ecx
	movl	-80(%ebp), %eax
	movl	%eax, -136(%ebp)
	movl	%ecx, -132(%ebp)
	cmpl	$1, %ecx
	je	L745
	cmpl	$-49146, %eax
	je	L746
	cmpl	$4, %ecx
	je	L747
	leal	-120(%ebp), %esi
	movl	-140(%ebp), %ebx
	movl	%esi, -200(%ebp)
	.p2align 4,,7
L752:
	movl	-136(%ebp), %eax
	movl	-132(%ebp), %edx
	movl	%eax, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	-200(%ebp), %edi
	movl	-188(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %ecx
	testl	%ecx, %ecx
	js	L788
L748:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L750
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L750:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L751
	pushl	%esi
	pushl	%esi
	leal	-120(%ebp), %esi
	pushl	%esi
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L751:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L752
	jmp	L744
	.p2align 4,,7
L788:
	cmpl	$1, -120(%ebp)
	jne	L748
L749:
	movl	-116(%ebp), %edx
	pushl	%edi
	pushl	%edx
	pushl	%ebx
	pushl	$LC2
	call	_DebugMessage
	movl	-116(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%ebx)
	jmp	L744
	.p2align 4,,7
L771:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L745:
	cmpl	$-49146, -136(%ebp)
	je	L789
	leal	-120(%ebp), %esi
	movl	-140(%ebp), %ebx
	movl	%esi, -208(%ebp)
	.p2align 4,,7
L767:
	movl	-136(%ebp), %eax
	movl	$1, -84(%ebp)
	movl	%eax, -80(%ebp)
	movl	-208(%ebp), %edi
	movl	-188(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edi
	testl	%edi, %edi
	js	L790
L764:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L765
	leal	-120(%ebp), %edx
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L765:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L766
	leal	-120(%ebp), %ecx
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L766:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L767
	jmp	L744
	.p2align 4,,7
L790:
	cmpl	$1, -120(%ebp)
	jne	L764
	jmp	L749
L747:
	movl	-136(%ebp), %ebx
	movl	%ebx, -80(%ebp)
L785:
	movl	$4, -84(%ebp)
L787:
	leal	-120(%ebp), %ebx
	movl	-188(%ebp), %esi
	movl	%ebx, %edi
	movl	%edx, %ecx
	rep movsl
	movl	-196(%ebp), %esi
	testl	%esi, %esi
	js	L791
L768:
	movl	-140(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L769
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L769:
	movl	-140(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L744
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	jmp	L744
	.p2align 4,,7
L791:
	cmpl	$1, -120(%ebp)
	jne	L768
	movl	-140(%ebp), %ebx
	jmp	L749
L789:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	jmp	L787
L746:
	cmpl	$4, -132(%ebp)
	je	L753
	leal	-120(%ebp), %edi
	movl	-140(%ebp), %ebx
	movl	%edi, -204(%ebp)
	.p2align 4,,7
L757:
	movl	-132(%ebp), %eax
	movl	$-49146, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	-204(%ebp), %edi
	movl	-188(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	104(%ebx), %edx
	testl	%edx, %edx
	js	L792
L754:
	movl	120(%ebx), %eax
	testl	%eax, %eax
	je	L755
	pushl	%edx
	pushl	%edx
	leal	-120(%ebp), %edx
	pushl	%edx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L755:
	movl	116(%ebx), %eax
	testl	%eax, %eax
	je	L756
	leal	-120(%ebp), %ecx
	pushl	%edi
	pushl	%edi
	pushl	%ecx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L744
L756:
	movl	96(%ebx), %ebx
	testl	%ebx, %ebx
	jne	L757
	jmp	L744
	.p2align 4,,7
L792:
	cmpl	$1, -120(%ebp)
	jne	L754
	jmp	L749
L753:
	movl	$-49146, -80(%ebp)
	jmp	L785
	.p2align 4,,15
.globl _WidgetDrawOnRect
_WidgetDrawOnRect:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	8(%ebp), %ebx
	movl	24(%ebp), %edx
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edi
	movl	12(%ebp), %esi
	movl	%ebx, %eax
	.p2align 4,,7
L795:
	testb	$1, 104(%eax)
	je	L802
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L795
	cmpl	%ecx, 36(%ebx)
	jg	L802
	cmpl	%edx, 40(%ebx)
	jg	L802
	cmpl	%esi, 44(%ebx)
	jl	L802
	cmpl	%edi, 48(%ebx)
	jl	L802
	testb	$1, 104(%ebx)
	je	L802
	subl	$12, %esp
	movl	%esi, -28(%ebp)
	movl	%ecx, -20(%ebp)
	leal	-28(%ebp), %eax
	movl	_screen, %ecx
	movl	%edi, -24(%ebp)
	movl	%edx, -16(%ebp)
	pushl	$0
	pushl	%ecx
	pushl	$0
	pushl	%eax
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %esi
	addl	$32, %esp
	testl	%esi, %esi
	je	L802
	movl	%esi, %ebx
	.p2align 4,,7
L800:
	cmpl	%ebx, 28(%ebp)
	je	L797
	movl	-24(%ebp), %eax
	movl	-28(%ebp), %ecx
	movl	-20(%ebp), %edi
	movl	-16(%ebp), %edx
	movl	%eax, -40(%ebp)
	movl	%ecx, -44(%ebp)
	movl	%edi, -36(%ebp)
	movl	%edx, -32(%ebp)
	movl	%ebx, %eax
	.p2align 4,,7
L798:
	testb	$1, 104(%eax)
	je	L797
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L798
	pushl	%edx
	pushl	%edx
	movl	28(%ebp), %edx
	movl	-32(%ebp), %ecx
	pushl	%edx
	movl	-36(%ebp), %eax
	movl	-40(%ebp), %edi
	movl	-44(%ebp), %edx
	pushl	%ecx
	pushl	%eax
	pushl	%edi
	pushl	%edx
	pushl	%ebx
	call	_WidgetDrawOnRectEx
	addl	$32, %esp
L797:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %esi
	jne	L800
	.p2align 4,,7
L802:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,15
.globl _WidgetSetFocusEx
_WidgetSetFocusEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$188, %esp
	movl	8(%ebp), %eax
	movl	152(%eax), %edx
	testl	%edx, %edx
	je	L809
	movl	%edx, %eax
L809:
	movl	104(%eax), %edx
	testb	$16, %dl
	je	L835
	movl	_FocusedWidget, %ecx
	movl	%ecx, -184(%ebp)
	testl	%ecx, %ecx
	je	L811
	movl	104(%ecx), %ebx
	movl	_Mouse, %edi
	andl	$-9, %ebx
	movl	%eax, _FocusedWidget
	movl	%ebx, 104(%ecx)
	movl	(%edi), %edx
	movl	104(%eax), %esi
	movl	4(%edi), %ecx
	orl	$8, %esi
	movl	8(%edi), %ebx
	movl	%esi, 104(%eax)
	movl	_KState, %eax
	movl	%eax, -36(%ebp)
	leal	-84(%ebp), %eax
	movl	12(%edi), %esi
	movl	%edx, -28(%ebp)
	movl	_KState+4, %edi
	movl	%eax, -180(%ebp)
	movl	$9, %edx
	movl	%edi, -32(%ebp)
	movl	%ecx, -24(%ebp)
	movl	%esi, -16(%ebp)
	movl	%ebx, -20(%ebp)
	movl	$0, -40(%ebp)
	movl	$-49151, -44(%ebp)
	movl	$1, -48(%ebp)
	leal	-48(%ebp), %esi
	movl	-180(%ebp), %edi
	movl	%edx, %ecx
	rep movsl
	movl	-84(%ebp), %ecx
	movl	-80(%ebp), %eax
	movl	%eax, -132(%ebp)
	movl	%ecx, -128(%ebp)
	cmpl	$1, %ecx
	je	L812
	cmpl	$-49146, %eax
	je	L813
	cmpl	$4, %ecx
	je	L814
	leal	-120(%ebp), %ebx
	.p2align 4,,7
L819:
	movl	-132(%ebp), %edx
	movl	-128(%ebp), %eax
	movl	%edx, -80(%ebp)
	movl	%eax, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	$9, %ecx
	movl	-184(%ebp), %edx
	rep movsl
	movl	104(%edx), %ecx
	testl	%ecx, %ecx
	js	L847
L815:
	movl	-184(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L817
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L817:
	movl	-184(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L818
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L818:
	movl	-184(%ebp), %esi
	movl	96(%esi), %ecx
	movl	%ecx, -184(%ebp)
	testl	%ecx, %ecx
	jne	L819
	.p2align 4,,7
L835:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L847:
	cmpl	$1, -120(%ebp)
	jne	L815
L816:
	pushl	%esi
	movl	-116(%ebp), %esi
	pushl	%esi
	movl	-184(%ebp), %ecx
	pushl	%ecx
	pushl	$LC2
	call	_DebugMessage
	movl	-184(%ebp), %edx
	movl	-116(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%edx)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L811:
	orl	$8, %edx
	movl	%eax, _FocusedWidget
	movl	%edx, 104(%eax)
	jmp	L835
	.p2align 4,,7
L812:
	leal	-120(%ebp), %esi
	movl	$9, %ebx
	movl	%esi, -188(%ebp)
	cmpl	$-49146, -132(%ebp)
	je	L848
	.p2align 4,,7
L837:
	movl	-132(%ebp), %edx
	movl	$1, -84(%ebp)
	movl	%edx, -80(%ebp)
	movl	-188(%ebp), %edi
	movl	-180(%ebp), %esi
	movl	%ebx, %ecx
	rep movsl
	movl	-184(%ebp), %eax
	movl	104(%eax), %edx
	testl	%edx, %edx
	js	L849
L830:
	movl	-184(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L831
	pushl	%ecx
	pushl	%ecx
	leal	-120(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L831:
	movl	-184(%ebp), %esi
	movl	116(%esi), %eax
	testl	%eax, %eax
	je	L832
	leal	-120(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L832:
	movl	-184(%ebp), %esi
	movl	96(%esi), %eax
	movl	%eax, -184(%ebp)
	testl	%eax, %eax
	jne	L837
	jmp	L835
	.p2align 4,,7
L849:
	cmpl	$1, -120(%ebp)
	jne	L830
	jmp	L816
L814:
	movl	-132(%ebp), %ebx
	movl	%edx, %ecx
	movl	%ebx, -80(%ebp)
	leal	-120(%ebp), %ebx
	movl	$4, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	rep movsl
	movl	-184(%ebp), %ecx
	movl	104(%ecx), %edx
	testl	%edx, %edx
	js	L850
L833:
	movl	-184(%ebp), %ecx
	movl	120(%ecx), %eax
	testl	%eax, %eax
	je	L834
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L834:
	movl	-184(%ebp), %esi
	movl	116(%esi), %eax
	testl	%eax, %eax
	je	L835
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	jmp	L835
L848:
	movl	$-49146, -80(%ebp)
	movl	$1, -84(%ebp)
	movl	%esi, %ebx
L846:
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	-184(%ebp), %edi
	movl	104(%edi), %esi
	testl	%esi, %esi
	js	L851
L828:
	movl	-184(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L829
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L829:
	movl	-184(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L835
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	jmp	L835
L850:
	cmpl	$1, -120(%ebp)
	jne	L833
	jmp	L816
L851:
	cmpl	$1, -120(%ebp)
	jne	L828
	jmp	L816
L813:
	cmpl	$4, -128(%ebp)
	je	L820
	leal	-120(%ebp), %ebx
	.p2align 4,,7
L824:
	movl	-128(%ebp), %edx
	movl	$-49146, -80(%ebp)
	movl	%edx, -84(%ebp)
	movl	%ebx, %edi
	movl	-180(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	-184(%ebp), %eax
	movl	104(%eax), %edi
	testl	%edi, %edi
	js	L852
L821:
	movl	-184(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L822
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L822:
	movl	-184(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L823
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L835
L823:
	movl	-184(%ebp), %ecx
	movl	96(%ecx), %eax
	movl	%eax, -184(%ebp)
	testl	%eax, %eax
	jne	L824
	jmp	L835
	.p2align 4,,7
L852:
	cmpl	$1, -120(%ebp)
	jne	L821
	jmp	L816
L820:
	movl	$-49146, -80(%ebp)
	movl	$4, -84(%ebp)
	leal	-120(%ebp), %ebx
	jmp	L846
	.p2align 4,,15
.globl _WidgetDrawOnRectListEx
_WidgetDrawOnRectListEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	8(%ebp), %ebx
	testb	$1, 104(%ebx)
	jne	L882
L872:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L882:
	subl	$12, %esp
	movl	48(%ebx), %esi
	movl	12(%ebp), %edi
	pushl	%esi
	movl	44(%ebx), %ecx
	pushl	%ecx
	movl	40(%ebx), %edx
	pushl	%edx
	movl	36(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L872
	subl	$12, %esp
	movl	12(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edx
	leal	36(%ebx), %edi
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	%edi
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L872
	movl	88(%eax), %esi
	movl	%esi, -40(%ebp)
	movl	%esi, %ebx
	jmp	L871
	.p2align 4,,7
L855:
	movl	88(%ebx), %ebx
	cmpl	%ebx, -40(%ebp)
	je	L872
L871:
	testb	$1, 104(%ebx)
	je	L855
	subl	$12, %esp
	movl	48(%ebx), %esi
	movl	12(%ebp), %edi
	pushl	%esi
	movl	44(%ebx), %ecx
	pushl	%ecx
	movl	40(%ebx), %edx
	pushl	%edx
	movl	36(%ebx), %eax
	pushl	%eax
	pushl	%edi
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L855
	subl	$12, %esp
	movl	12(%ebp), %eax
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edx
	leal	36(%ebx), %edi
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	%edi
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L855
	movl	88(%eax), %esi
	movl	%esi, -72(%ebp)
	movl	%esi, %edi
	jmp	L870
	.p2align 4,,7
L856:
	movl	88(%edi), %edi
	cmpl	%edi, -72(%ebp)
	je	L855
L870:
	testb	$1, 104(%edi)
	je	L856
	subl	$12, %esp
	movl	48(%edi), %eax
	pushl	%eax
	movl	12(%ebp), %eax
	movl	44(%edi), %esi
	pushl	%esi
	movl	40(%edi), %ecx
	pushl	%ecx
	movl	36(%edi), %edx
	pushl	%edx
	pushl	%eax
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L856
	subl	$12, %esp
	movl	20(%ebp), %eax
	movl	16(%ebp), %esi
	movl	12(%ebp), %ecx
	leal	36(%edi), %edx
	pushl	%eax
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	pushl	%edi
	call	*124(%edi)
	movl	92(%edi), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L856
	movl	88(%eax), %edx
	movl	%edx, -68(%ebp)
	movl	%edx, -36(%ebp)
	jmp	L869
	.p2align 4,,7
L857:
	movl	-36(%ebp), %esi
	movl	88(%esi), %ecx
	movl	%ecx, -36(%ebp)
	cmpl	%ecx, -68(%ebp)
	je	L856
L869:
	movl	-36(%ebp), %eax
	testb	$1, 104(%eax)
	je	L857
	subl	$12, %esp
	movl	48(%eax), %esi
	pushl	%esi
	movl	44(%eax), %ecx
	pushl	%ecx
	movl	12(%ebp), %ecx
	movl	40(%eax), %edx
	pushl	%edx
	movl	36(%eax), %esi
	pushl	%esi
	pushl	%ecx
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L857
	subl	$12, %esp
	movl	20(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	-36(%ebp), %esi
	pushl	%ecx
	pushl	%eax
	movl	-36(%ebp), %eax
	movl	12(%ebp), %edx
	addl	$36, %esi
	movl	-36(%ebp), %ecx
	pushl	%edx
	pushl	%esi
	pushl	%ecx
	call	*124(%eax)
	movl	-36(%ebp), %edx
	addl	$32, %esp
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L857
	movl	88(%eax), %eax
	movl	%eax, -64(%ebp)
	movl	%eax, -32(%ebp)
	jmp	L868
	.p2align 4,,7
L858:
	movl	-32(%ebp), %edx
	movl	88(%edx), %eax
	movl	%eax, -32(%ebp)
	cmpl	%eax, -64(%ebp)
	je	L857
L868:
	testb	$1, 104(%eax)
	je	L858
	subl	$12, %esp
	movl	48(%eax), %edx
	pushl	%edx
	movl	44(%eax), %esi
	pushl	%esi
	movl	12(%ebp), %esi
	movl	40(%eax), %ecx
	pushl	%ecx
	movl	36(%eax), %edx
	pushl	%edx
	pushl	%esi
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L858
	subl	$12, %esp
	movl	20(%ebp), %esi
	movl	16(%ebp), %eax
	movl	-32(%ebp), %edx
	pushl	%esi
	pushl	%eax
	movl	-32(%ebp), %eax
	movl	12(%ebp), %ecx
	addl	$36, %edx
	movl	-32(%ebp), %esi
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	call	*124(%eax)
	movl	-32(%ebp), %ecx
	addl	$32, %esp
	movl	92(%ecx), %eax
	testl	%eax, %eax
	je	L858
	movl	88(%eax), %edx
	movl	%edx, -60(%ebp)
	movl	%edx, -28(%ebp)
	jmp	L867
	.p2align 4,,7
L859:
	movl	-28(%ebp), %eax
	movl	88(%eax), %esi
	movl	%esi, -28(%ebp)
	cmpl	%esi, -60(%ebp)
	je	L858
L867:
	movl	-28(%ebp), %eax
	testb	$1, 104(%eax)
	je	L859
	subl	$12, %esp
	movl	48(%eax), %ecx
	pushl	%ecx
	movl	12(%ebp), %ecx
	movl	44(%eax), %edx
	pushl	%edx
	movl	40(%eax), %esi
	pushl	%esi
	movl	36(%eax), %eax
	pushl	%eax
	pushl	%ecx
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L859
	subl	$12, %esp
	movl	20(%ebp), %edx
	movl	16(%ebp), %eax
	movl	-28(%ebp), %ecx
	pushl	%edx
	pushl	%eax
	movl	-28(%ebp), %eax
	movl	12(%ebp), %esi
	addl	$36, %ecx
	movl	-28(%ebp), %edx
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	call	*124(%eax)
	movl	-28(%ebp), %esi
	addl	$32, %esp
	movl	92(%esi), %eax
	testl	%eax, %eax
	je	L859
	movl	88(%eax), %eax
	movl	%eax, -56(%ebp)
	movl	%eax, -24(%ebp)
	jmp	L866
	.p2align 4,,7
L860:
	movl	-24(%ebp), %ecx
	movl	88(%ecx), %eax
	movl	%eax, -24(%ebp)
	cmpl	%eax, -56(%ebp)
	je	L859
L866:
	testb	$1, 104(%eax)
	je	L860
	subl	$12, %esp
	movl	48(%eax), %esi
	pushl	%esi
	movl	44(%eax), %ecx
	pushl	%ecx
	movl	12(%ebp), %ecx
	movl	40(%eax), %edx
	pushl	%edx
	movl	36(%eax), %esi
	pushl	%esi
	pushl	%ecx
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L860
	subl	$12, %esp
	movl	20(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	-24(%ebp), %esi
	pushl	%ecx
	pushl	%eax
	movl	-24(%ebp), %eax
	movl	12(%ebp), %edx
	addl	$36, %esi
	movl	-24(%ebp), %ecx
	pushl	%edx
	pushl	%esi
	pushl	%ecx
	call	*124(%eax)
	movl	-24(%ebp), %edx
	addl	$32, %esp
	movl	92(%edx), %eax
	testl	%eax, %eax
	je	L860
	movl	88(%eax), %esi
	movl	%esi, -52(%ebp)
	movl	%esi, -20(%ebp)
	jmp	L865
	.p2align 4,,7
L861:
	movl	-20(%ebp), %edx
	movl	88(%edx), %eax
	movl	%eax, -20(%ebp)
	cmpl	%eax, -52(%ebp)
	je	L860
L865:
	movl	-20(%ebp), %eax
	testb	$1, 104(%eax)
	je	L861
	subl	$12, %esp
	movl	48(%eax), %edx
	pushl	%edx
	movl	12(%ebp), %edx
	movl	44(%eax), %esi
	pushl	%esi
	movl	40(%eax), %ecx
	pushl	%ecx
	movl	36(%eax), %eax
	pushl	%eax
	pushl	%edx
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L861
	subl	$12, %esp
	movl	20(%ebp), %esi
	movl	16(%ebp), %eax
	movl	-20(%ebp), %edx
	pushl	%esi
	pushl	%eax
	movl	-20(%ebp), %eax
	movl	12(%ebp), %ecx
	addl	$36, %edx
	movl	-20(%ebp), %esi
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	call	*124(%eax)
	movl	-20(%ebp), %ecx
	addl	$32, %esp
	movl	92(%ecx), %eax
	testl	%eax, %eax
	je	L861
	movl	88(%eax), %eax
	movl	%eax, -48(%ebp)
	movl	%eax, -16(%ebp)
	jmp	L864
	.p2align 4,,7
L862:
	movl	-16(%ebp), %esi
	movl	88(%esi), %eax
	movl	%eax, -16(%ebp)
	cmpl	%eax, -48(%ebp)
	je	L861
L864:
	testb	$1, 104(%eax)
	je	L862
	subl	$12, %esp
	movl	48(%eax), %ecx
	pushl	%ecx
	movl	44(%eax), %edx
	pushl	%edx
	movl	12(%ebp), %edx
	movl	40(%eax), %esi
	pushl	%esi
	movl	36(%eax), %ecx
	pushl	%ecx
	pushl	%edx
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L862
	subl	$12, %esp
	movl	20(%ebp), %edx
	movl	16(%ebp), %eax
	movl	-16(%ebp), %ecx
	pushl	%edx
	pushl	%eax
	movl	-16(%ebp), %eax
	movl	12(%ebp), %esi
	addl	$36, %ecx
	movl	-16(%ebp), %edx
	pushl	%esi
	pushl	%ecx
	pushl	%edx
	call	*124(%eax)
	movl	-16(%ebp), %esi
	addl	$32, %esp
	movl	92(%esi), %eax
	testl	%eax, %eax
	je	L862
	movl	88(%eax), %ecx
	movl	%ecx, -44(%ebp)
	movl	%ecx, %esi
	.p2align 4,,7
L863:
	movl	20(%ebp), %ecx
	movl	16(%ebp), %edx
	movl	12(%ebp), %eax
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	pushl	%esi
	call	_WidgetDrawOnRectListEx
	movl	88(%esi), %esi
	addl	$16, %esp
	cmpl	%esi, -44(%ebp)
	jne	L863
	jmp	L862
	.p2align 4,,15
.globl _WidgetMove
_WidgetMove:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	8(%ebp), %edi
	movl	16(%ebp), %esi
	movl	36(%edi), %edx
	movl	4(%edi), %ebx
	movl	16(%edi), %ecx
	movl	%edx, -28(%ebp)
	movl	40(%edi), %eax
	movl	%eax, -24(%ebp)
	movl	44(%edi), %edx
	movl	%edx, -20(%ebp)
	movl	48(%edi), %eax
	movl	%eax, -16(%ebp)
	movl	8(%edi), %edx
	movl	52(%edi), %eax
	movl	%eax, -44(%ebp)
	addl	%esi, %edx
	movl	%edx, -64(%ebp)
	movl	56(%edi), %edx
	movl	%edx, -40(%ebp)
	addl	%ecx, %esi
	movl	60(%edi), %ecx
	movl	%ecx, -36(%ebp)
	movl	64(%edi), %eax
	movl	%eax, -32(%ebp)
	movl	%ebx, %eax
	movl	60(%edi), %edx
	movl	12(%edi), %ecx
	addl	%edx, %eax
	movl	12(%ebp), %edx
	subl	%ebx, %eax
	leal	(%edx,%ecx), %ecx
	addl	%ebx, %edx
	movl	%ecx, 12(%edi)
	movl	%edx, -68(%ebp)
	movl	64(%edi), %ecx
	movl	8(%edi), %edx
	addl	%ecx, %edx
	movl	%eax, 60(%edi)
	movl	16(%edi), %eax
	movl	-64(%ebp), %ebx
	subl	%eax, %edx
	addl	%esi, %edx
	subl	%ebx, %edx
	movl	%edx, 64(%edi)
	movl	-68(%ebp), %eax
	movl	-64(%ebp), %ecx
	movl	%eax, 4(%edi)
	movl	96(%edi), %eax
	movl	%ecx, 8(%edi)
	movl	%esi, 16(%edi)
	testl	%eax, %eax
	je	L884
	pushl	%ecx
	movl	24(%eax), %edx
	pushl	%edx
	movl	20(%eax), %ecx
	pushl	%ecx
	leal	-60(%ebp), %ecx
	movl	64(%eax), %ebx
	pushl	%ebx
	movl	60(%eax), %esi
	pushl	%esi
	movl	56(%eax), %edx
	pushl	%edx
	movl	52(%eax), %eax
	pushl	%eax
	pushl	%ecx
	call	_RectMove
	addl	$28, %esp
	movl	-56(%ebp), %ebx
	movl	-60(%ebp), %esi
	pushl	%ebx
	pushl	%esi
	movl	16(%edi), %edx
	leal	20(%edi), %esi
	pushl	%edx
	movl	12(%edi), %eax
	pushl	%eax
	movl	8(%edi), %ecx
	pushl	%ecx
	movl	4(%edi), %ebx
	pushl	%ebx
	pushl	%esi
	call	_RectMove
	movl	96(%edi), %eax
	movl	20(%edi), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L885
	movl	24(%edi), %ecx
	cmpl	80(%eax), %ecx
	jle	L897
L885:
	subl	$12, %esp
	leal	36(%edi), %esi
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%esi
	call	_RectAssign
	addl	$32, %esp
L884:
	pushl	%eax
	movl	24(%edi), %ecx
	pushl	%ecx
	movl	20(%edi), %ebx
	pushl	%ebx
	leal	-60(%ebp), %ebx
	movl	64(%edi), %esi
	pushl	%esi
	movl	60(%edi), %eax
	pushl	%eax
	movl	56(%edi), %edx
	pushl	%edx
	movl	52(%edi), %ecx
	pushl	%ecx
	pushl	%ebx
	call	_RectMove
	addl	$20, %esp
	movl	48(%edi), %esi
	movl	-48(%ebp), %ebx
	pushl	%esi
	movl	-52(%ebp), %esi
	movl	44(%edi), %eax
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	40(%edi), %edx
	pushl	%edx
	movl	-60(%ebp), %edx
	movl	36(%edi), %ecx
	pushl	%ecx
	leal	68(%edi), %ecx
	pushl	%ebx
	pushl	%esi
	pushl	%eax
	pushl	%edx
	pushl	%ecx
	call	_RectIntersept
	movl	92(%edi), %ebx
	addl	$48, %esp
	testl	%ebx, %ebx
	je	L886
	subl	$12, %esp
	movl	64(%edi), %esi
	movl	-32(%ebp), %ebx
	pushl	%esi
	movl	-36(%ebp), %esi
	movl	60(%edi), %eax
	pushl	%eax
	movl	-40(%ebp), %eax
	movl	56(%edi), %edx
	pushl	%edx
	movl	-44(%ebp), %edx
	movl	52(%edi), %ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%esi
	pushl	%eax
	pushl	%edx
	pushl	%edi
	call	__WidgetAutosize
	addl	$48, %esp
L886:
	movl	%edi, %eax
	.p2align 4,,7
L888:
	testb	$1, 104(%eax)
	je	L887
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L888
	subl	$12, %esp
	pushl	%edi
	call	_WidgetDrawAllEx
	addl	$16, %esp
L887:
	movl	-20(%ebp), %edx
	movl	-24(%ebp), %ecx
	movl	-28(%ebp), %esi
	movl	-16(%ebp), %eax
	pushl	%eax
	pushl	%edx
	pushl	%ecx
	pushl	%esi
	call	_NewListFromRect
	movl	48(%edi), %ebx
	movl	%eax, %esi
	popl	%eax
	pushl	%ebx
	movl	44(%edi), %eax
	pushl	%eax
	movl	40(%edi), %edx
	pushl	%edx
	movl	36(%edi), %ecx
	pushl	%ecx
	pushl	%esi
	call	_RemoveZoneInList
	movl	_screen, %ebx
	movl	%ebx, -72(%ebp)
	movl	96(%edi), %ebx
	addl	$32, %esp
	testb	$1, 104(%ebx)
	jne	L898
L890:
	subl	$12, %esp
	pushl	%esi
	call	_FreeList
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L897:
	movl	28(%edi), %ebx
	cmpl	68(%eax), %ebx
	jl	L885
	movl	32(%edi), %esi
	cmpl	72(%eax), %esi
	jl	L885
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%edi), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_RectIntersept
	addl	$48, %esp
	jmp	L884
	.p2align 4,,7
L898:
	subl	$12, %esp
	movl	48(%ebx), %eax
	pushl	%eax
	movl	44(%ebx), %edx
	pushl	%edx
	movl	40(%ebx), %ecx
	pushl	%ecx
	movl	36(%ebx), %edi
	pushl	%edi
	pushl	%esi
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L890
	subl	$12, %esp
	movl	-72(%ebp), %ecx
	leal	36(%ebx), %edi
	pushl	$0
	pushl	%ecx
	pushl	%esi
	pushl	%edi
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L890
	movl	88(%eax), %edi
	movl	%edi, %ebx
	.p2align 4,,7
L891:
	movl	-72(%ebp), %edx
	pushl	$0
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	_WidgetDrawOnRectListEx
	movl	88(%ebx), %ebx
	addl	$16, %esp
	cmpl	%ebx, %edi
	jne	L891
	jmp	L890
	.p2align 4,,15
.globl _WidgetMoveToPoint
_WidgetMoveToPoint:
	pushl	%ebp
	movl	%esp, %ebp
	movl	8(%ebp), %ecx
	movl	16(%ebp), %eax
	movl	12(%ebp), %edx
	subl	8(%ecx), %eax
	movl	%eax, 16(%ebp)
	movl	4(%ecx), %eax
	subl	%eax, %edx
	movl	%edx, 12(%ebp)
	popl	%ebp
	jmp	_WidgetMove
	.p2align 4,,15
.globl __WidgetRemove
__WidgetRemove:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$44, %esp
	movl	12(%ebp), %ebx
	movl	88(%ebx), %edx
	cmpl	%edx, %ebx
	je	L940
	movl	84(%ebx), %ecx
	movl	%ecx, 84(%edx)
	movl	84(%ebx), %eax
	movl	%edx, 88(%eax)
	movl	8(%ebp), %edx
	cmpl	92(%edx), %ebx
	je	L941
L903:
	movl	$0, 96(%ebx)
	movl	48(%ebx), %ecx
	movl	44(%ebx), %edx
	movl	40(%ebx), %edi
	movl	36(%ebx), %esi
	movl	8(%ebp), %eax
	.p2align 4,,7
L905:
	testb	$1, 104(%eax)
	je	L904
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L905
	movl	8(%ebp), %eax
	movl	%esi, -28(%ebp)
	movl	%ecx, -16(%ebp)
	movl	%edx, -20(%ebp)
	movl	%edi, -24(%ebp)
	cmpl	%edx, 36(%eax)
	jg	L904
	cmpl	%ecx, 40(%eax)
	jg	L904
	cmpl	%esi, 44(%eax)
	jl	L904
	cmpl	%edi, 48(%eax)
	jl	L904
	testb	$1, 104(%eax)
	je	L904
	subl	$12, %esp
	leal	-28(%ebp), %eax
	pushl	$0
	movl	_screen, %ecx
	pushl	%ecx
	pushl	$0
	pushl	%eax
	movl	8(%ebp), %edi
	pushl	%edi
	movl	8(%ebp), %esi
	call	*124(%esi)
	movl	8(%ebp), %edx
	movl	92(%edx), %edi
	addl	$32, %esp
	testl	%edi, %edi
	je	L904
	movl	%edi, %esi
L910:
	testl	%esi, %esi
	je	L907
	movl	-28(%ebp), %edx
	movl	-20(%ebp), %eax
	movl	%edx, -44(%ebp)
	movl	-24(%ebp), %ecx
	movl	-16(%ebp), %edx
	movl	%eax, -36(%ebp)
	movl	%ecx, -40(%ebp)
	movl	%edx, -32(%ebp)
	movl	%esi, %eax
	.p2align 4,,7
L908:
	testb	$1, 104(%eax)
	je	L907
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L908
	pushl	%eax
	pushl	%eax
	pushl	$0
	movl	-32(%ebp), %ecx
	pushl	%ecx
	movl	-36(%ebp), %eax
	pushl	%eax
	movl	-40(%ebp), %edx
	pushl	%edx
	movl	-44(%ebp), %ecx
	pushl	%ecx
	pushl	%esi
	call	_WidgetDrawOnRectEx
	addl	$32, %esp
L907:
	movl	88(%esi), %esi
	cmpl	%esi, %edi
	jne	L910
	.p2align 4,,7
L904:
	cmpb	$0, 104(%ebx)
	jns	L925
	movl	8(%ebp), %ebx
	movl	92(%ebx), %eax
	testl	%eax, %eax
	je	L925
	movl	88(%eax), %edi
	movl	%edi, -48(%ebp)
	movl	%edi, %esi
	.p2align 4,,7
L922:
	movl	%esi, %eax
	.p2align 4,,7
L914:
	testb	$1, 104(%eax)
	je	L939
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L914
	movl	104(%esi), %eax
	testb	$1, %al
	jne	L942
	testb	$64, %al
	jne	L943
L921:
	movl	88(%esi), %esi
	cmpl	%esi, -48(%ebp)
	jne	L922
L925:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L942:
	subl	$12, %esp
	pushl	$0
	movl	_screen, %eax
	pushl	%eax
	pushl	$0
	pushl	$0
	pushl	%esi
	call	*124(%esi)
	movl	92(%esi), %edi
	addl	$32, %esp
	movl	%edi, %ebx
	testl	%edi, %edi
	je	L939
	.p2align 4,,7
L926:
	movl	%ebx, %eax
	.p2align 4,,7
L918:
	testb	$1, 104(%eax)
	je	L917
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L918
	subl	$12, %esp
	pushl	%ebx
	call	_WidgetDrawAllEx
	addl	$16, %esp
L917:
	movl	88(%ebx), %ebx
	cmpl	%ebx, %edi
	jne	L926
L939:
	movl	104(%esi), %eax
	testb	$64, %al
	je	L921
L943:
	subl	$12, %esp
	pushl	%esi
	call	_WidgetSelect
	addl	$16, %esp
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L940:
	movl	8(%ebp), %eax
	movl	$0, 92(%eax)
	jmp	L903
L941:
	movl	%eax, 92(%edx)
	jmp	L903
	.p2align 4,,15
.globl _DragStart
_DragStart:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$28, %esp
	movl	8(%ebp), %esi
	movl	12(%ebp), %ebx
	movl	20(%ebp), %edi
	testb	$4, _WorkingFlags
	jne	L951
L945:
	subl	$12, %esp
	pushl	$LC3
	call	_DebugMessage
	movl	_WorkingFlags, %eax
	movl	16(%ebp), %ecx
	orl	$4, %eax
	movl	%ebx, _DragDataType
	movl	%eax, _WorkingFlags
	popl	%eax
	popl	%edx
	movl	%esi, _DragCaller
	pushl	%ecx
	pushl	%ebx
	call	_DuplicateData2
	movl	104(%esi), %edx
	movl	_TopWidget, %ecx
	orb	$2, %dh
	movl	%edi, _DragSupportedMethods
	movl	%edx, 104(%esi)
	movl	160(%ecx), %edx
	addl	$16, %esp
	movl	%eax, %ebx
	movl	%eax, _DragData
	testl	%edx, %edx
	je	L946
	pushl	%eax
	pushl	%eax
	leal	-16(%ebp), %eax
	movl	_DragDataType, %esi
	pushl	%eax
	pushl	%edi
	pushl	%ebx
	movl	_DragCaller, %ebx
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	call	*%edx
	addl	$32, %esp
	movl	%eax, _DragOldAccept
	testl	%eax, %eax
	je	L947
	cmpl	$1, -16(%ebp)
	je	L952
	subl	$12, %esp
	movl	_DragCur, %edx
	pushl	%edx
	call	_MouseSetCursor
	addl	$16, %esp
L949:
	movl	-16(%ebp), %ebx
	movl	%ebx, _DragOldMethod
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L952:
	subl	$12, %esp
	movl	_DragCopyCur, %edi
	pushl	%edi
	call	_MouseSetCursor
	addl	$16, %esp
	jmp	L949
	.p2align 4,,7
L946:
	movl	$0, _DragOldAccept
L947:
	subl	$12, %esp
	movl	_NoDragCur, %ecx
	pushl	%ecx
	call	_MouseSetCursor
	addl	$16, %esp
	jmp	L949
	.p2align 4,,7
L951:
	subl	$12, %esp
	pushl	$LC3
	call	_DebugMessage
	addl	$16, %esp
	testb	$4, _WorkingFlags
	je	L945
	movl	_DragDataType, %ecx
	pushl	%eax
	pushl	%eax
	movl	_DragData, %eax
	pushl	%eax
	pushl	%ecx
	call	_FreeData2
	popl	%eax
	movl	_cursor_pointer, %edx
	movl	$0, _DragCaller
	pushl	%edx
	movl	$0, _DragData
	movl	$0, _DragDataType
	movl	$0, _DragSupportedMethods
	call	_MouseSetCursor
	movl	_WorkingFlags, %eax
	andl	$-5, %eax
	addl	$16, %esp
	movl	%eax, _WorkingFlags
	jmp	L945
	.p2align 4,,15
.globl _WidgetResizeToSize
_WidgetResizeToSize:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	8(%ebp), %edi
	movl	12(%ebp), %ebx
	movl	16(%ebp), %ecx
	movl	36(%edi), %eax
	movl	8(%edi), %esi
	movl	12(%edi), %edx
	movl	%eax, -28(%ebp)
	movl	40(%edi), %eax
	movl	%eax, -24(%ebp)
	movl	44(%edi), %eax
	movl	%eax, -20(%ebp)
	movl	48(%edi), %eax
	movl	%eax, -16(%ebp)
	movl	20(%edi), %eax
	addl	%eax, %ebx
	movl	24(%edi), %eax
	addl	%eax, %ecx
	movl	52(%edi), %eax
	movl	%eax, -44(%ebp)
	movl	56(%edi), %eax
	movl	%eax, -40(%ebp)
	movl	60(%edi), %eax
	movl	%eax, -36(%ebp)
	movl	64(%edi), %eax
	movl	%eax, -32(%ebp)
	movl	%ebx, %eax
	subl	%edx, %eax
	movl	%eax, %edx
	movl	60(%edi), %eax
	addl	%edx, %eax
	movl	64(%edi), %edx
	movl	%eax, 60(%edi)
	leal	(%esi,%edx), %eax
	movl	16(%edi), %edx
	subl	%edx, %eax
	subl	%esi, %eax
	addl	%ecx, %eax
	movl	%eax, 64(%edi)
	movl	%esi, 8(%edi)
	movl	96(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	%ebx, 12(%edi)
	testl	%eax, %eax
	je	L954
	pushl	%ecx
	movl	24(%eax), %ebx
	pushl	%ebx
	movl	20(%eax), %edx
	pushl	%edx
	movl	64(%eax), %esi
	pushl	%esi
	leal	-60(%ebp), %esi
	movl	60(%eax), %ecx
	pushl	%ecx
	movl	56(%eax), %ebx
	pushl	%ebx
	movl	52(%eax), %edx
	pushl	%edx
	pushl	%esi
	call	_RectMove
	addl	$28, %esp
	movl	-56(%ebp), %ecx
	movl	-60(%ebp), %ebx
	pushl	%ecx
	pushl	%ebx
	movl	16(%edi), %eax
	leal	20(%edi), %ebx
	pushl	%eax
	movl	12(%edi), %edx
	pushl	%edx
	movl	8(%edi), %esi
	pushl	%esi
	movl	4(%edi), %ecx
	pushl	%ecx
	pushl	%ebx
	call	_RectMove
	movl	96(%edi), %eax
	movl	20(%edi), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L955
	movl	24(%edi), %ecx
	cmpl	80(%eax), %ecx
	jle	L967
L955:
	subl	$12, %esp
	leal	36(%edi), %ecx
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%ecx
	call	_RectAssign
	addl	$32, %esp
L954:
	pushl	%eax
	movl	24(%edi), %edx
	pushl	%edx
	movl	20(%edi), %esi
	pushl	%esi
	leal	-60(%ebp), %esi
	movl	64(%edi), %ecx
	pushl	%ecx
	movl	60(%edi), %eax
	pushl	%eax
	movl	56(%edi), %ebx
	pushl	%ebx
	movl	52(%edi), %edx
	pushl	%edx
	pushl	%esi
	call	_RectMove
	addl	$20, %esp
	movl	48(%edi), %ecx
	movl	-48(%ebp), %esi
	pushl	%ecx
	movl	-52(%ebp), %ecx
	movl	44(%edi), %eax
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	40(%edi), %ebx
	pushl	%ebx
	movl	-60(%ebp), %ebx
	movl	36(%edi), %edx
	pushl	%edx
	leal	68(%edi), %edx
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	pushl	%edx
	call	_RectIntersept
	movl	92(%edi), %esi
	addl	$48, %esp
	testl	%esi, %esi
	je	L956
	subl	$12, %esp
	movl	64(%edi), %ecx
	movl	-32(%ebp), %esi
	pushl	%ecx
	movl	-36(%ebp), %ecx
	movl	60(%edi), %eax
	pushl	%eax
	movl	-40(%ebp), %eax
	movl	56(%edi), %ebx
	pushl	%ebx
	movl	-44(%ebp), %ebx
	movl	52(%edi), %edx
	pushl	%edx
	pushl	%esi
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	pushl	%edi
	call	__WidgetAutosize
	addl	$48, %esp
L956:
	movl	%edi, %eax
	.p2align 4,,7
L958:
	testb	$1, 104(%eax)
	je	L957
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L958
	subl	$12, %esp
	pushl	%edi
	call	_WidgetDrawAllEx
	addl	$16, %esp
L957:
	movl	-16(%ebp), %ecx
	movl	-24(%ebp), %ebx
	movl	-28(%ebp), %esi
	movl	-20(%ebp), %eax
	pushl	%ecx
	pushl	%eax
	pushl	%ebx
	pushl	%esi
	call	_NewListFromRect
	popl	%ecx
	movl	48(%edi), %edx
	movl	%eax, %esi
	pushl	%edx
	movl	44(%edi), %ecx
	pushl	%ecx
	movl	40(%edi), %eax
	pushl	%eax
	movl	36(%edi), %ebx
	pushl	%ebx
	pushl	%esi
	call	_RemoveZoneInList
	movl	96(%edi), %ebx
	movl	_screen, %edx
	addl	$32, %esp
	movl	%edx, -64(%ebp)
	testb	$1, 104(%ebx)
	jne	L968
L960:
	subl	$12, %esp
	pushl	%esi
	call	_FreeList
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L967:
	movl	28(%edi), %ebx
	cmpl	68(%eax), %ebx
	jl	L955
	movl	32(%edi), %esi
	cmpl	72(%eax), %esi
	jl	L955
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%edi), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	_RectIntersept
	addl	$48, %esp
	jmp	L954
	.p2align 4,,7
L968:
	subl	$12, %esp
	movl	48(%ebx), %ecx
	pushl	%ecx
	movl	44(%ebx), %eax
	pushl	%eax
	movl	40(%ebx), %edx
	pushl	%edx
	movl	36(%ebx), %edi
	pushl	%edi
	pushl	%esi
	call	_RectOverlayList
	addl	$32, %esp
	testl	%eax, %eax
	je	L960
	subl	$12, %esp
	movl	-64(%ebp), %edx
	leal	36(%ebx), %edi
	pushl	$0
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	%ebx
	call	*124(%ebx)
	movl	92(%ebx), %eax
	addl	$32, %esp
	testl	%eax, %eax
	je	L960
	movl	88(%eax), %edi
	movl	%edi, %ebx
	.p2align 4,,7
L961:
	movl	-64(%ebp), %eax
	pushl	$0
	pushl	%eax
	pushl	%esi
	pushl	%ebx
	call	_WidgetDrawOnRectListEx
	movl	88(%ebx), %ebx
	addl	$16, %esp
	cmpl	%ebx, %edi
	jne	L961
	jmp	L960
	.p2align 4,,15
.globl _WidgetDisposeEx
_WidgetDisposeEx:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$108, %esp
	movl	8(%ebp), %eax
	movl	%eax, -108(%ebp)
	cmpl	%eax, _TopWidget
	jne	L970
	movl	$0, _TopWidget
L970:
	movl	-108(%ebp), %edx
	cmpl	%edx, _MasterWidget
	jne	L971
	movl	$0, _MasterWidget
L971:
	movl	-108(%ebp), %ecx
	cmpl	%ecx, _FocusedWidget
	jne	L972
	movl	$0, _FocusedWidget
L972:
	movl	_LookFor, %eax
	testl	%eax, %eax
	je	L973
	movl	-108(%ebp), %ebx
	cmpl	%ebx, (%eax)
	jne	L973
	movl	$0, (%eax)
L973:
	movl	-108(%ebp), %esi
	movl	92(%esi), %edx
	movl	%edx, -68(%ebp)
	testl	%edx, %edx
	je	L974
	movl	%edx, -104(%ebp)
L1047:
	movl	-104(%ebp), %ecx
	movl	-104(%ebp), %edi
	cmpl	_TopWidget, %edi
	movl	88(%ecx), %edx
	movl	%edx, -100(%ebp)
	jne	L975
	movl	$0, _TopWidget
L975:
	movl	-104(%ebp), %ebx
	cmpl	_MasterWidget, %ebx
	jne	L976
	movl	$0, _MasterWidget
L976:
	movl	-104(%ebp), %esi
	cmpl	_FocusedWidget, %esi
	jne	L977
	movl	$0, _FocusedWidget
L977:
	testl	%eax, %eax
	je	L978
	movl	-104(%ebp), %edi
	cmpl	(%eax), %edi
	jne	L978
	movl	$0, (%eax)
L978:
	movl	-104(%ebp), %edx
	movl	92(%edx), %edx
	movl	%edx, -96(%ebp)
	testl	%edx, %edx
	je	L979
	movl	%edx, -60(%ebp)
L1043:
	movl	-60(%ebp), %esi
	movl	-60(%ebp), %ecx
	cmpl	_TopWidget, %ecx
	movl	88(%esi), %ebx
	movl	%ebx, -64(%ebp)
	jne	L980
	movl	$0, _TopWidget
L980:
	movl	-60(%ebp), %edi
	cmpl	_MasterWidget, %edi
	jne	L981
	movl	$0, _MasterWidget
L981:
	movl	-60(%ebp), %edx
	cmpl	_FocusedWidget, %edx
	jne	L982
	movl	$0, _FocusedWidget
L982:
	testl	%eax, %eax
	je	L983
	movl	-60(%ebp), %ecx
	cmpl	(%eax), %ecx
	jne	L983
	movl	$0, (%eax)
L983:
	movl	-60(%ebp), %ebx
	movl	92(%ebx), %edx
	movl	%edx, -92(%ebp)
	testl	%edx, %edx
	je	L984
	movl	%edx, -52(%ebp)
L1039:
	movl	-52(%ebp), %edx
	movl	-52(%ebp), %esi
	cmpl	_TopWidget, %esi
	movl	88(%edx), %edi
	movl	%edi, -56(%ebp)
	jne	L985
	movl	$0, _TopWidget
L985:
	movl	-52(%ebp), %ecx
	cmpl	_MasterWidget, %ecx
	jne	L986
	movl	$0, _MasterWidget
L986:
	movl	-52(%ebp), %ebx
	cmpl	_FocusedWidget, %ebx
	jne	L987
	movl	$0, _FocusedWidget
L987:
	testl	%eax, %eax
	je	L988
	movl	-52(%ebp), %esi
	cmpl	(%eax), %esi
	jne	L988
	movl	$0, (%eax)
L988:
	movl	-52(%ebp), %edi
	movl	92(%edi), %edx
	movl	%edx, -88(%ebp)
	testl	%edx, %edx
	je	L989
	movl	%edx, -44(%ebp)
L1035:
	movl	-44(%ebp), %ebx
	movl	-44(%ebp), %edx
	cmpl	_TopWidget, %edx
	movl	88(%ebx), %ecx
	movl	%ecx, -48(%ebp)
	je	L1053
L990:
	movl	-44(%ebp), %esi
	cmpl	_MasterWidget, %esi
	je	L1054
L991:
	movl	-44(%ebp), %edi
	cmpl	_FocusedWidget, %edi
	je	L1055
L992:
	testl	%eax, %eax
	je	L993
	movl	-44(%ebp), %edx
	cmpl	(%eax), %edx
	je	L1056
L993:
	movl	-44(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -84(%ebp)
	testl	%edx, %edx
	je	L994
	movl	%edx, -36(%ebp)
L1031:
	movl	-36(%ebp), %edi
	movl	-36(%ebp), %ebx
	cmpl	_TopWidget, %ebx
	movl	88(%edi), %esi
	movl	%esi, -40(%ebp)
	je	L1057
L995:
	movl	-36(%ebp), %edx
	cmpl	_MasterWidget, %edx
	je	L1058
L996:
	movl	-36(%ebp), %ecx
	cmpl	_FocusedWidget, %ecx
	je	L1059
L997:
	testl	%eax, %eax
	je	L998
	movl	-36(%ebp), %ebx
	cmpl	(%eax), %ebx
	je	L1060
L998:
	movl	-36(%ebp), %esi
	movl	92(%esi), %edx
	movl	%edx, -80(%ebp)
	testl	%edx, %edx
	je	L999
	movl	%edx, -28(%ebp)
L1027:
	movl	88(%edx), %edi
	movl	-28(%ebp), %edx
	movl	%edi, -32(%ebp)
	cmpl	_TopWidget, %edx
	je	L1061
	cmpl	_MasterWidget, %edx
	je	L1062
L1001:
	cmpl	_FocusedWidget, %edx
	je	L1063
L1002:
	testl	%eax, %eax
	je	L1003
	movl	-28(%ebp), %edx
	cmpl	(%eax), %edx
	je	L1064
L1003:
	movl	-28(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -76(%ebp)
	testl	%edx, %edx
	je	L1004
	movl	%edx, -20(%ebp)
	.p2align 4,,7
L1023:
	movl	88(%edx), %ebx
	movl	-20(%ebp), %edx
	movl	%ebx, -24(%ebp)
	cmpl	_TopWidget, %edx
	je	L1065
L1005:
	cmpl	_MasterWidget, %edx
	je	L1066
	cmpl	_FocusedWidget, %edx
	je	L1067
L1007:
	testl	%eax, %eax
	je	L1008
	movl	-20(%ebp), %esi
	cmpl	(%eax), %esi
	je	L1068
L1008:
	movl	-20(%ebp), %edi
	movl	92(%edi), %edx
	movl	%edx, -72(%ebp)
	testl	%edx, %edx
	je	L1009
	movl	%edx, %edi
	cmpl	_TopWidget, %edi
	movl	88(%edi), %edx
	movl	%edx, -16(%ebp)
	je	L1069
	.p2align 4,,7
L1010:
	cmpl	_MasterWidget, %edi
	je	L1070
L1011:
	cmpl	_FocusedWidget, %edi
	je	L1071
L1012:
	testl	%eax, %eax
	je	L1013
	cmpl	(%eax), %edi
	je	L1072
L1013:
	movl	92(%edi), %esi
	testl	%esi, %esi
	je	L1014
	movl	%esi, %eax
	jmp	L1015
	.p2align 4,,7
L1073:
	movl	%ebx, %eax
L1015:
	subl	$12, %esp
	movl	88(%eax), %ebx
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
	cmpl	%ebx, %esi
	jne	L1073
L1014:
	movl	132(%edi), %eax
	testl	%eax, %eax
	je	L1016
	subl	$12, %esp
	pushl	%edi
	call	*%eax
	addl	$16, %esp
L1016:
	testb	$1, 105(%edi)
	jne	L1017
	movl	156(%edi), %eax
	testl	%eax, %eax
	je	L1017
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1017:
	movl	176(%edi), %eax
	testl	%eax, %eax
	je	L1018
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1018:
	subl	$12, %esp
	pushl	%edi
	call	_free
	movl	-16(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -72(%ebp)
	je	L1009
	movl	%eax, %edi
	movl	_LookFor, %eax
	cmpl	_TopWidget, %edi
	movl	88(%edi), %edx
	movl	%edx, -16(%ebp)
	jne	L1010
L1069:
	movl	$0, _TopWidget
	cmpl	_MasterWidget, %edi
	jne	L1011
	.p2align 4,,7
L1070:
	movl	$0, _MasterWidget
	cmpl	_FocusedWidget, %edi
	jne	L1012
	.p2align 4,,7
L1071:
	movl	$0, _FocusedWidget
	jmp	L1012
	.p2align 4,,7
L1009:
	movl	-20(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1020
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1020:
	movl	-20(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1021
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1021
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1021:
	movl	-20(%ebp), %ebx
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L1022
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1022:
	subl	$12, %esp
	movl	-20(%ebp), %eax
	pushl	%eax
	call	_free
	movl	-24(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -76(%ebp)
	je	L1004
	movl	%eax, -20(%ebp)
	movl	_LookFor, %eax
	movl	-20(%ebp), %edx
	jmp	L1023
	.p2align 4,,7
L1072:
	movl	$0, (%eax)
	jmp	L1013
L1004:
	movl	-28(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1024
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1024:
	movl	-28(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1025
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1025
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1025:
	movl	-28(%ebp), %edi
	movl	176(%edi), %eax
	testl	%eax, %eax
	je	L1026
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1026:
	subl	$12, %esp
	movl	-28(%ebp), %edx
	pushl	%edx
	call	_free
	movl	-32(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -80(%ebp)
	je	L999
	movl	%eax, -28(%ebp)
	movl	_LookFor, %eax
	movl	-28(%ebp), %edx
	jmp	L1027
L1066:
	movl	-20(%ebp), %edx
	movl	$0, _MasterWidget
	cmpl	_FocusedWidget, %edx
	jne	L1007
L1067:
	movl	$0, _FocusedWidget
	jmp	L1007
L1065:
	movl	$0, _TopWidget
	movl	-20(%ebp), %edx
	jmp	L1005
L1068:
	movl	$0, (%eax)
	jmp	L1008
L999:
	movl	-36(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1028
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1028:
	movl	-36(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1029
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1029
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1029:
	movl	-36(%ebp), %ebx
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L1030
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1030:
	subl	$12, %esp
	movl	-36(%ebp), %eax
	pushl	%eax
	call	_free
	movl	-40(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -84(%ebp)
	je	L994
	movl	%eax, -36(%ebp)
	movl	_LookFor, %eax
	jmp	L1031
L1061:
	movl	-28(%ebp), %edx
	movl	$0, _TopWidget
	cmpl	_MasterWidget, %edx
	jne	L1001
L1062:
	movl	-28(%ebp), %edx
	movl	$0, _MasterWidget
	cmpl	_FocusedWidget, %edx
	jne	L1002
L1063:
	movl	$0, _FocusedWidget
	jmp	L1002
L1064:
	movl	$0, (%eax)
	jmp	L1003
L1059:
	movl	$0, _FocusedWidget
	jmp	L997
L1058:
	movl	$0, _MasterWidget
	jmp	L996
L1057:
	movl	$0, _TopWidget
	jmp	L995
L994:
	movl	-44(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1032
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1032:
	movl	-44(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1033
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1033
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1033:
	movl	-44(%ebp), %edi
	movl	176(%edi), %eax
	testl	%eax, %eax
	je	L1034
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1034:
	subl	$12, %esp
	movl	-44(%ebp), %edx
	pushl	%edx
	call	_free
	movl	-48(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -88(%ebp)
	je	L989
	movl	%eax, -44(%ebp)
	movl	_LookFor, %eax
	jmp	L1035
L1060:
	movl	$0, (%eax)
	jmp	L998
L1055:
	movl	$0, _FocusedWidget
	jmp	L992
L1054:
	movl	$0, _MasterWidget
	jmp	L991
L1053:
	movl	$0, _TopWidget
	jmp	L990
L989:
	movl	-52(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1036
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1036:
	movl	-52(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1037
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1037
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1037:
	movl	-52(%ebp), %ebx
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L1038
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1038:
	subl	$12, %esp
	movl	-52(%ebp), %eax
	pushl	%eax
	call	_free
	movl	-56(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -92(%ebp)
	je	L984
	movl	%eax, -52(%ebp)
	movl	_LookFor, %eax
	jmp	L1039
L979:
	movl	-104(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1044
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1044:
	movl	-104(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1045
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1045
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1045:
	movl	-104(%ebp), %ebx
	movl	176(%ebx), %eax
	testl	%eax, %eax
	je	L1046
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1046:
	subl	$12, %esp
	movl	-104(%ebp), %esi
	pushl	%esi
	call	_free
	movl	-100(%ebp), %eax
	addl	$16, %esp
	movl	%eax, -104(%ebp)
	cmpl	%eax, -68(%ebp)
	je	L974
	movl	_LookFor, %eax
	jmp	L1047
L974:
	movl	-108(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1048
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1048:
	movl	-108(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1049
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1049
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1049:
	movl	-108(%ebp), %edx
	movl	176(%edx), %eax
	testl	%eax, %eax
	je	L1050
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1050:
	movl	-108(%ebp), %ecx
	movl	%ecx, 8(%ebp)
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_free
L984:
	movl	-60(%ebp), %edx
	movl	132(%edx), %eax
	testl	%eax, %eax
	je	L1040
	subl	$12, %esp
	pushl	%edx
	call	*%eax
	addl	$16, %esp
L1040:
	movl	-60(%ebp), %eax
	testb	$1, 105(%eax)
	jne	L1041
	movl	156(%eax), %eax
	testl	%eax, %eax
	je	L1041
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1041:
	movl	-60(%ebp), %edi
	movl	176(%edi), %eax
	testl	%eax, %eax
	je	L1042
	subl	$12, %esp
	pushl	%eax
	call	_free
	addl	$16, %esp
L1042:
	subl	$12, %esp
	movl	-60(%ebp), %edx
	pushl	%edx
	call	_free
	movl	-64(%ebp), %eax
	addl	$16, %esp
	cmpl	%eax, -96(%ebp)
	je	L979
	movl	%eax, -60(%ebp)
	movl	_LookFor, %eax
	jmp	L1043
L1056:
	movl	$0, (%eax)
	jmp	L993
	.p2align 4,,15
.globl _Close
_Close:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$20, %esp
	movl	_WidgetExtender, %edx
	pushl	%edx
	call	_RemoveAppExtender
	popl	%eax
	movl	_WidgetTimerId, %eax
	pushl	%eax
	call	_KillTimer
	movl	$_WidgetEventHandler, (%esp)
	call	_RemoveEventHandler
	movl	_buffer, %eax
	addl	$16, %esp
	testl	%eax, %eax
	je	L1075
	subl	$12, %esp
	pushl	%eax
	call	_destroy_bitmap
	addl	$16, %esp
L1075:
	subl	$12, %esp
	movl	_DeskTop, %ecx
	pushl	%ecx
	call	_WidgetDisposeEx
	movl	$0, _DeskTop
	call	_iWidgetUnInstall
	addl	$16, %esp
	leave
	jmp	_WClassUnInstall
	.p2align 4,,15
.globl _WidgetDispose
_WidgetDispose:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	8(%ebp), %ebx
	testl	%ebx, %ebx
	je	L1080
	movl	96(%ebx), %eax
	testl	%eax, %eax
	je	L1079
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1079:
	movl	%ebx, 8(%ebp)
	movl	-4(%ebp), %ebx
	leave
	jmp	_WidgetDisposeEx
	.p2align 4,,7
L1080:
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,15
.globl _DisposeStartupLogo
_DisposeStartupLogo:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%ebx
	subl	$4, %esp
	movl	_StartMask, %ebx
	testl	%ebx, %ebx
	je	L1082
	movl	96(%ebx), %eax
	testl	%eax, %eax
	je	L1083
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1083:
	subl	$12, %esp
	pushl	%ebx
	call	_WidgetDisposeEx
	addl	$16, %esp
L1082:
	subl	$12, %esp
	movl	_StartLogo, %ecx
	pushl	%ecx
	call	_destroy_bitmap
	movl	$0, _StartLogo
	addl	$16, %esp
	movl	-4(%ebp), %ebx
	leave
	ret
	.p2align 4,,15
.globl __DisposeAllAppWidgets
__DisposeAllAppWidgets:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$76, %esp
	movl	8(%ebp), %eax
	movl	12(%ebp), %edi
	movl	%eax, -76(%ebp)
	cmpl	%edi, 108(%eax)
	je	L1132
	movl	-76(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -72(%ebp)
	testl	%edx, %edx
	je	L1121
L1122:
	movl	-72(%ebp), %esi
	movl	-72(%ebp), %edx
	movl	88(%esi), %ebx
	cmpl	108(%edx), %edi
	movl	%ebx, -68(%ebp)
	je	L1133
	movl	-72(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -64(%ebp)
	testl	%edx, %edx
	je	L1090
L1131:
	movl	-64(%ebp), %esi
	movl	-64(%ebp), %eax
	movl	88(%esi), %ebx
	cmpl	108(%eax), %edi
	movl	%ebx, -40(%ebp)
	je	L1134
	movl	-64(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -60(%ebp)
	testl	%edx, %edx
	je	L1093
L1130:
	movl	-60(%ebp), %esi
	movl	-60(%ebp), %eax
	movl	88(%esi), %ebx
	cmpl	108(%eax), %edi
	movl	%ebx, -36(%ebp)
	je	L1135
	movl	-60(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -56(%ebp)
	testl	%edx, %edx
	je	L1096
L1129:
	movl	-56(%ebp), %esi
	movl	-56(%ebp), %eax
	movl	88(%esi), %ebx
	cmpl	108(%eax), %edi
	movl	%ebx, -32(%ebp)
	je	L1136
	movl	-56(%ebp), %ecx
	movl	92(%ecx), %edx
	movl	%edx, -52(%ebp)
	testl	%edx, %edx
	je	L1099
L1128:
	movl	-52(%ebp), %esi
	movl	-52(%ebp), %eax
	movl	88(%esi), %ebx
	cmpl	108(%eax), %edi
	movl	%ebx, -28(%ebp)
	je	L1137
	movl	-52(%ebp), %edx
	movl	92(%edx), %eax
	movl	%eax, -48(%ebp)
	testl	%eax, %eax
	je	L1102
	movl	-48(%ebp), %ebx
	cmpl	108(%eax), %edi
	movl	88(%ebx), %ecx
	movl	%ecx, -24(%ebp)
	je	L1138
L1103:
	movl	92(%eax), %eax
	movl	%eax, -44(%ebp)
	testl	%eax, %eax
	je	L1105
	movl	-44(%ebp), %ecx
	cmpl	108(%eax), %edi
	movl	88(%ecx), %edx
	movl	%edx, -20(%ebp)
	je	L1139
	.p2align 4,,7
L1106:
	movl	92(%eax), %esi
	testl	%esi, %esi
	je	L1108
	movl	88(%esi), %ebx
	cmpl	108(%esi), %edi
	movl	%ebx, -16(%ebp)
	je	L1140
	.p2align 4,,7
L1109:
	movl	92(%esi), %eax
	testl	%eax, %eax
	jne	L1124
	jmp	L1111
	.p2align 4,,7
L1141:
	movl	%ebx, %eax
L1124:
	movl	88(%eax), %ebx
	pushl	%ecx
	pushl	%ecx
	pushl	%edi
	pushl	%eax
	call	__DisposeAllAppWidgets
	addl	$16, %esp
	cmpl	92(%esi), %ebx
	jne	L1141
L1111:
	movl	-44(%ebp), %esi
	movl	-16(%ebp), %edx
	cmpl	92(%esi), %edx
	je	L1108
L1142:
	movl	%edx, %esi
	movl	88(%esi), %ebx
	cmpl	108(%esi), %edi
	movl	%ebx, -16(%ebp)
	jne	L1109
L1140:
	movl	96(%esi), %eax
	testl	%eax, %eax
	je	L1110
	pushl	%ebx
	pushl	%ebx
	pushl	%esi
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1110:
	subl	$12, %esp
	pushl	%esi
	call	_WidgetDisposeEx
	movl	-44(%ebp), %esi
	movl	-16(%ebp), %edx
	addl	$16, %esp
	cmpl	92(%esi), %edx
	jne	L1142
	.p2align 4,,7
L1108:
	movl	-48(%ebp), %ecx
	movl	-20(%ebp), %edx
	cmpl	92(%ecx), %edx
	je	L1105
L1143:
	movl	%edx, -44(%ebp)
	movl	%edx, %eax
	movl	-44(%ebp), %ecx
	cmpl	108(%eax), %edi
	movl	88(%ecx), %edx
	movl	%edx, -20(%ebp)
	jne	L1106
L1139:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1107
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1107:
	subl	$12, %esp
	movl	-44(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	movl	-48(%ebp), %ecx
	movl	-20(%ebp), %edx
	addl	$16, %esp
	cmpl	92(%ecx), %edx
	jne	L1143
L1105:
	movl	-52(%ebp), %eax
	movl	-24(%ebp), %edx
	cmpl	92(%eax), %edx
	je	L1102
L1144:
	movl	%edx, -48(%ebp)
	movl	%edx, %eax
	movl	-48(%ebp), %ebx
	cmpl	108(%eax), %edi
	movl	88(%ebx), %ecx
	movl	%ecx, -24(%ebp)
	jne	L1103
L1138:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1104
	pushl	%esi
	pushl	%esi
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1104:
	subl	$12, %esp
	movl	-48(%ebp), %esi
	pushl	%esi
	call	_WidgetDisposeEx
	movl	-52(%ebp), %eax
	movl	-24(%ebp), %edx
	addl	$16, %esp
	cmpl	92(%eax), %edx
	jne	L1144
L1102:
	movl	-56(%ebp), %ebx
	movl	-28(%ebp), %edx
	cmpl	92(%ebx), %edx
	je	L1099
	movl	%edx, -52(%ebp)
	jmp	L1128
L1136:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1098
	pushl	%esi
	pushl	%esi
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1098:
	subl	$12, %esp
	movl	-56(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
L1099:
	movl	-60(%ebp), %esi
	movl	-32(%ebp), %edx
	cmpl	92(%esi), %edx
	je	L1096
	movl	%edx, -56(%ebp)
	jmp	L1129
L1137:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1101
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1101:
	subl	$12, %esp
	movl	-52(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
	jmp	L1102
L1135:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1095
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1095:
	subl	$12, %esp
	movl	-60(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
L1096:
	movl	-64(%ebp), %ecx
	movl	-36(%ebp), %edx
	cmpl	92(%ecx), %edx
	je	L1093
	movl	%edx, -60(%ebp)
	jmp	L1130
L1134:
	movl	%eax, %edx
	movl	96(%eax), %eax
	testl	%eax, %eax
	je	L1092
	pushl	%esi
	pushl	%esi
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1092:
	subl	$12, %esp
	movl	-64(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
L1093:
	movl	-72(%ebp), %eax
	movl	-40(%ebp), %edx
	cmpl	92(%eax), %edx
	je	L1090
	movl	%edx, -64(%ebp)
	jmp	L1131
L1133:
	movl	96(%edx), %eax
	testl	%eax, %eax
	je	L1089
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1089:
	subl	$12, %esp
	movl	-72(%ebp), %eax
	pushl	%eax
	call	_WidgetDisposeEx
	addl	$16, %esp
L1090:
	movl	-76(%ebp), %edx
	movl	-68(%ebp), %ebx
	movl	%ebx, -72(%ebp)
	cmpl	92(%edx), %ebx
	jne	L1122
L1121:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
L1132:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	jmp	_WidgetDispose
	.p2align 4,,15
.globl _DisposeAllAppWidgets
_DisposeAllAppWidgets:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movl	_DeskTop, %eax
	testl	%eax, %eax
	je	L1147
	movl	8(%ebp), %edx
	pushl	%ecx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	call	__DisposeAllAppWidgets
	addl	$16, %esp
L1147:
	leave
	ret
	.p2align 4,,15
.globl _WidgetTimer
_WidgetTimer:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$236, %esp
	movl	_LastMouseMove, %ecx
	movl	_LastMouseMove+4, %ebx
	movl	_LastNotified+4, %edx
	movl	_LastNotified, %eax
	xorl	%ebx, %edx
	xorl	%ecx, %eax
	orl	%eax, %edx
	je	L1149
	movl	_ATime, %eax
	movl	_ATime+4, %esi
	subl	%ecx, %eax
	sbbl	%ebx, %esi
	cmpl	$0, %esi
	jbe	L1224
L1189:
	movl	_TopWidget, %edi
	movl	%ecx, _LastNotified
	movl	%ebx, _LastNotified+4
	movl	%edi, -240(%ebp)
	testl	%edi, %edi
	je	L1149
	movl	_Mouse, %eax
	movl	_KState, %ebx
	movl	$0, -64(%ebp)
	movl	8(%eax), %edi
	movl	4(%eax), %ecx
	movl	(%eax), %edx
	movl	%ebx, -60(%ebp)
	leal	-108(%ebp), %ebx
	movl	12(%eax), %esi
	movl	%edx, -52(%ebp)
	movl	_KState+4, %eax
	movl	%ebx, -236(%ebp)
	movl	$9, %edx
	movl	%eax, -56(%ebp)
	movl	%ecx, -48(%ebp)
	movl	%edi, -44(%ebp)
	movl	%esi, -40(%ebp)
	movl	$-61180, -68(%ebp)
	movl	$4, -72(%ebp)
	leal	-72(%ebp), %esi
	movl	-236(%ebp), %edi
	movl	%edx, %ecx
	rep movsl
	movl	-108(%ebp), %ecx
	movl	-104(%ebp), %eax
	movl	%eax, -172(%ebp)
	movl	%ecx, -168(%ebp)
	cmpl	$1, %ecx
	je	L1151
	cmpl	$-49146, %eax
	je	L1152
	cmpl	$4, %ecx
	je	L1153
	leal	-144(%ebp), %ebx
	.p2align 4,,7
L1158:
	movl	-172(%ebp), %eax
	movl	-168(%ebp), %edx
	movl	%eax, -104(%ebp)
	movl	%edx, -108(%ebp)
	movl	%ebx, %edi
	movl	-236(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	-240(%ebp), %edi
	movl	104(%edi), %esi
	testl	%esi, %esi
	js	L1225
L1154:
	movl	-240(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L1156
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1156:
	movl	-240(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L1157
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1157:
	movl	-240(%ebp), %esi
	movl	96(%esi), %ecx
	movl	%ecx, -240(%ebp)
	testl	%ecx, %ecx
	jne	L1158
	.p2align 4,,7
L1215:
	movl	_LastMouseMove, %ecx
	movl	_LastMouseMove+4, %ebx
L1149:
	movl	_LastToolTip+4, %edx
	movl	_LastToolTip, %eax
	xorl	%ebx, %edx
	xorl	%ecx, %eax
	orl	%eax, %edx
	je	L1188
	movl	_ATime, %eax
	movl	_ATime+4, %esi
	subl	%ecx, %eax
	sbbl	%ebx, %esi
	cmpl	$0, %esi
	jbe	L1226
L1190:
	movl	_WorkingFlags, %eax
	testb	$2, %al
	jne	L1188
	orl	$2, %eax
	movl	%ecx, _LastToolTip
	movl	_TopWidget, %ecx
	movl	%ebx, _LastToolTip+4
	movl	%eax, _WorkingFlags
	testl	%ecx, %ecx
	je	L1176
	movl	156(%ecx), %ebx
	testl	%ebx, %ebx
	je	L1176
	movl	_Mouse, %edx
	testb	$1, 105(%ecx)
	movl	4(%edx), %edi
	movl	(%edx), %eax
	movl	%edi, -176(%ebp)
	movl	%eax, -180(%ebp)
	je	L1177
	movl	-180(%ebp), %eax
	pushl	%esi
	pushl	%edi
	pushl	%eax
	pushl	%ecx
	call	*%ebx
	addl	$16, %esp
	movl	%eax, -184(%ebp)
L1178:
	leal	-20(%ebp), %ecx
	leal	-16(%ebp), %edx
	movl	-184(%ebp), %ebx
	movl	_default_font, %eax
	pushl	%ecx
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	call	_TextSize
	movl	_Mouse, %edi
	movl	44(%edi), %esi
	movl	-20(%ebp), %ebx
	movl	-16(%ebp), %edi
	movl	(%esi), %ecx
	movl	-180(%ebp), %esi
	movl	(%ecx), %edx
	addl	%edx, %esi
	movl	-176(%ebp), %edx
	leal	4(%esi,%edi), %ecx
	leal	4(%edx,%ebx), %eax
	leal	-36(%ebp), %ebx
	movl	%eax, (%esp)
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%ebx
	call	_RectAssign
	addl	$20, %esp
	pushl	$200
	call	_malloc
	movl	%eax, -240(%ebp)
	movl	$50, %ecx
	xorl	%eax, %eax
	movl	-240(%ebp), %edi
	rep stosl
	movl	-24(%ebp), %eax
	movl	-28(%ebp), %edx
	movl	-240(%ebp), %ecx
	addl	$16, %esp
	movl	%eax, -164(%ebp)
	movl	%edx, -160(%ebp)
	movl	-32(%ebp), %esi
	movl	-36(%ebp), %ebx
	testl	%ecx, %ecx
	je	L1180
	movl	-240(%ebp), %ecx
	movl	%eax, %edi
	movl	_StdWidgetClass, %eax
	subl	$12, %esp
	movl	%eax, (%ecx)
	movl	%edi, %eax
	subl	%esi, %eax
	movl	%edx, 12(%ecx)
	movl	%edx, 28(%ecx)
	movl	%ebx, 4(%ecx)
	movl	%esi, 8(%ecx)
	movl	%edi, 16(%ecx)
	movl	%ebx, 20(%ecx)
	movl	%esi, 24(%ecx)
	movl	%edi, 32(%ecx)
	pushl	%eax
	movl	%edx, %eax
	subl	%ebx, %eax
	pushl	%eax
	movl	%ecx, %eax
	addl	$52, %eax
	pushl	$0
	pushl	$0
	pushl	%eax
	call	_RectAssign
	movl	-240(%ebp), %eax
	movl	-160(%ebp), %edx
	movl	%ebx, 68(%eax)
	movl	%esi, 72(%eax)
	movl	%edx, 76(%eax)
	movl	%edi, 80(%eax)
	movl	%ebx, 36(%eax)
	movl	%esi, 40(%eax)
	movl	%edx, 44(%eax)
	movl	%edi, 48(%eax)
	movl	$1, 104(%eax)
	movl	$_Me, 108(%eax)
	movl	$_WidgetRefresh, 124(%eax)
	movl	$__WidgetRemove, 144(%eax)
	movl	$__WidgetInsert, 140(%eax)
	movl	$__WidgetSetFirstEx, 148(%eax)
	addl	$32, %esp
L1180:
	movl	-240(%ebp), %ebx
	movl	-184(%ebp), %edi
	movl	_DeskTop, %esi
	movl	%edi, 196(%ebx)
	movl	$_ToolTipDraw, 128(%ebx)
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%esi
	call	*140(%esi)
	movl	-240(%ebp), %eax
	addl	$16, %esp
	.p2align 4,,7
L1182:
	testb	$1, 104(%eax)
	je	L1181
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L1182
	subl	$12, %esp
	movl	-240(%ebp), %ecx
	pushl	%ecx
	call	_WidgetDrawAllEx
	addl	$16, %esp
L1181:
	movl	_Mouse, %eax
	movl	(%eax), %ebx
	cmpl	-180(%ebp), %ebx
	jne	L1184
	movl	-176(%ebp), %edx
	cmpl	4(%eax), %edx
	je	L1216
	jmp	L1184
	.p2align 4,,7
L1227:
	call	_PollEvents
	call	_TimersPoll
	call	_PollTasks
	movl	_Mouse, %eax
	cmpl	%ebx, (%eax)
	jne	L1184
	movl	-176(%ebp), %esi
	cmpl	4(%eax), %esi
	jne	L1184
L1216:
	movl	12(%eax), %ecx
	testl	%ecx, %ecx
	je	L1227
L1184:
	movl	-240(%ebp), %eax
	testl	%eax, %eax
	je	L1186
	movl	-240(%ebp), %ecx
	movl	96(%ecx), %eax
	testl	%eax, %eax
	je	L1187
	pushl	%edx
	pushl	%edx
	pushl	%ecx
	pushl	%eax
	call	*144(%eax)
	addl	$16, %esp
L1187:
	subl	$12, %esp
	movl	-240(%ebp), %ebx
	pushl	%ebx
	call	_WidgetDisposeEx
	addl	$16, %esp
L1186:
	subl	$12, %esp
	movl	-184(%ebp), %edi
	pushl	%edi
	call	_free
	addl	$16, %esp
L1176:
	movl	_WorkingFlags, %edx
	andl	$-3, %edx
	movl	%edx, _WorkingFlags
L1188:
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L1226:
	cmpl	$1999, %eax
	jbe	L1188
	jmp	L1190
	.p2align 4,,7
L1224:
	cmpl	$199, %eax
	jbe	L1149
	jmp	L1189
	.p2align 4,,7
L1151:
	leal	-144(%ebp), %esi
	movl	$9, %ebx
	movl	%esi, -244(%ebp)
	cmpl	$-49146, -172(%ebp)
	je	L1228
	.p2align 4,,7
L1212:
	movl	-172(%ebp), %edx
	movl	$1, -108(%ebp)
	movl	%edx, -104(%ebp)
	movl	-244(%ebp), %edi
	movl	-236(%ebp), %esi
	movl	%ebx, %ecx
	rep movsl
	movl	-240(%ebp), %eax
	movl	104(%eax), %ecx
	testl	%ecx, %ecx
	js	L1229
L1169:
	movl	-240(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L1170
	pushl	%ecx
	pushl	%ecx
	leal	-144(%ebp), %ecx
	pushl	%ecx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1170:
	movl	-240(%ebp), %esi
	movl	116(%esi), %eax
	testl	%eax, %eax
	je	L1171
	leal	-144(%ebp), %edi
	pushl	%edx
	pushl	%edx
	pushl	%edi
	pushl	%esi
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1171:
	movl	-240(%ebp), %esi
	movl	96(%esi), %eax
	movl	%eax, -240(%ebp)
	testl	%eax, %eax
	jne	L1212
	jmp	L1215
	.p2align 4,,7
L1225:
	cmpl	$1, -144(%ebp)
	jne	L1154
L1155:
	movl	-240(%ebp), %ecx
	movl	-140(%ebp), %esi
	pushl	%eax
	pushl	%esi
	pushl	%ecx
	pushl	$LC2
	call	_DebugMessage
	movl	-240(%ebp), %edx
	movl	-140(%ebp), %eax
	addl	$16, %esp
	movl	%eax, 112(%edx)
	movl	_LastMouseMove, %ecx
	movl	_LastMouseMove+4, %ebx
	jmp	L1149
	.p2align 4,,7
L1229:
	cmpl	$1, -144(%ebp)
	jne	L1169
	jmp	L1155
	.p2align 4,,7
L1177:
	subl	$12, %esp
	pushl	%ebx
	call	_TextDup
	addl	$16, %esp
	movl	%eax, -184(%ebp)
	jmp	L1178
L1153:
	movl	-172(%ebp), %ebx
	movl	%edx, %ecx
	movl	%ebx, -104(%ebp)
	leal	-144(%ebp), %ebx
	movl	$4, -108(%ebp)
	movl	%ebx, %edi
	movl	-236(%ebp), %esi
	rep movsl
	movl	-240(%ebp), %ecx
	movl	104(%ecx), %edx
	testl	%edx, %edx
	js	L1230
L1172:
	movl	-240(%ebp), %ecx
	movl	120(%ecx), %eax
	testl	%eax, %eax
	je	L1173
	pushl	%esi
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1173:
	movl	-240(%ebp), %edi
	movl	116(%edi), %eax
	testl	%eax, %eax
	je	L1215
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	movl	-240(%ebp), %ebx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	jmp	L1215
L1230:
	cmpl	$1, -144(%ebp)
	jne	L1172
	jmp	L1155
L1228:
	movl	$-49146, -104(%ebp)
	movl	$1, -108(%ebp)
	movl	%esi, %ebx
L1223:
	movl	%ebx, %edi
	movl	-236(%ebp), %esi
	movl	%edx, %ecx
	rep movsl
	movl	-240(%ebp), %edi
	movl	104(%edi), %esi
	testl	%esi, %esi
	js	L1231
L1167:
	movl	-240(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L1168
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1168:
	movl	-240(%ebp), %edx
	movl	116(%edx), %eax
	testl	%eax, %eax
	je	L1215
	pushl	%edx
	pushl	%edx
	pushl	%ebx
	movl	-240(%ebp), %ebx
	pushl	%ebx
	call	*%eax
	addl	$16, %esp
	movl	_LastMouseMove, %ecx
	movl	_LastMouseMove+4, %ebx
	jmp	L1149
L1231:
	cmpl	$1, -144(%ebp)
	jne	L1167
	jmp	L1155
L1152:
	cmpl	$4, -168(%ebp)
	je	L1159
	leal	-144(%ebp), %ebx
	.p2align 4,,7
L1163:
	movl	-168(%ebp), %eax
	movl	$-49146, -104(%ebp)
	movl	%eax, -108(%ebp)
	movl	%ebx, %edi
	movl	-236(%ebp), %esi
	movl	$9, %ecx
	rep movsl
	movl	-240(%ebp), %edx
	movl	104(%edx), %edi
	testl	%edi, %edi
	js	L1232
L1160:
	movl	-240(%ebp), %edx
	movl	120(%edx), %eax
	testl	%eax, %eax
	je	L1161
	pushl	%ecx
	pushl	%ecx
	pushl	%ebx
	pushl	%edx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1161:
	movl	-240(%ebp), %ecx
	movl	116(%ecx), %eax
	testl	%eax, %eax
	je	L1162
	pushl	%edi
	pushl	%edi
	pushl	%ebx
	pushl	%ecx
	call	*%eax
	addl	$16, %esp
	testl	%eax, %eax
	jne	L1215
L1162:
	movl	-240(%ebp), %ecx
	movl	96(%ecx), %edx
	movl	%edx, -240(%ebp)
	testl	%edx, %edx
	jne	L1163
	jmp	L1215
	.p2align 4,,7
L1232:
	cmpl	$1, -144(%ebp)
	jne	L1160
	jmp	L1155
L1159:
	movl	$-49146, -104(%ebp)
	movl	$4, -108(%ebp)
	leal	-144(%ebp), %ebx
	jmp	L1223
	.p2align 4,,15
.globl _WidgetResize
_WidgetResize:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	subl	$60, %esp
	movl	8(%ebp), %edi
	movl	36(%edi), %eax
	movl	12(%edi), %edx
	movl	8(%edi), %ebx
	movl	16(%edi), %ecx
	movl	%eax, -28(%ebp)
	movl	40(%edi), %esi
	movl	%esi, -24(%ebp)
	movl	44(%edi), %eax
	movl	%eax, -20(%ebp)
	movl	12(%ebp), %eax
	movl	48(%edi), %esi
	addl	%edx, %eax
	movl	%esi, -16(%ebp)
	movl	%eax, -68(%ebp)
	movl	52(%edi), %eax
	movl	16(%ebp), %esi
	movl	%eax, -44(%ebp)
	addl	%esi, %ecx
	movl	56(%edi), %esi
	movl	%esi, -40(%ebp)
	movl	-68(%ebp), %esi
	movl	60(%edi), %eax
	subl	%edx, %esi
	movl	%eax, -36(%ebp)
	movl	%esi, %edx
	movl	64(%edi), %eax
	movl	%eax, -32(%ebp)
	movl	60(%edi), %esi
	leal	(%ebx,%eax), %eax
	addl	%edx, %esi
	movl	16(%edi), %edx
	subl	%edx, %eax
	movl	%esi, 60(%edi)
	subl	%ebx, %eax
	addl	%ecx, %eax
	movl	%eax, 64(%edi)
	movl	%ebx, 8(%edi)
	movl	-68(%ebp), %esi
	movl	96(%edi), %eax
	movl	%ecx, 16(%edi)
	movl	%esi, 12(%edi)
	testl	%eax, %eax
	je	L1234
	pushl	%ecx
	movl	24(%eax), %ecx
	pushl	%ecx
	movl	20(%eax), %esi
	pushl	%esi
	movl	64(%eax), %edx
	pushl	%edx
	leal	-60(%ebp), %edx
	movl	60(%eax), %ebx
	pushl	%ebx
	movl	56(%eax), %ecx
	pushl	%ecx
	movl	52(%eax), %esi
	pushl	%esi
	pushl	%edx
	call	_RectMove
	addl	$28, %esp
	movl	-56(%ebp), %ebx
	movl	-60(%ebp), %ecx
	pushl	%ebx
	pushl	%ecx
	movl	16(%edi), %eax
	leal	20(%edi), %ecx
	pushl	%eax
	movl	12(%edi), %esi
	pushl	%esi
	movl	8(%edi), %edx
	pushl	%edx
	movl	4(%edi), %ebx
	pushl	%ebx
	pushl	%ecx
	call	_RectMove
	movl	96(%edi), %eax
	movl	20(%edi), %edx
	addl	$32, %esp
	cmpl	76(%eax), %edx
	jg	L1235
	movl	24(%edi), %ecx
	cmpl	80(%eax), %ecx
	jle	L1247
L1235:
	subl	$12, %esp
	leal	36(%edi), %ebx
	pushl	$-1
	pushl	$-1
	pushl	$0
	pushl	$0
	pushl	%ebx
	call	_RectAssign
	addl	$32, %esp
L1234:
	pushl	%esi
	movl	24(%edi), %esi
	pushl	%esi
	movl	20(%edi), %edx
	pushl	%edx
	leal	-60(%ebp), %edx
	movl	64(%edi), %ebx
	pushl	%ebx
	movl	60(%edi), %eax
	pushl	%eax
	movl	56(%edi), %ecx
	pushl	%ecx
	movl	52(%edi), %esi
	pushl	%esi
	pushl	%edx
	call	_RectMove
	addl	$20, %esp
	movl	48(%edi), %ebx
	movl	-48(%ebp), %edx
	pushl	%ebx
	movl	-52(%ebp), %ebx
	movl	44(%edi), %eax
	pushl	%eax
	movl	-56(%ebp), %eax
	movl	40(%edi), %ecx
	pushl	%ecx
	movl	-60(%ebp), %ecx
	movl	36(%edi), %esi
	pushl	%esi
	leal	68(%edi), %esi
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	pushl	%ecx
	pushl	%esi
	call	_RectIntersept
	movl	92(%edi), %edx
	addl	$48, %esp
	testl	%edx, %edx
	je	L1236
	subl	$12, %esp
	movl	64(%edi), %ebx
	movl	-32(%ebp), %edx
	pushl	%ebx
	movl	-36(%ebp), %ebx
	movl	60(%edi), %eax
	pushl	%eax
	movl	-40(%ebp), %eax
	movl	56(%edi), %ecx
	pushl	%ecx
	movl	-44(%ebp), %ecx
	movl	52(%edi), %esi
	pushl	%esi
	pushl	%edx
	pushl	%ebx
	pushl	%eax
	pushl	%ecx
	pushl	%edi
	call	__WidgetAutosize
	addl	$48, %esp
L1236:
	movl	%edi, %eax
	.p2align 4,,7
L1238:
	testb	$1, 104(%eax)
	je	L1237
	movl	96(%eax), %eax
	testl	%eax, %eax
	jne	L1238
	subl	$12, %esp
	pushl	%edi
	call	_WidgetDrawAllEx
	addl	$16, %esp
L1237:
	movl	-16(%ebp), %ebx
	movl	-24(%ebp), %ecx
	movl	-28(%ebp), %esi
	movl	-20(%ebp), %eax
	pushl	%ebx
	pushl	%eax
	pushl	%ecx
	pushl	%esi
	call	_NewListFromRect
	movl	48(%edi), %edx
	movl	%eax, %esi
	popl	%eax
	pushl	%edx
	movl	44(%edi), %ebx
	pushl	%ebx
	movl	40(%edi), %eax
	pushl	%eax
	movl	36(%edi), %ecx
	pushl	%ecx
	pushl	%esi
	call	_RemoveZoneInList
	movl	96(%edi), %ebx
	movl	_screen, %edx
	addl	$32, %esp
	movl	%edx, -64(%ebp)
	testb	$1, 104(%ebx)
	jne	L1248
L1240:
	subl	$12, %esp
	pushl	%esi
	call	_FreeList
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.p2align 4,,7
L1247:
	movl	28(%edi), %ebx
	cmpl	68(%eax), %ebx
	jl	L1235
	movl	32(%edi), %esi
	cmpl	72(%eax), %esi
	jl	L1235
	subl	$12, %esp
	pushl	80(%eax)
	pushl	76(%eax)
	pushl	72(%eax)
	movl	68(%eax), %eax
	pushl	%eax
	leal	36(%edi), %eax
	pushl	%esi
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%eax
	