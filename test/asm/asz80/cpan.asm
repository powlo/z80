; *******************************
; CP A, n
; *******************************

	.area	_CODE

cpan:

   call rst_reg
	ld	a,#0H05		      ; simple 5-2 to get started
	cp	#0H02
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
	cp	#0H45
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
	cp	#0H08
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
	cp	#0HFF
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
	cp	#0H7F
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

   ret