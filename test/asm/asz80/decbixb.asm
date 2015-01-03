; *******************************
; DEC (ix+d)
; *******************************

	.area	_CODE

decbixb:

;----------------------------------
; DEC (ix+d)
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0H01
	dec	4(ix)		; decrement 4(ix)
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0H80
	dec	4(ix)		; decrement 4(ix)
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0HFF
	dec	4(ix)		; decrement 4(ix)
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------

   ret