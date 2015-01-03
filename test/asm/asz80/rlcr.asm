;-----------------------------------
;-- 	Rotate Left with Carry	    --
;-----------------------------------
rlcr:

	ld	a,#0H80
	rlc	a

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	cp	#0H01
	jp	nz,	fail
	
	ld	a,#0H80			; force generation of carry
	rlc	a
	ld	a,#0H53
	rlc	a

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	B Operand               --
;-------------------------------
	ld	b,#0H80
	rlc	b

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,b
	cp	#0H01
	jp	nz,	fail
	
	ld	b,#0H80			; force generation of carry
	rlc	b
	ld	b,#0H53
	rlc	b

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,b
	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	c Operand               --
;-------------------------------
	ld	c,#0H80
	rlc	c

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,c
	cp	#0H01
	jp	nz,	fail
	
	ld	c,#0H80			; force generation of carry
	rlc	c
	ld	c,#0H53
	rlc	c

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,c
	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	d Operand               --
;-------------------------------
	ld	d,#0H80
	rlc	d

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,d
	cp	#0H01
	jp	nz,	fail
	
	ld	d,#0H80			; force generation of carry
	rlc	d
	ld	d,#0H53
	rlc	d

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,d
	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	e Operand               --
;-------------------------------
	ld	e,#0H80
	rlc	e

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,e
	cp	#0H01
	jp	nz,	fail
	
	ld	e,#0H80			; force generation of carry
	rlc	e
	ld	e,#0H53
	rlc	e

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,e
	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	h Operand               --
;-------------------------------
	ld	h,#0H80
	rlc	h

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,h
	cp	#0H01
	jp	nz,	fail
	
	ld	h,#0H80			; force generation of carry
	rlc	h
	ld	h,#0H53
	rlc	h

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,h
	cp	#0HA6
	jp	nz,	fail
;-------------------------------
;-- 	l Operand               --
;-------------------------------
	ld	l,#0H80
	rlc	l

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,l
	cp	#0H01
	jp	nz,	fail
	
	ld	l,#0H80			; force generation of carry
	rlc	l
	ld	l,#0H53
	rlc	l

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,l
	cp	#0HA6
	jp	nz,	fail
	
   ret
