.globl	_ZNK8Cylinder9VolumeAsmEv

_ZNK8Cylinder9VolumeAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        
        mov 8(%ebp), %ebx
        mov (%ebx), %edx
        mov 32(%edx), %eax  /* Cylinder::BaseAreaAsm */
        push %ebx
        call *%eax
        push %eax      /* push le resultat sur la stack */
        fld (%esp)     /* pour pouvoir le load sur le float stack */
        
        mov 8(%ebp), %ebx
        fld 4(%ebx)
        fmulp
        fstp (%esp)
        pop %eax
       
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
