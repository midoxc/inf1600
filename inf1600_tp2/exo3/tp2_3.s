.data
	/* Votre programme assembleur ici... */
	i:
		.long 10

.global func_s

func_s:	
	/* Votre programme assembleur ici... */

	mov $0,%edx
	jmp condition

boucle:

	mov d, %eax
	mov c, %ebx
	sub %eax, %ebx
	mov b, %eax
	add %ebx, %eax
	mov %eax, a  

	//condition if
	mov c, %eax
	add $1000, %eax
	mov e, %ebx
	sub $500, %ebx
	cmp %eax, %ebx
	jl if

	mov c, %eax
	mov d, %ebx
	sub %ebx,%eax
	mov %eax, c 
	
	mov b, %eax
	sub $300, %eax
	mov %eax, b

	jmp continue
if:
	mov e, %eax
	sub $300, %eax
	mov %eax, e

	//condition if

	mov b, %ebx
	mov c, %eax
	cmp %ebx, %eax
	jnle continue

	mov c, %eax
	add $300, %eax
	mov %eax, c 

continue :
	add $1, %edx

condition:
	cmp i, %edx
	jna boucle

	ret
