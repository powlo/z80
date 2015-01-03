; *******************************
; SET b,(ix+d)
; *******************************

stbbixdb:
	
   ld    ix, #ix_point
   
   ld    0HA(ix), #0H00
	set	0,0HA(ix)
   ld    a,0HA(ix)
   cp    #0H01
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	1,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H02
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	2,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H04
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	3,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H08
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	4,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H10
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	5,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H20
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	6,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H40
   jp    nz,fail
	
   ld    0HA(ix), #0H00
	set	7,0HA(ix)  
   ld    a,0HA(ix)
   cp    #0H80
   jp    nz,fail
		
   ret