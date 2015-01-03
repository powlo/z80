; *******************************
; RET cc
; *******************************
   .module retcc
   .title retcc
	.area	_CODE

retcc:
   call rst_reg

	ld	a,#0H00
	ld	b,#0H01
   sub   b
   
	call retcc_nc
	cp	#0H02
	jp	nz,	fail

	call retcc_c
	cp	#0H03
	jp	nz,	fail

	call retcc_nz
	cp	#0H04
	jp	nz,	fail

	call retcc_z
	cp	#0H00
	jp	nz,	fail

	call retcc_po
	cp	#0H07
	jp	nz,	fail

	call retcc_pe
	cp	#0H09
	jp	nz,	fail

	call retcc_p
	cp	#0H0B
	jp	nz,	fail

	call retcc_m
	cp	#0HB0
	jp	nz,	fail

	ret
	
retcc_nc:
	ld	a,#0H01
	ld	b,#0H01
	add	b
	ret nc
   jp		fail

retcc_c:
	ld	a,#0HFF
	add	#0H04
	ret c
   jp		fail

retcc_nz:
	ld	a,#0H00
	add	#0H04
	ret nz
   jp		fail

retcc_z:
	ld	a,#0H00
	add	#0H00
	ret z
   jp		fail

retcc_po:
	ld	a,#0H01
	or	#0H06
	ret po
   jp		fail

retcc_pe:
	ld	a,#0H01
	or	#0H08
	ret pe
   jp		fail

retcc_p:
	ld	a,#0H0A
	add	#0H01
	ret p
   jp		fail

retcc_m:
	ld	a,#0HA0
	add	#0H10
	ret m
   jp		fail