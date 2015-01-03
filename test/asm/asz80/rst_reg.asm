;-----------------------------------
;--Sub routine to reset registers --
;-----------------------------------
   .module rst_reg
   .title rst_reg
	.area	_CODE

rst_reg:
	ld	a,#0H00
	ld	b,#0H00
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	hl,#0H0000
	ld	ix,#0H0000
	ld	iy,#0H0000
   ret