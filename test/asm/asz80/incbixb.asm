; *******************************
; INC (IX+d)
; *******************************

	.area	_CODE

incbixb:

   call rst_reg
	ld	a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0HFF
	inc	4(ix)		; increment 4(ix)
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0H7F
	inc	4(ix)		; increment 4(ix)
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	ix,#ix_point
	ld	4(ix),#0H55
	inc	4(ix)		; increment 4(ix)
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,4(ix)
	cp	#0H56
	jp	nz,	fail

   ret