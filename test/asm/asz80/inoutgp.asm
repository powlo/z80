; *******************************
; Input and Output group
; *******************************

   .include "inann.asm"
   .include "inrbcb.asm"
   .include "ini.asm"
   .include "inir.asm"
   .include "ind.asm"
   .include "indr.asm"
   .include "outi.asm"
   .include "otir.asm"
   .include "outd.asm"
   .include "otdr.asm"

inoutgp:

   call inann   ; in a, nn
   call inrbcb  ; in r, (c)
   call ini     ; ini
   call inir    ; inir
   call ind     ; ind
   call indr    ; indr
   call outi    ; outi
   call otir    ; otir
   call outd    ; outd
   call otdr    ; otdr
   
   ret
   
