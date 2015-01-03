; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This file contains tests for all "undocumented"
; opcodes. These opcodes are unsupported by assemblers
; / compilers and so to generate they require ram file
; editing. This is a pain, so should only be done once,
; hence all unsupported codes in one file.

	.area	CODE (ABS)
	.org	#0H0000	

; ------------
; LD IXh, n
; ------------
; Requires RAM file editing because the assembler
; does not support undocumented opcodes.
	ld	hl,#0H0000
	ld	iy,#0H0000
	nop					; replace this nop with "DD" in the ram file.
	ld	h,#0H80

	ld	a,#0H00		; check the HL register has
	cp	l				; not been corrupted.
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),iy					; check the IY reg has not
	ex	(sp),hl					; been corrupted. by swapping
	ld	a,#0H00		; to the hl register
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the ld has worked
	ex	(sp),hl					; on the IXh reg.
	ld	a,#0H80
	cp	h
	jp	nz,	fail	
	
; ------------
; LD IXl, n
; ------------
; Requires RAM file editing because the assembler
; does not support undocumented opcodes.
	ld	hl,#0H0000
	ld	iy,#0H0000
	nop					; replace this nop with "DD" in the ram file.
	ld	l,#0H11

	ld	a,#0H00		; check the HL register has
	cp	l				; not been corrupted.
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),iy					; check the IY reg has not
	ex	(sp),hl					; been corrupted. by swapping
	ld	a,#0H00		; to the hl register
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the ld has worked
	ex	(sp),hl					; on the IX1 reg.
	ld	a,#0H11
	cp	l
	jp	nz,	fail	

; ------------
; LD IYh, n
; ------------
; Requires RAM file editing because the assembler
; does not support undocumented opcodes.
	ld	hl,#0H0000
	ld	ix,#0H0000
	nop					; replace this nop with "FD" in the ram file.
	ld	h,#0H22

	ld	a,#0H00		; check the HL register has
	cp	l				; not been corrupted.
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the IX reg has not
	ex	(sp),hl					; been corrupted. by swapping
	ld	a,#0H00		; to the hl register
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),iy					; check the ld has worked
	ex	(sp),hl					; on the IYh reg.
	ld	a,#0H22
	cp	h
	jp	nz,	fail	
		
; ------------
; LD IYl, n
; ------------
; Requires RAM file editing because the assembler
; does not support undocumented opcodes.
	ld	hl,#0H0000
	ld	ix,#0H0000
	nop					; replace this nop with "FD" in the ram file.
	ld	l,#0H33

	ld	a,#0H00		; check the HL register has
	cp	l				; not been corrupted.
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the IX reg has not
	ex	(sp),hl					; been corrupted. by swapping
	ld	a,#0H00		; to the hl register
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),iy					; check the ld has worked
	ex	(sp),hl					; on the IYl reg.
	ld	a,#0H33
	cp	l
	jp	nz,	fail	
		
pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail