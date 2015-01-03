; *******************************
; RES b,(iy+d)
; *******************************

rsbbiydb:
	
   ld    iy, #iy_point
   
   ld    7(iy), #0HFF
	res	0,7(iy)
   ld    a,7(iy)
   cp    #0HFE
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	1,7(iy)  
   ld    a,7(iy)
   cp    #0HFD
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	2,7(iy)  
   ld    a,7(iy)
   cp    #0HFB
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	3,7(iy)  
   ld    a,7(iy)
   cp    #0HF7
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	4,7(iy)  
   ld    a,7(iy)
   cp    #0HEF
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	5,7(iy)  
   ld    a,7(iy)
   cp    #0HDF
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	6,7(iy)  
   ld    a,7(iy)
   cp    #0HBF
   jp    nz,fail
	
   ld    7(iy), #0HFF
	res	7,7(iy)  
   ld    a,7(iy)
   cp    #0H7F
   jp    nz,fail
		
   ret