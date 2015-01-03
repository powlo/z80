; *******************************
; ADD A,r
; *******************************

addar:
;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	add	a
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+40 = neg number :- overflow
	add	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H08		; 8+8 = 10 :- Half carry
	add	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80		; 80+80 = 00 :- Carry
	add	a
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H00
	jp	nz,	fail

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
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	b,#0H45
	add	b
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
	ld	b,#0H0A
	add	b
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
	ld	b,#0HFF
	add	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	c,#0H01
	add	c
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
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
	ld	c,#0H0A
	add	c
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
	ld	c,#0HFF
	add	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	d,#0H01
	add	d
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	d,#0H45
	add	d
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
	ld	d,#0HFF
	add	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	e,#0H01
	add	e
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	e,#0H45
	add	e
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
	ld	e,#0H0A
	add	e
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
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	h,#0H01
	add	h
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	h,#0H45
	add	h
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
	ld	h,#0H0A
	add	h
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
	ld	h,#0HFF
	add	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
   call rst_reg
   
	ld	a,#0H01		; simple 1+1 to get started
	ld	l,#0H01
	add	l
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Overflow
;------------------------------------------------
   call rst_reg

	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	l,#0H45
	add	l
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
	ld	l,#0H0A
	add	l
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
	ld	l,#0HFF
	add	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H7F
	jp	nz,	fail

   ret