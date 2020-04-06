.globl	_ZNK9Rectangle11DiagonalAsmEv

_ZNK9Rectangle11DiagonalAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8 (%ebp), %ebx
        fld 4 (%ebx) /* Pour la longueur */
        fld 4 (%ebx)
        fmulp

        sub $4, %esp
        fstp (%esp) /* on garde le résultat sur la stack */
        fld 8 (%ebx) /* Pour la largeur */
        fld 8 (%ebx)
        fmulp 

        fld (%esp) /* on remet lautre résultat */
        faddp
        fsqrt
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
        