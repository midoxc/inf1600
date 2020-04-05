.globl	_ZNK8Cylinder7AreaAsmEv

_ZNK8Cylinder7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx), %eax
        mov 32(%eax), %edx
        push %ebx
        call *%edx /* Base area */
        fld %eax
        
        mov 8(%ebp),%ebx
        mov (%ebx), %eax
        mov 40(%eax), %edx
        push %ebx
        call *%edx
        fld %eax /* Lat. area */
        
        faddp
        fstp %eax
    
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
