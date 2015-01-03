
;-----------------------------------
;--     Shift Right Arithmetic    --
;-----------------------------------
srar:
	ld	a,#0H81
	sra	a

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	cp	#0HC0
	jp	nz,	fail
;-------------------------------
;-- 	b Operand               --
;-----------------------------------
	ld	b,#0H81
	sra	b

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,b
	cp	#0HC0
	jp	nz,	fail
;-------------------------------
;-- 	c Operand               --
;-------------------------------
	ld	c,#0H81
	sra	c

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,c
	cp	#0HC0
	jp	nz,	fail

;-------------------------------
;-- 	d Operand               --
;-------------------------------
	ld	d,#0H81
	sra	d

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,d
	cp	#0HC0
	jp	nz,	fail

;-------------------------------
;-- 	e Operand               --
;-------------------------------
	ld	e,#0H81
	sra	e

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,e
	cp	#0HC0
	jp	nz,	fail
;-------------------------------
;-- 	h Operand               --
;-------------------------------
	ld	h,#0H81
	sra	h

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,h
	cp	#0HC0
	jp	nz,	fail
   
;-------------------------------
;-- 	l Operand               --
;-------------------------------
	ld	l,#0H81
	sra	l

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	po,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.

	ld	a,l
	cp	#0HC0
	jp	nz,	fail
		
	ret
