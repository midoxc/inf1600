.globl	_ZNK8Cylinder14LateralAreaAsmEv

_ZNK8Cylinder14LateralAreaAsmEv:
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
        fmulp   /* La valeur de l'aire est dans eax (2Pirh) */
       
        
        leave          /* restore ebp and esp */
        ret            /* return to the caller */
