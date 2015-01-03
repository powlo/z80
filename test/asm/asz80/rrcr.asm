; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
rrcr:
	ld	a,#0H51
	rrc	a

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	cp	#0HA8
	jp	nz,	fail
	
	ld	a,#0H51			; force generation of carry
	rrc	a
	ld	a,#0H52
	rrc	a

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	b,#0H51
	rrc	b

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,b
	cp	#0HA8
	jp	nz,	fail
	
	ld	b,#0H51			; force generation of carry
	rrc	b
	ld	b,#0H52
	rrc	b

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,b
	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	c,#0H51
	rrc	c

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,c
	cp	#0HA8
	jp	nz,	fail
	
	ld	c,#0H51			; force generation of carry
	rrc	c
	ld	c,#0H52
	rrc	c

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,c
	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	d,#0H51
	rrc	d

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,d
	cp	#0HA8
	jp	nz,	fail
	
	ld	d,#0H51			; force generation of carry
	rrc	d
	ld	d,#0H52
	rrc	d

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,d
	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	e,#0H51
	rrc	e

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,e
	cp	#0HA8
	jp	nz,	fail
	
	ld	e,#0H51			; force generation of carry
	rrc	e
	ld	e,#0H52
	rrc	e

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,e
	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	h,#0H51
	rrc	h

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,h
	cp	#0HA8
	jp	nz,	fail
	
	ld	h,#0H51			; force generation of carry
	rrc	h
	ld	h,#0H52
	rrc	h

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,h
	cp	#0H29
	jp	nz,	fail
;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	l,#0H51
	rrc	l

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,l
	cp	#0HA8
	jp	nz,	fail
	
	ld	l,#0H51			; force generation of carry
	rrc	l
	ld	l,#0H52
	rrc	l

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,l
	cp	#0H29
	jp	nz,	fail

   ret