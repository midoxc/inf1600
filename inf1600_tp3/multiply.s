.globl matrix_multiply_asm

matrix_multiply_asm:
	push %ebp      /* save old base pointer */
	mov %esp, %ebp /* set ebp to current esp */
	
	#on alloue de la place pour r,c,i et elem
	push	$0
	push	$0
	push	$0
	push	$0
	jmp	.for_r

.multiply:

	# *(inmatdata1 + (i + matorder * r ) * 4 ) -> ecx
	movl	-4(%ebp), %eax		
	#à la différence du bloc de equals.s, matorder se situe dans 20(%ebp)
	imull	20(%ebp), %eax	
	#on ajoute i à matorder * r, qui se trouve à -12(%ebp) 
	movl	-12(%ebp), %edx
	addl	%eax, %edx
	#le pointeur de la première matrice inmatdata1 est à 8(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax,%edx,4), %ecx

	# *(inmatdata2 + (c + matorder * i ) * 4 ) -> eax
	movl	-12(%ebp), %eax
	imull	20(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
	#le pointeur de la deuxième matrice inmatdata2 est à 12(%ebp)
	movl	12(%ebp), %eax
	movl	(%eax,%edx,4), %eax
        
	#on multiplie les deux valeurs et on les ajoute à elem
	imull	%ecx, %eax
	addl	%eax, -16(%ebp)

.increment_i:
	incl	-12(%ebp)

.for_i:
	#le bloc for_i se base sur celui de for_r et for_c. 
	#la condition est la même: jump if (i < matorder)
	movl	-12(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.multiply
    
	#lorsque la boucle (i < matorder) termine, on exécute ce bloc:
	#on affecte elem à *(outmatdata + (c + matorder * r ) * 4 ) 
	movl	-4(%ebp), %eax
	imull	20(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
	movl	16(%ebp), %eax
	movl    -16(%ebp), %ecx
	movl	%ecx, (%eax,%edx,4)

.increment_c:
	incl	-8(%ebp)

	#réinitialise i et elem à 0 lorsque la for_i fini
	movl	$0, -16(%ebp)
	movl	$0, -12(%ebp)

.for_c:
	movl	-8(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.for_i
.increment_r:
	incl	-4(%ebp)

	#réinitialise c lorsque for_c fini
	movl	$0, -8(%ebp)
.for_r:
	movl	-4(%ebp), %eax
	cmpl	20(%ebp), %eax
	jl	.for_c

	leave          /* restore ebp and esp */
	ret            /* return to the caller */
