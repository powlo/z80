; *******************************
; OR A, n
; *******************************
	.area	_CODE

oran:

;-------------------------------------------------
; OR A, n
;-------------------------------------------------
   call rst_reg
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

   call rst_reg
	ld	a,#0H11		
	or	#0H22
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
	or	#0H00
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
	or	#0H60
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail


   ret