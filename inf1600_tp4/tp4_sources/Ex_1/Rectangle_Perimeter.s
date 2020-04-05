.globl	_ZNK9Rectangle12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK9Rectangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp), %ebx
        lea 4 (%ebx) ,%eax /* Pour la longueur */
        lea 8 (%ebx), %edx /* Pour la largeur */
        fld %eax
        fld %eax
        faddp       /*  2 * Longueur */ 
        fld %edx
        faddp       /* 2 * Longueur + largeur */ 
        fld %edx
        faddp       /* 2 (Longueur + largeur) */
        fsqrt
        fstp %eax /* Le perimetre total est dans eax */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
