;-------------------------------
;--     RRCA Test             --
;-------------------------------
rrca:
	ld	a,#0H51
	rrca

	jp	nc,	fail			; check flag

	cp	#0HA8
	jp	nz,	fail
	
	ld	a,#0H51			; force generation of carry
	rrca
	ld	a,#0H52
	rrca

	jp	c,	fail			; check flag

	cp	#0H29
	jp	nz,	fail
   
   ret