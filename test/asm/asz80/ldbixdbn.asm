; *******************************
; LD (ix), n
; *******************************
	.area	_CODE
   .module ldbixbn
   
ldbixdbn:
; ------------
; LD A, n
; ------------
   call rst_reg
   ld ix,#ix_point
	ld	0H3(ix),#0H01
	ld a, #0H01
   cp 0H3(ix)
	jp	nz,	fail
	
   ret
