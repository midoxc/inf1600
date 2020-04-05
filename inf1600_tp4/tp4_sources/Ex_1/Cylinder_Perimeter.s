.globl	_ZNK8Cylinder12PerimeterAsmEv

factor: .float 2.0 /* use this to mult by two */

_ZNK8Cylinder12PerimeterAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        /* Pour le Rayon */
        /* Pour le Hauteur */
        flds 4(%ebx)
        flds 4(%ebx)     /* Avant on avait mis fld %eax */
        faddp           /* Le diamètre total*/
        flds 8(%ebx)    /* Avant on vait mis fld %edx */
        fldpi
        fmulp
        sub $4,%esp

        fstps (%esp)    /* Perimetre total dans %eax */
        pop %eax
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
        
