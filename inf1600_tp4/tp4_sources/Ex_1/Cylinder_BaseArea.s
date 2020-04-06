        .globl	_ZNK8Cylinder11BaseAreaAsmEv

_ZNK8Cylinder11BaseAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx /* le pointeur de la classe */
        
        fld 4(%ebx) /* radius_ */
        fld 4(%ebx)
        fmulp           /* radius_ * radius_ */
        
        fldpi
        fmulp           /* resultat * pi */   
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
