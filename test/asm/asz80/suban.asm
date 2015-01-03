; *******************************
; SUB A,n
; *******************************
	.area	_CODE

suban:

   call rst_reg
   
	ld	a,#0H05		; simple 5-2 to get started
	sub	#0H02
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Check Over flow
;------------------------------------------------

	ld	a,#0H85		; 85-45 = 40 :- overflow
	sub	#0H45
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H40
	jp	nz,	fail

;------------------------------------------------
; Check Half Carry
;------------------------------------------------
	ld	a,#0H12		; 8+A = 12 :- Half carry
	sub	#0H08
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Check Carry
;------------------------------------------------
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	sub	#0HFF
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Check No Carry
;------------------------------------------------
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	sub	#0H7F
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Now check with a borrow in
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sub #0H01
   
	ld	a,#0H05		; simple 5-2 to get started
	sub	#0H02
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Check Over flow
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sub #0H01
   
	ld	a,#0H85		; 85-45 = 40 :- overflow
	sub	#0H45
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H40
	jp	nz,	fail

;------------------------------------------------
; Check Half Carry
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sub #0H01
   
	ld	a,#0H12		; 8+A = 12 :- Half carry
	sub	#0H08
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Check Carry
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sub #0H01
   
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	sub	#0HFF
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Check No Carry
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sub #0H01
   
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	sub	#0H7F
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   ret