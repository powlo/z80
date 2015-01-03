; *******************************
; LD A, (DE)
; *******************************
	.area	_CODE
   .module ldabdeb

ldabdeb:

   call rst_reg
	ld	hl,#de_point
	ld	(hl),#0H11
   ld hl, #0H0000
   
	ld	de,#de_point
	ld	a,#0H00
	ld	a,(de)
	cp	#0H11
	jp nz,	fail
	
   ret