.globl	_ZNK8Cylinder14LateralAreaAsmEv

_ZNK8Cylinder14LateralAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx),%edx     /* pointeur de vtable */
        mov 12(%edx),%eax   /* Cylinder::perimeterAsm */
        push %ebx
        call *%eax
        
        push %eax
        mov 8(%ebp),%ebx
        fld 4(%ebx)     
        fld (%esp)
        fmulp
       
        fstp (%esp)       
        pop %eax
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
