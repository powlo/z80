; *******************************
; 8 Bit Load Group
; *******************************
	.area	_CODE
   .module ld8gp

   .include "ldrr.asm"
   .include "ldrn.asm"
   .include "ldrbhlb.asm"
   .include "ldrbixdb.asm"
   .include "ldrbiydb.asm"
   .include "ldbhlbr.asm"
   .include "ldbixdbr.asm"
   .include "ldbiydbr.asm"
   .include "ldbhlbn.asm"
   .include "ldbixdbn.asm"
   .include "ldbiydbn.asm"
   .include "ldabbcb.asm"
   .include "ldabdeb.asm"
   .include "ldabnnb.asm"
   .include "ldbbcba.asm"
   .include "ldbdeba.asm"
   .include "ldbnnba.asm"
   .include "ldia.asm"
   .include "ldai.asm"
   .include "ldra.asm"
   .include "ldar.asm"

ld8gp:

   call ldrr      ; ld r, r'
   call ldrn      ; ld r, n
   call ldrbhlb   ; ld r, (hl)
   call ldrbixdb  ; ld r, (ix+d)
   call ldrbiydb  ; ld r, (iy+d)
   call ldbhlbr   ; ld (hl),r
   call ldbixdbr  ; ld (ix+d),r
   call ldbiydbr  ; ld (iy+d),r
   call ldbhlbn   ; ld (hl),n
   call ldbixdbn  ; ld (ix+d),n
   call ldbiydbn  ; ld (iy+d),n
   call ldabbcb   ; ld A,(bc)
   call ldabdeb   ; ld A,(de)
   call ldabnnb   ; ld A,(nn)
   call ldbbcba   ; ld (bc),a
   call ldbdeba   ; ld (de),a
   call ldbnnba   ; ld (nn),a
   call ldia      ; ld i,a
   call ldai      ; ld a,i
   call ldra      ; ld r,a
   call ldar      ; ld a,r
   
   ret
   
