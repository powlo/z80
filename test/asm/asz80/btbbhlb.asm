; *******************************
; BIT b ,(hl)
; *******************************

btbbhlb:

	ld	hl,#hl_point
   
	ld	(hl),#0H01
	bit	0,(hl)
	jp	z,		fail
	ld	(hl),#0HFE
	bit	0,(hl)
	jp	nz,	fail

	ld	(hl),#0H02
	bit	1,(hl)
	jp	z,		fail
	ld	(hl),#0HFD
	bit	1,(hl)
	jp	nz,	fail

	ld	(hl),#0H04
	bit	2,(hl)
	jp	z,		fail
	ld	(hl),#0HFB
	bit	2,(hl)
	jp	nz,	fail

	ld	(hl),#0H08
	bit	3,(hl)
	jp	z,		fail
	ld	(hl),#0HF7
	bit	3,(hl)
	jp	nz,	fail

	ld	(hl),#0H10
	bit	4,(hl)
	jp	z,		fail
	ld	(hl),#0HEF
	bit	4,(hl)
	jp	nz,	fail

	ld	(hl),#0H20
	bit	5,(hl)
	jp	z,		fail
	ld	(hl),#0HDF
	bit	5,(hl)
	jp	nz,	fail

	ld	(hl),#0H40
	bit	6,(hl)
	jp	z,		fail
	ld	(hl),#0HBF
	bit	6,(hl)
	jp	nz,	fail

	ld	(hl),#0H80
	bit	7,(hl)
	jp	z,		fail
	ld	(hl),#0H7F
	bit	7,(hl)
	jp	nz,	fail

   ret