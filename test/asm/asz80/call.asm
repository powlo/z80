; *******************************
; CALL
; *******************************
   .module call
   .title call
	.area	_CODE

call:
   call rst_reg
   
	ld	a,#0H00

	call call_sub
	cp	#0H01
	jp	nz,	fail
	ret
   
call_sub:	
	ld	a,#0H01
	ret
	jp		fail