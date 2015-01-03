; *******************************
; OR A, r
; *******************************
	.area	_CODE

orar:

;-------------------------------------------------
; OR A, A
;-------------------------------------------------
	call rst_reg
	ld	a,#0HAA		; Bitwise check of or function
	or	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail
	jp	po,	fail
	jp	p,		fail
	;-------------------------------------------------
	cp	#0HAA
	jp	nz,	fail

	call rst_reg
	ld	a,#0H00		; Bitwise check of or function
	or	a
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail
	jp	po,	fail
	jp	m,		fail
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

	call rst_reg
	ld	a,#0H70		; Bitwise check of or function
	or	a
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail
	jp	pe,	fail
	jp	m,		fail
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, b
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	b,#0HCC
	or	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	b,#0H22
	or	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	b,#0H00
	or	b
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	b,#0H60
	or	b
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, c
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	c,#0HCC
	or	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	c,#0H22
	or	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	c,#0H00
	or	c
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	c,#0H60
	or	c
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, d
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	d,#0HCC
	or	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	d,#0H22
	or	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	d,#0H00
	or	d
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	d,#0H60
	or	d
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, e
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	e,#0HCC
	or	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	e,#0H22
	or	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	e,#0H00
	or	e
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	e,#0H60
	or	e
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, h
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	h,#0HCC
	or	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	h,#0H22
	or	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	h,#0H00
	or	h
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	h,#0H60
	or	h
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

;-------------------------------------------------
; OR A, l
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	l,#0HCC
	or	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HEE
	jp	nz,	fail

   call rst_reg
	ld	a,#0H11		
	ld	l,#0H22
	or	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H33
	jp	nz,	fail

   call rst_reg
	ld	a,#0H00
	ld	l,#0H00
	or	l
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H10
	ld	l,#0H60
	or	l
	;-------------------------------------------------
	jp	z,    fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H70
	jp	nz,	fail

   ret