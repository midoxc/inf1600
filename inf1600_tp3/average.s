.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

        #alloue r,c, elem
        push $0
        push $0
        push $0

	jmp	.for_r
.average:
        #on calcule elem + *(inmatdata + (c + matorder * r ) * 4 ) -> elem
        movl	-4(%ebp), %eax
	imull	16(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	addl	%eax, -12(%ebp)
.increment_c:
	incl	-8(%ebp)
.for_c:
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.average

        #on affecte *(outmatdata + r) à elem/matorder
        # elem/matorder avant
	movl	-12(%ebp), %eax
        movl    $0, %edx        #on reset edx à zéro pour que le résultat de la division entière 
                                #soit entièrement dans %eax, et qu'on divise seulement eax et non pas edx:eax
	idivl	16(%ebp)

        # puis, on calcule *(outmatdata + r) et on lui affecte elem/matorder
	movl	-4(%ebp), %ecx
	movl	12(%ebp), %edx
	movl	%eax, (%edx,%ecx,4)
.increment_r:
	incl	-4(%ebp)

        #réinitialise elem et c lorsque for_c fini
        movl	$0, -12(%ebp)
	movl	$0, -8(%ebp)
.for_r:
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.for_c

        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
