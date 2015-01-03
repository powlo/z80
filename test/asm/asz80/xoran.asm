; *******************************
; XOR A, n
; *******************************

	.area	_CODE

xoran:

;-------------------------------------------------
; XOR A, 6(iy)
;-------------------------------------------------
	call rst_reg
   ld	a,#0HAA		
	xor	#0HCC
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	xor	#0HAA
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	xor	#0H02
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	xor	#0H84
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

   ret