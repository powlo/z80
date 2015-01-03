; *******************************
; RET
; *******************************
   .module ret
   .title ret
	.area	_CODE

ret:
   call rst_reg

   ld hl, #ret_label
   push hl
   ret
   jp fail
ret_label:
   ret   