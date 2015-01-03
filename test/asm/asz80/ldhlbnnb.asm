; *******************************
; LD hl, (nn)
; *******************************

	.area	_CODE

ldhlbnnb:

   call rst_reg
   
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a
      
	ld	hl,(nn_point)

	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail

   ret