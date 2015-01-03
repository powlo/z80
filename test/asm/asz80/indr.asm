; *******************************
; INDR
; *******************************

indr_bc       = 0H0305
indr_de       = 0H1234
indr_n        = 0H05
indr_data     = 0H49
indr_zero     = 0H00

.ds 2
indr_hl:
.ds 1

indr:
    ld    bc, #indr_bc
    ld    de, #indr_de
    ld    hl, #indr_hl
    
    ld    a, #indr_zero       ; initialise the target address locations.
    ld    (#indr_hl), a
    ld    (#indr_hl-1), a
    ld    (#indr_hl-2), a
    
    ld    a, #indr_data       ; load our source address locations with test data
    out   (#indr_n), a
 
    indr
    
    jp   nz, fail             ; check z flag
  
    cp    #indr_data            ; check a reg has not changed
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
 
    ld   a, (#indr_hl)         ; check the data arrived correctly
    cp   #indr_data
    jp   nz, fail
    
    ld   a, (#indr_hl-1)
    cp   #indr_data
    jp   nz, fail
    

   ld   a, (#indr_hl-2)
   cp   #indr_data
   jp   nz, fail
   
   ret
