; *******************************
; IN A, nn
; *******************************
inann:
	
	ld	a,#0H01
	out	(#0H00),a
	ld	a,#0H00
	in		a,(#0H00)

	cp	#0H01
	jp	nz,	fail
	
	ld	a,#0HFF
	out	(#0H37),a
	ld	a,#0H00
	in		a,(#0H37)

	cp	#0HFF
	jp	nz,	fail
	
   ret
