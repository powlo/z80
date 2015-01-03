; *******************************
; LD sp, iy
; *******************************

	.area	_CODE
   .module ldspiy

ldspiy:

   call rst_reg	

   ld (sp_point), sp
   ld sp,#0H0000
   ld	iy,#0HABCD

   ld sp, iy

   ld iy,#0H0000
   
   add iy, sp

   ld sp, (sp_point)

   push iy
   pop  hl
      
	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail
   
   ret