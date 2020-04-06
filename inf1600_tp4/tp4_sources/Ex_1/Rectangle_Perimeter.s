.globl	_ZNK9Rectangle12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK9Rectangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp), %ebx
        fld 4 (%ebx) /* Pour la longueur */
        fld 8 (%ebx) /* Pour la largeur */
        faddp       /* Longueur + largeur */ 
        fld (factor)
        fmulp       /* 2 * (Longueur + largeur) */ 

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
