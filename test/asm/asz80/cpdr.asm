; *******************************
; CPDR
; *******************************
	.area	_CODE

   cpdr_bc       = 0H0003
   cpdr_de       = 0H3000
   cpdr_data     = 0H49
   cpdr_zero     = 0H00

   .ds 2
   cpdr_hl:
   .ds 1

cpdr:

   call rst_reg

   ld    bc, #cpdr_bc
   ld    de, #cpdr_de
   ld    hl, #cpdr_hl
   
   ld    a, #cpdr_data-1       ; load search address locations with test data
   ld    (#cpdr_hl), a

   ld    a, #cpdr_data+1
   ld    (#cpdr_hl-1), a

   ld    a, #cpdr_data
   ld    (#cpdr_hl-2), a


   ld    a, #cpdr_data-2     ; search for a value which is not there
   
   cpdr                       
   jp    p, fail              ; last result should be negative
   jp    z, fail              ; none zero
   jp    pe, fail             ; and bc = 0 
   
   cp    #cpdr_data-2        ; check a reg has not changed
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

   ld    bc, #cpdr_bc        ; reset search parameters
   ld    de, #cpdr_de
   ld    hl, #cpdr_hl
   ld    a, #cpdr_data-1     ; search for a value at the start

   cpdr                      
   jp    m, fail              ; result should be positive
   jp    nz, fail             ; found means result = zero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpdr_data-1        ; check a reg has not changed
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

   ld    a, #cpdr_data
   ld    (#cpdr_hl+2), a

   ld    bc, #cpdr_bc        ; reset search parameters
   ld    de, #cpdr_de
   ld    hl, #cpdr_hl
   ld    a, #cpdr_data+1     ; search for a value in middle

   cpdr                       ; check next HL
   jp    m, fail              ; result should be zero
   jp    nz, fail             ; found means result = zero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpdr_data+1        ; check a reg has not changed
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