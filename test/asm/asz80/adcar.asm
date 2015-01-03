; *******************************
; ADC A, r
; *******************************

adcar:

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+40+C = neg number :- overflow
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H81
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+8+C = 11 :- Half carry
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H11
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+85+C = 0B :- Carry
	adc	a
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0B
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+40 = neg number :- overflow
	ld	a,#0H40
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H80
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+8 = 10 :- Half carry
	adc	a
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H10
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+85 = 0A :- Carry
	adc	a
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H0A
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	b,#0H01
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	b,#0H45
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	b,#0H0A
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	b,#0H7F
	adc	b
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	b,#0H01
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	b,#0H45
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	b,#0H0A
	adc	b
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	b,#0H7F
	adc	b
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	c,#0H01
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	c,#0H45
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	c,#0H0A
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	c,#0H7F
	adc	c
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	c,#0H01
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	c,#0H45
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	c,#0H0A
	adc	c
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	c,#0H7F
	adc	c
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	d,#0H01
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	d,#0H45
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	d,#0H0A
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	d,#0H7F
	adc	d
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	d,#0H01
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	d,#0H45
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	d,#0H0A
	adc	d
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	d,#0H7F
	adc	d
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	e,#0H01
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	e,#0H45
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	e,#0H0A
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	e,#0H7F
	adc	e
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	e,#0H01
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	e,#0H45
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	e,#0H0A
	adc	e
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	e,#0H7F
	adc	e
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	h,#0H01
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	h,#0H45
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	h,#0H0A
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	h,#0H7F
	adc	h
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	h,#0H01
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	h,#0H45
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	h,#0H0A
	adc	h
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	h,#0H7F
	adc	h
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

;------------------------------------------------
; Simple Test
;------------------------------------------------
	ld	a,#0H80	
	add	a			; First, force a carry.
	ld	a,#0H01
	ld	l,#0H01
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H03		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	l,#0H45
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H86
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H08	; 8+A+C = 13 :- Half carry
	ld	l,#0H0A
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H13
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H80	; Force a carry
	add	a			
	ld	a,#0H85	; 85+7F+C = 05 :- Carry
	ld	l,#0H7F
	adc	l
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H05
	jp	nz,	fail

;------------------------------------------------
; Now test with no carry in
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H01
	ld	l,#0H01
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H02		; because we performed adc
	jp	nz,	fail		; the operation is 1+1+carry

;------------------------------------------------
; Overflow
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H40		; 40+45 = neg number :- overflow
	ld	l,#0H45
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	po,	fail			
	jp	p,		fail			
	;-------------------------------------------------
	cp	#0H85
	jp	nz,	fail

;------------------------------------------------
; Half Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H08	; 8+A+C = 12 :- Half carry
	ld	l,#0H0A
	adc	l
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H12
	jp	nz,	fail

;------------------------------------------------
; Carry
;------------------------------------------------
	ld	a,#0H00	
	add	a			; First, force a no carry.
	ld	a,#0H85	; 85+7F = 04 :- Carry
	ld	l,#0H7F
	adc	l
	;-------------------------------------------------
	jp	z,		fail		; flag check
	jp	nc,	fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------
	cp	#0H04
	jp	nz,	fail

   ret