; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the general arithmetic
; instructions

	z80
	org	&H0000	

;-------------------------------------
;	Set / Clear Carry Tests
;-------------------------------------

	mvi	a,&H01
	mvi	b,&H01
	add	b
	jc		fail		; force no carry
	stc				; set the carry flag
	jnc	fail
	
	mvi	a,&HFF
	mvi	b,&H01
	add	b
	jnc	fail		; force a carry
	cmc				; clear the carry flag
	jc		fail
	
;-------------------------------------
;	Compliment
;-------------------------------------
	
	mvi	a,&H0F
	cma
	cmpi	&HF0
	jnz	fail
	
;-------------------------------------
;	Negate
;-------------------------------------

; Not yet implimented!

;	mvi	a,&H53
;	neg
;	cmpi	&HAD
;	jnz	fail

	
pass
	mvi	a,&H55
	sta	&H2000

	jmp	pass
	
fail
	
	mvi	a,&HAA
	sta	&H2000
	jmp	fail

