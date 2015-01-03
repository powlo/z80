; *******************************
; RES b,r
; *******************************

rsbr:

   ld    a, #0HFF
	res	0,a  
   cp    #0HFE
   jp    nz,fail
	
   ld    a, #0HFF
	res	1,a  
   cp    #0HFD
   jp    nz,fail
	
   ld    a, #0HFF
	res	2,a  
   cp    #0HFB
   jp    nz,fail
	
   ld    a, #0HFF
	res	3,a  
   cp    #0HF7
   jp    nz,fail
	
   ld    a, #0HFF
	res	4,a  
   cp    #0HEF
   jp    nz,fail
	
   ld    a, #0HFF
	res	5,a  
   cp    #0HDF
   jp    nz,fail
	
   ld    a, #0HFF
	res	6,a  
   cp    #0HBF
   jp    nz,fail
	
   ld    a, #0HFF
	res	7,a  
   cp    #0H7F
   jp    nz,fail
	
   ld    b, #0HFF
	res	0,b
   ld    a,b
   cp    #0HFE
   jp    nz,fail
	
   ld    b, #0HFF
	res	1,b  
   ld    a,b
   cp    #0HFD
   jp    nz,fail
	
   ld    b, #0HFF
	res	2,b  
   ld    a,b
   cp    #0HFB
   jp    nz,fail
	
   ld    b, #0HFF
	res	3,b  
   ld    a,b
   cp    #0HF7
   jp    nz,fail
	
   ld    b, #0HFF
	res	4,b  
   ld    a,b
   cp    #0HEF
   jp    nz,fail
	
   ld    b, #0HFF
	res	5,b  
   ld    a,b
   cp    #0HDF
   jp    nz,fail
	
   ld    b, #0HFF
	res	6,b  
   ld    a,b
   cp    #0HBF
   jp    nz,fail
	
   ld    b, #0HFF
	res	7,b  
   ld    a,b
   cp    #0H7F
   jp    nz,fail
	
   ld    c, #0HFF
	res	0,c
   ld    a,c
   cp    #0HFE
   jp    nz,fail
	
   ld    c, #0HFF
	res	1,c  
   ld    a,c
   cp    #0HFD
   jp    nz,fail
	
   ld    c, #0HFF
	res	2,c  
   ld    a,c
   cp    #0HFB
   jp    nz,fail
	
   ld    c, #0HFF
	res	3,c  
   ld    a,c
   cp    #0HF7
   jp    nz,fail
	
   ld    c, #0HFF
	res	4,c  
   ld    a,c
   cp    #0HEF
   jp    nz,fail
	
   ld    c, #0HFF
	res	5,c  
   ld    a,c
   cp    #0HDF
   jp    nz,fail
	
   ld    c, #0HFF
	res	6,c  
   ld    a,c
   cp    #0HBF
   jp    nz,fail
	
   ld    c, #0HFF
	res	7,c  
   ld    a,c
   cp    #0H7F
   jp    nz,fail
	
   ld    d, #0HFF
	res	0,d
   ld    a,d
   cp    #0HFE
   jp    nz,fail
	
   ld    d, #0HFF
	res	1,d  
   ld    a,d
   cp    #0HFD
   jp    nz,fail
	
   ld    d, #0HFF
	res	2,d  
   ld    a,d
   cp    #0HFB
   jp    nz,fail
	
   ld    d, #0HFF
	res	3,d  
   ld    a,d
   cp    #0HF7
   jp    nz,fail
	
   ld    d, #0HFF
	res	4,d  
   ld    a,d
   cp    #0HEF
   jp    nz,fail
	
   ld    d, #0HFF
	res	5,d  
   ld    a,d
   cp    #0HDF
   jp    nz,fail
	
   ld    d, #0HFF
	res	6,d  
   ld    a,d
   cp    #0HBF
   jp    nz,fail
	
   ld    d, #0HFF
	res	7,d  
   ld    a,d
   cp    #0H7F
   jp    nz,fail
	
   ld    e, #0HFF
	res	0,e
   ld    a,e
   cp    #0HFE
   jp    nz,fail
	
   ld    e, #0HFF
	res	1,e  
   ld    a,e
   cp    #0HFD
   jp    nz,fail
	
   ld    e, #0HFF
	res	2,e  
   ld    a,e
   cp    #0HFB
   jp    nz,fail
	
   ld    e, #0HFF
	res	3,e  
   ld    a,e
   cp    #0HF7
   jp    nz,fail
	
   ld    e, #0HFF
	res	4,e  
   ld    a,e
   cp    #0HEF
   jp    nz,fail
	
   ld    e, #0HFF
	res	5,e  
   ld    a,e
   cp    #0HDF
   jp    nz,fail
	
   ld    e, #0HFF
	res	6,e  
   ld    a,e
   cp    #0HBF
   jp    nz,fail
	
   ld    e, #0HFF
	res	7,e  
   ld    a,e
   cp    #0H7F
   jp    nz,fail
	
   ld    h, #0HFF
	res	0,h
   ld    a,h
   cp    #0HFE
   jp    nz,fail
	
   ld    h, #0HFF
	res	1,h  
   ld    a,h
   cp    #0HFD
   jp    nz,fail
	
   ld    h, #0HFF
	res	2,h  
   ld    a,h
   cp    #0HFB
   jp    nz,fail
	
   ld    h, #0HFF
	res	3,h  
   ld    a,h
   cp    #0HF7
   jp    nz,fail
	
   ld    h, #0HFF
	res	4,h  
   ld    a,h
   cp    #0HEF
   jp    nz,fail
	
   ld    h, #0HFF
	res	5,h  
   ld    a,h
   cp    #0HDF
   jp    nz,fail
	
   ld    h, #0HFF
	res	6,h  
   ld    a,h
   cp    #0HBF
   jp    nz,fail
	
   ld    h, #0HFF
	res	7,h  
   ld    a,h
   cp    #0H7F
   jp    nz,fail
	
   ld    l, #0HFF
	res	0,l
   ld    a,l
   cp    #0HFE
   jp    nz,fail
	
   ld    l, #0HFF
	res	1,l  
   ld    a,l
   cp    #0HFD
   jp    nz,fail
	
   ld    l, #0HFF
	res	2,l  
   ld    a,l
   cp    #0HFB
   jp    nz,fail
	
   ld    l, #0HFF
	res	3,l  
   ld    a,l
   cp    #0HF7
   jp    nz,fail
	
   ld    l, #0HFF
	res	4,l  
   ld    a,l
   cp    #0HEF
   jp    nz,fail
	
   ld    l, #0HFF
	res	5,l  
   ld    a,l
   cp    #0HDF
   jp    nz,fail
	
   ld    l, #0HFF
	res	6,l  
   ld    a,l
   cp    #0HBF
   jp    nz,fail
	
   ld    l, #0HFF
	res	7,l  
   ld    a,l
   cp    #0H7F
   jp    nz,fail
	
   ret