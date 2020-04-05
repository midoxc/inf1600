.globl	_ZNK8Cylinder7AreaAsmEv

_ZNK8Cylinder7AreaAsmEv:
        push %ebp      /* save old base pointer */
        mov %esp, %ebp /* set ebp to current esp */
        
        mov 8(%ebp), %ebx
        mov 4(%ebx), %eax /* Pour la hauteur */
        mov 8(%ebx), %edx /* Pour le rayon */
        fld %eax
        fld %edx
        fmulp
        fldpi
        fmulp  /*Multiplication avec Pi */
        mov %eax, 2 /* Apparition de la valeur 2 */
        fld %eax 
        fmulp
        fstp %eax /* La valeur de l'aire est dans eax */
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
