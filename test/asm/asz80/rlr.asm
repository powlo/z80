; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
rlr:
	ld	a,#0H80
	rl	a

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	cp	#0H00
	jp	nz,	fail
	
	ld	a,#0H80			; force generation of carry
	rl	a
	ld	a,#0H53
	rl	a

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	cp	#0HA7
	jp	nz,	fail

;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	b,#0H80
	rl	b

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,b
	cp	#0H00
	jp	nz,	fail
	
	ld	b,#0H80			; force generation of carry
	rl	b
	ld	b,#0H53
	rl	b

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,b
	cp	#0HA7
	jp	nz,	fail

;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	c,#0H80
	rl	c

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,c
	cp	#0H00
	jp	nz,	fail
	
	ld	c,#0H80			; force generation of carry
	rl	c
	ld	c,#0H53
	rl	c

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,c
	cp	#0HA7
	jp	nz,	fail
;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	d,#0H80
	rl	d

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,d
	cp	#0H00
	jp	nz,	fail
	
	ld	d,#0H80			; force generation of carry
	rl	d
	ld	d,#0H53
	rl	d

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,d
	cp	#0HA7
	jp	nz,	fail
;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	e,#0H80
	rl	e

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,e
	cp	#0H00
	jp	nz,	fail
	
	ld	e,#0H80			; force generation of carry
	rl	e
	ld	e,#0H53
	rl	e

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,e
	cp	#0HA7
	jp	nz,	fail
;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	h,#0H80
	rl	h

	jp	nz,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,h
	cp	#0H00
	jp	nz,	fail
	
	ld	h,#0H80			; force generation of carry
	rl	h
	ld	h,#0H53
	rl	h

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,h
	cp	#0HA7
	jp	nz,	fail
;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
	ld	l,#0H80
	rl	l

	jp	nz,	fail     ; Check all the flags to
	jp	nc,	fail     ; make sure that the calculation
	jp	po,	fail     ; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,l
	cp	#0H00
	jp	nz,	fail
	
	ld	l,#0H80			; force generation of carry
	rl	l
	ld	l,#0H53
	rl	l

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail     ; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,l
	cp	#0HA7
	jp	nz,	fail

   ret
