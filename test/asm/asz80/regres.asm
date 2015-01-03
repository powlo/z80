; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the addition
; instructions.

	.area	VECTORS (ABS)
	.org	#0H0000	
	jp		main_code

	.org	#0H0038	
	jp		mode1_code

	.org	#0H0066	
	jp		nmi_code
      
   .include "calretgp.asm"
   .include "jumpgp.asm"
   .include "ld8gp.asm"
   .include "ld16gp.asm"
   .include "exblkgp.asm"
   .include "rotsftgp.asm"
   .include "genarigp.asm"
   .include "arit8gp.asm"
   .include "arit16gp.asm"
   .include "inoutgp.asm"
   .include "bitsrtgp.asm"
   .include "pass_fai.asm"

	.area	_CODE

mode1_code:
	ld	a,#0H01
	ret
		
nmi_code:
	ld	a,#0H02
	ret
   
main_code:
   ld sp, #stack

   call calretgp
   call jumpgp
   call ld8gp
   call ld16gp
   call exblkgp
   call rotsftgp
   call genarigp
   call arit8gp
   call arit16gp
   call inoutgp
   call bitsrtgp
   
   halt
   nop
   nop
   nop
; space reserved for stack.

.ds 32

stack:

; space reserved for pointers / variables
nn_point:
.ds 2

bc_point:
.ds 2

de_point:
.ds 2

hl_point:
.ds 2

ix_point:
.ds 2

iy_point:
.ds 2

sp_point:
.ds 2