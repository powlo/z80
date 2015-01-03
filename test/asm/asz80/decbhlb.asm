; *******************************
; DEC (HL)
; *******************************

	.area	_CODE

decbhlb:

;----------------------------------
; DEC (hl)
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0H01
	dec	(hl)		; decrement (hl)
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,(hl)
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0H80
	dec	(hl)		; decrement (hl)
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,(hl)
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0HFF
	dec	(hl)		; decrement (hl)
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,(hl)
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------

   ret