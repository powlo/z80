; *******************************
; AND A, (IX)
; *******************************

	.area	_CODE

andabixb:

   call rst_reg
	ld	a,#0HAA		
   ld ix,#ix_point
	ld	7(ix),#0HCC
	and	7(ix)
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
   ld ix,#ix_point
	ld	7(ix),#0H12
	and	7(ix)
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
   ld ix,#ix_point
	ld	7(ix),#0HF0
	and	7(ix)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

   ret