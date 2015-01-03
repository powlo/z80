; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the subraction
; instructions.

;------------------------------------------------
; First we check the mathematical implementation
; of the sub command using registers a and b.
;------------------------------------------------
	ld	a,#0H00
	ld	b,#0H00
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	h,#0H00
	ld	l,#0H00

	ld	a,#0H05		; simple 5-2 to get started
	ld	b,#0H02
	sub	b
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Check Over flow
;------------------------------------------------

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	b,#0H45
	sub	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H40
	jp	nz,	fail

;------------------------------------------------
; Check Half Carry
;------------------------------------------------
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	b,#0H08
	sub	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Check Carry
;------------------------------------------------
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	b,#0HFF
	sub	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Check No Carry
;------------------------------------------------
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	b,#0H7F
	sub	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail


;------------------------------------------------
; Now check all versions of the sub command
; with a simple subtraction
;------------------------------------------------

;------------------------------------------------
; Sub A,A
;------------------------------------------------
	ld	a,#0H05		
	sub	a
	jp	nz,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H00					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,B
;------------------------------------------------
	ld	a,#0H05		
	ld	b,#0H04		
	sub	b
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H01					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,C
;------------------------------------------------
	ld	a,#0H05		
	ld	c,#0H03		
	sub	c
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,D
;------------------------------------------------
	ld	a,#0H05		
	ld	d,#0H02		
	sub	d
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,E
;------------------------------------------------
	ld	a,#0H05		
	ld	e,#0H01		
	sub	e
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H04					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,H
;------------------------------------------------
	ld	a,#0H09		
	ld	h,#0H08		
	sub	h
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H01					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A,L
;------------------------------------------------
	ld	a,#0H09		
	ld	l,#0H07		
	sub	l
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sub A, <immediate>
;------------------------------------------------
	ld	a,#0H36	; check the immediate add instruction
	sub	#0H23
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Sub A, (HL)
;------------------------------------------------
	ld	hl,#0H3001
	ld	(hl),#0H14		
	ld	a,#0H50	
	sub	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H3C
	jp	nz,	fail

;------------------------------------------------
; Sub A, (IX+d)
;------------------------------------------------
	ld	ix,#0H3020
	ld	0H3(ix),#0H15		
	ld	a,#0H50	
	sub	0H3(ix)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H3B
	jp	nz,	fail

;------------------------------------------------
; Sub A, (IY+d)
;------------------------------------------------
	ld	iy,#0H3050
	ld	0H3(iy),#0H16		
	ld	a,#0H50	
	sub	0H3(iy)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H3A
	jp	nz,	fail