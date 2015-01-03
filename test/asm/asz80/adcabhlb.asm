; *******************************
; ADC A, (hl)
; *******************************

adcabhlb:
;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   ld hl,#hl_point
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	(hl),#0H01
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	(hl),#0H45
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	(hl),#0H0A
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	(hl),#0H7F
	adc	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
   call rst_reg
   ld hl,#hl_point
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	(hl),#0H01
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	(hl),#0H45
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	(hl),#0H0A
	adc	(hl)
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
   ld hl,#hl_point
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	(hl),#0H7F
	adc	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail


   ret