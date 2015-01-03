; *******************************
; 16 Bit Arithmetic Group
; *******************************

   .include "addhlss.asm"
   .include "adchlss.asm"

arit16gp:
   call addhlss      ; add HL, ss
   call adchlss      ; add HL, ss

   ret
   
