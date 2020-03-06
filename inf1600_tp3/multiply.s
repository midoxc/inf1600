.globl matrix_multiply_asm

matrix_multiply_asm:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov $0, %ecx            /* r = %ecx */
        mov $0, %ebx            /* c = %ebx */
        mov $0, %esi            /* i = %esi */
        mov $0, %edi            /* elem = %edi */

        jmp condition_1
for : 
        mov matorder, %eax
        imul %ecx, %eax
        add %esi, %eax
        mov (inmatdata1, %eax), %edx
        push %edx

        mov matorder, %eax
        imul %esi, %eax
        add %ebx, %eax
        mov (inmatdata2, %eax), %edx
        pop %eax

        imul %edx, %eax
        add %eax, %edi
increment_3 :
        inc %esi
condition_3 :
        mov matorder, %eax
        cmp %esi, %eax
        jg for

        mov matorder, %eax
        imul %ecx, %eax
        add %ebx, %eax
        mov %edi, (outmatdata, %eax)
increment_2 :
        inc %ebx
condition_2 :
        mov matorder, %eax
        cmp %ebx, %eax
        jg condition_3
increment_1 :
        inc %ecx
condition_1 : 
        mov matorder, %eax
        cmp %ecx, %eax
        jg condition_2
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
