; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the ldi instruction

	.area	_CODE

lddr_bc       = 0H0003
lddr_data     = 0H49
lddr_zero     = 0H00

.ds 2
lddr_de:
.ds 1

.ds 2
lddr_hl:
.ds 1

lddr:
;-------------------------------
; LDDR
;-------------------------------

   ld    bc, #lddr_bc
   ld    de, #lddr_de
   ld    hl, #lddr_hl
   
   ld    a, #lddr_zero       ; initialise the target address locations.
   ld    (#lddr_de), a
   ld    (#lddr_de-1), a
   ld    (#lddr_de-2), a
   
   ld    a, #lddr_data       ; load oursource address locations with test data
   ld    (#lddr_hl), a

   inc    a
   ld    (#lddr_hl-1), a
   
   inc    a
   ld    (#lddr_hl-2), a

   lddr
   
   cp    #lddr_data+2        ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc is zero
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H00
   jp    nz, fail
      
   ld    a,(#lddr_de)        ; check data was written successfully
   cp    #lddr_data
   jp    nz, fail
   
   ld    a,(#lddr_de-1)
   cp    #lddr_data+1
   jp    nz, fail
   
   ld    a,(#lddr_de-2)
   cp    #lddr_data+2
   jp    nz, fail
   
   ld    a,(#lddr_hl)        ; check source data is unchanged
   cp    #lddr_data
   jp    nz, fail
   
   ld    a,(#lddr_hl-1)
   cp    #lddr_data+1
   jp    nz, fail
   
   ld    a,(#lddr_hl-2)
   cp    #lddr_data+2
   jp    nz, fail
   
   ret