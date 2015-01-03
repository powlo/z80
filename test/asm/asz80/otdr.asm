; *******************************
; OTDR
; *******************************
	.area	_CODE

otdr_bc       = 0H0305
otdr_de       = 0H1234
otdr_n        = 0H05
otdr_data     = 0H49
otdr_zero     = 0H00

otdr_hl:
.ds 3

otdr:
    ld    bc, #otdr_bc
    ld    de, #otdr_de
    ld    hl, #otdr_hl
    
    ld    a, #otdr_zero       ; initialise the target address locations.
    out    (c), a
    
    ld    a, #otdr_data       ; load our source address locations with test data
    ld   (#otdr_hl), a
    inc    a
    ld   (#otdr_hl-1), a
    inc    a
    ld   (#otdr_hl-2), a
 
    otdr
    
    jp   nz, fail             ; check z flag
  
    cp    #otdr_data+2         ; check a reg has not changed
    jp    nz, fail
    
    ld    a,b                  ; check b is zero
    cp    #0H00
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
 
    in   a, (c)         ; check the data arrived correctly
    cp   #otdr_data+2
    jp   nz, fail
       
   ret
