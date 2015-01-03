; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX X Test             --
;-------------------------------

exx:

	ld	b,#0H12
	ld	c,#0H34
	ld	d,#0H56
	ld	e,#0H78
	ld	h,#0H9A
	ld	l,#0HBC

	exx

	ld	a,#0H00			; all b,c,d,e,h,l should now be zero
	cp	b			; because we've just done an ex x
	jp	nz,	fail
	cp	c
	jp	nz,	fail
	cp	d
	jp	nz,	fail
	cp	e
	jp	nz,	fail
	cp	h
	jp	nz,	fail
	cp	l
	jp	nz,	fail

	ld	b,#0Hdd
	ld	c,#0Hee
	ld	d,#0Hff
	ld	e,#0H11
	ld	h,#0H22
	ld	l,#0H33

	exx

	ld	a,#0H12			; we return to the old values
	cp	b			; and check them
	jp	nz,	fail

	ld	a,#0H34			
	cp	c			
	jp	nz,	fail

	ld	a,#0H56			
	cp	d			
	jp	nz,	fail

	ld	a,#0H78			
	cp	e			
	jp	nz,	fail

	ld	a,#0H9A			
	cp	h			
	jp	nz,	fail

	ld	a,#0HBC			
	cp	l			
	jp	nz,	fail

	exx				; Kazaam Aanother exchange

	ld	a,#0Hdd			; final check of the shadow values
	cp	b			
	jp	nz,	fail

	ld	a,#0Hee			
	cp	c			
	jp	nz,	fail

	ld	a,#0Hff			
	cp	d			
	jp	nz,	fail

	ld	a,#0H11			
	cp	e			
	jp	nz,	fail

	ld	a,#0H22			
	cp	h			
	jp	nz,	fail
	
   ret
   