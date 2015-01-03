
;-----------------------------------
;--  (IX) Operand                 --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------
slabixdb:

	ld	ix,#ix_point
	ld	0H3(ix),#0H81
	sla	0H3(ix)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,0H3(ix)
	cp	#0H02
	jp	nz,	fail
   ret
