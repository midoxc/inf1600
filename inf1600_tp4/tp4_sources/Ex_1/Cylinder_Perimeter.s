.globl	_ZNK8Cylinder12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK8Cylinder12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        fld (factor)
        fldpi
        fmulp           /* 2*pi */

        mov 8(%ebp), %ebx
        fld 4(%ebx)         /* Pour le Rayon */
        fmulp               /* Le diamètre total */

        leave          /* restore ebp and esp */
        ret            /* return to the caller */
        
