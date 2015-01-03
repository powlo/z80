; *******************************
; LD ix, (nn)
; *******************************

	.area	_CODE

ldixbnnb:

   call rst_reg
   
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a
      
	ld	ix,(nn_point)

   push ix
   pop hl

	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail

   ret