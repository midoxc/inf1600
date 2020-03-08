.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

        push	$0
        push	$0

	jmp	.for_r
.if:
        #on a besoin de (c + matorder * r ) pour le if et le else , donc on la calcule avant le jump
	movl	-4(%ebp), %eax
	imull	16(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
        
        #jump à else si r != c
	movl	-8(%ebp), %eax
	cmpl	-4(%ebp), %eax
	jne	.else

        #on calcule *(inmatdata + (c + matorder * r ) * 4 ) -> ecx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %ecx

        #on affecte *(inmatdata + (c + matorder * r ) * 4 ) -> *(outmatdata + (c + matorder * r ) * 4 )
	movl	12(%ebp), %eax
	movl	%ecx, (%eax,%edx,4)

	jmp	.increment_c
.else:
        #on affecte 0 à *(outmatdata + (c + matorder * r ) * 4 )
	movl	12(%ebp), %eax
	movl	$0, (%eax,%edx,4)
.increment_c:
	incl	-8(%ebp)
.for_c:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.if

	movl	$0, -8(%ebp)
.increment_r:
	incl	-4(%ebp)
.for_r:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.for_c

        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

