; *******************************
; LD (iy), n
; *******************************
	.area	_CODE
   .module ldbiybn
   
ldbiydbn:
; ------------
; LD A, n
; ------------
   call rst_reg
   ld iy,#iy_point
	ld	0H3(iy),#0H01
	ld a, #0H01
   cp 0H3(iy)
	jp	nz,	fail
	
   ret
