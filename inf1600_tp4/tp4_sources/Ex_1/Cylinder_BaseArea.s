        .globl	_ZNK8Cylinder11BaseAreaAsmEv

_ZNK8Cylinder11BaseAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx // le pointeur de la classe est dans %ebx
        mov 4(%ebx), %edx // radius_ est dans %edx  = 2

        fld %edx
        fld %edx
        fmulp
        fldpi
        fmulp
        fstp %eax
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
