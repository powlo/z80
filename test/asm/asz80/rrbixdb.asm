;----------------------------------
;-- 	(IX+d) Operand             --
;----------------------------------
rrbixdb:
	ld	ix,#ix_point
	ld	0HD(ix),#0H51
	rr	0HD(ix)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,0HD(ix)
	cp	#0H28
	jp	nz,	fail
	
	ld	0HD(ix),#0H51			; force generation of carry
	rr	0HD(ix)
	ld	0HD(ix),#0H52
	rr	0HD(ix)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,0HD(ix)
	cp	#0HA9
	jp	nz,	fail
   
   ret