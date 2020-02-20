.global func_s

func_s:
	/* Votre programme assembleur ici... */
	
	flds e
	flds b
	fmulp

	flds g
	faddp

	flds d
	fdivrp

	fstps c

	flds g
	flds f
	fsubrp

	fstps a

	flds d
	flds e
	faddp

	flds a
	fdivp

	flds c
	fmulp

	fstps a 

	ret
