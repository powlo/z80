;-----------------------------------
;--  (IX+d) Operand                 --
;-----------------------------------
srabixdb:
	ld	ix,#ix_point
	ld	0HC(ix),#0H81
	sra	0HC(ix)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,0HC(ix)
	cp	#0HC0
	jp	nz,	fail
   
   ret