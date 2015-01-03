;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
rrcbixdb:
	ld	ix,#ix_point
	ld	0H9(ix),#0H51
	rrc	0H9(ix)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,0H9(ix)
	cp	#0HA8
	jp	nz,	fail
	
	ld	0H9(ix),#0H51			; force generation of carry
	rrc	0H9(ix)
	ld	0H9(ix),#0H52
	rrc	0H9(ix)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,0H9(ix)
	cp	#0H29
	jp	nz,	fail

   ret