; *******************************
; LD A, (nn)
; *******************************
	.area	_CODE
   .module ldabnnb

ldabnnb:

   call rst_reg
	ld	a,#0H55
	ld	(#nn_point),a
	ld	hl,#nn_point
	ld	a,#0H00
   ld a,(hl)

	cp	#0H55
	jp nz,	fail
	
   ret