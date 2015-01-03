; *******************************
; Pushix
; *******************************

	.area	_CODE

pushix:

;--------------------------------
; push ix
;--------------------------------
   call rst_reg	

   ld ix, #0HABCD   
   push ix
   pop  hl

   ld a,h   
   cp	#0HAB
	jp	nz,	fail

   ld a,l   
   cp	#0HCD
	jp	nz,	fail

   ret