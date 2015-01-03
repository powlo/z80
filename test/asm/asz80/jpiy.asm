; *******************************
; JP IY
; *******************************
   .module jpiy
   .title jpiy
	.area	_CODE

jpiy:
   call rst_reg

	ld	iy,#jphl_end
	jp (iy)
	jp fail
			
jpiy_end:
   ret