; *******************************
; AND A, (IY)
; *******************************

	.area	_CODE

andabiyb:

   call rst_reg
	ld	a,#0HAA		
   ld iy,#iy_point
	ld	6(iy),#0HCC
	and	6(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00		
   ld iy,#iy_point
	ld	6(iy),#0H12
	and	6(iy)
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H77		
   ld iy,#iy_point
	ld	6(iy),#0HF0
	and	6(iy)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

   ret