;----------------------------------
;-- 	(HL) Operand               --
;----------------------------------
rrbhlb:
	ld	hl,#hl_point
	ld	(hl),#0H51
	rr	(hl)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,(hl)
	cp	#0H28
	jp	nz,	fail
	
	ld	(hl),#0H51			; force generation of carry
	rr	(hl)
	ld	(hl),#0H52
	rr	(hl)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,(hl)
	cp	#0HA9
	jp	nz,	fail
   
   ret