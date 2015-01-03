; *******************************
; OUTD
; *******************************

outd_bc       = 0H0305
outd_de       = 0H1234

.ds 2
outd_hl:
.ds 1
out_n        = 0H05

outd_data     = 0H49
outd_zero     = 0H00

outd:
    ld    bc, #outd_bc
    ld    de, #outd_de
    ld    hl, #outd_hl
    
    ld    a, #outd_zero       ; initialise the target address locations.
    out    (#out_n), a
    out    (#out_n+1), a
    out    (#out_n+2), a
    
    ld    a, #outd_data       ; load our source address locations with test data
    ld   (#outd_hl), a
    inc    a
    ld   (#outd_hl-1), a
    inc    a
    ld   (#outd_hl-2), a
 
    outd
  
    cp    #outd_data+2        ; check a reg has not changed
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
    cp   #outd_data
    jp   nz, fail
    
    inc c
                          
   outd
      
   ld    a,b                  ; check b has been decremented
   cp    #0H01
   jp    nz, fail
   
    in   a, (c)               ; check the data arrived correctly
    cp   #outd_data+1
    jp   nz, fail

    inc c
       
   outd
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   in   a, (c)                ; check the data arrived correctly
   cp   #outd_data+2
   jp   nz, fail
   
   ret
