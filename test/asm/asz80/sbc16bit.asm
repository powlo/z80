; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This test targets the exchange
; instructions.

	.area	CODE (ABS)
	.org	#0H0000	


;-------------------------------
;--     SBC HL BC             --
;-------------------------------
;Check Borrow In Works
;-------------------------------
	ld	bc,#0H1234
	ld	hl,#0H2345

	ld		a,#0H80	; Force a 'borrow' by doing 80+80
	add	a			

	sbc	hl,bc

	jp	c,	fail			

	ld	a,#0H10
	cp	l
	jp	nz,	fail

	ld	a,#0H11
	cp	h
	jp	nz,	fail

;-------------------------------
; Check a borrow can be generated
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a
	
	ld	bc,#0HA004
	ld	hl,#0H8005

	sbc	hl,bc

	jp	nc,	fail			

	ld	a,#0H01
	cp	l
	jp	nz,	fail

	ld	a,#0HE0
	cp	h
	jp	nz,	fail

;-------------------------------
; Check borrow travels between bytes
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a
	
	ld	bc,#0H00FF
	ld	hl,#0H02A0

	sbc	hl,bc

	jp	c,	fail			

	ld	a,#0HA1
	cp	l
	jp	nz,	fail

	ld	a,#0H01
	cp	h
	jp	nz,	fail


;-------------------------------
;--     SBC HL DE             --
;-------------------------------
;Check Carry In Works
;-------------------------------
	ld	de,#0H2143
	ld	hl,#0H2345

	ld		a,#0H80	; Force a carry by doing 80+80
	add	a			

	sbc	hl,de

	jp	c,	fail			

	ld	a,#0H01
	cp	l
	jp	nz,	fail

	ld	a,#0H02
	cp	h
	jp	nz,	fail

;-------------------------------
; Check a carry can be generated
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a
	
	ld	de,#0HA004
	ld	hl,#0H9003

	sbc	hl,de

	jp	nc,	fail			

	ld	a,#0HFF
	cp	l
	jp	nz,	fail

	ld	a,#0HEF
	cp	h
	jp	nz,	fail

;-------------------------------
; Check carry travels between bytes
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a
	
	ld	de,#0H00FF
	ld	hl,#0H05A0

	sbc	hl,de

	jp	c,	fail			

	ld	a,#0HA1
	cp	l
	jp	nz,	fail

	ld	a,#0H04
	cp	h
	jp	nz,	fail

;-------------------------------
;--     SBC HL HL             --
;-------------------------------
;Self subtract with carry always generates -1!
; so other cases dont exist.
;-------------------------------
	ld		hl,#0H4523

	ld		a,#0H80	; Force a carry by doing 80+80
	add	a			

	sbc	hl,hl

	jp		nc,fail			

	ld		a,#0HFF
	cp		l
	jp		nz,fail

	ld		a,#0HFF
	cp		h
	jp		nz,fail

;-------------------------------
;--     SBC HL SP             --
;-------------------------------
;Check Carry In Works
;-------------------------------
	ld	sp,#0H1122
	ld	hl,#0H4321

	ld		a,#0H80	; Force a carry by doing 80+80
	add	a			

	sbc	hl,sp

	jp	c,	fail			

	ld	a,#0HFE
	cp	l
	jp	nz,	fail

	ld	a,#0H31
	cp	h
	jp	nz,	fail

;-------------------------------
; Check a carry can be generated
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a

	ld	sp,#0HC005
	ld	hl,#0HA009

	sbc	hl,sp

	jp	nc,	fail			

	ld	a,#0H04
	cp	l
	jp	nz,	fail

	ld	a,#0HE0
	cp	h
	jp	nz,	fail

;-------------------------------
; Check carry travels between bytes
;-------------------------------
	ld	a, #0H00			; make sure the carry bit is clear
	add	a
	
	ld	sp,#0H00FE
	ld	hl,#0H0490

	sbc	hl,sp

	jp	c,	fail			

	ld	a,#0H92
	cp	l
	jp	nz,	fail

	ld	a,#0H03
	cp	h
	jp	nz,	fail

pass:
	ld	a,#0H55
	ld	(#0H2000),a

	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a
	jp		fail

