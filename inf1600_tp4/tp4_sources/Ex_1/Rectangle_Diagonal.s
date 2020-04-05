.globl	_ZNK9Rectangle11DiagonalAsmEv

_ZNK9Rectangle11DiagonalAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp), %ebx
        mov 4 (%ebx),%eax /*Pour la longueur*/
        mov 8 (%ebx),%edx /*Pour la largeur*/
        fld %eax
        fld %eax
        fmulp 
        fld %edx
        fld %edx
        fmulp
        fld %eax
        faddp
        fsqrt
        fstp %eax /*La valeur de la diagonale va etre dans eax*/
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
