; *******************************
; OR A, (IX)
; *******************************
	.area	_CODE

orabixb:

   call rst_reg
	ld	a,#0HAA		
   ld ix, #ix_point
	ld	2(ix),#0HCC
	or	2(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
   ld ix, #ix_point
	ld	2(ix),#0H22
	or	2(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
   ld ix, #ix_point
	ld	2(ix),#0H00
	or	2(ix)
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
   ld ix, #ix_point
	ld	2(ix),#0H60
	or	2(ix)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail


   ret