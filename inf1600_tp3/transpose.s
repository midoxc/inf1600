.globl matrix_transpose_asm

matrix_transpose_asm:
        push %ebp       /* save old base pointer */
        mov %esp, %ebp  /* set ebp to current esp */
        
        mov $0, %ecx    /* r = %ecx */
        mov $0, %ebx    /* c = %ebx */

        jmp condition_1

for : 
        mov matorder, %eax
        imul %ebx, %eax
        add %ecx, %eax
        mov (inmatdata, %eax), %edx
        push %edx

        mov matorder, %eax
        imul %ecx, %eax
        add %ebx, %eax
        pop %edx
        mov %edx, (outmatdata, %eax)
increment_2 :
        inc %ebx
condition_2 :
        mov matorder, %eax
        cmp %ebx, %eax
        jg for
increment_1 :
        inc %ecx
condition_1 : 
        mov matorder, %eax
        cmp %ecx, %eax
        jg condition_2

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
