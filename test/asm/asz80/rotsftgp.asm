; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This procedure contains calls to 
; all rotate and shift tests

   .include "rlca.asm"
   .include "rla.asm"
   .include "rrca.asm"
   .include "rra.asm"
   .include "rlcr.asm"
   .include "rlr.asm"
   .include "rrcr.asm"
   .include "rrr.asm"
   .include "slar.asm"
   .include "srar.asm"
   .include "srlr.asm"

   .include "rlcbhlb.asm"
   .include "rlbhlb.asm"
   .include "rrcbhlb.asm"
   .include "rrbhlb.asm"
   .include "slabhlb.asm"
   .include "srabhlb.asm"
   .include "srlbhlb.asm"

   .include "rlcbixdb.asm"
   .include "rlbixdb.asm"
   .include "rrcbixdb.asm"
   .include "rrbixdb.asm"
   .include "slabixdb.asm"
   .include "srabixdb.asm"
   .include "srlbixdb.asm"

   .include "rlcbiydb.asm"
   .include "rlbiydb.asm"
   .include "rrcbiydb.asm"
   .include "rrbiydb.asm"
   .include "slabiydb.asm"
   .include "srabiydb.asm"
   .include "srlbiydb.asm"

   .include "rld.asm"
   .include "rrd.asm"

rotsftgp:

   call rlca
   call rla
   call rrca
   call rra
   call rlcr
   call rlr
   call rrcr
   call rrr
   call slar
   call srar
   call srlr
   
   call rlcbhlb
   call rlbhlb
   call rrcbhlb
   call rrbhlb
   call slabhlb
   call srabhlb
   call srlbhlb
   
   call rlcbixdb
   call rlbixdb
   call rrcbixdb
   call rrbixdb
   call slabixdb
   call srabixdb
   call srlbixdb
   
   call rlcbiydb
   call rlbiydb
   call rrcbiydb
   call rrbiydb
   call slabiydb
   call srabiydb
   call srlbiydb
   
   call rld
   call rrd
   
   ret
   
