; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the subraction
; with carry instructions.

	.area	CODE (ABS)
	.org	#0H0000	

;------------------------------------------------
; First we check the mathematical implementation
; of the sbc command using registers a and b.
;------------------------------------------------


;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		; simple 5-2 to get started
	ld	b,#0H02
	sbc	b
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H85		; 85-44-Borrow = 40 :- overflow
	ld	c,#0H44
	sbc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H40
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H12		; 12-7-Borrow = A :- Half carry
	ld	d,#0H07
	sbc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H7F		; 7F-FE-Borrow = 80 :- Carry
	ld	b,#0HFE
	sbc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; No Carry
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0HFF		; FF-7E-Borrow = 80 :- No Carry!
	ld	b,#0H7E
	sbc	b
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
; Sbc A,A
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		
	sbc	a
	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.
	cp	#0HFF					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,B
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		
	ld	b,#0H04		
	sbc	b
	jp	nz,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H00					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,C
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		
	ld	c,#0H03		
	sbc	c
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H01					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,D
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		
	ld	d,#0H02		
	sbc	d
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,E
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H05		
	ld	e,#0H01		
	sbc	e
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,H
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H09		
	ld	h,#0H08		
	sbc	h
	jp	nz,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H00					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Sbc A,L
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H09		
	ld	l,#0H07		
	sbc	l
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H01					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; SBC A, <immediate>
;------------------------------------------------
	ld	a,#0H00		; force a borrow
	ld	b,#0H01
	sub	b
	ld	a,#0H09		; 09-04-Borrow = 04 :- No Carry!
	sbc	#0H04
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; SBC A, (HL)
;------------------------------------------------
	ld	a,#0H00	; Force a borrow
	ld	b,#0H01	
	sub	b			
	ld	a,#0HC2	; C2-1E-b = A3
	ld	(hl),#0H1E
	sbc	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HA3
	jp	nz,	fail

;------------------------------------------------
; Sbc A, (IX+d)
;------------------------------------------------
	ld	a,#0H00	; Force a borrow
	ld	b,#0H01	
	sub	b			
	ld	ix,#0H3020
	ld	0H3(ix),#0H15		
	ld	a,#0H50	
	sbc	0H3(ix)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H3A
	jp	nz,	fail

;------------------------------------------------
; Sbc A, (IY+d)
;------------------------------------------------
	ld	a,#0H00	; Force a borrow
	ld	b,#0H01	
	sub	b			
	ld	iy,#0H3050
	ld	0H3(iy),#0H16		
	ld	a,#0H50	
	sbc	0H3(iy)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H39
	jp	nz,	fail



pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

