;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
rrcbhlb:
	ld	hl,#hl_point
	ld	(hl),#0H51
	rrc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,(hl)
	cp	#0HA8
	jp	nz,	fail
	
	ld	(hl),#0H51			; force generation of carry
	rrc	(hl)
	ld	(hl),#0H52
	rrc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,(hl)
	cp	#0H29
	jp	nz,	fail

   ret