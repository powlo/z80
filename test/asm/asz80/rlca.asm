;-------------------------------
;--     RLCA Test             --
;-------------------------------
rlca:

	ld	a,#0H80
	rlca
	jp	nc,	fail			; check flag

	cp	#0H01
	jp	nz,	fail
	
	ld	a,#0H80			; force generation of carry
	rlca
	ld	a,#0H53
	rlca
	jp	c,	fail			; check flag

	cp	#0HA6
	jp	nz,	fail

   ret