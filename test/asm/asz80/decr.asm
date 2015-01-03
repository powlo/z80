; *******************************
; DEC r
; *******************************

	.area	_CODE

decr:

;----------------------------------
; DEC a
;----------------------------------
   call rst_reg
	ld	a,#0H01
	dec	a		; decrement a
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
	ld	a,#0H80
	dec	a		; decrement a
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
	ld	a,#0HFF
	dec	a		; decrement a
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC b
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	b,#0H01
	dec	b		; decrement b
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,b
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	b,#0H80
	dec	b		; decrement b
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,b
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	b,#0HFF
	dec	b		; decrement b
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,b
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC c
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	c,#0H01
	dec	c		; decrement c
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,c
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	c,#0H80
	dec	c		; decrement c
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,c
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	c,#0HFF
	dec	c		; decrement c
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,c
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC d
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	d,#0H01
	dec	d		; decrement d
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,d
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	d,#0H80
	dec	d		; decrement d
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,d
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	d,#0HFF
	dec	d		; decrement d
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,d
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC e
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	e,#0H01
	dec	e		; decrement e
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,e
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	e,#0H80
	dec	e		; decrement e
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,e
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	e,#0HFF
	dec	e		; decrement e
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,e
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC h
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	h,#0H01
	dec	h		; decrement h
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,h
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	h,#0H80
	dec	h		; decrement h
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,h
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	h,#0HFF
	dec	h		; decrement h
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,h
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------
; DEC l
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	l,#0H01
	dec	l		; decrement l
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,l
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	l,#0H80
	dec	l		; decrement l
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,l
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	l,#0HFF
	dec	l		; decrement l
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,l
	cp	#0HFE
	jp	nz,	fail
   
   ret