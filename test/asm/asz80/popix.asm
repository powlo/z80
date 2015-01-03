; *******************************
; Popix
; *******************************

	.area	_CODE

popix:

;--------------------------------
; pop ix
;--------------------------------
   call rst_reg	

   ld hl, #hl_point+1
   ld (hl), #0HCD
   
   ld hl, #hl_point
   ld (hl), #0HAB
   
   push hl
   ld hl, #0H0000
   pop  ix

   ld a,0H0(ix)   
   cp	#0HAB
	jp	nz,	fail

   ld a,0H1(ix)   
   cp	#0HCD
	jp	nz,	fail

   ret