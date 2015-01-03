; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

	.area	_CODE

;-------------------------------
; INC A
;-------------------------------
	ld	a,#0HFF
	inc	a		; increment a
	jp	nz,	fail		; Check all the flags to
	jp	nc,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	cp	#0H00
	jp	nz,	fail

;-------------------------------
; INC B
;-------------------------------
	ld	b,#0H12
	inc	b		; increment b
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,b
	cp	#0H13
	jp	nz,	fail

;-------------------------------
; INC C
;-------------------------------
	ld	c,#0H80
	inc	c		; increment c
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,	fail		; the F flag.
	ld	a,c
	cp	#0H81
	jp	nz,	fail

;-------------------------------
; INC D
;-------------------------------
	ld	d,#0HF0
	inc	d		; increment d
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,	fail		; the F flag.
	ld	a,d
	cp	#0HF1
	jp	nz,	fail

;-------------------------------
; INC E
;-------------------------------
	ld	e,#0H01
	inc	e		; increment e
	jp	z,	fail		; Check all the flags to
	jp	c,	fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,	fail		; the F flag.
	ld	a,e
	cp	#0H02
	jp	nz,	fail

;-------------------------------
; INC H
;-------------------------------
	ld	h,#0H55
	inc	h		; increment h
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	m,		fail	; the F flag.
	ld	a,h
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC L
;-------------------------------
	ld	l,#0H9F
	inc	l		; increment l
	jp	z,		fail	; Check all the flags to
	jp	c,		fail	; make sure that the calculation
	jp	pe,	fail	; was performed correctly in
	jp	p,		fail	; the F flag.
	ld	a,l
	cp	#0HA0
	jp	nz,	fail

;-------------------------------
; INC (HL)
;-------------------------------
	ld	(hl),#0H0F
	inc	(hl)			; increment (hl)
	jp	z,		fail		; Check all the flags to
	jp	c,		fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld	a,(hl)
	cp	#0H10	
	jp	nz,	fail	

;-------------------------------
; INC (IX+d)
;-------------------------------
	ld		ix,#0H3000		; load ix with value 3000
	ld		a,#0H4F
	ld		(#0H3010),a		;	write 4F to 3010

	inc	0H10(ix)      ; increment (ix+d)
	jp	z,		fail		; Check all the flags to
	jp	c,		fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.

	ld		a,(#0H3010)	; read 3000 to A reg.
	cp	#0H50
	jp	nz,	fail

;-------------------------------
; INC (IY+d)
;-------------------------------
	ld		iy,#0H3050		; load iy with value 3050
	ld		a,#0H8F
	ld		(#0H3067),a		;	write 4F to 3067

	inc	0H17(iy)      ; increment (iy+d)
	jp	z,		fail		; Check all the flags to
	jp	c,		fail		; make sure that the calculation
	jp	pe,	fail		; was performed correctly in
	jp	p,		fail		; the F flag.

	ld		a,(#0H3067)	; read 0H3067 to A reg.
	cp	#0H90
	jp	nz,	fail

;-------------------------------
; INC IXh
;-------------------------------
; OK This is where it gets tricky
; The following tests are designed to test the 
; INC	IXh and INC IXl commands. These instructions
; are undocumented and are not supported by the assembler
;; currently being used. Therefore editing of the resultant
; RAM file is required.
; The test is copied as for the inc h and inc l.
; the inserted nop is replaced by the required prefix code.

	ld	hl,#0H0000
	ld	iy,#0H0000
	ld	ix,#0H1F30
	
	nop
	inc	h	   	; increment IXh (change needs to be done in RAM file!
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

	ex	(sp),iy     ; check the IY reg has not
	ex	(sp),hl     ; been corrupted. by swapping
	ld	a,#0H00		; to the hl register
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the inc has worked
	ex	(sp),hl					; on the IXh reg.
	ld	a,#0H20
	cp	h
	jp	nz,	fail

;-------------------------------
; INC IXl
;-------------------------------
; notes on above test aply here.

	ld	hl,#0H0000
	ld	iy,#0H0000
	ld	ix,#0H1F30
	
	nop
	inc	l		; increment IXl (change needs to be done in RAM file!
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

	ex	(sp),ix					; check the inc has worked
	ex	(sp),hl					; on the IXl reg.
	ld	a,#0H31
	cp	l
	jp	nz,	fail

;-------------------------------
; INC IYh
;-------------------------------
; notes on above test apply here.

	ld	hl,#0H0000
	ld	iy,#0HF9FF
	ld	ix,#0H0000
	
	nop
	inc	h		; increment IYh (change needs to be done in RAM file!
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

	ex	(sp),iy					; check the inc has worked
	ex	(sp),hl					; on the IYh reg.
	ld	a,#0HFA
	cp	h
	jp	nz,	fail
	
;-------------------------------
; INC IYl
;-------------------------------
; notes on above test apply here.

	ld	hl,#0H0000
	ld	iy,#0HF9FE
	ld	ix,#0H0000
	
	nop
	inc	l		; increment IYl (change needs to be done in RAM file!
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

	ex	(sp),iy					; check the inc has worked
	ex	(sp),hl					; on the IYl reg.
	ld	a,#0HFF
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

