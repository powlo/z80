; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX (SP) HL Test       --
;-------------------------------

exbspbhl:

   ld bc,#0H0000
   push bc

	ld	hl,#0H4050

	ex	(sp),hl
	
	ld	hl,#0H3243

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

   pop   bc          ; restore stack after testing
   ret