; *******************************
; Jump group
; *******************************

   .module jumpgp
   .title jumpgp
	.area	_CODE

   .include "jpnn.asm"
   .include "jpccnn.asm"
   .include "jre.asm"
   .include "jrcce.asm"
   .include "jphl.asm"
   .include "jpix.asm"
   .include "jpiy.asm"
   .include "djnz.asm"

jumpgp:
   call jpnn      ; jp (nn)
   call jpccnn    ; jp cc, (nn)
   call jre       ; jr e
   call jrcce     ; jr cc,e
   call jphl      ; jp (hl)
   call jpix      ; jp (ix)
   call jpiy      ; jp (iy)
   call djnz      ; djnz
   
   ret
   
