;-----------------------------------
;--  (IY) Operand                 --
;-----------------------------------
srlbiydb:
	ld	iy,#iy_point
	ld	0H6(iy),#0H81
	srl   0H6(iy)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,0H6(iy)
	cp	#0H40
	jp	nz,	fail
	
   ret