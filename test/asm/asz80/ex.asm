; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

	.area	CODE (ABS)
	.org	#0H0000	

;-------------------------------
;--     EX AF Test            --
;-------------------------------
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


;-------------------------------
;--     EX DE HL Test         --
;-------------------------------

	ld	d,#0H12
	ld	e,#0H34
	ld	h,#0H56
	ld	l,#0H78

	ex	de,hl

	ld	a,#0H12
	cp	d
	jp	z,	fail			; we've swapped, so they shouldn't match!

	ld	a,#0H56			; d should hold the old h value, 56.
	cp	d
	jp	nz,	fail			

	ld	a,#0H34
	cp	e
	jp	z,	fail			

	ld	a,#0H78			; e should hold the old l value, 78.
	cp	e
	jp	nz,	fail			

	ld	a,#0H56
	cp	h
	jp	z,	fail			

	ld	a,#0H12			; h should hold the old d value, 12.
	cp	h
	jp	nz,	fail			

	ld	a,#0H78
	cp	l
	jp	z,	fail			

	ld	a,#0H34			; l should hold the old e value, 34.
	cp	l
	jp	nz,	fail			

;-------------------------------
;--     EX X Test             --
;-------------------------------


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
	
;-------------------------------
;--     EX (SP) HL Test       --
;-------------------------------

	ld	h,#0H30
	ld	l,#0H00


	ld	sp,hl				; use ld sp hl because other loads are not yet coded...
	ld	(hl),#0H00
	ld	l,#0H01
	ld	(hl),#0H00

	ld	h,#0H40
	ld	l,#0H50

	ex	(sp),hl
	
	ld	h,#0H32
	ld	l,#0H43

	ex	(sp),hl

	ld	a,#0H40			; we should have old hl		
	cp	h			
	jp	nz,	fail

	ld	a,#0H50			
	cp	l			
	jp	nz,	fail
	
	ex	(sp),hl

	ld	a,#0H32			; again, we want the old hl		
	cp	h			
	jp	nz,	fail

	ld	a,#0H43			
	cp	l			
	jp	nz,	fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

