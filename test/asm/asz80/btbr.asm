; *******************************
; BIT b ,r
; *******************************

btbr:

	ld	a,#0H01
	bit	0,a
	jp	z,		fail
	ld	a,#0HFE
	bit	0,a
	jp	nz,	fail

	ld	a,#0H02
	bit	1,a
	jp	z,		fail
	ld	a,#0HFD
	bit	1,a
	jp	nz,	fail

	ld	a,#0H04
	bit	2,a
	jp	z,		fail
	ld	a,#0HFB
	bit	2,a
	jp	nz,	fail

	ld	a,#0H08
	bit	3,a
	jp	z,		fail
	ld	a,#0HF7
	bit	3,a
	jp	nz,	fail

	ld	a,#0H10
	bit	4,a
	jp	z,		fail
	ld	a,#0HEF
	bit	4,a
	jp	nz,	fail

	ld	a,#0H20
	bit	5,a
	jp	z,		fail
	ld	a,#0HDF
	bit	5,a
	jp	nz,	fail

	ld	a,#0H40
	bit	6,a
	jp	z,		fail
	ld	a,#0HBF
	bit	6,a
	jp	nz,	fail

	ld	a,#0H80
	bit	7,a
	jp	z,		fail
	ld	a,#0H7F
	bit	7,a
	jp	nz,	fail

	ld	b,#0H01
	bit	0,b
	jp	z,		fail
	ld	b,#0HFE
	bit	0,b
	jp	nz,	fail

	ld	b,#0H02
	bit	1,b
	jp	z,		fail
	ld	b,#0HFD
	bit	1,b
	jp	nz,	fail

	ld	b,#0H04
	bit	2,b
	jp	z,		fail
	ld	b,#0HFB
	bit	2,b
	jp	nz,	fail

	ld	b,#0H08
	bit	3,b
	jp	z,		fail
	ld	b,#0HF7
	bit	3,b
	jp	nz,	fail

	ld	b,#0H10
	bit	4,b
	jp	z,		fail
	ld	b,#0HEF
	bit	4,b
	jp	nz,	fail

	ld	b,#0H20
	bit	5,b
	jp	z,		fail
	ld	b,#0HDF
	bit	5,b
	jp	nz,	fail

	ld	b,#0H40
	bit	6,b
	jp	z,		fail
	ld	b,#0HBF
	bit	6,b
	jp	nz,	fail

	ld	b,#0H80
	bit	7,b
	jp	z,		fail
	ld	b,#0H7F
	bit	7,b
	jp	nz,	fail

	ld	c,#0H01
	bit	0,c
	jp	z,		fail
	ld	c,#0HFE
	bit	0,c
	jp	nz,	fail

	ld	c,#0H02
	bit	1,c
	jp	z,		fail
	ld	c,#0HFD
	bit	1,c
	jp	nz,	fail

	ld	c,#0H04
	bit	2,c
	jp	z,		fail
	ld	c,#0HFB
	bit	2,c
	jp	nz,	fail

	ld	c,#0H08
	bit	3,c
	jp	z,		fail
	ld	c,#0HF7
	bit	3,c
	jp	nz,	fail

	ld	c,#0H10
	bit	4,c
	jp	z,		fail
	ld	c,#0HEF
	bit	4,c
	jp	nz,	fail

	ld	c,#0H20
	bit	5,c
	jp	z,		fail
	ld	c,#0HDF
	bit	5,c
	jp	nz,	fail

	ld	c,#0H40
	bit	6,c
	jp	z,		fail
	ld	c,#0HBF
	bit	6,c
	jp	nz,	fail

	ld	c,#0H80
	bit	7,c
	jp	z,		fail
	ld	c,#0H7F
	bit	7,c
	jp	nz,	fail

	ld	d,#0H01
	bit	0,d
	jp	z,		fail
	ld	d,#0HFE
	bit	0,d
	jp	nz,	fail

	ld	d,#0H02
	bit	1,d
	jp	z,		fail
	ld	d,#0HFD
	bit	1,d
	jp	nz,	fail

	ld	d,#0H04
	bit	2,d
	jp	z,		fail
	ld	d,#0HFB
	bit	2,d
	jp	nz,	fail

	ld	d,#0H08
	bit	3,d
	jp	z,		fail
	ld	d,#0HF7
	bit	3,d
	jp	nz,	fail

	ld	d,#0H10
	bit	4,d
	jp	z,		fail
	ld	d,#0HEF
	bit	4,d
	jp	nz,	fail

	ld	d,#0H20
	bit	5,d
	jp	z,		fail
	ld	d,#0HDF
	bit	5,d
	jp	nz,	fail

	ld	d,#0H40
	bit	6,d
	jp	z,		fail
	ld	d,#0HBF
	bit	6,d
	jp	nz,	fail

	ld	d,#0H80
	bit	7,d
	jp	z,		fail
	ld	d,#0H7F
	bit	7,d
	jp	nz,	fail

	ld	e,#0H01
	bit	0,e
	jp	z,		fail
	ld	e,#0HFE
	bit	0,e
	jp	nz,	fail

	ld	e,#0H02
	bit	1,e
	jp	z,		fail
	ld	e,#0HFD
	bit	1,e
	jp	nz,	fail

	ld	e,#0H04
	bit	2,e
	jp	z,		fail
	ld	e,#0HFB
	bit	2,e
	jp	nz,	fail

	ld	e,#0H08
	bit	3,e
	jp	z,		fail
	ld	e,#0HF7
	bit	3,e
	jp	nz,	fail

	ld	e,#0H10
	bit	4,e
	jp	z,		fail
	ld	e,#0HEF
	bit	4,e
	jp	nz,	fail

	ld	e,#0H20
	bit	5,e
	jp	z,		fail
	ld	e,#0HDF
	bit	5,e
	jp	nz,	fail

	ld	e,#0H40
	bit	6,e
	jp	z,		fail
	ld	e,#0HBF
	bit	6,e
	jp	nz,	fail

	ld	e,#0H80
	bit	7,e
	jp	z,		fail
	ld	e,#0H7F
	bit	7,e
	jp	nz,	fail

	ld	h,#0H01
	bit	0,h
	jp	z,		fail
	ld	h,#0HFE
	bit	0,h
	jp	nz,	fail

	ld	h,#0H02
	bit	1,h
	jp	z,		fail
	ld	h,#0HFD
	bit	1,h
	jp	nz,	fail

	ld	h,#0H04
	bit	2,h
	jp	z,		fail
	ld	h,#0HFB
	bit	2,h
	jp	nz,	fail

	ld	h,#0H08
	bit	3,h
	jp	z,		fail
	ld	h,#0HF7
	bit	3,h
	jp	nz,	fail

	ld	h,#0H10
	bit	4,h
	jp	z,		fail
	ld	h,#0HEF
	bit	4,h
	jp	nz,	fail

	ld	h,#0H20
	bit	5,h
	jp	z,		fail
	ld	h,#0HDF
	bit	5,h
	jp	nz,	fail

	ld	h,#0H40
	bit	6,h
	jp	z,		fail
	ld	h,#0HBF
	bit	6,h
	jp	nz,	fail

	ld	h,#0H80
	bit	7,h
	jp	z,		fail
	ld	h,#0H7F
	bit	7,h
	jp	nz,	fail

	ld	l,#0H01
	bit	0,l
	jp	z,		fail
	ld	l,#0HFE
	bit	0,l
	jp	nz,	fail

	ld	l,#0H02
	bit	1,l
	jp	z,		fail
	ld	l,#0HFD
	bit	1,l
	jp	nz,	fail

	ld	l,#0H04
	bit	2,l
	jp	z,		fail
	ld	l,#0HFB
	bit	2,l
	jp	nz,	fail

	ld	l,#0H08
	bit	3,l
	jp	z,		fail
	ld	l,#0HF7
	bit	3,l
	jp	nz,	fail

	ld	l,#0H10
	bit	4,l
	jp	z,		fail
	ld	l,#0HEF
	bit	4,l
	jp	nz,	fail

	ld	l,#0H20
	bit	5,l
	jp	z,		fail
	ld	l,#0HDF
	bit	5,l
	jp	nz,	fail

	ld	l,#0H40
	bit	6,l
	jp	z,		fail
	ld	l,#0HBF
	bit	6,l
	jp	nz,	fail

	ld	l,#0H80
	bit	7,l
	jp	z,		fail
	ld	l,#0H7F
	bit	7,l
	jp	nz,	fail

   ret