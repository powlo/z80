; *******************************
; LD A, (BC)
; *******************************
	.area	_CODE
   .module ldabbcb

ldabbcb:

   call rst_reg
	ld	hl,#bc_point
	ld	(hl),#0H11
   ld hl,#0H0000

	ld	bc,#bc_point
	ld	a,#0H00
	ld	a,(bc)
	cp	#0H11
	jp nz,	fail
	
   ret