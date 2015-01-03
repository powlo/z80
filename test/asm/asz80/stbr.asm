; *******************************
; SET b,r
; *******************************

stbr:

   ld    a, #0H00
	set	0,a  
   cp    #0H01
   jp    nz,fail
	
   ld    a, #0H00
	set	1,a  
   cp    #0H02
   jp    nz,fail
	
   ld    a, #0H00
	set	2,a  
   cp    #0H04
   jp    nz,fail
	
   ld    a, #0H00
	set	3,a  
   cp    #0H08
   jp    nz,fail
	
   ld    a, #0H00
	set	4,a  
   cp    #0H10
   jp    nz,fail
	
   ld    a, #0H00
	set	5,a  
   cp    #0H20
   jp    nz,fail
	
   ld    a, #0H00
	set	6,a  
   cp    #0H40
   jp    nz,fail
	
   ld    a, #0H00
	set	7,a  
   cp    #0H80
   jp    nz,fail
	
   ld    b, #0H00
	set	0,b
   ld    a,b
   cp    #0H01
   jp    nz,fail
	
   ld    b, #0H00
	set	1,b  
   ld    a,b
   cp    #0H02
   jp    nz,fail
	
   ld    b, #0H00
	set	2,b  
   ld    a,b
   cp    #0H04
   jp    nz,fail
	
   ld    b, #0H00
	set	3,b  
   ld    a,b
   cp    #0H08
   jp    nz,fail
	
   ld    b, #0H00
	set	4,b  
   ld    a,b
   cp    #0H10
   jp    nz,fail
	
   ld    b, #0H00
	set	5,b  
   ld    a,b
   cp    #0H20
   jp    nz,fail
	
   ld    b, #0H00
	set	6,b  
   ld    a,b
   cp    #0H40
   jp    nz,fail
	
   ld    b, #0H00
	set	7,b  
   ld    a,b
   cp    #0H80
   jp    nz,fail
	
   ld    c, #0H00
	set	0,c
   ld    a,c
   cp    #0H01
   jp    nz,fail
	
   ld    c, #0H00
	set	1,c  
   ld    a,c
   cp    #0H02
   jp    nz,fail
	
   ld    c, #0H00
	set	2,c  
   ld    a,c
   cp    #0H04
   jp    nz,fail
	
   ld    c, #0H00
	set	3,c  
   ld    a,c
   cp    #0H08
   jp    nz,fail
	
   ld    c, #0H00
	set	4,c  
   ld    a,c
   cp    #0H10
   jp    nz,fail
	
   ld    c, #0H00
	set	5,c  
   ld    a,c
   cp    #0H20
   jp    nz,fail
	
   ld    c, #0H00
	set	6,c  
   ld    a,c
   cp    #0H40
   jp    nz,fail
	
   ld    c, #0H00
	set	7,c  
   ld    a,c
   cp    #0H80
   jp    nz,fail
	
   ld    d, #0H00
	set	0,d
   ld    a,d
   cp    #0H01
   jp    nz,fail
	
   ld    d, #0H00
	set	1,d  
   ld    a,d
   cp    #0H02
   jp    nz,fail
	
   ld    d, #0H00
	set	2,d  
   ld    a,d
   cp    #0H04
   jp    nz,fail
	
   ld    d, #0H00
	set	3,d  
   ld    a,d
   cp    #0H08
   jp    nz,fail
	
   ld    d, #0H00
	set	4,d  
   ld    a,d
   cp    #0H10
   jp    nz,fail
	
   ld    d, #0H00
	set	5,d  
   ld    a,d
   cp    #0H20
   jp    nz,fail
	
   ld    d, #0H00
	set	6,d  
   ld    a,d
   cp    #0H40
   jp    nz,fail
	
   ld    d, #0H00
	set	7,d  
   ld    a,d
   cp    #0H80
   jp    nz,fail
	
   ld    e, #0H00
	set	0,e
   ld    a,e
   cp    #0H01
   jp    nz,fail
	
   ld    e, #0H00
	set	1,e  
   ld    a,e
   cp    #0H02
   jp    nz,fail
	
   ld    e, #0H00
	set	2,e  
   ld    a,e
   cp    #0H04
   jp    nz,fail
	
   ld    e, #0H00
	set	3,e  
   ld    a,e
   cp    #0H08
   jp    nz,fail
	
   ld    e, #0H00
	set	4,e  
   ld    a,e
   cp    #0H10
   jp    nz,fail
	
   ld    e, #0H00
	set	5,e  
   ld    a,e
   cp    #0H20
   jp    nz,fail
	
   ld    e, #0H00
	set	6,e  
   ld    a,e
   cp    #0H40
   jp    nz,fail
	
   ld    e, #0H00
	set	7,e  
   ld    a,e
   cp    #0H80
   jp    nz,fail
	
   ld    h, #0H00
	set	0,h
   ld    a,h
   cp    #0H01
   jp    nz,fail
	
   ld    h, #0H00
	set	1,h  
   ld    a,h
   cp    #0H02
   jp    nz,fail
	
   ld    h, #0H00
	set	2,h  
   ld    a,h
   cp    #0H04
   jp    nz,fail
	
   ld    h, #0H00
	set	3,h  
   ld    a,h
   cp    #0H08
   jp    nz,fail
	
   ld    h, #0H00
	set	4,h  
   ld    a,h
   cp    #0H10
   jp    nz,fail
	
   ld    h, #0H00
	set	5,h  
   ld    a,h
   cp    #0H20
   jp    nz,fail
	
   ld    h, #0H00
	set	6,h  
   ld    a,h
   cp    #0H40
   jp    nz,fail
	
   ld    h, #0H00
	set	7,h  
   ld    a,h
   cp    #0H80
   jp    nz,fail
	
   ld    l, #0H00
	set	0,l
   ld    a,l
   cp    #0H01
   jp    nz,fail
	
   ld    l, #0H00
	set	1,l  
   ld    a,l
   cp    #0H02
   jp    nz,fail
	
   ld    l, #0H00
	set	2,l  
   ld    a,l
   cp    #0H04
   jp    nz,fail
	
   ld    l, #0H00
	set	3,l  
   ld    a,l
   cp    #0H08
   jp    nz,fail
	
   ld    l, #0H00
	set	4,l  
   ld    a,l
   cp    #0H10
   jp    nz,fail
	
   ld    l, #0H00
	set	5,l  
   ld    a,l
   cp    #0H20
   jp    nz,fail
	
   ld    l, #0H00
	set	6,l  
   ld    a,l
   cp    #0H40
   jp    nz,fail
	
   ld    l, #0H00
	set	7,l  
   ld    a,l
   cp    #0H80
   jp    nz,fail
	
   ret