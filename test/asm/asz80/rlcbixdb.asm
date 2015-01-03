;----------------------------------
;-- 	(IX) Operand               --
;----------------------------------
;-- 	Rotate Left with Carry-    --
;----------------------------------
rlcbixdb:
	ld	ix,#ix_point
	ld	0H6(ix),#0H80
	rlc	0H6(ix)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,0H6(ix)
	cp	#0H01
	jp	nz,	fail
	
	ld	0H6(ix),#0H80			; force generation of carry
	rlc	0H6(ix)
	ld	0H6(ix),#0H53
	rlc	0H6(ix)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,0H6(ix)
	cp	#0HA6
	jp	nz,	fail

   ret