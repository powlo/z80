; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; targets:
; jr

	.area	CODE (ABS)
	.org	#0H0000	
	
;-------------------------------
;--     JR e TEST             --
;-------------------------------
	jmpr	next_jr				; a forward jump
	jp		fail

backward_label:
	jp		test_jr_c
next_jr:
	jmpr	backward_label		; a backward jump
	jp		fail

;-------------------------------
;--     JR (condition),e      --
;-------------------------------

test_jr_c:			
	ld	a,#0H80				; force a carry
	ld	b,#0H80
	add	b
	jrnc	fail
	
	ld	a,#0H01				; force a no-carry
	ld	b,#0H01
	add	b
	jrc	fail

	ld	a,#0H00				; force a zero result
	ld	b,#0H00
	add	b
	
	jrnz	fail					;force a non-zero result
	ld	b,#0H01
	add	b
	jrz	fail

;-------------------------------
;--     DJNZ                  --
;-------------------------------
	ld	a,#0H00
	ld	b,#0H0A
	ld	c,#0H02
	ld	e,#0H70
	ld	h,#0H22
	ld	l,#0H33

test_loop				; this loop should be executed b times
	add	c				; b is hex A, so loop is executed ten times
							; each time c is added.
	djnz	test_loop

	cp	#0H14


	jp	nz,	fail

	ld	b,#0H05					
backward_mark:
	djnz	forward_loop	; this tests the instructions capacity to loop

	jp		finish			; forwards.

forward_loop:

	jp		backward_mark

finish						; the A reg should not have changed
	cp	#0H14
	jp	nz,	fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a	jp		pass	
		
fail:
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

