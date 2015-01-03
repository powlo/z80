; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; Trying to get new assembler to work

	.area	CODE (ABS)
	.org	0H0000	

	ld	a,	#0H01
	bit	0,a
	jp	z,fail
	ld	a,	#0HFE
	bit	0,a
	jp	nz,fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp	pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp	fail

