; *******************************
; JP HL
; *******************************
   .module jphl
   .title jphl
	.area	_CODE

jphl:
   call rst_reg

	ld	hl,#jphl_end
	jp (hl)
	jp fail
			
jphl_end:
   ret