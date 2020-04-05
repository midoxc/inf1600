.globl	_ZNK8Cylinder12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK8Cylinder12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */

        mov 4(%ebx), %eax /* Pour la Rayon */
        mov 8(%ebx), %edx /* Pour le Hauteur */
        fld %eax
        fld %eax
        faddp /* Le diamètre total*/
        fld %edx
        fldpi
        fmulp
        fstp %eax /* Perimetre total dans %eax */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
        