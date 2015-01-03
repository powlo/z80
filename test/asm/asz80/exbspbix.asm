; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX (SP) IX Test       --
;-------------------------------

exbspbix:

   ld bc,#0H0000
   push bc

	ld	ix,#0H4050

	ex	(sp),ix
	
	ld	ix,#0H3243

	ex	(sp),ix

   push  ix
   pop   hl
	ld	a,#0H40			; we should have old ix		
	cp	h			
	jp	nz,	fail

	ld	a,#0H50			
	cp	l			
	jp	nz,	fail
	
	ex	(sp),ix

   push  ix
   pop   hl
	ld	a,#0H32			; again, we want the old ix		
	cp	h			
	jp	nz,	fail

	ld	a,#0H43			
	cp	l			
	jp	nz,	fail

   pop   bc          ; restore stack after testing

   ret