; *******************************
; LD (nn), ix
; *******************************

	.area	_CODE

ldbnnbix:

   call rst_reg
   
   ld ix, #0hABCD
   
   ld (nn_point),ix
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

   ret