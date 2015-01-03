; *******************************
; JP e
; *******************************
jpe:
	jp    next_jr				; a forward jump
	jp    fail

backward_label:
	jp    test_jmp_c
next_jr:
	jp    backward_label		; a backward jump
	jp    fail

   ret