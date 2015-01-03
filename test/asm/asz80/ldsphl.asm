; *******************************
; LD sp, hl
; *******************************

	.area	_CODE

ldsphl:

   call rst_reg	

   ld (sp_point), sp
   ld sp,#0H0000
   ld	hl,#0HABCD

   ld sp, hl

   ld hl,#0H0000
   
   add hl, sp
   
	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail

   ld sp, (sp_point)

   ret