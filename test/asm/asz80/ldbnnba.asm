; *******************************
; LD (nn), a
; *******************************
	.area	_CODE
   .module ldbnnba

ldbnnba:

   call rst_reg
   ld a, #0H77
	ld	(nn_point),a
   
   ld hl, #nn_point
   ld a, (hl)
	cp	#0H77
	jp nz,	fail
	
   ret