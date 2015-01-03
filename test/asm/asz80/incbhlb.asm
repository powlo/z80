; *******************************
; INC (HL)
; *******************************

	.area	_CODE

incbhlb:

   call rst_reg
	ld	a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0HFF
	inc	(hl)		; increment (hl)
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,(hl)
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0H7F
	inc	(hl)		; increment (hl)
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,(hl)
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	hl,#hl_point
	ld	(hl),#0H55
	inc	(hl)		; increment (hl)
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,(hl)
	cp	#0H56
	jp	nz,	fail

   ret