.globl	_ZNK8Cylinder9VolumeAsmEv

_ZNK8Cylinder9VolumeAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov 4(%ebx), %eax /* Pour la rayon */
        mov 8 (%ebx), %edx
        fld %eax
        fld %eax
        fmulp
        fldpi
        fmulp /* Pi*r'2 est dans %eax */
        fld %edx
        fmulp  /*Multiplication avec la hauteur */
        fstp %eax /* La valeur du volume est dans eax */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
