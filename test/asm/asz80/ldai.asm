; *******************************
; LD A, I
; *******************************

	.area	_CODE
	.module ldai 

ldai:

   di
   
   ld a, #0H80
   ld b, #0H08
   add   a,b
   
   ld i, a
   ld a, #0H00
   ld a, i
   
	;-------------------------------------------------
	jp	z,		fail			; flag check
	jp	c,		fail			
	jp	pe,	fail			
	jp	p,		fail			
	;-------------------------------------------------

   cp #0H88
   jp nz, fail

   ld a, #0HFF
   ld b, #0H01
   add   a,b
   
   ld i, a
   ld a, #0H66
   ld a, i
   
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
   
   ld i, a
   ld a, #0H00
   ld a, i
   
	;-------------------------------------------------
	jp	z,    fail     ; flag check
	jp	c,    fail			
	jp	po,	fail			
	jp	m,		fail			
	;-------------------------------------------------

   cp #0H46
   jp nz, fail

   ret

