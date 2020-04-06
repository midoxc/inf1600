.globl	_ZNK8Cylinder9VolumeAsmEv

_ZNK8Cylinder9VolumeAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx), %edx
        mov 24(%edx), %eax  /* Cylinder::BaseAreaAsm */
        push %ebx
        call *%eax
        add $4, %esp

        /* le résultat se trouve dans st[0] */

        mov 8(%ebp), %ebx
        
        fld 8(%ebx)
        fmulp
        

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
