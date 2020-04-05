.globl	_ZNK8Cylinder12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK8Cylinder12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov 4(%ebx), %eax /* Pour la hauteur */
        mov 8(%ebx), %edx /* Pour le Rayon */
        fld %eax
        fld %eax
        faddp /* La longueur totale dans %eax*/
        fld %edx
        fldpi
        fmulp
        faddp /* 2*Pi *r dans %edx */
        faddp /* La largeur totale de %edx */
        fld %eax
        faddp
        fstp %eax /* Perimetre total dans %eax */
        
        
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
