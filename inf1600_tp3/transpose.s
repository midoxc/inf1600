.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp       /* save old base pointer */
        mov %esp, %ebp  /* set ebp to current esp */
        
        #on push r et c sur la pile
	push	$0
        push    $0
	jmp	.for_r
.transpose:
        
        # *(inmatdata + (c + matorder * r ) * 4 ) -> edx, mm bloc que dans equals.s , s'y référer pour plus de détail
	movl	-8(%ebp), %eax
	imull	16(%ebp), %eax
	movl	-4(%ebp), %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %ecx

        # *(inmatdata + (c + matorder * r ) * 4 ) -> *(outmatdata + (r + matorder * c ) * 4), mm chose quen haut, mais avec quelques variables changées
	movl	-4(%ebp), %eax
	imull	16(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	%ecx, (%eax,%edx,4) # cette fois ci, on affecte la valeur trouvé au premier bloc à l'élément pointé par l'adresse calculé au 2e bloc
.increment_c:
	incl	-8(%ebp)
.for_c:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.transpose

        #on remet c à zero si on sort de la boucle
        movl	$0, -8(%ebp)
.increment_r:
	incl	-4(%ebp)
        
.for_r:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.for_c

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
