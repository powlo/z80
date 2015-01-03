; *******************************
; OTIR
; *******************************

	.area	_CODE

otir_bc       = 0H0305
otir_de       = 0H1234
otir_n        = 0H05
otir_data     = 0H49
otir_zero     = 0H00

otir_hl:
.ds 3

otir:
    ld    bc, #otir_bc
    ld    de, #otir_de
    ld    hl, #otir_hl
    
    ld    a, #otir_zero       ; initialise the target address locations.
    out    (c), a
    
    ld    a, #otir_data       ; load our source address locations with test data
    ld   (#otir_hl), a
    inc    a
    ld   (#otir_hl+1), a
    inc    a
    ld   (#otir_hl+2), a
 
    otir
    
    jp   nz, fail             ; check z flag
  
    cp    #otir_data+2         ; check a reg has not changed
    jp    nz, fail
    
    ld    a,b                 ; check b is zero
    cp    #0H00
    jp    nz, fail
    
    ld    a,c                 ; check c has not changed
    cp    #0H05
    jp    nz, fail
    
    ld    a,d                 ; check de has not changed
    cp    #0H12
    jp    nz, fail
    
    ld    a,e
    cp    #0H34
    jp    nz, fail
 
    in   a, (c)         ; check the data arrived correctly
    cp   #otir_data+2
    jp   nz, fail
       
   ret
