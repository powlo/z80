; *******************************
; JR e
; *******************************
   .module jre
   .title jre
	.area	_CODE

jre:
   call rst_reg

	jr	jre_next				; a forward jump
	jp		fail

jre_back:
	ret
jre_next:
	jr	jre_back    		; a backward jump
	jp		fail
