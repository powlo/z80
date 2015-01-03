; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the interrupt mechanism

	.area	CODE (ABS)
	.org	#0H0000	
	jp		main_code

	.org	#0H0038	
	jp		mode1_code

	.org	#0H0066	
	jp		nmi_code


main_code:	
	ei
	ld	a,#0H00
	ld	b,#0H0A
	
loop:
	dec	b
	jp	z,		test_for_end
	jp		loop

test_for_end:
	cp	#0H01
	jp	nz,	fail
	jp		pass
	
mode1_code:
	ld	a,#0H01
	ret
		
nmi_code:
	ld	a,#0H02
	ret
		
pass:
	ld	a,#0H55
	ld	(#0H2000),a
   halt
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

