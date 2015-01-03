; *******************************
; RES b,(ix+d)
; *******************************

rsbbixdb:
	
   ld    ix, #ix_point
   
   ld    5(ix), #0HFF
	res	0,5(ix)
   ld    a,5(ix)
   cp    #0HFE
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	1,5(ix)  
   ld    a,5(ix)
   cp    #0HFD
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	2,5(ix)  
   ld    a,5(ix)
   cp    #0HFB
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	3,5(ix)  
   ld    a,5(ix)
   cp    #0HF7
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	4,5(ix)  
   ld    a,5(ix)
   cp    #0HEF
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	5,5(ix)  
   ld    a,5(ix)
   cp    #0HDF
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	6,5(ix)  
   ld    a,5(ix)
   cp    #0HBF
   jp    nz,fail
	
   ld    5(ix), #0HFF
	res	7,5(ix)  
   ld    a,5(ix)
   cp    #0H7F
   jp    nz,fail
		
   ret