; *******************************
; LD (bc), a
; *******************************
	.area	_CODE
   .module ldbbcba

ldbbcba:

   call rst_reg
	ld	bc,#bc_point
   ld a, #0H22
	ld	(bc),a
   
   ld hl, #bc_point
   ld a, (hl)
	cp	#0H22
	jp nz,	fail
	
   ret