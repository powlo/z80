;-------------------------------------
;	SCF
;-------------------------------------
scf:
	ld		a,#0H01
	ld		b,#0H01
	add	b
	jp		c,fail		; force no carry
	jp		z,fail		
	jp		pe,fail		
	jp		m,fail		

	scf					; set the carry flag
	jp		nc,fail
	jp		z,fail		
	jp		pe,fail		
	jp		m,fail		

   cp    #0H02
   jp    nz, fail
   
   ret