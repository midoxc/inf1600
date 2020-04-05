        .globl	_ZNK8Cylinder11BaseAreaAsmEv

_ZNK8Cylinder11BaseAreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx // le pointeur de la classe est dans %ebx
        mov 4(%ebx), %edx // radius_ est dans %edx

        fld %edx
        fld %edx
        fmulp           //radius_ * radius_
        fldpi
        fmulp           //resultat * pi
        fstp %eax       //on retourne le résultat dans %eax
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
