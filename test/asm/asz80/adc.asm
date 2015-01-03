; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the ADC
; instructions.

	ld	a,#0H00
	ld	b,#0H00
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	hl,#0H0000
	ld	ix,#0H0000
	ld	iy,#0H0000

;------------------------------------------------
; First we check the mathematical implementation
; of the adc command using registers a and b.
;------------------------------------------------

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	ld	h,#0H80	
	add	h			; First, force a carry.
	ld	a,#0H01
	ld	h,#0H01
	adc	h
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
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	c,#0H45
	adc	c
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
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	d,#0H0A
	adc	d
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
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	e,#0H7F
	adc	e
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now check all versions of the add command
; with a simple addition
;------------------------------------------------

;------------------------------------------------
; ADC A,A
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H05		
	adc	a
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H0B					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,B
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H05		
	ld	b,#0H04		
	adc	b
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H0A					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,C
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H05		
	ld	c,#0H03		
	adc	c
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H09					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,D
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H05		
	ld	d,#0H02		
	adc	d
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H08					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,E
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H05		
	ld	e,#0H01		
	adc	e
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H07					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,H
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H09		
	ld	h,#0H08		
	adc	h
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H12					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC A,L
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H09		
	ld	l,#0H07		
	adc	l
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H11					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; ADC	A,<immediate>
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H23	; check the immediate addc instruction
	adc	#0H36
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H5A
	jp	nz,	fail

;------------------------------------------------
; ADC	A,(HL)
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	a,#0H31	; 31+31+C = 63 :- Carry
	ld	(hl),#0H31
	adc	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H63
	jp	nz,	fail

;------------------------------------------------
; ADC A,(IX+d)
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			
	ld	ix,#0H3005
	ld	0H20(ix),#0HA4	
	ld	a,#0H3F	
	adc	0H20(ix)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HE4
	jp	nz,	fail
	
;------------------------------------------------
; ADC A,(IY+d)
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	ld	h,#0H80	
	add	h			

	ld	iy,#0H3025
	ld	0H20(iy),#0HA2	
	ld	a,#0H3F	
	adc	0H20(iy)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HE2
	jp	nz,	fail
