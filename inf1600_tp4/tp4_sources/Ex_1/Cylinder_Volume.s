.globl	_ZNK8Cylinder9VolumeAsmEv

_ZNK8Cylinder9VolumeAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov (%ebx), %edx
        mov 32(%edx), %eax
        push %ebx
        call *%eax
        fld %eax          /* Base area */
        
        mov 8(%ebp), %ebx
        mov 4(%ebx), %edx /* height */
        fld %edx
        fmulp
        fstp %eax
       
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
