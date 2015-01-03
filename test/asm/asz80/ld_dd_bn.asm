; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the ld dd (nn) instructions
; where dd is bc,de,hl or sp.

;----------------
; Test LD bc, (nn)
; and LD (nn), bc
;----------------
	ld	bc,#0H4754	; store and load bc direct.
	ld	(#0H2002),bc; load bc value direct to 2002
	ld	bc,#0H0000	; clear bc register
	ld	bc,(#0H2002); load bc value FROM 2002
	
	ld	a,#0H47
	cp	b
	jp	nz,	fail

	ld	a,#0H54
	cp	c
	jp	nz,	fail

;----------------
; Test LD de, (nn)
; and LD (nn), de
;----------------
	ld	de,#0H9AE1	; store and load de direct.
	ld	(#0H2002),de; load de value direct to 2002
	ld	de,#0H0000	; clear de register
	ld	de,(#0H2002); load de value FROM 2002
	
	ld	a,#0H9A
	cp	d
	jp	nz,	fail

	ld	a,#0HE1
	cp	e
	jp	nz,	fail

;----------------
; Test LD HL, (nn)
; and LD (nn), HL
;----------------
	ld	hl,#0H6CE4	; store and load hl direct.
	ld	(#0H2002),hl; load hl value direct to 2002
	ld	hl,#0H0000	; clear hl register
	ld	hl,(#0H2002); load hl value FROM 2002
	
	ld	a,#0H6C
	cp	h
	jp	nz,	fail

	ld	a,#0HE4
	cp	l
	jp	nz,	fail

;----------------
; Test LD sp, (nn)
; and LD (nn), sp
;----------------
	ld		bc,#0H29B1	; a value to push onto the stack
	ld		sp,#0H8AA6	; store and load sp direct.
	push	bc				; put bc onto the stack
	ld		(#0H2002),sp; load sp value direct to 2002
	ld		sp,#0H0000	; clear sp register
	ld		bc,#0H0000	; clear bc register
	ld		sp,(#0H2002); load sp value FROM 2002
	
	pop	bc				; the pop should pop from the
							; same location as the push
	ld	a,#0H29			; and so we should have the 
	cp	b					; same values.
	jp	nz,	fail

	ld	a,#0HB1
	cp	c
	jp	nz,	fail

;----------------
; Test LD HL, (nn)
; and LD (nn), HL
;----------------
	ld	hl,#0H1324		; This version of ld hl, (nn) needs
	nop					; to be different to the version above
	ld	(#0H2002),hl	; ie, 2A,nn,nn instead of ED,6B,nn,nn
	ld	hl,#0H0000		; There's no way to force the compiler
	nop					; to do it!
	ld	hl,(#0H2002)	
							
	ld	a,#0H13
	cp	h
	jp	nz,	fail

	ld	a,#0H24
	cp	l
	jp	nz,	fail

;----------------
; Test LD IX, (nn)
; and LD (nn), IX
;----------------
	ld	hl,#0H0000	; ix is closely linked to hl and iy
	ld	iy,#0H0000	; so we need to make sure it doesn't
							; get corrupted
	ld	ix,#0H1A2B	; assign a value to ix
	ld	(#0H2002),ix; store ix value direct to 2002

	ld	a,#0H00		; check for none corruption of hl
	cp	h
	jp	nz,	fail

	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ld	hl,#0H0000	; clear hl register
	ld	ix,(#0H2002); load ix value from 2002

	ld	a,#0H00		; check for none corruption of hl
	cp	h
	jp	nz,	fail

	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ex	(sp),iy					; check for none corruption of iy
	ex	(sp),hl					
	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),ix					; check the load has worked
	ex	(sp),hl					; on the IX reg.
	ld	a,#0H2B
	cp	l
	jp	nz,	fail

	ld	a,#0H1A
	cp	h
	jp	nz,	fail

;----------------
; Test LD IY, (nn)
; and LD (nn), IY
;----------------
	ld	hl,#0H0000	; iy is closely linked to hl and iy
	ld	ix,#0H0000	; so we need to make sure it doesn't
							; get corrupted
	ld	iy,#0H1A2B	; assign a value to iy
	ld	(#0H2002),iy; store iy value direct to 2002

	ld	a,#0H00		; check for none corruption of hl
	cp	h
	jp	nz,	fail

	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ld	hl,#0H0000	; clear hl register
	ld	iy,(#0H2002); load iy value from 2002

	ld	a,#0H00		; check for none corruption of hl
	cp	h
	jp	nz,	fail

	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ex	(sp),ix					; check for none corruption of ix
	ex	(sp),hl					
	ld	a,#0H00
	cp	l
	jp	nz,	fail

	ld	a,#0H00
	cp	h
	jp	nz,	fail

	ex	(sp),iy					; check the load has worked
	ex	(sp),hl					; on the IY reg.
	ld	a,#0H2B
	cp	l
	jp	nz,	fail

	ld	a,#0H1A
	cp	h
	jp	nz,	fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail
