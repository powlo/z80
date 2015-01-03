
;-------------------------------
;--     RRA Test              --
;-------------------------------
rra:
	ld	a,#0H51
	rra

	jp	nc,	fail			; check flag

	cp	#0H28
	jp	nz,	fail
	
	ld	a,#0H51			; force generation of carry
	rra
	ld	a,#0H52
	rra

	jp	c,	fail			; check flag

	cp	#0HA9
	jp	nz,	fail
	
   ret