;--------------------------------------
;--Vector Handlers for int nmi etc   --
;--------------------------------------
   .module vhndle
   .title vhndle
	.area	_CODE

vhndle08:
	ld	a,#0H08
	ret
		
vhndle10:
	ld	a,#0H10
	ret

vhndle18:
	ld	a,#0H18
	ret

vhndle20:
	ld	a,#0H20
	ret

vhndle28:
	ld	a,#0H28
	ret

vhndle30:
	ld	a,#0H30
	ret

vhndle38:
	ld	a,#0H38
	ret

vhndle66:
	ld	a,#0H66
	ret