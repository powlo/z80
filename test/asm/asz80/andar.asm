; *******************************
; AND A, r
; *******************************

	.area	_CODE

andar:

;-------------------------------------------------
; AND A, A
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		; Bitwise check of and fucntion
	and	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0HAA
	jp	nz,	fail

;-------------------------------------------------
; AND A, B
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	b,#0HCC
	and	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

;-------------------------------------------------
; AND A, C
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	c,#0HCC
	and	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

;-------------------------------------------------
; AND A, D
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	d,#0HCC
	and	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

;-------------------------------------------------
; AND A, E
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	e,#0HCC
	and	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

;-------------------------------------------------
; AND A, H
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	h,#0HCC
	and	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

;-------------------------------------------------
; AND A, L
;-------------------------------------------------
   call rst_reg
	ld	a,#0HAA		
	ld	l,#0HCC
	and	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H88
	jp	nz,	fail

   ret