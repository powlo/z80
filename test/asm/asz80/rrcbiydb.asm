;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
rrcbiydb:
	ld	iy,#iy_point
	ld	0HB(iy),#0H51
	rrc	0HB(iy)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,0HB(iy)
	cp	#0HA8
	jp	nz,	fail
	
	ld	0HB(iy),#0H51			; force generation of carry
	rrc	0HB(iy)
	ld	0HB(iy),#0H52
	rrc	0HB(iy)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,0HB(iy)
	cp	#0H29
	jp	nz,	fail

   ret