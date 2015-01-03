; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

	.area	CODE (ABS)
	.org	#0H0000	


	ld	a,#0H00
	dec	a		; increment a
	jp	z,	fail		; Check all the flags to
	jp	nc,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,	fail		; the F flag.
	cp	#0HFF
	jp	nz,	fail

	ld	b,#0H13
	dec	b		; increment b
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,b
	cp	#0H12
	jp	nz,	fail

	ld	c,#0H81
	dec	c		; increment c
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,	fail		; the F flag.
	ld	a,c
	cp	#0H80
	jp	nz,	fail

	ld	d,#0HF1
	dec	d		; increment d
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,	fail		; the F flag.
	ld	a,d
	cp	#0HF0
	jp	nz,	fail

	ld	e,#0H02
	dec	e		; increment e
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,e
	cp	#0H01
	jp	nz,	fail

	ld	h,#0H10
	dec	h		; increment h
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,h
	cp	#0H0F
	jp	nz,	fail

	ld	l,#0H33
	dec	l		; increment l
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,l
	cp	#0H32
	jp	nz,	fail	
	
	ld	(hl),#0H10
	dec	(hl)			; decrement (hl)
	jp	z,		fail		; Check all the flags to
	jp	c,		fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld	a,(hl)
	cp	#0H0F	
	jp	nz,	fail	

;-------------------------------
; DEC IXh
;-------------------------------
; OK This is where it gets tricky
; The following tests are designed to test the 
; DEC	IXh and DEC IXl commands. These instructions
; are undocumented and are not supported by the assembler
;; currently being used. Therefore editing of the resultant
; RAM file is required.
; The test is copied as for the dec h and dec l.
; the inserted nop is replaced by the required prefix code.

	ld	hl,#0H0000
	ld	iy,#0H0000
	ld	ix,#0H2031
	
	nop
	dec	h		; decrement IXh (change needs to be done in RAM file!
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	m,		fail	; the F flag.

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

	ex	(sp),ix					; check the dec has worked
	ex	(sp),hl					; on the IXh reg.
	ld	a,#0H1F
	cp	h
	jp	nz,	fail

;-------------------------------
; DEC IXl
;-------------------------------
; notes on above test aply here.

	ld	hl,#0H0000
	ld	iy,#0H0000
	ld	ix,#0H2031
	
	nop
	dec	l		; decrement IXl (change needs to be done in RAM file!
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	m,		fail	; the F flag.

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

	ex	(sp),ix					; check the dec has worked
	ex	(sp),hl					; on the IXl reg.
	ld	a,#0H30
	cp	l
	jp	nz,	fail

;-------------------------------
; DEC IYh
;-------------------------------
; notes on above test apply here.

	ld	hl,#0H0000
	ld	iy,#0HFA00
	ld	ix,#0H0000
	
	nop
	dec	h		; decrement IYh (change needs to be done in RAM file!
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	p,		fail	; the F flag.

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

	ex	(sp),iy					; check the dec has worked
	ex	(sp),hl					; on the IYh reg.
	ld	a,#0HF9
	cp	h
	jp	nz,	fail
	
;-------------------------------
; INC IYl
;-------------------------------
; notes on above test apply here.

	ld	hl,#0H0000
	ld	iy,#0H00FF
	ld	ix,#0H0000
	
	nop
	dec	l		; decrement IYl (change needs to be done in RAM file!
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	p,		fail	; the F flag.

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

	ex	(sp),iy					; check the dec has worked
	ex	(sp),hl					; on the IYl reg.
	ld	a,#0HFE
	cp	l
	jp	nz,	fail
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

