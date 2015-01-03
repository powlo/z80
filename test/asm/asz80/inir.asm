; *******************************
; INIR
; *******************************
	.area	_CODE

inir_bc       = 0H0305
inir_de       = 0H1234
inir_n        = 0H05
inir_data     = 0H49
inir_zero     = 0H00

inir_hl:
.ds 3

inir:
    ld    bc, #inir_bc
    ld    de, #inir_de
    ld    hl, #inir_hl
    
    ld    a, #inir_zero       ; initialise the target address locations.
    ld    (#inir_hl), a
    ld    (#inir_hl+1), a
    ld    (#inir_hl+2), a
    
    ld    a, #inir_data       ; load our source address locations with test data
    out   (#inir_n), a
 
    inir
    jp   nz, fail             ; check z flag
  
    cp    #inir_data            ; check a reg has not changed
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
 
    ld   a, (#inir_hl)         ; check the data arrived correctly
    cp   #inir_data
    jp   nz, fail
    
    ld   a, (#inir_hl+1)
    cp   #inir_data
    jp   nz, fail
    

   ld   a, (#inir_hl+2)
   cp   #inir_data
   jp   nz, fail
   
   ret
