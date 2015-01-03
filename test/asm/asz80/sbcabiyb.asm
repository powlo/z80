; *******************************
; SBC A, (IY+d)
; *******************************
	.area	_CODE

sbcabiyb:

	ld	iy,#iy_point     	
   
;------------------------------------------------
; SBC A, (iy+d)
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld 1(iy),#0H02
   sbc   1(iy)
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H03		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Check Over flow
;------------------------------------------------
   call rst_reg
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld 1(iy),#0H45
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H40
	jp	nz,	fail

;------------------------------------------------
; Check Half borrow
;------------------------------------------------
   call rst_reg
	ld	a,#0H12		; 8+A = 12 :- Half borrow
	ld 1(iy),#0H08
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Check borrow
;------------------------------------------------
   call rst_reg
	ld	a,#0H7F		; 7F-FF = 80 :- borrow
	ld 1(iy),#0HFF
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Check No borrow
;------------------------------------------------
   call rst_reg
	ld	a,#0HFF		; FF-7F = 80 :- No borrow!
	ld 1(iy),#0H7F
   sbc   1(iy)
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
   sbc #0H01
   
	ld	a,#0H05		; simple 5-2-b to get started
	ld 1(iy),#0H02
   sbc   1(iy)
	jp	z,		fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H02			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Check Over flow
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sbc #0H01
   
	ld	a,#0H85		; 85-45-b = 3F :- overflow
	ld 1(iy),#0H45
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H3F
	jp	nz,	fail

;------------------------------------------------
; Check Half borrow
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sbc #0H01
   
	ld	a,#0H12		; 12-8-b = 9 :- Half borrow
	ld 1(iy),#0H08
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H09
	jp	nz,	fail

;------------------------------------------------
; Check borrow
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sbc #0H01
   
	ld	a,#0H7F		; 7F-FE-b = 80 :- borrow
	ld 1(iy),#0HFE
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,	fail
	jp	po,	fail
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Check No borrow
;------------------------------------------------
   call rst_reg
   ld a,#0H00     ; create a borrow
   sbc #0H01
   
	ld	a,#0HFF		; FF-7E-b = 80 :- No borrow!
	ld 1(iy),#0H7E
   sbc   1(iy)
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   ret