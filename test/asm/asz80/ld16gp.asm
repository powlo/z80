; *******************************
; 16 Bit Load Group
; *******************************

   .include "ldddnn.asm"
   .include "ldixnn.asm"
   .include "ldiynn.asm"
   .include "ldhlbnnb.asm"
   .include "ldddbnnb.asm"
   .include "ldixbnnb.asm"
   .include "ldiybnnb.asm"
   .include "ldbnnbhl.asm"
   .include "ldbnnbdd.asm"
   .include "ldbnnbix.asm"
   .include "ldbnnbiy.asm"
   .include "ldsphl.asm"
   .include "ldspix.asm"
   .include "ldspiy.asm"
   .include "pushqq.asm"
   .include "pushix.asm"
   .include "pushiy.asm"
   .include "popqq.asm"
   .include "popix.asm"
   .include "popiy.asm"

ld16gp:

   call ldddnn      ; ld dd, nn
   call ldixnn      ; ld ix, nn
   call ldiynn      ; ld iy, nn
   call ldhlbnnb    ; ld hl, (nn)
   call ldddbnnb    ; ld dd, (nn)
   call ldixbnnb    ; ld ix, (nn)
   call ldiybnnb    ; ld iy, (nn)
   call ldbnnbhl    ; ld (nn), hl
   call ldbnnbdd    ; ld (nn), dd
   call ldbnnbix    ; ld (nn), ix
   call ldbnnbiy    ; ld (nn), iy
   call ldsphl      ; ld sp, hl
   call ldspix      ; ld sp, ix
   call ldspiy      ; ld sp, iy
   call pushqq      ; push qq
   call pushix      ; push ix
   call pushiy      ; push iy
   call popqq       ; pop qq
   call popix       ; pop ix
   call popiy       ; pop iy

   ret
   
