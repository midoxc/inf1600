.globl matrix_equals_asm

matrix_equals_asm:
        push %ebp       /* Save old base pointer */
        mov %esp, %ebp  /* Set ebp to current esp */

        mov $0, %ecx    /* r = %ecx */
        mov $0, %ebx    /* c = %ebx */

        jmp condition_1

if : 
        mov matorder, %eax
        imul %ecx, %eax
        add %ebx, %eax
        mov (inmatdata1, %eax), %edx
        mov (inmatdata2, %eax), %eax

        cmp %edx, %eax
        je return:
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
        jmp return_1
return_0:
        move $0, %eax
        jmp last
return_1:
        move $1, %eax
last:
        leave          /* Restore ebp and esp */
        ret            /* Return to the caller */
