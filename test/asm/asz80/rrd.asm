;-----------------------------------
;--     Rotate Right Decimal       --
;-----------------------------------
rrd:
   ld a, #0H00       ; set zero bit
   add   a,a
   
	ld	hl,#hl_point
	ld	(hl),#0HCD
	ld	a,#0HAB
	rrd

	jp	z,    fail     ; Check all the flags to
	jp	c,    fail     ; make sure that the calculation
	jp	pe,   fail     ; was performed correctly in
	jp	p,    fail     ; the F flag.

	cp	#0HAD          ; check a is correctly rotated
	jp	nz,	fail
	
   ld a, (hl)        ; check (hl) is correctly rotated
   cp #0HBC
	jp	nz,	fail

   ld a, #0H00       ; set zero bit
   add   a,a

   ld a, #0H81       ; create a carry before
   add   a,a
   
	ld	hl,#hl_point
	ld	(hl),#0H40
	ld	a,#0H03
	rrd

	jp	nz,   fail     ; Check all the flags to
	jp	nc,   fail     ; make sure that the calculation
	jp	po,   fail     ; was performed correctly in
	jp	m,    fail     ; the F flag.

	cp	#0H00          ; check a is correctly rotated
	jp	nz,	fail
	
   ld a, (hl)        ; check (hl) is correctly rotated
   cp #0H34
	jp	nz,	fail
   
   ret
