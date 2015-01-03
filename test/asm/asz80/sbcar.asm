; *******************************
; SBC A, r
; *******************************
	.area	_CODE

sbcar:
   
;------------------------------------------------
; SBC A, A - Always returns 0!
;------------------------------------------------
   call rst_reg
	ld	a,#0H05		; simple 5-5 to get started
   sbc   a
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
   sbc #0H01
   
	ld	a,#0H0C		      ; simple C-C-b to get started
   sbc   a
	jp	z,		fail        ; Check all the flags to
	jp	nc,   fail			; make sure that the calculation
	jp	pe,	fail			; was performed correctly in
	jp	p,		fail			; the F flag.
	cp	#0HFF		      	; Check the result in A register
	jp	nz,	fail

;------------------------------------------------
; SBC A, b
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld b,#0H02
   sbc   b
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
	ld b,#0H45
   sbc   b
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
	ld b,#0H08
   sbc   b
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
	ld b,#0HFF
   sbc   b
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
	ld b,#0H7F
   sbc   b
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
	ld b,#0H02
   sbc   b
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
	ld b,#0H45
   sbc   b
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
	ld b,#0H08
   sbc   b
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
	ld b,#0HFE
   sbc   b
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
	ld b,#0H7E
   sbc   b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
;------------------------------------------------
; SBC A, c
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld c,#0H02
   sbc   c
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
	ld c,#0H45
   sbc   c
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
	ld c,#0H08
   sbc   c
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
	ld c,#0HFF
   sbc   c
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
	ld c,#0H7F
   sbc   c
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
	ld c,#0H02
   sbc   c
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
	ld c,#0H45
   sbc   c
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
	ld c,#0H08
   sbc   c
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
	ld c,#0HFE
   sbc   c
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
	ld c,#0H7E
   sbc   c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   
;------------------------------------------------
; SBC A, d
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld d,#0H02
   sbc   d
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
	ld d,#0H45
   sbc   d
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
	ld d,#0H08
   sbc   d
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
	ld d,#0HFF
   sbc   d
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
	ld d,#0H7F
   sbc   d
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
	ld d,#0H02
   sbc   d
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
	ld d,#0H45
   sbc   d
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
	ld d,#0H08
   sbc   d
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
	ld d,#0HFE
   sbc   d
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
	ld d,#0H7E
   sbc   d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   
;------------------------------------------------
; SBC A, e
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld e,#0H02
   sbc   e
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
	ld e,#0H45
   sbc   e
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
	ld e,#0H08
   sbc   e
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
	ld e,#0HFF
   sbc   e
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
	ld e,#0H7F
   sbc   e
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
	ld e,#0H02
   sbc   e
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
	ld e,#0H45
   sbc   e
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
	ld e,#0H08
   sbc   e
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
	ld e,#0HFE
   sbc   e
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
	ld e,#0H7E
   sbc   e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   
;------------------------------------------------
; SBC A, h
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld h,#0H02
   sbc   h
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
	ld h,#0H45
   sbc   h
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
	ld h,#0H08
   sbc   h
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
	ld h,#0HFF
   sbc   h
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
	ld h,#0H7F
   sbc   h
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
	ld h,#0H02
   sbc   h
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
	ld h,#0H45
   sbc   h
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
	ld h,#0H08
   sbc   h
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
	ld h,#0HFE
   sbc   h
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
	ld h,#0H7E
   sbc   h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail
      
   
;------------------------------------------------
; SBC A, l
;------------------------------------------------
   call rst_reg
	ld	a,#0H05	      	; simple 5-2 to get started
	ld l,#0H02
   sbc   l
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
	ld l,#0H45
   sbc   l
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
	ld l,#0H08
   sbc   l
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
	ld l,#0HFF
   sbc   l
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
	ld l,#0H7F
   sbc   l
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
	ld l,#0H02
   sbc   l
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
	ld l,#0H45
   sbc   l
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
	ld l,#0H08
   sbc   l
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
	ld l,#0HFE
   sbc   l
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
	ld l,#0H7E
   sbc   l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

   ret