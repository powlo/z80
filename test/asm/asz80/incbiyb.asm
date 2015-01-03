; *******************************
; INC (iy+d)
; *******************************

	.area	_CODE

incbiyb:

   call rst_reg
	ld	a,#0H66
	ld	iy,#iy_point
	ld	2(iy),#0HFF
	inc	2(iy)		; increment 2(iy)
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,2(iy)
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	iy,#iy_point
	ld	2(iy),#0H7F
	inc	2(iy)		; increment 2(iy)
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,2(iy)
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	iy,#iy_point
	ld	2(iy),#0H55
	inc	2(iy)		; increment 2(iy)
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,2(iy)
	cp	#0H56
	jp	nz,	fail

   ret