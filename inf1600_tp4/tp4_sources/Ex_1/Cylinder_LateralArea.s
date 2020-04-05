.globl	_ZNK8Cylinder14LateralAreaAsmEv

_ZNK8Cylinder14LateralAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx),%edx
        mov 8(%edx),%eax
        push %ebx
        call *%eax
        
        mov 8(%ebp),%ebx
        mov 4(%ebx),%edx
        fld %edx
        fld %eax
        fmulp
       
        fstp %eax 
       
       
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
