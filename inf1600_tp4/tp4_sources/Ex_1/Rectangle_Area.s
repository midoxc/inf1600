.globl	_ZNK9Rectangle7AreaAsmEv

_ZNK9Rectangle7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp),%ebx
        mov 4 (%ebx),%eax  /* Pour la longueur */
        mov 8 (%ebx),%edx  /* Pour la largeur */
        fld %eax
        fld %edx
        fmulp /* L'aire total du rectangle est dans %eax et %edx*/
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
