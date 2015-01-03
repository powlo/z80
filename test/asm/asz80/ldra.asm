; *******************************
; LD R A
; *******************************

	.area	_CODE
	.module ldra 

ldra:
   
   ld a, #0H77
   ld r, a
   ld a, #0H00
   ld a, r
   
   cp   #0H7A              ; compare to 7A because refresh always incs.
   jp   nz,fail            ; there are three instructions between load and store
   

   ret

