; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; targets:
; jr

	.area	CODE (ABS)
	.org	#0H0000	
	
;-------------------------------
;--     JP e TEST             --
;-------------------------------
	jp		next_jr				; a forward jump
	jmpr	fail

backward_label:
	jp		test_jmp_c
next_jr:
	jp		backward_label		; a backward jump
	jmpr	fail

;-------------------------------
;--     JP (condition),e      --
;-------------------------------

test_jmp_c:			
	ld	a,#0H80				; force a carry
	ld	b,#0H80
	add	b
	jp	nc,	fail
	jp	c,		test_jmp_nc
	jmpr	fail
	
test_jmp_nc:	
	ld	a,#0H01				; force a no-carry
	ld	b,#0H01
	add	b
	jp	c,		fail
	jp	nc,	test_jmp_z
	jmpr	fail

	ld	a,#0H00				; force a zero result
	ld	b,#0H00
	add	b
	
	jp	nz,	fail					;force a non-zero result
	jp	z,		test_jmp_z
	jmpr	fail

test_jmp_z:
	ld	b,#0H01
	add	b
	jp	z,		fail
	jp	nz,	test_jmp_hl
	jmpr	fail


;-------------------------------
;--     JP (HL)					--
;-------------------------------

test_jmp_hl:
	ld	hl,pass
	pchl
	jp		fail
			
pass:
	ld	a,#0H55
	ld	(#0H2000),a	jp		pass	
		
fail:
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

