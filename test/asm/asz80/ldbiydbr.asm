; *******************************
; LD (iy+d), r
; *******************************

ldbiydbr:

;-------------------------------
; LD (iy+d), A
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld a, #0H11
	ld	0H0(iy),a
	cp	0H0(iy)
	jp nz,	fail
	
;-------------------------------
; LD (iy+d), b
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld b, #0H22
	ld	0H1(iy),b
   ld a, #0H22
	cp	0H1(iy)
	jp nz,	fail

;-------------------------------
; LD (iy+d), c
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld c, #0H44
	ld	0H2(iy),c
   ld a, #0H44
	cp	0H2(iy)
	jp nz,	fail

;-------------------------------
; LD (iy+d), d
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld d, #0H88
	ld	0H3(iy),d
   ld a, #0H88
	cp	0H3(iy)
	jp nz,	fail

;-------------------------------
; LD (iy+d), e
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld e, #0HAA
	ld	0H4(iy),e
   ld a, #0HAA
	cp	0H4(iy)
	jp nz,	fail

;-------------------------------
; LD (iy+d), h
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld h, #0HEE
	ld	0H5(iy),h
   ld a, #0HEE
	cp	0H5(iy)
	jp nz,	fail

;-------------------------------
; LD (iy+d), l
;-------------------------------
   call rst_reg
	ld	iy,#iy_point
   ld l, #0HCC
	ld	0H6(iy),l
   ld a, #0HCC
	cp	0H6(iy)
	jp nz,	fail

   ret