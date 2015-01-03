; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

;-------------------------------------
;-- Rotate right with No Carry Test --
;-------------------------------------
rrr:
	ld	a,#0H51
	rr	a

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	cp	#0H28
	jp	nz,	fail
	
	ld	a,#0H51			; force generation of carry
	rr	a
	ld	a,#0H52
	rr	a

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	B Operand               --
;-------------------------------
	ld	b,#0H51
	rr	b

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,b
	cp	#0H28
	jp	nz,	fail
	
	ld	b,#0H51			; force generation of carry
	rr	b
	ld	b,#0H52
	rr	b

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,b
	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	c Operand               --
;-------------------------------
	ld	c,#0H51
	rr	c

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,c
	cp	#0H28
	jp	nz,	fail
	
	ld	c,#0H51			; force generation of carry
	rr	c
	ld	c,#0H52
	rr	c

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,c
	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	d Operand               --
;-------------------------------
	ld	d,#0H51
	rr	d

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,d
	cp	#0H28
	jp	nz,	fail
	
	ld	d,#0H51			; force generation of carry
	rr	d
	ld	d,#0H52
	rr	d

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,d
	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	e Operand               --
;-------------------------------
	ld	e,#0H51
	rr	e

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,e
	cp	#0H28
	jp	nz,	fail
	
	ld	e,#0H51			; force generation of carry
	rr	e
	ld	e,#0H52
	rr	e

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,e
	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	h Operand               --
;-------------------------------
	ld	h,#0H51
	rr	h

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,h
	cp	#0H28
	jp	nz,	fail
	
	ld	h,#0H51			; force generation of carry
	rr	h
	ld	h,#0H52
	rr	h

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,h
	cp	#0HA9
	jp	nz,	fail

;-------------------------------
;-- 	l Operand               --
;-------------------------------
	ld	l,#0H51
	rr	l

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	m,	fail			; the F flag.

	ld	a,l
	cp	#0H28
	jp	nz,	fail
	
	ld	l,#0H51			; force generation of carry
	rr	l
	ld	l,#0H52
	rr	l

	jp	z,	fail			; Check all the flags to
	jp	c,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,	fail			; the F flag.

	ld	a,l
	cp	#0HA9
	jp	nz,	fail

   ret