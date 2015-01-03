; *******************************
; LD (nn), iy
; *******************************

	.area	_CODE

ldbnnbiy:

   call rst_reg
   
   ld iy, #0hABCD
   
   ld (nn_point),iy
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

   ret