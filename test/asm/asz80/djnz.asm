; *******************************
; DJNZ
; *******************************
   .module djnz
   .title djnz
	.area	_CODE

djnz:
   call rst_reg

	ld	a,#0H00
	ld	b,#0H0A
	ld	c,#0H02

djnz_loop:				; this loop should be executed b times
	add	c				; b is hex A, so loop is executed ten times
							; each time c is added.
	djnz	djnz_loop
	cp	#0H14
	jp	nz,	fail

	ld	b,#0H05					
djnz_back:
	djnz	djnz_forw   	; this tests the instructions capacity to loop

	jp		djnz_end			; forwards.

djnz_forw:

	jp		djnz_back

djnz_end:
	cp	#0H14		         ; the A reg should not have changed
	jp	nz,	fail
   ret			


