.globl	_ZNK8Cylinder7AreaAsmEv

_ZNK8Cylinder7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx), %eax
        mov 24(%eax), %edx      /* Cylinder::baseAreaAsm() */
        push %ebx
        call *%edx      /* Base area */

        /* le résultat se trouve dans st[0] */

        fstp -4(%ebp) /* on écrase le pointeur de fonction par notre résultat */
        
        mov 8(%ebp),%ebx
        mov (%ebx), %eax
        mov 32(%eax), %edx      /* Cylinder::LateralAreaAsm() */
        push %ebx
        call *%edx
        add $4, %esp 

        /* le résultat se trouve dans st[0] */

        fld -4(%ebp) /* on reprend le résultat */
        faddp

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
