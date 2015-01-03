; *******************************
; CP A, r
; *******************************

	.area	_CODE

cpar:

;-------------------------------------------------
; CP A, A - Always returns 0!
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; self compare always matches!
	cp	a
	;-------------------------------------------------
	jp	nz,	fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, b
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	b,#0H02
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	b,#0H45
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	b,#0H08
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	b,#0HFF
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	b,#0H7F
	cp	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, c
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	c,#0H02
	cp	c
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	c,#0H45
	cp	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	c,#0H08
	cp	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	c,#0HFF
	cp	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	c,#0H7F
	cp	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, d
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	d,#0H02
	cp	d
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	d,#0H45
	cp	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	d,#0H08
	cp	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	d,#0HFF
	cp	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	d,#0H7F
	cp	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, e
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	e,#0H02
	cp	e
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	e,#0H45
	cp	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	e,#0H08
	cp	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	e,#0HFF
	cp	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	e,#0H7F
	cp	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, h
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	h,#0H02
	cp	h
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	h,#0H45
	cp	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	h,#0H08
	cp	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	h,#0HFF
	cp	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	h,#0H7F
	cp	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

;-------------------------------------------------
; CP A, l
;-------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld	l,#0H02
	cp	l
	;-------------------------------------------------
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	;-------------------------------------------------
	sub	#0H05			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld	l,#0H45
	cp	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H85			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld	l,#0H08
	cp	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	sub	#0H12			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld	l,#0HFF
	cp	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0H7F			; A reg shouldn't change!
	jp	nz,	fail

	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld	l,#0H7F
	cp	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	sub	#0HFF			; A reg shouldn't change!
	jp	nz,	fail

   ret