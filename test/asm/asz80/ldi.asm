; *******************************
; LDI
; *******************************

	.area	_CODE

ldi_bc       = 0H0003
ldi_data     = 0H49
ldi_zero     = 0H00

ldi_de:
.ds 3

ldi_hl:
.ds 3

ldi:
 
    ld    bc, #ldi_bc
    ld    de, #ldi_de
    ld    hl, #ldi_hl
    
    ld    a, #ldi_zero       ; initialise the target address locations.
    ld    (#ldi_de), a
    ld    (#ldi_de+1), a
    ld    (#ldi_de+2), a
    
    ld    a, #ldi_data       ; load oursource address locations with test data
    ld    (#ldi_hl), a
    inc    a
    ld    (#ldi_hl+1), a
   
    inc    a
    ld    (#ldi_hl+2), a
 
    ldi
  
    cp    #ldi_data+2        ; check a reg has not changed
    jp    nz, fail
    
    ld    a,b                  ; check bc has been decremented
    cp    #0H00
    jp    nz, fail
    
    ld    a,c
    cp    #0H02
    jp    nz, fail
    
                   
   ldi
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H01
   jp    nz, fail
   
   
   ldi
      
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H00
   jp    nz, fail
      
   ret
