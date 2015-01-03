; *******************************
; Bit Set, Reset and Test Group
; *******************************

   .include "btbr.asm"
   .include "btbbhlb.asm"
   .include "btbbixdb.asm"
   .include "btbbiydb.asm"
   .include "stbr.asm"
   .include "stbbhlb.asm"
   .include "stbbixdb.asm"
   .include "stbbiydb.asm"
   .include "rsbr.asm"
   .include "rsbbhlb.asm"
   .include "rsbbixdb.asm"
   .include "rsbbiydb.asm"

bitsrtgp:

   call btbr         ; bit b,r
   call btbbhlb      ; bit b,(hl)
   call btbbixdb      ; bit b,(ix+d)
   call btbbiydb      ; bit b,(iy+d)
   
   call stbr         ; set b,r
   call stbbhlb      ; set b,(hl)
   call stbbixdb      ; set b,(ix+d)
   call stbbiydb      ; set b,(iy+d)

   call rsbr         ; res b,r
   call rsbbhlb      ; res b,(hl)
   call rsbbixdb      ; res b,(ix+d)
   call rsbbiydb      ; res b,(iy+d)

   ret
   
