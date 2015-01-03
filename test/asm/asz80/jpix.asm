; *******************************
; JP IX
; *******************************
   .module jpix
   .title jpix
	.area	_CODE

jpix:
   call rst_reg

	ld	ix,#jphl_end
	jp (ix)
	jp fail
			
jpix_end:
   ret