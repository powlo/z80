; *******************************
; ADD A,(ix+d)
; *******************************

addabixb:

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
   ld ix, #ix_point   
	ld	a,#0H01		; simple 1+1 to get started
	ld	0HC(ix),#0H01
	add	0HC(ix)
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

   ld ix, #ix_point   
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	0HC(ix),#0H45
	add	0HC(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
   call rst_reg

   ld ix, #ix_point   
	ld	a,#0H08		; 8+A = 12 :- Half carry
	ld	0HC(ix),#0H0A
	add	0HC(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
   call rst_reg

   ld ix, #ix_point   
	ld	a,#0H80		; 80+FF = 7F :- Carry
	ld	0HC(ix),#0HFF
	add	0HC(ix)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

   ret