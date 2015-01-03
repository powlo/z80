; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the and
; instructions.

	ld	a,#0H00
	ld	b,#0H00
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	h,#0H00
	ld	l,#0H00

	ld	a,#0HAA		; Bitwise check of and fucntion
	and	a
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
	and	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	b,#0H00
	ld	a,#0HAA		
	ld	c,#0HCC
	and	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	c,#0H00
	ld	a,#0HAA		
	ld	d,#0HCC
	and	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	d,#0H00
	ld	a,#0HAA		
	ld	e,#0HCC
	and	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	e,#0H00
	ld	a,#0HAA		
	ld	h,#0HCC
	and	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	h,#0H00
	ld	a,#0HAA		
	ld	l,#0HCC
	and	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	h,#0H20
	ld	l,#0H01
	ld	a,#0HAA		
	ld	(hl),#0HCC
	and	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	ix,#0H2030
	ld	0H40(ix),#0H55
	ld	a,#0HEE
	and	0H40(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H44
	jp	nz,	fail

	ld	iy,#0H2100
	ld	0H40(ix),#0H33
	ld	a,#0HEE
	and	0H40(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H22
	jp	nz,	fail

	ld	hl,#0H0000	; clear hl, ix and iy
	ld	ix,#0H0000
	ld	iy,#0H0000

	ld	a,#0HAA		
	and	#0HCC
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

	ld	a,#0HF0
	ld	b,#0H0F
	and	b			; Should give z,pe,p
	;-------------------------------------------------
	jp	nz,	fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	ld	a,#0H80
	ld	b,#0H80
	and	b			; Should give nz,po,m
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

