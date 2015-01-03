;-----------------------------------
;--  (HL) Operand                 --
;-----------------------------------
srabhlb:
	ld	hl,#hl_point
	ld	(hl),#0H81
	sra	(hl)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,(hl)
	cp	#0HC0
	jp	nz,	fail
   
   ret