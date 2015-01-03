; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the ld_r_r instructions

ldrr:

	ld	a,#0HFF
	ld	c,#0H00
	ld	d,#0H00
	ld	e,#0H00
	ld	h,#0H00
	ld	l,#0H00

;----------------------
; LD r A
;----------------------
	ld		a,a
	cp	a
	jp nz,	fail
	
	ld	b,a
	cp	b
	jp nz,	fail
	
	ld	c,a
	cp	c
	jp nz,	fail
	
	ld	d,a
	cp	d
	jp nz,	fail
	
	ld	e,a
	cp	e
	jp nz,	fail
	
	ld	h,a
	cp	h
	jp nz,	fail
	
	ld	l,a
	cp	l
	jp nz,	fail

	ld	hl,#0H3000
	ld	ix,#0H4000
	ld	iy,#0H5000
	ld	(hl),a
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),a
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(ix),a
	cp 0H20(ix)
	jp nz,	fail
	
;----------------------
; LD r B
;----------------------
	ld	a,#0H00
	ld	b,#0H11

	ld	a,b
	cp	b
	jp nz,	fail
	
	ld	b,b
	cp	b
	jp nz,	fail
	
	ld	c,b
	cp	c
	jp nz,	fail
	
	ld	d,b
	cp	d
	jp nz,	fail
	
	ld	e,b
	cp	e
	jp nz,	fail
	
	ld	h,b
	cp	h
	jp nz,	fail
	
	ld	l,b
	cp	l
	jp nz,	fail

	ld	hl,#0H3000
	ld	ix,#0H4000
	ld	iy,#0H5000
	ld	(hl),b
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),b
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),b
	cp	0H20(iy)
	jp nz,	fail
	
;----------------------
; LD r C
;----------------------
	ld	b,#0H00
	ld	c,#0H22

	ld	a,c
	cp	c
	jp nz,	fail
	
	ld	b,c
	cp	b
	jp nz,	fail

	ld	c,c
	cp	c
	jp nz,	fail
	
	ld	d,c
	cp	d
	jp nz,	fail
	
	ld	e,c
	cp	e
	jp nz,	fail
	
	ld	h,c
	cp	h
	jp nz,	fail
	
	ld	l,c
	cp	l
	jp nz,	fail

	ld	hl,#0H3000
	ld	ix,#0H4000
	ld	iy,#0H5000
	ld	(hl),c
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),c
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),c
	cp	0H20(iy)
	jp nz,	fail
	
;----------------------
; LD r D
;----------------------
	ld	c,#0H00
	ld	d,#0H33

	ld	a,d
	cp	d
	jp nz,	fail
	
	ld	b,d
	cp	b
	jp nz,	fail

	ld	c,d
	cp	c
	jp nz,	fail
	
	ld	d,d
	cp	d
	jp nz,	fail
	
	ld	e,d
	cp	e
	jp nz,	fail
	
	ld	h,d
	cp	h
	jp nz,	fail
	
	ld	l,d
	cp	l
	jp nz,	fail

	ld	hl,#0H3000
	ld	ix,#0H4000
	ld	iy,#0H5000
	ld	(hl),d
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),d
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),d
	cp	0H20(iy)
	jp nz,	fail	
	
;----------------------
; LD r E
;----------------------
	ld	d,#0H00
	ld	e,#0H44

	ld	a,e
	cp	e
	jp nz,	fail
	
	ld	b,e
	cp	b
	jp nz,	fail

	ld	c,e
	cp	c
	jp nz,	fail
	
	ld	d,e
	cp	d
	jp nz,	fail
	
	ld	e,e
	cp	e
	jp nz,	fail
	
	ld	h,e
	cp	h
	jp nz,	fail
	
	ld	l,e
	cp	l
	jp nz,	fail

	ld	hl,#0H3000
	ld	ix,#0H4000
	ld	iy,#0H5000
	ld	(hl),e
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),e
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),e
	cp	0H20(iy)
	jp nz,	fail
	
;----------------------
; LD r H
;----------------------
	ld	e,#0H00
	ld	h,#0H55

	ld	a,h
	cp	h
	jp nz,	fail
	
	ld	b,h
	cp	b
	jp nz,	fail

	ld	c,h
	cp	c
	jp nz,	fail
	
	ld	d,h
	cp	d
	jp nz,	fail
	
	ld	e,h
	cp	e
	jp nz,	fail
	
	ld	h,h
	cp	h
	jp nz,	fail
	
	ld	l,h
	cp	l
	jp nz,	fail

	ld	hl,#0H3300
	ld	ix,#0H4400
	ld	iy,#0H5500
	ld	(hl),h
	ld	a,#0H33
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),h
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),h
	cp	0H20(iy)
	jp nz,	fail	
;----------------------
; LD r L
;----------------------
	ld	h,#0H00
	ld	l,#0H66

	ld	a,l
	cp	l
	jp nz,	fail
	
	ld	b,l
	cp	b
	jp nz,	fail

	ld	c,l
	cp	c
	jp nz,	fail
	
	ld	d,l
	cp	d
	jp nz,	fail
	
	ld	e,l
	cp	e
	jp nz,	fail
	
	ld	h,l
	cp	h
	jp nz,	fail
	
	ld	l,l
	cp	l
	jp nz,	fail

	ld	hl,#0H3066
	ld	ix,#0H4077
	ld	iy,#0H5088
	ld	(hl),l
	ld	a, #0H66
	cp	(hl)
	jp nz,	fail

	ld	0H10(ix),l
	cp	0H10(ix)
	jp nz,	fail

	ld	0H20(iy),l
	cp	0H20(iy)
	jp nz,	fail	

   ret