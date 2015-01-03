; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the subraction
; instructions.

	.area	CODE (ABS)
	.org	#0H0000	

	ld	a,#0H00
	ld	b,#0H00
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	h,#0H00
	ld	l,#0H00

	ld	a,#0H05		; self compare always matches!
	cp	a
	;-------------------------------------------------
	jp	nz,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H05		; simple 5-2 to get started
	ld	b,#0H02
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	b,#0H45
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	b,#0H08
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	b,#0HFF
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	b,#0H7F
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail


	ld	b,#0H00		; check cp on other registers
	ld	a,#0H14	
	ld	c,#0H14
	cp	c
	;-------------------------------------------------
	jp	nz,	fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H14			; A reg shouldn't change!
	jp	nz,	fail

	ld	c,#0H00	
	ld	a,#0H14	
	ld	d,#0H14
	cp	d
	;-------------------------------------------------
	jp	nz,	fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H14			; A reg shouldn't change!
	jp	nz,	fail

	ld	d,#0H00	
	ld	a,#0H14	
	ld	e,#0H14
	cp	e
	;-------------------------------------------------
	jp	nz,	fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H14			; A reg shouldn't change!
	jp	nz,	fail

	ld	e,#0H00	
	ld	a,#0H14	
	ld	h,#0H14
	cp	h
	;-------------------------------------------------
	jp	nz,	fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H14			; A reg shouldn't change!
	jp	nz,	fail

	ld	h,#0H00	
	ld	a,#0H14	
	ld	l,#0H14
	cp	l
	;-------------------------------------------------
	jp	nz,	fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H14			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H36	; check the immediate cp instruction
	cp	#0H23
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H36			; A reg shouldn't change!
	jp	nz,	fail

	ld	hl,#0H2001
	ld	(hl),#0H14		

	ld	a,#0H50	
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H50			; A reg shouldn't change!
	jp	nz,	fail

	ld	ix,#0H2052
	ld	0H2(ix),#0H14		

	ld	a,#0H50	
	cp	0H2(ix)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H50			; A reg shouldn't change!
	jp	nz,	fail

	ld	iy,#0H2099
	ld	0H7(iy),#0H14	

	ld	a,#0H50	
	cp	0H7(iy)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H50			; A reg shouldn't change!
	jp	nz,	fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

