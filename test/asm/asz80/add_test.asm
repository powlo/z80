; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
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

	mvi	a,&H01		; simple 1+1 to get started
	mvi	b,&H01
	add	b
	jz		fail			; Check all the flags to
	jc		fail			; make sure that the calculation
	jpe	fail			; was performed correctly in
	jm		fail			; the F flag.
	cmpi	&H02			; Check the result in A register
	jnz	fail

	mvi	a,&H40		; 40+45 = neg number :- overflow
	mvi	c,&H45
	add	c
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpo	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&H85
	jnz	fail

	mvi	a,&H08		; 8+A = 12 :- Half carry
	mvi	d,&H0A
	add	d
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H12
	jnz	fail

	mvi	a,&H80		; 80+FF = 7F :- Carry
	mvi	e,&HFF
	add	e
	;-------------------------------------------------
	jz		fail			; flag check
	jnc	fail			
	jpo	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H7F
	jnz	fail

	mvi	a,&H80	; now do some tests to make
	mvi	h,&H80	; sure carry operations work.
	add	h			; First, force a carry.
	mvi	a,&H01
	mvi	h,&H01
	adc	h
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H03		; because we performed adc
	jnz	fail		; the operation is 1+1+carry

	mvi	a,&H80	; Force a carry
	mvi	h,&H80	
	add	h			
	mvi	a,&H08	; 8+A+C = 13 :- Half carry
	mvi	d,&H0A
	adc	d
	;-------------------------------------------------
	jz		fail			; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H13
	jnz	fail

	mvi	a,&H80	; Force a carry
	mvi	h,&H80	
	add	h			
	mvi	a,&H85	; 85+7F+C = 05 :- Carry
	mvi	e,&H7F
	adc	e
	;-------------------------------------------------
	jz		fail		; flag check
	jnc	fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H05
	jnz	fail

	mvi	a,&H23	; check the immediate add instruction
	adi	&H36
	;-------------------------------------------------
	jz		fail		; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H59
	jnz	fail

	mvi	a,&H80	; Force a carry
	mvi	h,&H80	
	add	h			
	mvi	a,&H23	; check the immediate addc instruction
	aci	&H36
	;-------------------------------------------------
	jz		fail		; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H60
	jnz	fail

	mvi	h,&H30	; check the add (hl) instruction
	mvi	l,&H01
	mvi	m,&HA4		; m refers to (hl)!

	mvi	a,&H1F	
	add	m
	;-------------------------------------------------
	jz		fail		; flag check
	jc		fail			
	jpe	fail			
	jp		fail			
	;-------------------------------------------------
	cmpi	&HC3
	jnz	fail

	mvi	a,&H80	; Force a carry
	mvi	h,&H80	
	add	h			
	mvi	a,&H31	; 31+31+C = 63 :- Carry
	mvi	m,&H31
	adc	m
	;-------------------------------------------------
	jz		fail		; flag check
	jc		fail			
	jpe	fail			
	jm		fail			
	;-------------------------------------------------
	cmpi	&H63
	jnz	fail
	
pass
	mvi	a,&H55
	sta	&H2000

	jmp	pass
	
fail
	
	mvi	a,&HAA
	sta	&H2000
	jmp	fail

