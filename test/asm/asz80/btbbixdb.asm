; *******************************
; BIT b, (ix+d)
; *******************************

btbbixdb:

	ld	ix,#ix_point
   
	ld	8(ix),#0H01
	bit	0,8(ix)
	jp	z,		fail
	ld	8(ix),#0HFE
	bit	0,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H02
	bit	1,8(ix)
	jp	z,		fail
	ld	8(ix),#0HFD
	bit	1,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H04
	bit	2,8(ix)
	jp	z,		fail
	ld	8(ix),#0HFB
	bit	2,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H08
	bit	3,8(ix)
	jp	z,		fail
	ld	8(ix),#0HF7
	bit	3,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H10
	bit	4,8(ix)
	jp	z,		fail
	ld	8(ix),#0HEF
	bit	4,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H20
	bit	5,8(ix)
	jp	z,		fail
	ld	8(ix),#0HDF
	bit	5,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H40
	bit	6,8(ix)
	jp	z,		fail
	ld	8(ix),#0HBF
	bit	6,8(ix)
	jp	nz,	fail

	ld	8(ix),#0H80
	bit	7,8(ix)
	jp	z,		fail
	ld	8(ix),#0H7F
	bit	7,8(ix)
	jp	nz,	fail

   ret