; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This is a test to target the 16bit add and
; adc together. Add works fine but adc
; causes the fetch to fail. Confused as code
; is almost identical.

	.area	CODE (ABS)
	.org	#0H0000	

	ld	b,#0HCA
	ld	c,#0HDE
	ld	d,#0H45
	ld	e,#0H70
	ld	h,#0H22
	ld	l,#0H33

	ld	d,e				; some loads to see if early fetch works here.
	ld	c,b
	
	inc	a
	inc	b
	inc	c
	
;-------------------------------
;--     ADD HL BC             --
;-------------------------------
	add	hl,bc

	jp	c,	fail			

	adc	hl,bc

	jp	c,	fail			
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

