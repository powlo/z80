; *******************************
; LDD
; *******************************

	.area	_CODE

ldd_bc       = 0H0003
ldd_data     = 0H49
ldd_zero     = 0H00

.ds 2
ldd_de:
.ds 1

.ds 2
ldd_hl:
.ds 1


ldd:
 ;-------------------------------
 ; LDD
 ;-------------------------------
 
    ld    bc, #ldd_bc
    ld    de, #ldd_de
    ld    hl, #ldd_hl
    
    ld    a, #ldd_zero       ; initialise the target address locations.
    ld    (#ldd_de), a
    ld    (#ldd_de-1), a
    ld    (#ldd_de-2), a
    
    ld    a, #ldd_data       ; load oursource address locations with test data
    ld    (#ldd_hl), a
    inc    a
    ld    (#ldd_hl-1), a
   
    inc    a
    ld    (#ldd_hl-2), a
 
    ldd
    jp    po, fail             ; check BC /= 0
    
    cp    #ldd_data+2          ; check a reg has not changed
    jp    nz, fail
    
    ld    a,b                  ; check bc has been decremented
    cp    #0H00
    jp    nz, fail
    
    ld    a,c
    cp    #0H02
    jp    nz, fail

    ld    a, #ldd_data+2      ; load oursource address locations with test data
                   
   ldd
    jp    po, fail             ; check BC /= 0
   
    cp    #ldd_data+2        ; check a reg has not changed
    jp    nz, fail
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H01
   jp    nz, fail
      
   ldd
   jp    pe, fail             ; check BC = 0
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H00
   jp    nz, fail
      
   ld    a,(#ldd_de)        ; check data was written successfully
   cp    #ldd_data
   jp    nz, fail
   
   ld    a,(#ldd_de-1)
   cp    #ldd_data+1
   jp    nz, fail
   
   ld    a,(#ldd_de-2)
   cp    #ldd_data+2
   jp    nz, fail
   
   ld    a,(#ldd_hl)        ; check source data is unchanged
   cp    #ldd_data
   jp    nz, fail
   
   ld    a,(#ldd_hl-1)
   cp    #ldd_data+1
   jp    nz, fail
   
   ld    a,(#ldd_hl-2)
   cp    #ldd_data+2
   jp    nz, fail
   
   ret