; *******************************
; AND A, (HL)
; *******************************

	.area	_CODE

andabhlb:

   call rst_reg
	ld	a,#0HAA		
   ld hl,#hl_point
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

   call rst_reg
	ld	a,#0H00		
   ld hl,#hl_point
	ld	(hl),#0H12
	and	(hl)
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
   ld hl,#hl_point
	ld	(hl),#0HF0
	and	(hl)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

   ret