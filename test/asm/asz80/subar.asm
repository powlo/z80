; *******************************
; SUB A,r
; *******************************
	.area	_CODE

subar:
   
;------------------------------------------------
; Sub A, A - Always returns 0!
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-5 to get started
   sub   a
	jp	nz,   fail			; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H00    			; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; Now check with a borrow in
;------------------------------------------------
   call rst_reg
   ld a,#0H00           ; create a borrow
   sub #0H01
   
	ld	a,#0H0C		      ; simple C-C to get started
   sub   a
	jp	nz,		fail     ; Check all the flags to
	jp	c,		fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	m,		fail			; the F flag.
	cp	#0H00		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; SUB A, B
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld b,#0H02
   sub   b
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld b,#0H45
   sub   b
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld b,#0H08
   sub   b
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld b,#0HFF
   sub   b
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld b,#0H7F
   sub   b
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
	ld b,#0H02
   sub   b
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
	ld b,#0H45
   sub   b
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
	ld b,#0H08
   sub   b
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
	ld b,#0HFF
   sub   b
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
	ld b,#0H7F
   sub   b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SUB A, C
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld c,#0H02
   sub   c
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld c,#0H45
   sub   c
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld c,#0H08
   sub   c
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld c,#0HFF
   sub   c
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld c,#0H7F
   sub   c
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
	ld c,#0H02
   sub   c
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
	ld c,#0H45
   sub   c
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
	ld c,#0H08
   sub   c
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
	ld c,#0HFF
   sub   c
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
	ld c,#0H7F
   sub   c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SUB A, D
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld d,#0H02
   sub   d
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld d,#0H45
   sub   d
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld d,#0H08
   sub   d
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld d,#0HFF
   sub   d
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld d,#0H7F
   sub   d
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
	ld d,#0H02
   sub   d
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
	ld d,#0H45
   sub   d
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
	ld d,#0H08
   sub   d
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
	ld d,#0HFF
   sub   d
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
	ld d,#0H7F
   sub   d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SUB A, E
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld e,#0H02
   sub   e
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld e,#0H45
   sub   e
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld e,#0H08
   sub   e
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld e,#0HFF
   sub   e
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld e,#0H7F
   sub   e
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
	ld e,#0H02
   sub   e
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
	ld e,#0H45
   sub   e
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
	ld e,#0H08
   sub   e
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
	ld e,#0HFF
   sub   e
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
	ld e,#0H7F
   sub   e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SUB A, H
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld h,#0H02
   sub   h
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld h,#0H45
   sub   h
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld h,#0H08
   sub   h
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld h,#0HFF
   sub   h
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld h,#0H7F
   sub   h
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
	ld h,#0H02
   sub   h
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
	ld h,#0H45
   sub   h
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
	ld h,#0H08
   sub   h
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
	ld h,#0HFF
   sub   h
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
	ld h,#0H7F
   sub   h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SUB A, L
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-2 to get started
	ld l,#0H02
   sub   l
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
	ld	a,#0H85		; 85-45 = 40 :- overflow
	ld l,#0H45
   sub   l
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
	ld	a,#0H12		; 8+A = 12 :- Half carry
	ld l,#0H08
   sub   l
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
	ld	a,#0H7F		; 7F-FF = 80 :- Carry
	ld l,#0HFF
   sub   l
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
	ld	a,#0HFF		; FF-7F = 80 :- No Carry!
	ld l,#0H7F
   sub   l
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
	ld l,#0H02
   sub   l
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
	ld l,#0H45
   sub   l
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
	ld l,#0H08
   sub   l
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
	ld l,#0HFF
   sub   l
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
	ld l,#0H7F
   sub   l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   ret