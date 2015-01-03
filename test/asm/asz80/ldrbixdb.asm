; *******************************
; LD r (ix+d)
; *******************************
	.area	_CODE
   .module ldrbixdb

ldrbixdb:

;--------------------------------
; ld a, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H0(ix),#0H11
	ld	a,0H0(ix)
	cp	#0H11
	jp nz,	fail
	
;--------------------------------
; ld b, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H1(ix),#0H22
	ld	b,0H1(ix)
   ld a,b
	cp	#0H22
	jp nz,	fail
	
;--------------------------------
; ld c, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H2(ix),#0H33
	ld	c,0H2(ix)
   ld a,c
	cp	#0H33
	jp nz,	fail
	
;--------------------------------
; ld d, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H3(ix),#0H44
	ld	d,0H3(ix)
   ld a,d
	cp	#0H44
	jp nz,	fail
	
;--------------------------------
; ld e, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H4(ix),#0H55
	ld	e,0H4(ix)
   ld a,e
	cp	#0H55
	jp nz,	fail
	
;--------------------------------
; ld h,(ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H5(ix),#0H66
	ld	h,0H5(ix)
   ld a,h
	cp	#0H66
	jp nz,	fail
	
;--------------------------------
; ld l, (ix+d)
;--------------------------------
   call rst_reg
	ld	ix,#ix_point
	ld	0H6(ix),#0H77
	ld	l,0H6(ix)
   ld a,l
	cp	#0H77
	jp nz,	fail
	
   ret