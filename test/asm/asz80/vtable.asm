;-----------------------------------
;--Vector Table for int nmi etc   --
;-----------------------------------
   .module vtable
   .title vtable
	.area	VTABLE (ABS)

vtable:
	.org	#0H0000	
	jp		main_code

	.org	#0H0008	
	jp		vhndle08

	.org	#0H0010	
	jp		vhndle10

	.org	#0H0018	
	jp		vhndle18

	.org	#0H0020	
	jp		vhndle20

	.org	#0H0028	
	jp		vhndle28

	.org	#0H0030	
	jp		vhndle30

	.org	#0H0038	
	jp		vhndle38

	.org	#0H0066	
	jp		vhndle66
