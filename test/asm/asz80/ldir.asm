; *******************************
; LDIR
; *******************************

	.area	_CODE

ldir_bc       = 0H0003
ldir_dat     = 0H49
ldir_zero     = 0H00

ldir_de:
.ds 3

ldir_hl:
.ds 3

ldir:

   ld    bc, #ldir_bc
   ld    de, #ldir_de
   ld    hl, #ldir_hl
   
   ld    a, #ldir_zero       ; initialise the target address locations.
   ld    (#ldir_de), a
   ld    (#ldir_de+1), a
   ld    (#ldir_de+2), a
   
   ld    a, #ldir_dat       ; load oursource address locations with test data
   ld    (#ldir_hl), a

   inc    a
   ld    (#ldir_hl+1), a
   
   inc    a
   ld    (#ldir_hl+2), a

   ldir
   
   cp    #ldir_dat+2        ; check a reg has not changed
   jp    nz, fail
   
   ld    a,b                  ; check bc is zero
   cp    #0H00
   jp    nz, fail
   
   ld    a,c
   cp    #0H00
   jp    nz, fail
      
   ld    a,(#ldir_de)        ; check data was written successfully
   cp    #ldir_dat
   jp    nz, fail
   
   ld    a,(#ldir_de+1)
   cp    #ldir_dat+1
   jp    nz, fail
   
   ld    a,(#ldir_de+2)
   cp    #ldir_dat+2
   jp    nz, fail
   
   ld    a,(#ldir_hl)        ; check source data is unchanged
   cp    #ldir_dat
   jp    nz, fail
   
   ld    a,(#ldir_hl+1)
   cp    #ldir_dat+1
   jp    nz, fail
   
   ld    a,(#ldir_hl+2)
   cp    #ldir_dat+2
   jp    nz, fail
   
   ret