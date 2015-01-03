; *******************************
; SET b,(hl)
; *******************************

stbbhlb:
	
   ld    hl, #hl_point
   
   ld    (hl), #0H00
	set	0,(hl)
   ld    a,(hl)
   cp    #0H01
   jp    nz,fail
	
   ld    (hl), #0H00
	set	1,(hl)  
   ld    a,(hl)
   cp    #0H02
   jp    nz,fail
	
   ld    (hl), #0H00
	set	2,(hl)  
   ld    a,(hl)
   cp    #0H04
   jp    nz,fail
	
   ld    (hl), #0H00
	set	3,(hl)  
   ld    a,(hl)
   cp    #0H08
   jp    nz,fail
	
   ld    (hl), #0H00
	set	4,(hl)  
   ld    a,(hl)
   cp    #0H10
   jp    nz,fail
	
   ld    (hl), #0H00
	set	5,(hl)  
   ld    a,(hl)
   cp    #0H20
   jp    nz,fail
	
   ld    (hl), #0H00
	set	6,(hl)  
   ld    a,(hl)
   cp    #0H40
   jp    nz,fail
	
   ld    (hl), #0H00
	set	7,(hl)  
   ld    a,(hl)
   cp    #0H80
   jp    nz,fail
		
   ret