; *******************************
; LD ix, nn
; *******************************

	.area	_CODE

ldixnn:

   call rst_reg
   
	ld	ix,#0H2468

   push ix
   pop  hl
   
	ld	a,#0H24
	cp	h
	jp	nz,	fail

	ld	a,#0H68
	cp	l
	jp	nz,	fail

   ret