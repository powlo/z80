;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
rlbhlb:
   ld hl,#hl_point
	ld	(hl),#0H80
	rl	(hl)

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,(hl)
	cp	#0H00
	jp	nz,	fail
	
	ld	(hl),#0H80			; force generation of carry
	rl	(hl)
	ld	(hl),#0H53
	rl	(hl)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,(hl)
	cp	#0HA7
	jp	nz,	fail

   ret