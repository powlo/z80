; *******************************
; CALL cc
; *******************************
   .module callcc
   .title callcc
	.area	_CODE

callcc:
   call rst_reg

	call callcc_nc
	ret

callcc_nc:
	ld	   a,    #0H01
	add	#0H00
	call  c, 	fail
	call  nc,   callcc_c
	ret
	jp	fail
   	
callcc_c:
	ld	   a,    #0HFF
	add   #0H04
	call  nc,   fail
	call  c,    callcc_nz
	ret
	jp	fail

callcc_nz:
	ld 	a,    #0H00
	add	#0H04
	call  z,    fail
	call  nz,	callcc_z
	ret
	jp	fail

callcc_z:
	ld	   a,    #0H00
	add	#0H00
	call  nz,	fail
	call  z, 	callcc_po
	ret
	jp	fail
	
callcc_po:
	ld	a,#0H01
	or	#0H06
	call pe,	fail
	call po,	callcc_pe
	ret
	jp	fail

callcc_pe:
	ld	a,#0H01
	or	#0H08
	call po,	fail
	call pe,	callcc_p
	ret
	jp	fail

callcc_p:
	ld	a,#0H0A
	add	#0H01
	call m,fail
	call p,callcc_m
	ret
	jp	fail

callcc_m:
	ld	a,#0HA0
	add	#0H10
	call p,fail
	call m,callcc_turn_back
	ret
	jp	fail

callcc_turn_back:
	ret
	jp	fail
