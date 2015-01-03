; *******************************
; LD (nn), hl
; *******************************

	.area	_CODE

ldbnnbhl:

   call rst_reg
   
   ld hl, #0hABCD
   
   ld (nn_point),hl
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

   ret