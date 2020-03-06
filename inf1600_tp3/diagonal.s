.global matrix_diagonal_asm

matrix_diagonal_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

        mov $0, %ecx            /* r = %ecx */
        mov $0, %ebx            /* c = %ebx */

        jmp condition_1

if : 
        mov matorder, %eax
        imul %ecx, %eax
        add %ebx, %eax

        cmp %ecx, %ebx
        jne else

        mov (inmatdata, %eax), %edx
        mov %edx, (outmatdata, %eax)

        jmp increment_2
else :
        mov $0, (outmatdata, %eax)
increment_2 :
        inc %ebx
condition_2 :
        mov matorder, %eax
        cmp %ebx, %eax
        jg if
increment_1 :
        inc %ecx
condition_1 : 
        mov matorder, %eax
        cmp %ecx, %eax
        jg condition_2

        leave          			/* Restore ebp and esp */
        ret            			/* Return to the caller */

