; *******************************
; Popqq
; *******************************

	.area	_CODE

popqq:

;--------------------------------
; pop bc
;--------------------------------
   call rst_reg	

   ld bc, #0HABCD
   push bc
   ld bc, #0H0000
   pop  bc
   
	ld	a,#0HAB
	cp	b
	jp	nz,	fail

	ld	a,#0HCD
	cp	c
	jp	nz,	fail  
   
;--------------------------------
; pop de
;--------------------------------
   call rst_reg	

   ld de, #0HABCD
   push de
   ld de, #0H0000
   pop  de
   
	ld	a,#0HAB
	cp	d
	jp	nz,	fail

	ld	a,#0HCD
	cp	e
	jp	nz,	fail  
   
;--------------------------------
; pop hl
;--------------------------------
   call rst_reg	

   ld hl, #0HABCD
   push hl
   ld hl, #0H0000
   pop  hl
   
	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail  
   
;--------------------------------
; pop af
;--------------------------------
   call rst_reg	

   ld a, #0H00
   sub   a, #0H01
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	nc,   fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------

   ld a, #0HAB
   
   push af
   ld a, #0H00
   or a, #0H00
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	c,    fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------
   
   pop  af
	;-------------------------------------------------
	jp	z,   fail			; flag check
	jp	nc,  fail			
	jp	pe,  fail			
	jp	p,	  fail			
	;-------------------------------------------------
   
   cp #0HAB
   jp nz, fail
      
   ret