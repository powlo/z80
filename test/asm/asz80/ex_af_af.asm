; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX AF Test            --
;-------------------------------
ex_af_af:

	ld	a,#0HDE
	ld	c,#0H11
	add	c
	ex	af,af

	jp	z,	fail			; The new F flag will be empty
	jp	c,	fail			; since this is the first swap.
	jp	pe,	fail			; 
	jp	m,	fail			; 

	cp	#0H00			; the new A should be empty too
	jp	nz,	fail

	ld	a,#0H80
	ld	b,#0H80

	add	b

	ex	af,af

	jp	z,	fail			; The F flag will be that of
	jp	c,	fail			; the calculation before the 
	jp	pe,	fail			; last swap, ie from DE+11
	jp	p,	fail			; 

	cp	#0HEF			; A value from DE+11
	jp	nz,	fail
	
	ex	af,af

	jp	nz,	fail			; The F flag will be that of
	jp	nc,	fail			; the calculation  from 80+80
	jp	m,	fail			; 

	cp	#0H00			; A value from 80+80
	jp	nz,	fail

   ret