;-----------------------------------
;--  (IY+d) Operand               --
;-----------------------------------
srabiydb:
	ld	iy,#iy_point
	ld	0HF(iy),#0H81
	sra	0HF(iy)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,0HF(iy)
	cp	#0HC0
	jp	nz,	fail
   
   ret