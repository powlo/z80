; *******************************
; LD r (iy+d)
; *******************************
	.area	_CODE
   .module ldrbiydb

ldrbiydb:

;--------------------------------
; ld a, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H0(iy),#0H11
	ld	a,0H0(iy)
	cp	#0H11
	jp nz,	fail
	
;--------------------------------
; ld b, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H1(iy),#0H22
	ld	b,0H1(iy)
   ld a,b
	cp	#0H22
	jp nz,	fail
	
;--------------------------------
; ld c, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H2(iy),#0H33
	ld	c,0H2(iy)
   ld a,c
	cp	#0H33
	jp nz,	fail
	
;--------------------------------
; ld d, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H3(iy),#0H44
	ld	d,0H3(iy)
   ld a,d
	cp	#0H44
	jp nz,	fail
	
;--------------------------------
; ld e, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H4(iy),#0H55
	ld	e,0H4(iy)
   ld a,e
	cp	#0H55
	jp nz,	fail
	
;--------------------------------
; ld h,(iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H5(iy),#0H66
	ld	h,0H5(iy)
   ld a,h
	cp	#0H66
	jp nz,	fail
	
;--------------------------------
; ld l, (iy+d)
;--------------------------------
   call rst_reg
	ld	iy,#iy_point
	ld	0H6(iy),#0H77
	ld	l,0H6(iy)
   ld a,l
	cp	#0H77
	jp nz,	fail
	
   ret