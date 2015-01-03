; *******************************
; IN r, (C)
; *******************************

inrbcb:

;---------------------------------------------
; Set up some data to read later
;---------------------------------------------
	ld		a,#0H01
	out	(#0H11),a

	ld		a,#0H02
	out	(#0H22),a

	ld		a,#0H03
	out	(#0H33),a
	
	ld		a,#0H04
	out	(#0H44),a

	ld		a,#0H05
	out	(#0H55),a

	ld		a,#0H06
	out	(#0H66),a

	ld		a,#0H07
	out	(#0H77),a

;---------------------------------------------
;	Data for exceptions
;---------------------------------------------
; Data is zero or FF
	ld		a,#0H00
	out	(#0HA5),a

	ld		a,#0HFF
	out	(#0H5A),a

; Address is zero or FF
	ld		a,#0HF5
	out	(#0H00),a

	ld		a,#0H5F
	out	(#0HFF),a

;---------------------------------------------
; Test each of the hardcoded parameters a,b,c...
;---------------------------------------------
	ld		bc,#0H0011
	in		a,(c)
	jp	z,		fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	cp		#0H01
	jp		nz,fail
	
	ld		bc,#0H0022
	in		b,(c)
	jp	z,		fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,b
	cp		#0H02
	jp		nz,fail
	
	ld		bc,#0H0033
	in		c,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,c
	cp		#0H03
	jp		nz,fail
	
	ld		bc,#0H0044
	in		d,(c)
	jp	z,		fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,d
	cp		#0H04
	jp		nz,fail
	
	ld		bc,#0H0055
	in		e,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,e
	cp		#0H05
	jp		nz,fail
	
	ld		bc,#0H0066
	in		h,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,h
	cp		#0H06
	jp		nz,fail
	
	ld		bc,#0H0077
	in		l,(c)
	jp	z,		fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	ld		a,l
	cp		#0H07
	jp		nz,fail
	
;---------------------------------------------
; Test a few exceptions
;---------------------------------------------
	ld		bc,#0H00A5
	in		a,(c)
	jp	nz,	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	cp		#0H00
	jp		nz,fail
	
	ld		bc,#0H005A
	in		a,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,		fail		; the F flag.
	cp		#0HFF
	jp		nz,fail
	
	ld		bc,#0H0000
	in		a,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,		fail		; the F flag.
	cp		#0HF5
	jp		nz,fail
	
	ld		bc,#0H00FF
	in		a,(c)
	jp	z,		fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	m,		fail		; the F flag.
	cp		#0H5F
	jp		nz,fail

   ret
