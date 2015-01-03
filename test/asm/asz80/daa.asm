;-------------------------------------
;	DAA
;-------------------------------------
daa:
	ld	a,#0H00
	ld	b,#0H00
	add	b
	daa
	jp	c,		fail			
	jp	nz,	fail
	jp	po,	fail			
	jp	m,		fail		
	
	cp	#0H00
	jp	nz,	fail
	
	ld	a,#0H08
	ld	b,#0H08
	add	b
	daa
	jp	c,		fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	m,		fail		
	
	cp	#0H16
	jp	nz,	fail

	ld	a,#0H05
	ld	b,#0H05
	add	b
	daa
	jp	c,		fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	m,		fail		
	
	cp	#0H10
	jp	nz,	fail
		
	ld	a,#0H81
	ld	b,#0H50
	add	b
	daa
	jp	nc,	fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	m,		fail		
	
	cp	#0H31
	jp	nz,	fail
		
	ld	a,#0H77
	ld	b,#0H54
	add	b
	daa
	jp	nc,	fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	m,		fail		
	
	cp	#0H31
	jp	nz,	fail

	ld	a,#0H79
	ld	b,#0H58
	add	b
	daa
	jp	nc,	fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	m,		fail		
	
	cp	#0H37
	jp	nz,	fail
		
	ld	a,#0H92
	ld	b,#0H92
	add	b
	daa
	jp	c,	fail			
	jp	z,		fail
	jp	po,	fail			
	jp	p,		fail		
	
	cp	#0H84
	jp	nz,	fail
		
	ld	a,#0H98
	ld	b,#0H94
	add	b
	daa
	jp	c,		fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	p,		fail		
	
	cp	#0H92
	jp	nz,	fail
		
	ld	a,#0H99
	ld	b,#0H99
	add	b
	daa
	jp	c,		fail			
	jp	z,		fail
	jp	pe,	fail			
	jp	p,		fail		
	
	cp	#0H98
	jp	nz,	fail
	
   ret

