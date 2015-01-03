; *******************************
; RES b,(hl)
; *******************************

rsbbhlb:
	
   ld    hl, #hl_point
   
   ld    (hl), #0HFF
	res	0,(hl)
   ld    a,(hl)
   cp    #0HFE
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	1,(hl)  
   ld    a,(hl)
   cp    #0HFD
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	2,(hl)  
   ld    a,(hl)
   cp    #0HFB
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	3,(hl)  
   ld    a,(hl)
   cp    #0HF7
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	4,(hl)  
   ld    a,(hl)
   cp    #0HEF
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	5,(hl)  
   ld    a,(hl)
   cp    #0HDF
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	6,(hl)  
   ld    a,(hl)
   cp    #0HBF
   jp    nz,fail
	
   ld    (hl), #0HFF
	res	7,(hl)  
   ld    a,(hl)
   cp    #0H7F
   jp    nz,fail
		
   ret