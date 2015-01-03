; *******************************
; LD (nn), dd
; *******************************

	.area	_CODE

ldbnnbdd:

;-------------------------------
; LD (nn), BC
;-------------------------------
   call rst_reg
   
   ld bc, #0hABCD
   
   ld (nn_point),bc
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

;-------------------------------
; LD (nn), DE
;-------------------------------
   call rst_reg
   
   ld de, #0hABCD
   
   ld (nn_point),de
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

;-------------------------------
; LD (nn), HL
;-------------------------------
   call rst_reg
   
   ld hl, #0hABCD
   
   ld (nn_point),hl
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

;-------------------------------
; LD (nn), SP
;-------------------------------
   call rst_reg

   ld (sp_point), sp ; preserve the sp

   ld sp, #0hABCD
   
   ld (nn_point),sp
      
	ld	a,(nn_point)
	cp	#0HCD
	jp	nz,	fail

	ld	a,(nn_point+1)
	cp	#0HAB
	jp	nz,	fail

   ld sp, (sp_point)
   
   ret