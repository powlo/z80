;-----------------------------------
;--  (HL) Operand                 --
;-----------------------------------
srlbhlb:
	ld	hl,#hl_point
	ld	(hl),#0H81
	srl	(hl)

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,(hl)
	cp	#0H40
	jp	nz,	fail
	
   ret