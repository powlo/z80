; *******************************
; LD dd, nn
; *******************************

	.area	_CODE

ldddnn:

;-----------------
;  ld bc, nn
;-----------------
   call rst_reg	

   ld	bc,#0H1234

	ld	a,#0H12
	cp	b
	jp	nz,	fail

	ld	a,#0H34
	cp	c
	jp	nz,	fail

;-----------------
;  ld de, nn
;-----------------
   call rst_reg	

	ld	de,#0H5678

	ld	a,#0H56
	cp	d
	jp	nz,	fail

	ld	a,#0H78
	cp	e
	jp	nz,	fail

;-----------------
;  ld hl, nn
;-----------------
   call rst_reg	

	ld	hl,#0H90AB

	ld	a,#0H90
	cp	h
	jp	nz,	fail

	ld	a,#0HAB
	cp	l
	jp	nz,	fail

;-----------------
;  ld sp, nn
;-----------------
   call rst_reg	
   ld (nn_point), sp ; preserve the sp

	ld	sp,#0HCDEF
   
   add hl, sp        ; use add hl,sp to get make sp checkable

	ld	a,h
	cp	#0HCD
	jp	nz,	fail

	ld	a,l
	cp	#0HEF
	jp	nz,	fail

   ld sp, (nn_point) ; restore the sp

   ret