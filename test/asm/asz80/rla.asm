;-------------------------------
;--     RLA Test              --
;-------------------------------

rla:
	ld	a,#0H80
	rla

	jp	nc,	fail			; check flag

	cp	#0H00
	jp	nz,	fail
	
	ld	a,#0H80			; force generation of carry
	rla
	ld	a,#0H53
	rla

	jp	c,	fail			; check flag

	cp	#0HA7
	jp	nz,	fail

   ret