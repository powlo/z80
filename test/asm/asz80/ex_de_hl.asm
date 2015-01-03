; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX DE HL Test         --
;-------------------------------

ex_de_hl:

	ld	de,#0H1234
	ld	hl,#0H5678

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

	ex	de,hl          ; return things how they were

   ret