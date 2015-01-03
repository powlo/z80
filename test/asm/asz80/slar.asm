
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------
slar:
	ld	a,#0H81
	sla	a

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	cp	#0H02
	jp	nz,	fail
;-------------------------------
;-- 	b Operand               --
;-----------------------------------
;-------------------------------
;-- 	c Operand               --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------

	ld	c,#0H81
	sla	c

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,c
	cp	#0H02
	jp	nz,	fail
	
;-----------------------------------
;--     Shift Right Arithmetic    --
;-----------------------------------
	ld	c,#0H81
	sra	c

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,c
	cp	#0HC0
	jp	nz,	fail
	
;----------------------------------
;-- Shift Right Logical			   --
;----------------------------------
	ld	c,#0H81
	srl	c

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,c
	cp	#0H40
	jp	nz,	fail
	
;-------------------------------
;-- 	d Operand               --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------

	ld	d,#0H81
	sla	d

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,d
	cp	#0H02
	jp	nz,	fail
	;-------------------------------
;-- 	e Operand               --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------

	ld	e,#0H81
	sla	e

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,e
	cp	#0H02
	jp	nz,	fail

;-------------------------------
;-- 	h Operand               --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------

	ld	h,#0H81
	sla	h

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,h
	cp	#0H02
	jp	nz,	fail

;-------------------------------
;-- 	l Operand               --
;-----------------------------------
;-- 	Shift Left Arithmetic	    --
;-----------------------------------

	ld	l,#0H81
	sla	l

	jp	z,	fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,l
	cp	#0H02
	jp	nz,	fail

	ret
