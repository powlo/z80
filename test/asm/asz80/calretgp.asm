; *******************************
; Call and Return Group
; *******************************

   .module calretgp
   .title calretgp
	.area	_CODE

   .include "call.asm"
   .include "ret.asm"
   .include "callcc.asm"
   .include "retcc.asm"

calretgp:
   call call   ; call (?!)
   call ret    ; ret
   call callcc ; call cc
   call retcc  ; ret cc

   ret
   
