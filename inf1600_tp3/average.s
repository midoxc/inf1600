.global matrix_row_aver_asm

matrix_row_aver_asm:
        push %ebp      			/* Save old base pointer */
        mov %esp, %ebp 			/* Set ebp to current esp */

        mov $0, %ecx            /* r = %ecx */
        mov $0, %ebx            /* c = %ebx */
        mov $0, %edi            /* elem = %edi */

        jmp condition_1
for : 
        mov matorder, %eax
        imul %ecx, %eax
        add %ebx, %eax
        mov (inmatdata1, %eax), %edx
        add %edx, %edi
increment_2 :
        inc %ebx
condition_2 :
        mov matorder, %eax
        cmp %ebx, %eax
        jg for

        mov matorder, %edx
        mov %edi, %eax
        idiv %edx
        mov %eax, (outmadata, %ecx)
increment_1 :
        inc %ecx
condition_1 : 
        mov matorder, %eax
        cmp %ecx, %eax
        jg condition_2
		
        leave          			/* Restore ebp and esp */
        ret           			/* Return to the caller */
		
