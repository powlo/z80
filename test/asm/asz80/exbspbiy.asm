; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

;-------------------------------
;--     EX (SP) IY Test       --
;-------------------------------

exbspbiy:

   ld bc,#0H0000
   push bc

	ld	iy,#0H4050

	ex	(sp),iy
	
	ld	iy,#0H3243

	ex	(sp),iy

   push  iy
   pop   hl
	ld	a,#0H40			; we should have old iy		
	cp	h			
	jp	nz,	fail

	ld	a,#0H50			
	cp	l			
	jp	nz,	fail
	
	ex	(sp),iy

   push  iy
   pop   hl
	ld	a,#0H32			; again, we want the old iy		
	cp	h			
	jp	nz,	fail

	ld	a,#0H43			
	cp	l			
	jp	nz,	fail

   pop   bc          ; restore stack after testing

   ret