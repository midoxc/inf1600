.globl	_ZNK9Rectangle7AreaAsmEv

_ZNK9Rectangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp),%ebx
        fld 4 (%ebx) /* Pour la longueur */
        fld 8 (%ebx) /* Pour la largeur */
        fmulp /* Longueur * largeur */

        /* le résultat doit rester sur la stack */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
