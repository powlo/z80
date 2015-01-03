; *******************************
; LD I A
; *******************************

	.area	_CODE
	.module ldia 

ldia:
   call rst_reg
   ld a, #0H55
   ld i, a
   ld a, #0H00
   ld a, i
   
   cp   #0H55
   jp   nz,fail
   
   ret

