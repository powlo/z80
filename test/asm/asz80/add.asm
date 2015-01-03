; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.


;------------------------------------------------
; First we check the mathematical implementation
; of the add command using registers a and b.
;------------------------------------------------


;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	b,#0H01
	add	b
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	c,#0H45
	add	c
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
	ld	a,#0H08		; 8+A = 12 :- Half carry
	ld	d,#0H0A
	add	d
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
	ld	a,#0H80		; 80+FF = 7F :- Carry
	ld	e,#0HFF
	add	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

;------------------------------------------------
; Now check all versions of the add command
; with a simple addition
;------------------------------------------------

;------------------------------------------------
; Add A,A
;------------------------------------------------
	ld	a,#0H05		
	add	a
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H0A					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,B
;------------------------------------------------
	ld	a,#0H05		
	ld	b,#0H04		
	add	b
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H09					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,C
;------------------------------------------------
	ld	a,#0H05		
	ld	c,#0H03		
	add	c
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H08					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,D
;------------------------------------------------
	ld	a,#0H05		
	ld	d,#0H02		
	add	d
	jp	z,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H07					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,E
;------------------------------------------------
	ld	a,#0H05		
	ld	e,#0H01		
	add	e
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H06					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,H
;------------------------------------------------
	ld	a,#0H09		
	ld	h,#0H08		
	add	h
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H11					; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Add A,L
;------------------------------------------------
	ld	a,#0H09		
	ld	l,#0H07		
	add	l
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H10					; Check the result in A register
	jp	nz,	fail


;------------------------------------------------
; Add A,<intermediate>
;------------------------------------------------
	ld	a,#0H23	; check the immediate add instruction
	add	#0H36
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H59
	jp	nz,	fail

;------------------------------------------------
; Add A,(HL)
;------------------------------------------------
	ld	hl,#0H3001
	ld	(hl),#0HA4

	ld	a,#0H1F	
	add	(hl)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HC3
	jp	nz,	fail

;------------------------------------------------
; Add A,(IX+d)
;------------------------------------------------
	ld	ix,#0H3005
	ld	0H20(ix),#0HA4	

	ld	a,#0H3F	
	add	0H20(ix)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HE3
	jp	nz,	fail
	
;------------------------------------------------
; Add A,(IY+d)
;------------------------------------------------
	ld	iy,#0H3025
	ld	0H20(iy),#0HA2	

	ld	a,#0H3F	
	add	0H20(iy)
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HE1
	jp	nz,	fail
