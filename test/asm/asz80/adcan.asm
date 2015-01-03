; *******************************
; ADC a,n
; *******************************
	.area	_CODE

adcan:

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
	ld	a,#0H80	
	add	#0H80			; First, force a carry.
	ld	a,#0H01
	adc	#0H01
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg
	ld	a,#0H80	; Force a carry
	add	#0H80			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	adc	#0H45
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
   call rst_reg
	ld	a,#0H80	; Force a carry
	add	#0H80			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	adc	#0H0A
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
   call rst_reg
	ld	a,#0H80	; Force a carry
	add	#0H80			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	adc	#0H7F
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now check with no carry input
;------------------------------------------------
   call rst_reg
	ld	a,#0H00	
	add	#0H00			; First, force a no carry.
	ld	a,#0H01
	adc	#0H01
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg
	ld	a,#0H00	
	add	#0H00			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	adc	#0H45
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
	ld	a,#0H00	
	add	#0H00			; First, force a no carry.
	ld	a,#0H08	; 8+A = 12 :- Half carry
	adc	#0H0A
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
	ld	a,#0H00	
	add	#0H00			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	adc	#0H7F
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

   ret