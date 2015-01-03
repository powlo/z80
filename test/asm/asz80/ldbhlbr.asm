; *******************************
; LD (hl), r
; *******************************

ldbhlbr:

;-------------------------------
; LD (hl), A
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld a, #0H11
	ld	(hl),a
	cp	(hl)
	jp nz,	fail
	
;-------------------------------
; LD (hl), b
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld b, #0H22
	ld	(hl),b
   ld a, #0H22
	cp	(hl)
	jp nz,	fail

;-------------------------------
; LD (hl), c
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld c, #0H44
	ld	(hl),c
   ld a, #0H44
	cp	(hl)
	jp nz,	fail

;-------------------------------
; LD (hl), d
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld d, #0H88
	ld	(hl),d
   ld a, #0H88
	cp	(hl)
	jp nz,	fail

;-------------------------------
; LD (hl), e
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld e, #0HAA
	ld	(hl),e
   ld a, #0HAA
	cp	(hl)
	jp nz,	fail

;-------------------------------
; LD (hl), h
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld h, #0HEE
	ld	(hl),h
   ld a, #0HEE
	cp	(hl)
	jp nz,	fail

;-------------------------------
; LD (hl), l
;-------------------------------
   call rst_reg
	ld	hl,#hl_point
   ld l, #0HCC
	ld	(hl),l
   ld a, #0HCC
	cp	(hl)
	jp nz,	fail

   ret