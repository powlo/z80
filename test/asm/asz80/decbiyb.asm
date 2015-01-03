; *******************************
; DEC (iy+d)
; *******************************

	.area	_CODE

decbiyb:

;----------------------------------
; DEC (iy+d)
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	iy,#iy_point
	ld	1(iy),#0H01
	dec	1(iy)		; decrement 1(iy)
	jp	nz, fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,1(iy)
	cp	#0H00
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	iy,#iy_point
	ld	1(iy),#0H80
	dec	1(iy)		; decrement 1(iy)
	jp	z,  fail    ; Check all the flags to
	jp	po, fail    ; was performed correctly in
	jp	m,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,1(iy)
	cp	#0H7F
	jp	nz,	fail
   
;----------------------------------
   call rst_reg
   ld a,#0H66
	ld	iy,#iy_point
	ld	1(iy),#0HFF
	dec	1(iy)		; decrement 1(iy)
	jp	z,  fail    ; Check all the flags to
	jp	pe, fail    ; was performed correctly in
	jp	p,  fail    ; the F flag.

	cp	#0H66
	jp	nz,	fail

	ld	a,1(iy)
	cp	#0HFE
	jp	nz,	fail
   
;----------------------------------

   ret