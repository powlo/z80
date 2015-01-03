; *******************************
; LD r (hl)
; *******************************
	.area	_CODE
   .module ldrbhlb

ldrbhlb:

;--------------------------------
; ld a, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H11
	ld	a,(hl)
	cp	#0H11
	jp nz,	fail
	
;--------------------------------
; ld b, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H22
	ld	b,(hl)
   ld a,b
	cp	#0H22
	jp nz,	fail
	
;--------------------------------
; ld c, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H33
	ld	c,(hl)
   ld a,c
	cp	#0H33
	jp nz,	fail
	
;--------------------------------
; ld d, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H44
	ld	d,(hl)
   ld a,d
	cp	#0H44
	jp nz,	fail
	
;--------------------------------
; ld e, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H55
	ld	e,(hl)
   ld a,e
	cp	#0H55
	jp nz,	fail
	
;--------------------------------
; ld h, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H66
	ld	h,(hl)
   ld a,h
	cp	#0H66
	jp nz,	fail
	
;--------------------------------
; ld l, (hl)
;--------------------------------
   call rst_reg
	ld	hl,#hl_point
	ld	(hl),#0H77
	ld	l,(hl)
   ld a,l
	cp	#0H77
	jp nz,	fail
	
   ret