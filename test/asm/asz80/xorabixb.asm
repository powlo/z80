; *******************************
; XOR A, (IX)
; *******************************

	.area	_CODE

xorabixb:

;-------------------------------------------------
; XOR A, 5(ix)
;-------------------------------------------------
	call rst_reg
   ld ix, #ix_point
   ld	a,#0HAA		
	ld	5(ix),#0HCC
	xor	5(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
   ld ix, #ix_point
	ld	a,#0HAA		
	ld	5(ix),#0HAA
	xor	5(ix)
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
   ld ix, #ix_point
	ld	a,#0H12		
	ld	5(ix),#0H02
	xor	5(ix)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
   ld ix, #ix_point
	ld	a,#0H04		
	ld	5(ix),#0H84
	xor	5(ix)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail


   ret