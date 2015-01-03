; *******************************
; CPIR
; *******************************

	.area	_CODE

   cpir_bc       = 0H0003
   cpir_de       = 0H3000
   cpir_data     = 0H49
   cpir_zero     = 0H00

   cpir_hl:
   .ds 3

cpir:

   call rst_reg

   ld    bc, #cpir_bc
   ld    de, #cpir_de
   ld    hl, #cpir_hl
   
   ld    a, #cpir_data-1       ; load search address locations with test data
   ld    (#cpir_hl), a

   ld    a, #cpir_data+1
   ld    (#cpir_hl+1), a

   ld    a, #cpir_data
   ld    (#cpir_hl+2), a


   ld    a, #cpir_data-2     ; search for a value which is not there
   
   cpir                       
   jp    p, fail              ; last result should be negative
   jp    z, fail              ; none zero
   jp    pe, fail             ; and bc = 0 
   
   cp    #cpir_data-2        ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc is zero
   cp    #0H00
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

   ld    bc, #cpir_bc        ; reset search parameters
   ld    de, #cpir_de
   ld    hl, #cpir_hl
   ld    a, #cpir_data-1     ; search for a value at the start

   cpir                      
   jp    m, fail              ; result should be positive
   jp    nz, fail             ; found means result = zero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpir_data-1        ; check a reg has not changed
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

   ld    a, #cpir_data
   ld    (#cpir_hl+2), a

   ld    bc, #cpir_bc        ; reset search parameters
   ld    de, #cpir_de
   ld    hl, #cpir_hl
   ld    a, #cpir_data+1     ; search for a value in middle

   cpir                       ; check next HL
   jp    m, fail              ; result should be zero
   jp    nz, fail             ; found means result = zero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpir_data+1        ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc has been decremented
   cp    #0H00
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

   ret