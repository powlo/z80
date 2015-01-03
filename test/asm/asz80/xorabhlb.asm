; *******************************
; XOR A, (hl)
; *******************************

	.area	_CODE

xorabhlb:

;-------------------------------------------------
; XOR A, (hl)
;-------------------------------------------------
	call rst_reg
   ld hl, #hl_point
   ld	a,#0HAA		
	ld	(hl),#0HCC
	xor	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
   ld hl, #hl_point
	ld	a,#0HAA		
	ld	(hl),#0HAA
	xor	(hl)
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
   ld hl, #hl_point
	ld	a,#0H12		
	ld	(hl),#0H02
	xor	(hl)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
   ld hl, #hl_point
	ld	a,#0H04		
	ld	(hl),#0H84
	xor	(hl)
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail


   ret