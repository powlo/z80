; *******************************
; General Purpose Arithmetic
;   And CPU Control Group
; *******************************

   .include "daa.asm"
   .include "cpl.asm"
   .include "neg.asm"
   .include "ccf.asm"
   .include "scf.asm"

genarigp:

   call daa      ; daa
   call cpl      ; cpl
   call neg      ; neg
   call ccf      ; ccf
   call scf      ; scf

   ret
   
