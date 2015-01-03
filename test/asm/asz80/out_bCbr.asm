; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the out (c),r 
; instructions

	.area	CODE (ABS)
	.org	#0H0000	


;---------------------------------------------
; Write the data out
;---------------------------------------------
; Testing each of the hardcoded parameters a,b,c...
;---------------------------------------------
	ld		bc,#0H0011
	ld		a,#0H01
	out	(c),a

	ld		bc,#0H0022
	ld		b,#0H02
	out	(c),b

	ld		bc,#0H0033			; we cant change c  here because
	out	(c),c					; its the address too!

	ld		bc,#0H0044
	ld		d,#0H04
	out	(c),d

	ld		bc,#0H0055
	ld		e,#0H05
	out	(c),e

	ld		bc,#0H0066
	ld		h,#0H06
	out	(c),h

	ld		bc,#0H0077
	ld		l,#0H07
	out	(c),l

;---------------------------------------------
;	Data for exceptions
;---------------------------------------------
; Data is zero or FF
	ld		bc,#0H00A5			
	ld		a,#0H00 				
	out	(c),a 				

	ld		bc,#0H005A			
	ld		a,#0HFF 				
	out	(c),a 				

; Address is zero or FF
	ld		bc,#0H0000			
	ld		a,#0HA5 				
	out	(c),a 				

	ld		bc,#0H00FF			
	ld		a,#0H5A 				
	out	(c),a 				

;---------------------------------------------
; Check results
;---------------------------------------------
	in		a, (#0H11)	
	cp		#0H01
	jp		nz,fail
	
	in		a, (#0H22)	
	cp		#0H02
	jp		nz,fail
	
	in		a, (#0H33)	
	cp		#0H33
	jp		nz,fail
	
	in		a, (#0H44)	
	cp		#0H04
	jp		nz,fail
	
	in		a, (#0H55)	
	cp		#0H05
	jp		nz,fail
	
	in		a, (#0H66)	
	cp		#0H06
	jp		nz,fail
	
	in		a, (#0H77)	
	cp		#0H07
	jp		nz,fail
	
	in		a, (#0HA5)	
	cp		#0H00
	jp		nz,fail
	
	in		a, (#0H5A)	
	cp		#0HFF
	jp		nz,fail
	
	in		a, (#0H00)	
	cp		#0HA5
	jp		nz,fail
	
	in		a, (#0HFF)	
	cp		#0H5A
	jp		nz,fail
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

