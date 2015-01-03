; *******************************
; LD A, R
; *******************************

	.area	_CODE
	.module ldar 

ldar:

   di
   
   ld a, #0H80
   ld b, #0H08
   add   a,b
   
   ld r, a
   ld a, #0H00
   ld a, r
   
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------

   cp #0H8B
   jp nz, fail

   ld a, #0H7F
   ld b, #0HFE
   add   a,b
   
   ld r, a
   ld a, #0H55
   ld a, r
   
	;-------------------------------------------------
	jp	nz,   fail			; flag check
	jp	nc,   fail			
	jp	pe,	fail			
	jp	m,		fail			
	;-------------------------------------------------

   cp #0H00
   jp nz, fail
   
   ei
   
   ld a, #0H12
   ld b, #0H34
   add   a,b
   
   ld r, a
   ld a, #0H00
   ld a, r
   
	;-------------------------------------------------
	jp	z,    fail     ; flag check
	jp	c,    fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------

   cp #0H49
   jp nz, fail

   ret

