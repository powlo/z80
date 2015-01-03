; *******************************
; CP A, (HL)
; *******************************

	.area	_CODE

cpabhlb:

;-------------------------------------------------
; CP A, (hl)
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		      ; simple 5-2 to get started
	ld	hl,#hl_point		; simple 5-2 to get started
	ld	(hl),#0H02
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

   call rst_reg
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	hl,#hl_point		; simple 5-2 to get started
	ld	(hl),#0H45
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

   call rst_reg
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	hl,#hl_point		; simple 5-2 to get started
	ld	(hl),#0H08
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

   call rst_reg
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	hl,#hl_point		; simple 5-2 to get started
	ld	(hl),#0HFF
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

   call rst_reg
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	hl,#hl_point		; simple 5-2 to get started
	ld	(hl),#0H7F
	cp	(hl)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

   ret