; *******************************
; XOR A, r
; *******************************

	.area	_CODE

xorar:

;-------------------------------------------------
; XOR A, A - Always returns 0!
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		; Bitwise check of and fucntion
	xor	a
	;-------------------------------------------------
	jp	nz,	fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

;-------------------------------------------------
; XOR A, b
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	b,#0HCC
	xor	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	b,#0HAA
	xor	b
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	b,#0H02
	xor	b
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	b,#0H84
	xor	b
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;-------------------------------------------------
; XOR A, c
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	c,#0HCC
	xor	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	c,#0HAA
	xor	c
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	c,#0H02
	xor	c
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	c,#0H84
	xor	c
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;-------------------------------------------------
; XOR A, d
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	d,#0HCC
	xor	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	d,#0HAA
	xor	d
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	d,#0H02
	xor	d
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	d,#0H84
	xor	d
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;-------------------------------------------------
; XOR A, e
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	e,#0HCC
	xor	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	e,#0HAA
	xor	e
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	e,#0H02
	xor	e
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	e,#0H84
	xor	e
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;-------------------------------------------------
; XOR A, h
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	h,#0HCC
	xor	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	h,#0HAA
	xor	h
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	h,#0H02
	xor	h
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	h,#0H84
	xor	h
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;-------------------------------------------------
; XOR A, l
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		
	ld	l,#0HCC
	xor	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H66
	jp	nz,	fail

	call rst_reg
	ld	a,#0HAA		
	ld	l,#0HAA
	xor	l
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H12		
	ld	l,#0H02
	xor	l
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

	call rst_reg
	ld	a,#0H04		
	ld	l,#0H84
	xor	l
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

   ret