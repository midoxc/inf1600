.globl	_ZNK8Cylinder14LateralAreaAsmEv

_ZNK8Cylinder14LateralAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx),%edx     /* pointeur de vtable */
        mov 4(%edx),%eax   /* Cylinder::perimeterAsm */
        push %ebx
        call *%eax
        add $4, %esp

        /* le résultat se trouve dans st[0] */
        
        mov 8(%ebp),%ebx
        fld 8(%ebx)
        fmulp

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
