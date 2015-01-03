;-------------------------------------
;	Negate
;-------------------------------------
neg:
	ld		a,#0H53
	neg
	cp		#0HAD
	jp		nz,fail
	
	ld		a,#0H00
	neg
	cp		#0H00
	jp		nz,fail
	
	ld		a,#0HFF
	neg
	cp		#0H01
	jp		nz,fail
	
	ld		a,#0H01
	neg
	cp		#0HFF
	jp		nz,fail
	
	ld		a,#0H1F
	neg
	cp		#0HE1
	jp		nz,fail
	
	ld		a,#0HF8
	neg
	cp		#0H08
	jp		nz,fail

   ret
