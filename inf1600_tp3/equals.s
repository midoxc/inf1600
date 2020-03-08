.globl matrix_equals_asm

matrix_equals_asm:
	push %ebp       /* Save old base pointer */
	movl %esp, %ebp  /* Set ebp to current esp */

	#on push r et c sur la pile, r est à -4(%ebp) et c est à -8(%ebp).
	push	$0
	push	$0
	jmp	.for_r
	
.if:
	#on va seulement documenter un des deux blocs, car ils font la même chose, pour 2 matrices différentes
	
	#premier bloc, ici, on fait inmatdata1[c + r * matorder]
	#on commence donc par aller chercher la valeur de matorder et de la multiplier avec r, puis on ajoute c.
	movl	-4(%ebp), %eax          #r -> eax
	imull	16(%ebp), %eax          #matorder * r -> eax
	movl	-8(%ebp), %edx          #c -> edx
	addl	%eax, %edx              #c + matorder * r -> edx
	#ensuite, on prend la valeur de inmatdata1, qui est l'adresse du premmier chiffre dans la matrice.
	#on ajoute y la valeur calculé dans edx, pour se placer à l'adresse du chiffre qu'on veut obtenir.
	movl	8(%ebp), %eax           #inmatdata1* -> eax
	movl	(%eax,%edx,4), %ecx     # *(inmatdata1 + (c + matorder * r ) * 4) -> edx, on fait *4 car chaque int a une taille de 4 bytes

	#deuxième bloc, fait la même chose que le premier bloc, inmatdata2[c + r * matorder]
	movl	-4(%ebp), %eax
	imull	16(%ebp), %eax
	movl	-8(%ebp), %edx
	addl	%eax, %edx
	movl	12(%ebp), %eax
	movl	(%eax,%edx,4), %eax
	
	#on compare les deux valeurs trouvés, soit les deux chiffres à l'adresse inmatdata(1 et 2) + c + r * matorder
	#s'il y a egalité entre les deux valeurs, on continue la deuxieme boucle for
	cmpl	%eax, %ecx
	je	.increment_c

	#si non égal, on retourne 0
	movl	$0, %eax
	jmp	.fin

.increment_c:
	incl	-8(%ebp) 

.for_c:
	#on compare c et matorder
	movl	-8(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.if                     # jump if matorder > c

	#si la boucle 2 termine, on remet c à 0
	movl    $0, -8(%ebp)

.increment_r:    
	incl	-4(%ebp)

.for_r:
	#on compare r et matorder
	movl	-4(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	.for_c                  # jump if matorder > r
        
	#si la boucle 1 termine, on retourne 1
	movl	$1, %eax
.fin:
	leave          /* Restore ebp and esp */
	ret            /* Return to the caller */
