;----------------------------------
;-- 	(HL) Operand               --
;----------------------------------
;-- 	Rotate Left with Carry-    --
;----------------------------------
rlcbhlb:
	ld	hl,#hl_point
	ld	(hl),#0H80
	rlc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,(hl)
	cp	#0H01
	jp	nz,	fail
	
	ld	(hl),#0H80			; force generation of carry
	rlc	(hl)
	ld	(hl),#0H53
	rlc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,(hl)
	cp	#0HA6
	jp	nz,	fail

   ret