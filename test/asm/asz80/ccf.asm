;-------------------------------------
;	CCF
;-------------------------------------
ccf:
	ld		a,#0HFF
	ld		b,#0H01
	add	b
	jp		nc,fail		; force a carry
   jp    m, fail
   jp    nz, fail
   jp    pe, fail
   
	ccf					; clear the carry flag

	jp		c,fail
   jp    m, fail
   jp    nz, fail
   jp    pe, fail
   
   cp    #0H00
   jp    nz, fail
   
   ret