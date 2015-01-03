;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
rlbixdb:
   ld ix,#ix_point
	ld	0H8(ix),#0H80
	rl	0H8(ix)

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,0H8(ix)
	cp	#0H00
	jp	nz,	fail
	
	ld	0H8(ix),#0H80			; force generation of carry
	rl	0H8(ix)
	ld	0H8(ix),#0H53
	rl	0H8(ix)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,0H8(ix)
	cp	#0HA7
	jp	nz,	fail

   ret