; *******************************
; IND
; *******************************
	.area	_CODE

ind_bc       = 0H0305
ind_de       = 0H1234
ind_n        = 0H05
ind_data     = 0H49
ind_zero     = 0H00

.ds 2
ind_hl:
.ds 1

ind:
    ld    bc, #ind_bc
    ld    de, #ind_de
    ld    hl, #ind_hl
    
    ld    a, #ind_zero       ; initialise the target address locations.
    ld    (#ind_hl), a
    ld    (#ind_hl-1), a
    ld    (#ind_hl-2), a
    
    ld    a, #ind_data       ; load our source address locations with test data
    out   (#ind_n), a
    inc    a
    out   (#ind_n+1), a
    inc    a
    out   (#ind_n+2), a
 
    ind
    jp   z, fail             ; check z flag
    
    cp    #ind_data+2        ; check a reg has not changed
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
 
    ld   a, (#ind_hl)         ; check the data arrived correctly
    cp   #ind_data
    jp   nz, fail
    
    inc c
                          
   ind
    jp   z, fail              ; check z flag
      
   ld    a,b                  ; check b has been decremented
   cp    #0H01
   jp    nz, fail
   
    ld   a, (#ind_hl-1)       ; check the data arrived correctly
    cp   #ind_data+1
    jp   nz, fail

    inc c
       
   ind
    jp   nz, fail             ; check z flag
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld   a, (#ind_hl-2)       ; check the data arrived correctly
   cp   #ind_data+2
   jp   nz, fail
   
   ret
