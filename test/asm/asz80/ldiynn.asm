; *******************************
; LD iy, nn
; *******************************

	.area	_CODE

ldiynn:

   call rst_reg
   
	ld	iy,#0HAE81

   push iy
   pop  hl
   
	ld	a,#0HAE
	cp	h
	jp	nz,	fail

	ld	a,#0H81
	cp	l
	jp	nz,	fail

   ret