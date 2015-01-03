; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the and
; instructions.

	z80
	org	&H0000	

	mvi	a,&H00
	mvi	b,&H00
	mvi	c,&H00
	mvi	d,&H00
	mvi	e,&H00
	mvi	h,&H00
	mvi	l,&H00

	mvi	a,&HAA		; Bitwise check of and fucntion
	ana	a
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&HAA
	jnz	fail

	mvi	a,&HAA		
	mvi	b,&HCC
	ana	b
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	b,&H00
	mvi	a,&HAA		
	mvi	c,&HCC
	ana	c
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	c,&H00
	mvi	a,&HAA		
	mvi	d,&HCC
	ana	d
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	d,&H00
	mvi	a,&HAA		
	mvi	e,&HCC
	ana	e
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	e,&H00
	mvi	a,&HAA		
	mvi	h,&HCC
	ana	h
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	h,&H00
	mvi	a,&HAA		
	mvi	l,&HCC
	ana	l
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	h,&H20
	mvi	l,&H01
	mvi	a,&HAA		
	mvi	m,&HCC
	ana	m
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	h,&H00
	mvi	l,&H00
	mvi	a,&HAA		
	ani	&HCC
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H88
	jnz	fail

	mvi	a,&HF0
	mvi	b,&H0F
	ana	b			; Should give z,pe,p
	;-------------------------------------------------
	jnz	fail			; flag check
	jc		fail			
	jpo	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H00
	jnz	fail

	mvi	a,&H80
	mvi	b,&H80
	ana	b			; Should give nz,po,m
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpe	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H80
	jnz	fail
	
pass
	mvi	a,&H55
	sta	&H2000

	jmp	pass
	
fail
	
	mvi	a,&HAA
	sta	&H2000
	jmp	fail

