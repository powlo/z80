; *******************************
; LD (ix+d), r
; *******************************

ldbixdbr:

;-------------------------------
; LD (ix+d), A
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld a, #0H11
	ld	0H0(ix),a
	cp	0H0(ix)
	jp nz,	fail
	
;-------------------------------
; LD (ix+d), b
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld b, #0H22
	ld	0H1(ix),b
   ld a, #0H22
	cp	0H1(ix)
	jp nz,	fail

;-------------------------------
; LD (ix+d), c
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld c, #0H44
	ld	0H2(ix),c
   ld a, #0H44
	cp	0H2(ix)
	jp nz,	fail

;-------------------------------
; LD (ix+d), d
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld d, #0H88
	ld	0H3(ix),d
   ld a, #0H88
	cp	0H3(ix)
	jp nz,	fail

;-------------------------------
; LD (ix+d), e
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld e, #0HAA
	ld	0H4(ix),e
   ld a, #0HAA
	cp	0H4(ix)
	jp nz,	fail

;-------------------------------
; LD (ix+d), h
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld h, #0HEE
	ld	0H5(ix),h
   ld a, #0HEE
	cp	0H5(ix)
	jp nz,	fail

;-------------------------------
; LD (ix+d), l
;-------------------------------
   call rst_reg
	ld	ix,#ix_point
   ld l, #0HCC
	ld	0H6(ix),l
   ld a, #0HCC
	cp	0H6(ix)
	jp nz,	fail

   ret