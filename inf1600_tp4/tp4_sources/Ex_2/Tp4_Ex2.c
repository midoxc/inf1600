
#include <stdio.h>

unsigned int change_endianness(unsigned int x)
{
	unsigned int y;
	
	asm volatile (
		"movl %1, %%ebx;"
		"bswap %%ebx;"
		"movl %%ebx, %0;"
		: "=r" (y) // sorties (s'il y a lieu)
		: "r" (x) // entrées
		: "%ebx" // registres modifiés (s'il y a lieu)
	);
    
	return y;
}

int main()
{
	unsigned int data = 0xff1122ee;

	printf("Donnée en little-endian: %08x\n"
	       "Donnée en big-endian   : %08x\n"
	       "Donnée en little-endian: %08x\n",
	       data,
	       change_endianness(data),
           change_endianness(change_endianness(data))
           );

	return 0;
}
