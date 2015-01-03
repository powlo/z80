; *******************************
; OR A, (IY)
; *******************************
	.area	_CODE

orabiyb:

   call rst_reg
	ld	a,#0HAA		
   ld iy, #iy_point
	ld	4(iy),#0HCC
	or	4(iy)
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
   ld iy, #iy_point
	ld	4(iy),#0H22
	or	4(iy)
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
   ld iy, #iy_point
	ld	4(iy),#0H00
	or	4(iy)
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
   ld iy, #iy_point
	ld	4(iy),#0H60
	or	4(iy)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail


   ret