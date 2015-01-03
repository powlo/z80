; *******************************
; OR A, (HL)
; *******************************
	.area	_CODE

orabhlb:

;-------------------------------------------------
; OR A, (hl)
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
   ld hl, #hl_point
	ld	(hl),#0HCC
	or	(hl)
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
   ld hl, #hl_point
	ld	(hl),#0H22
	or	(hl)
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
   ld hl, #hl_point
	ld	(hl),#0H00
	or	(hl)
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
   ld hl, #hl_point
	ld	(hl),#0H60
	or	(hl)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail


   ret