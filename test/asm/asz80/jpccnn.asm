; *******************************
; JP cc nn
; *******************************
   .module jpccnn
   .title jpccnn
	.area	_CODE

jpccnn:
   call rst_reg

	ld	a,#0H80				; force a carry
	ld	b,#0H80
	add	b
	jp	c,		jpccnn_nc
	jp	nc,	fail
	jp	fail
	
jpccnn_nc:	
	ld	a,#0H01				; force a no-carry
	ld	b,#0H01
	add	b
	jp	nc,	jpccnn_z
	jp	c,		fail
	jp	fail

jpccnn_z:
	ld	a,#0H00				; force a zero result
	ld	b,#0H00
	add	b
	
	jp	z,		jpccnn_nz
	jp	nz,	fail					
	jp	fail

jpccnn_nz:
	ld	b,#0H01           ;force a non-zero result
	add	b
	jp	nz,	jpccnn_po
	jp	z,		fail
	jp	fail

jpccnn_po:
	ld	a,#0H01				; force a parity odd result
	ld	b,#0H00
	or	b
	
	jp	po,   jpccnn_pe
	jp	pe,	fail					
	jp	fail

jpccnn_pe:
	ld	a,#0H01           ;force a parity even result
	ld	b,#0H02
	or	b
	jp	pe,   jpccnn_p
	jp	po,   fail
	jp	fail

jpccnn_p:
	ld	a,#0H01				; force a positive result
	ld	b,#0H00
	add	b
	
	jp	p, jpccnn_m
	jp	m,	fail					
	jp	fail

jpccnn_m:
	ld	a,#0H80           ;force a negative result
	ld	b,#0H00
	add	b
	jp	m,	jpccnn_end
	jp	p, fail
	jp	fail

jpccnn_end:
   ret