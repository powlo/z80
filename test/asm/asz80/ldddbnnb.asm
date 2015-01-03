; *******************************
; LD dd, (nn)
; *******************************

	.area	_CODE

ldddbnnb:


;-------------------------------
; ld bc, (nn)
;-------------------------------
   call rst_reg
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a
      
	ld	bc,(nn_point)

	ld	a,#0HAB
	cp	b
	jp	nz,	fail

	ld	a,#0HCD
	cp	c
	jp	nz,	fail

;-------------------------------
; ld de, (nn)
;-------------------------------
   call rst_reg
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a
      
	ld	de,(nn_point)

	ld	a,#0HAB
	cp	d
	jp	nz,	fail

	ld	a,#0HCD
	cp	e
	jp	nz,	fail

;-------------------------------
; ld hl, (nn)
;-------------------------------
   call rst_reg
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a
      
	ld	hl,(nn_point)

	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail

;-------------------------------
; ld sp, (nn)
;-------------------------------
   call rst_reg
   ld a,#0HCD
   ld (nn_point),a
   ld a,#0HAB
   ld (nn_point+1),a

   ld (sp_point), sp ; preserve the sp
      
	ld	sp,(nn_point)   
   add hl, sp        ; use add hl,sp to get make sp checkable

	ld	a,#0HAB
	cp	h
	jp	nz,	fail

	ld	a,#0HCD
	cp	l
	jp	nz,	fail

   ld sp, (sp_point)    ; restore the sp

   ret