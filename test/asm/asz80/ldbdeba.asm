; *******************************
; LD (de), a
; *******************************
	.area	_CODE
   .module ldbdeba

ldbdeba:

   call rst_reg
	ld	de,#de_point
   ld a, #0H77
	ld	(de),a
   
   ld hl, #de_point
   ld a, (hl)
	cp	#0H77
	jp nz,	fail
	
   ret