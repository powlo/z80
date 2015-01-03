; *******************************
; LD sp, ix
; *******************************

	.area	_CODE

ldspix:

   call rst_reg	

   ld (sp_point), sp
   ld sp,#0H0000
   ld	ix,#0HABCD

   ld sp, ix

   ld ix,#0H0000
   
   add ix, sp

   ld sp, (sp_point)

   push ix
   pop  hl
      
	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail
   
   ret