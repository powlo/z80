; *******************************
; AND A, n
; *******************************

	.area	_CODE

andan:

   call rst_reg
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

   call rst_reg
	ld    a,#0H00		
	and   #0H12
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
	and	#0HF0
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

   ret