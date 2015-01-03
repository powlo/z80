; *******************************
; SET b,(iy+d)
; *******************************

stbbiydb:
	
   ld    iy, #iy_point
   
   ld    0HC(iy), #0H00
	set	0,0HC(iy)
   ld    a,0HC(iy)
   cp    #0H01
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	1,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H02
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	2,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H04
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	3,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H08
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	4,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H10
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	5,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H20
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	6,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H40
   jp    nz,fail
	
   ld    0HC(iy), #0H00
	set	7,0HC(iy)  
   ld    a,0HC(iy)
   cp    #0H80
   jp    nz,fail
		
   ret