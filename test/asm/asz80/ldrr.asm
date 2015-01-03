; *******************************
; LD r, r
; *******************************
	.area	_CODE
   .module ldrr

ldrr:

;-------------------------------
; LD r, A
;-------------------------------

   call rst_reg
   	
	ld	a,#0HFF

	ld	a,a
	cp	a
	jp	nz,	fail
	
	ld	b,a
	cp	b
	jp	nz,	fail
	
	ld	c,a
	cp	c
	jp	nz,	fail
	
	ld	d,a
	cp	d
	jp	nz,	fail
	
	ld	e,a
	cp	e
	jp	nz,	fail
	
	ld	h,a
	cp	h
	jp	nz,	fail
	
	ld	l,a
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, B
;-------------------------------
   call rst_reg

	ld	b,#0H11

	ld	a,b
	cp	b
	jp	nz,	fail
	
	ld	b,b
	cp	b
	jp	nz,	fail
	
	ld	c,b
	cp	c
	jp	nz,	fail
	
	ld	d,b
	cp	d
	jp	nz,	fail
	
	ld	e,b
	cp	e
	jp	nz,	fail
	
	ld	h,b
	cp	h
	jp	nz,	fail
	
	ld	l,b
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, C
;-------------------------------
   call rst_reg
	ld	c,#0H22

	ld	a,c
	cp	c
	jp	nz,	fail
	
	ld	b,c
	cp	b
	jp	nz,	fail

	ld	c,c
	cp	c
	jp	nz,	fail
	
	ld	d,c
	cp	d
	jp	nz,	fail
	
	ld	e,c
	cp	e
	jp	nz,	fail
	
	ld	h,c
	cp	h
	jp	nz,	fail
	
	ld	l,c
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, D
;-------------------------------
   call rst_reg
	ld	d,#0H33

	ld	a,d
	cp	d
	jp	nz,	fail
	
	ld	b,d
	cp	b
	jp	nz,	fail

	ld	c,d
	cp	c
	jp	nz,	fail
	
	ld	d,d
	cp	d
	jp	nz,	fail
	
	ld	e,d
	cp	e
	jp	nz,	fail
	
	ld	h,d
	cp	h
	jp	nz,	fail
	
	ld	l,d
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, E
;-------------------------------
   call rst_reg
	ld	e,#0H44

	ld	a,e
	cp	e
	jp	nz,	fail
	
	ld	b,e
	cp	b
	jp	nz,	fail

	ld	c,e
	cp	c
	jp	nz,	fail
	
	ld	d,e
	cp	d
	jp	nz,	fail
	
	ld	e,e
	cp	e
	jp	nz,	fail
	
	ld	h,e
	cp	h
	jp	nz,	fail
	
	ld	l,e
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, H
;-------------------------------
   call rst_reg
	ld	h,#0H55

	ld	a,h
	cp	h
	jp	nz,	fail
	
	ld	b,h
	cp	b
	jp	nz,	fail

	ld	c,h
	cp	c
	jp	nz,	fail
	
	ld	d,h
	cp	d
	jp	nz,	fail
	
	ld	e,h
	cp	e
	jp	nz,	fail
	
	ld	h,h
	cp	h
	jp	nz,	fail
	
	ld	l,h
	cp	l
	jp	nz,	fail
	
;-------------------------------
; LD r, L
;-------------------------------
   call rst_reg
	ld	l,#0H66

	ld	a,l
	cp	l
	jp	nz,	fail
	
	ld	b,l
	cp	b
	jp	nz,	fail

	ld	c,l
	cp	c
	jp	nz,	fail
	
	ld	d,l
	cp	d
	jp	nz,	fail
	
	ld	e,l
	cp	e
	jp	nz,	fail
	
	ld	h,l
	cp	h
	jp	nz,	fail
	
	ld	l,l
	cp	l
	jp	nz,	fail

   ret