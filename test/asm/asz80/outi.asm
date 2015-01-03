; *******************************
; OUTI
; *******************************

outi_bc       = 0H0305
outi_de       = 0H1234

outi_hl:
.ds 3

outi_n        = 0H05

outi_data     = 0H49
outi_zero     = 0H00

outi:
    ld    bc, #outi_bc
    ld    de, #outi_de
    ld    hl, #outi_hl
    
    ld    a, #outi_zero       ; initialise the target address locations.
    out    (#outi_n), a
    out    (#outi_n+1), a
    out    (#outi_n+2), a
    
    ld    a, #outi_data       ; load our source address locations with test data
    ld   (#outi_hl), a
    inc    a
    ld   (#outi_hl+1), a
    inc    a
    ld   (#outi_hl+2), a
 
    outi
  
    cp    #outi_data+2        ; check a reg has not changed
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
 
    in   a, (c)               ; check the data arrived correctly
    cp   #outi_data
    jp   nz, fail
    
    inc c
                          
   outi
      
   ld    a,b                  ; check b has been decremented
   cp    #0H01
   jp    nz, fail
   
    in   a, (c)               ; check the data arrived correctly
    cp   #outi_data+1
    jp   nz, fail

    inc c
       
   outi
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   in   a, (c)                ; check the data arrived correctly
   cp   #outi_data+2
   jp   nz, fail
   
   ret
