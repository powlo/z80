; *******************************
; LD (hl), n
; *******************************
	.area	_CODE
   .module ldbhlbn
   
ldbhlbn:
; ------------
; LD A, n
; ------------
   call rst_reg
   ld hl,#hl_point
	ld	(hl),#0H01
	ld a, #0H01
   cp (hl)
	jp	nz,	fail
	
   ret
