; *******************************
; BIT b,(iy+d)
; *******************************

btbbiydb:

	ld	iy,#iy_point
   
	ld	3(iy),#0H01
	bit	0,3(iy)
	jp	z,		fail
	ld	3(iy),#0HFE
	bit	0,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H02
	bit	1,3(iy)
	jp	z,		fail
	ld	3(iy),#0HFD
	bit	1,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H04
	bit	2,3(iy)
	jp	z,		fail
	ld	3(iy),#0HFB
	bit	2,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H08
	bit	3,3(iy)
	jp	z,		fail
	ld	3(iy),#0HF7
	bit	3,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H10
	bit	4,3(iy)
	jp	z,		fail
	ld	3(iy),#0HEF
	bit	4,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H20
	bit	5,3(iy)
	jp	z,		fail
	ld	3(iy),#0HDF
	bit	5,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H40
	bit	6,3(iy)
	jp	z,		fail
	ld	3(iy),#0HBF
	bit	6,3(iy)
	jp	nz,	fail

	ld	3(iy),#0H80
	bit	7,3(iy)
	jp	z,		fail
	ld	3(iy),#0H7F
	bit	7,3(iy)
	jp	nz,	fail

   ret