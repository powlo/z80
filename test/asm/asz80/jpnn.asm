; *******************************
; JP nn
; *******************************
   .module jpnn
   .title jpnn
	.area	_CODE

jpnn:
   call rst_reg

	jp    next_jr				; a forward jump
	jp    fail

backward_label:
	ret                     ; end of test
next_jr:
	jp    backward_label		; a backward jump
	jp    fail
