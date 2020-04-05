.globl	_ZNK9Rectangle12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK9Rectangle12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp), %ebx
        mov 4 (%ebx) ,%eax /* Pour la longueur */
        mov 8 (%ebx), %edx /* Pour la largeur */
        fld %eax
        fld %eax
        faddp       /* Calcul de la longueur totale */ 
        fld %edx
        fld %edx
        faddp       /* Calcul de la largeur totale */    
        fld %eax
        faddp           
        fsqrt %eax /* Le perimetre total est dans eax */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
