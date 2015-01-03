; *******************************
; Pushiy
; *******************************

	.area	_CODE

pushiy:

;--------------------------------
; push iy
;--------------------------------
   call rst_reg	

   ld iy, #0HABCD   
   push iy
   pop  hl

   ld a,h   
   cp	#0HAB
	jp	nz,	fail

   ld a,l   
   cp	#0HCD
	jp	nz,	fail

   ret