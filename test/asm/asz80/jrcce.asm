; *******************************
; JR cc, e
; *******************************
   .module jrcce
   .title jrcce
	.area	_CODE

jrcce:
   call rst_reg
			
	ld	a,#0H80				; force a carry
	ld	b,#0H80
	add	b
	jr	c,		jrcce_c2
	jp	fail
	
jrcce_c2:	
	ld	a,#0H80				; force a carry
	ld	b,#0H80
	add	b
	jr	nc,   jrcce_fail
	
jrcce_nc:	
	ld	a,#0H01				; force a no-carry
	ld	b,#0H01
	add	b
	jr	nc,	jrcce_nc2
	jp	fail

jrcce_nc2:
	ld	a,#0H01				; force a no-carry
	ld	b,#0H01
	add	b
	jr	c,	jrcce_fail

jrcce_z:
	ld	a,#0H00				; force a zero result
	ld	b,#0H00
	add	b
	
	jr	z,		jrcce_z2
	jp	fail

jrcce_z2:
	ld	a,#0H00				; force a zero result
	ld	b,#0H00
	add	b	
	jr	nz, jrcce_fail

jrcce_nz:
	ld	b,#0H01           ;force a non-zero result
	add	b
	jr	nz,	jrcce_nz2
	jp	fail

jrcce_nz2:
	ld	b,#0H01           ;force a non-zero result
	add	b
	jr	z,    jrcce_fail

jrcce_end:
   ret

jrcce_fail:
   jp fail
   
