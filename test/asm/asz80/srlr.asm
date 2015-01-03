;----------------------------------
;-- Shift Right Logical			   --
;----------------------------------
srlr:
	ld	a,#0H81
	srl	a

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	cp	#0H40
	jp	nz,	fail
	

;-------------------------------
;-- 	b Operand               --
;-------------------------------
	ld	b,#0H81
	srl	b

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,b
	cp	#0H40
	jp	nz,	fail
	
;-------------------------------
;-- 	c Operand               --
;-------------------------------
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
;-------------------------------
	ld	d,#0H81
	srl	d

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,d
	cp	#0H40
	jp	nz,	fail
	
;-------------------------------
;-- 	e Operand               --
;-------------------------------
	ld	e,#0H81
	srl	e

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,e
	cp	#0H40
	jp	nz,	fail
	
;-------------------------------
;-- 	h Operand               --
;-------------------------------
	ld	h,#0H81
	srl	h

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,h
	cp	#0H40
	jp	nz,	fail
	
;-------------------------------
;-- 	l Operand               --
;-------------------------------
	ld	l,#0H81
	srl	l

	jp	z,		fail			; Check all the flags to
	jp	nc,	fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.

	ld	a,l
	cp	#0H40
	jp	nz,	fail
	
   ret