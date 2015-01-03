; *******************************
; XOR A, (IY)
; *******************************

	.area	_CODE

xorabiyb:

;-------------------------------------------------
; XOR A, 6(iy)
;-------------------------------------------------
	call rst_reg
   ld iy, #iy_point
   ld	a,#0HAA		
	ld	6(iy),#0HCC
	xor	6(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
   ld iy, #iy_point
	ld	a,#0HAA		
	ld	6(iy),#0HAA
	xor	6(iy)
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
   ld iy, #iy_point
	ld	a,#0H12		
	ld	6(iy),#0H02
	xor	6(iy)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
   ld iy, #iy_point
	ld	a,#0H04		
	ld	6(iy),#0H84
	xor	6(iy)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

   ret