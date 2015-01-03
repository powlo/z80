; *******************************
; INI
; *******************************
	.area	_CODE

ini_bc       = 0H0305
ini_de       = 0H1234
ini_hl:
.ds 3

ini_n        = 0H05

ini_data     = 0H49
ini_zero     = 0H00

ini:
    ld    bc, #ini_bc
    ld    de, #ini_de
    ld    hl, #ini_hl
    
    ld    a, #ini_zero       ; initialise the target address locations.
    ld    (#ini_hl), a
    ld    (#ini_hl+1), a
    ld    (#ini_hl+2), a
    
    ld    a, #ini_data       ; load our source address locations with test data
    out   (#ini_n), a
    inc    a
    out   (#ini_n+1), a
    inc    a
    out   (#ini_n+2), a
 
    ini
  
    cp    #ini_data+2        ; check a reg has not changed
    jp    nz, fail
    
    ld    a,b                  ; check b has been decremented
    cp    #0H02
    jp    nz, fail
    
    ld    a,c                  ; check c has not changed
    cp    #0H05
    jp    nz, fail
    
    ld    a,d                  ; check de has not changed
    cp    #0H12
    jp    nz, fail
    
    ld    a,e
    cp    #0H34
    jp    nz, fail
 
    ld   a, (#ini_hl)         ; check the data arrived correctly
    cp   #ini_data
    jp   nz, fail
    
    inc c
                          
   ini
      
   ld    a,b                  ; check b has been decremented
   cp    #0H01
   jp    nz, fail
   
    ld   a, (#ini_hl+1)       ; check the data arrived correctly
    cp   #ini_data+1
    jp   nz, fail

    inc c
       
   ini
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld   a, (#ini_hl+2)       ; check the data arrived correctly
   cp   #ini_data+2
   jp   nz, fail
   
   ret
