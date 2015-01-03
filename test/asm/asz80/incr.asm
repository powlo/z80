; *******************************
; INC A, r
; *******************************

	.area	_CODE

incr:

;-------------------------------
; INC a
;-------------------------------
   call rst_reg
	ld	a,#0HFF
	inc	a		; increment a
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H7F
	inc	a		; increment a
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H55
	inc	a		; increment a
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC b
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	b,#0HFF
	inc	b		; increment b
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,b
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	b,#0H7F
	inc	b		; increment b
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,b
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	b,#0H55
	inc	b		; increment b
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,b
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC c
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	c,#0HFF
	inc	c		; increment c
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,c
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	c,#0H7F
	inc	c		; increment c
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,c
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	c,#0H55
	inc	c		; increment c
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,c
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC d
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	d,#0HFF
	inc	d		; increment d
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,d
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	d,#0H7F
	inc	d		; increment d
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,d
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	d,#0H55
	inc	d		; increment d
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,d
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC e
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	e,#0HFF
	inc	e		; increment e
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,e
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	e,#0H7F
	inc	e		; increment e
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,e
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	e,#0H55
	inc	e		; increment e
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,e
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC h
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	h,#0HFF
	inc	h		; increment h
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,h
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	h,#0H7F
	inc	h		; increment h
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,h
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	h,#0H55
	inc	h		; increment h
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,h
	cp	#0H56
	jp	nz,	fail

;-------------------------------
; INC l
;-------------------------------
   call rst_reg
	ld	a,#0H66
	ld	l,#0HFF
	inc	l		; increment l
	jp	nz,	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,l
	cp	#0H00
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	l,#0H7F
	inc	l		; increment l
	jp	z, 	fail		; Check all the flags to
	jp	po,	fail		; was performed correctly in
	jp	p,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,l
	cp	#0H80
	jp	nz,	fail

   call rst_reg
	ld	a,#0H66
	ld	l,#0H55
	inc	l		; increment l
	jp	z, 	fail		; Check all the flags to
	jp	pe,	fail		; was performed correctly in
	jp	m,	   fail		; the F flag.

	cp	#0H66          ;make sur A doesnt change
	jp	nz,	fail

	ld	a,l
	cp	#0H56
	jp	nz,	fail

   ret