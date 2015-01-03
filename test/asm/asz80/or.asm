; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the xor
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

	ld	a,#0HAA		; Bitwise check of and fucntion
	or	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HAA
	jp	nz,	fail

	ld	a,#0HAA		
	ld	b,#0HCC
	or	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	b,#0H00
	ld	a,#0HAA		
	ld	c,#0HCC
	or	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	c,#0H00
	ld	a,#0HAA		
	ld	d,#0HCC
	or	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	d,#0H00
	ld	a,#0HAA		
	ld	e,#0HCC
	or	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	e,#0H00
	ld	a,#0HAA		
	ld	h,#0HCC
	or	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	h,#0H00
	ld	a,#0HAA		
	ld	l,#0HCC
	or	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	h,#0H20
	ld	l,#0H01
	ld	a,#0HAA		
	ld	(hl),#0HCC
	or	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	ix,#0H2560
	ld	0H5(ix),#0H1A
	ld	a,#0H57		
	or	0H5(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H5F
	jp	nz,	fail

	ld	iy,#0H2745
	ld	0H7(iy),#0H11
	ld	a,#0H22		
	or	0H7(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

	ld	hl,#0H0000
	ld	a,#0HAA		
	or	#0HCC
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

	ld	a,#0H00
	ld	b,#0H00
	or	b			; Should give z,pe,p
	;-------------------------------------------------
	jp	nz,	fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	ld	a,#0H80
	ld	b,#0H00
	or	b			; Should give nz,po,m
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

