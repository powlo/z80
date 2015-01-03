;-------------------------------------
;	CPL
;-------------------------------------
cpl:
   ld a,#0H00
   or   a
   jp    nz, fail
   jp    m, fail
   jp    po, fail
   jp    c, fail

	ld		a,#0H0F
	cpl
   jp    nz, fail
   jp    m, fail
   jp    po, fail
   jp    c, fail

	cp		#0HF0
   jp    nz, fail

; ensure Z is not affected

   ld a,#0H00
   or   a
   jp    nz, fail
   jp    m, fail
   jp    po, fail
   jp    c, fail
   
   cpl
   jp    nz, fail
   jp    m, fail
   jp    po, fail
   jp    c, fail
   
   cp #0HFF
   jp    nz, fail
   
   ld a,#0HFF
   or   a
   jp    z, fail
   jp    p, fail
   jp    po, fail
   jp    c, fail
   
   cpl
   jp    z, fail
   jp    p, fail
   jp    po, fail
   jp    c, fail
   
   cp #0H00
   jp    nz, fail
   
   ld a,#0H81
   add   a
   jp    z, fail
   jp    m, fail
   jp    po, fail
   jp    nc, fail
   
   cpl
   jp    z, fail
   jp    m, fail
   jp    po, fail
   jp    nc, fail
   
   cp #0HFD
   jp    nz, fail
   
   ld a,#0H50
   ld b,#0H05
   add   b
   jp    z, fail
   jp    m, fail
   jp    pe, fail
   jp    c, fail
   
   cpl
   jp    z, fail
   jp    m, fail
   jp    pe, fail
   jp    c, fail
   
   cp #0HAA
   jp    nz, fail
   
   ret