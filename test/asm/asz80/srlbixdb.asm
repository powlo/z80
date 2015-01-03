;-----------------------------------
;--  (IX) Operand                 --
;-----------------------------------
srlbixdb:
	ld	ix,#ix_point
	ld	0H6(ix),#0H81
	srl   0H6(ix)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,0H6(ix)
	cp	#0H40
	jp	nz,	fail
	
   ret