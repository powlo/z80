; *******************************
; CPI
; *******************************
	.area	_CODE

   cpi_bc       = 0H0003
   cpi_de       = 0H3000
   cpi_data     = 0H49
   cpi_zero     = 0H00

   cpi_hl:
   .ds 3

cpi:

   call rst_reg

   ld    bc, #cpi_bc
   ld    de, #cpi_de
   ld    hl, #cpi_hl
   
   ld    a, #cpi_data-1       ; load search address locations with test data
   ld    (#cpi_hl), a

   ld    a, #cpi_data+1
   ld    (#cpi_hl+1), a

   ld    a, #cpi_data
   ld    (#cpi_hl+2), a
   
   cpi                        ; check first HL
   jp    m, fail              ; result should be positive
   jp    z, fail              ; none sero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpi_data          ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H02
   jp    nz, fail
   
   ld    a,d                  ; check de has not changed
   cp    #0H30
   jp    nz, fail
   
   ld    a,e
   cp    #0H00
   jp    nz, fail

   ld    a, #cpi_data
   ld    (#cpi_hl+2), a

   cpi                        ; check next HL
   jp    p, fail              ; result should be negative
   jp    z, fail              ; none sero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpi_data          ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc has been decremented
   cp    #0H0
   jp    nz, fail
   
   ld    a,c
   cp    #0H01
   jp    nz, fail
   
   ld    a,d                  ; check de has not changed
   cp    #0H30
   jp    nz, fail
   
   ld    a,e
   cp    #0H00
   jp    nz, fail

   ld    a, #cpi_data
   ld    (#cpi_hl+2), a

   cpi                        ; check next HL
   jp    m, fail              ; result should be zero
   jp    nz, fail             ; zero
   jp    pe, fail             ; and bc = 0 
   
   cp    #cpi_data          ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc has been decremented
   cp    #0H0
   jp    nz, fail
   
   ld    a,c
   cp    #0H00
   jp    nz, fail
   
   ld    a,d                  ; check de has not changed
   cp    #0H30
   jp    nz, fail
   
   ld    a,e
   cp    #0H00
   jp    nz, fail

   ret