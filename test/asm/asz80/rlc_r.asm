; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

	.area	CODE (ABS)
	.org	#0H0000	

;-----------------------------------
;--     Rotate Instructions using --
;-- 	CB prefix Test              --
;-----------------------------------
;-- 	A Operand         	       --
;-----------------------------------
;-- 	Rotate Left with Carry	    --
;-----------------------------------
rlc_r:

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

;----------------------------------
;-- 	(HL) Operand               --
;----------------------------------
;-- 	Rotate Left with Carry-    --
;----------------------------------
	ld	h,#0H30
	ld	l,#0H00
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

;-----------------------------------
;--     Rotate Left no carry Test --
;-----------------------------------
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

;----------------------------------
;-- Rotate Right with Carry Test --
;----------------------------------
	ld	(hl),#0H51
	rrc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,(hl)
	cp	#0HA8
	jp	nz,	fail
	
	ld	(hl),#0H51			; force generation of carry
	rrc	(hl)
	ld	(hl),#0H52
	rrc	(hl)

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,(hl)
	cp	#0H29
	jp	nz,	fail

;-------------------------------------
;-- Rotate right with No Carry Test --
;-------------------------------------
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
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

