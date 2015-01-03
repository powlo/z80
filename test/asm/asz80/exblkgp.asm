; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This procedure contains calls to 
; all exchange, block transfer and search
; instructions

   .include "ex_de_hl.asm"
   .include "ex_af_af.asm"
   .include "exx.asm"
   .include "exbspbhl.asm"
   .include "exbspbix.asm"
   .include "exbspbiy.asm"

   .include "ldi.asm"
   .include "ldir.asm"
   .include "ldd.asm"
   .include "lddr.asm"
   .include "cpi.asm"
   .include "cpd.asm"
   .include "cpir.asm"
   .include "cpdr.asm"

exblkgp:
   call ex_de_hl  ; ex de, hl
   call ex_af_af  ; ex af, af'
   call exx       ; exx
   call exbspbhl  ; ex (sp), hl
   call exbspbix  ; ex (sp), ix
   call exbspbiy  ; ex (sp), iy
   
   call ldi       ; ldi
   call ldd       ; ldd
   call ldir      ; ldir
   call lddr      ; lddr
   call cpi       ; cpi
   call cpd       ; cpd
   call cpir      ; cpir
   call cpdr      ; cpdr

   ret
   
