
;-----------------------------------
;--  (Iy) Operand                 --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------
slabiydb:

	ld	iy,#iy_point
	ld	0H4(iy),#0H81
	sla	0H4(iy)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,0H4(iy)
	cp	#0H02
	jp	nz,	fail
   ret
