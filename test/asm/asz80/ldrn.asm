; *******************************
; LD r, n
; *******************************
	.area	_CODE
   .module ldrn
   
ldrn:
; ------------
; LD A, n
; ------------
	ld	a,#0H01
	cp	#0H01
	jp	nz,	fail
	
; ------------
; LD B, n
; ------------
	ld	b,#0H02
	ld	a,b
	cp	#0H02
	jp	nz,	fail
	
; ------------
; LD C, n
; ------------
	ld	c,#0H04
	ld	a,c
	cp	#0H04
	jp	nz,	fail
	
; ------------
; LD D, n
; ------------
	ld	d,#0H08
	ld	a,d
	cp	#0H08
	jp	nz,	fail

; ------------
; LD E, n
; ------------
	ld	e,#0H10
	ld	a,e
	cp	#0H10
	jp	nz,	fail
	
; ------------
; LD H, n
; ------------
	ld	h,#0H20
	ld	a,h
	cp	#0H20
	jp	nz,	fail
	
; ------------
; LD L, n
; ------------
	ld	l,#0H40
	ld	a,l
	cp	#0H40
	jp	nz,	fail

   ret