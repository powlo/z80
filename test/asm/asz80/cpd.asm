; *******************************
; CPD
; *******************************
	.area	_CODE

   cpd_bc       = 0H0003
   cpd_de       = 0H3000
   cpd_data     = 0H49
   cpd_zero     = 0H00

   .ds 2
   cpd_hl:
   .ds 1

cpd:

   call rst_reg

   ld    bc, #cpd_bc
   ld    de, #cpd_de
   ld    hl, #cpd_hl
   
   ld    a, #cpd_data-1       ; load search address locations with test data
   ld    (#cpd_hl), a

   ld    a, #cpd_data+1
   ld    (#cpd_hl-1), a

   ld    a, #cpd_data
   ld    (#cpd_hl-2), a
   
   cpd                        ; check first HL
   jp    m, fail              ; result should be positive
   jp    z, fail              ; none sero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpd_data          ; check a reg has not changed
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

   ld    a, #cpd_data
   ld    (#cpd_hl-2), a

   cpd                        ; check next HL
   jp    p, fail              ; result should be negative
   jp    z, fail              ; none sero
   jp    po, fail             ; and bc /= 0 
   
   cp    #cpd_data          ; check a reg has not changed
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

   ld    a, #cpd_data
   ld    (#cpd_hl-2), a

   cpd                        ; check next HL
   jp    m, fail              ; result should be zero
   jp    nz, fail             ; zero
   jp    pe, fail             ; and bc = 0 
   
   cp    #cpd_data          ; check a reg has not changed
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