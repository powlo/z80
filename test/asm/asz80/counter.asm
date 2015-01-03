; *******************************
; Z80 Assembler Test Cases
; to verify vhdl model
; *******************************
; Test purpose:
; This code is written to drive the counter
; enabling it to generate interrupts.

	.module counter 

Counter1_Adr_base        = 0H00
Counter2_Adr_base        = 0H10
Counter3_Adr_base        = 0H20

Counter1_Adr_Load       = Counter1_Adr_base + 0H00	
Counter1_Adr_Value      = Counter1_Adr_base + 0H01	
Counter1_Adr_command    = Counter1_Adr_base + 0H02
Counter1_Adr_int_resp   = Counter1_Adr_base + 0H03
Counter1_Adr_interrupt  = Counter1_Adr_base + 0H04
Counter1_Adr_nmi        = Counter1_Adr_base + 0H05

Counter2_Adr_Load       = Counter2_Adr_base + 0H00	
Counter2_Adr_Value      = Counter2_Adr_base + 0H01	
Counter2_Adr_command    = Counter2_Adr_base + 0H02
Counter2_Adr_int_resp   = Counter2_Adr_base + 0H03
Counter2_Adr_interrupt  = Counter2_Adr_base + 0H04
Counter2_Adr_nmi        = Counter2_Adr_base + 0H05

Counter3_Adr_Load       = Counter3_Adr_base + 0H00	
Counter3_Adr_Value      = Counter3_Adr_base + 0H01	
Counter3_Adr_command    = Counter3_Adr_base + 0H02
Counter3_Adr_int_res    = Counter3_Adr_base + 0H03
Counter3_Adr_interrupt  = Counter3_Adr_base + 0H04
Counter3_Adr_nmi        = Counter3_Adr_base + 0H05

Counter1_Command_load_value = 0H80
Counter2_Command_load_value = 0H20
Counter3_Command_load_value = 0HFF

; These values are used as bit set/reset and refer
; to the bit positions in a register.

Counter_Command_load       = 0
Counter_Command_Nmi        = 1

; The various values that can be given for int status
; and also nmi status.
Counter_int_none           = 0H00
Counter_int_requesting     = 0H01
Counter_int_processing     = 0H02
Counter_int_ed_found       = 0H03
Counter_int_waiting        = 0H04

; Z80 fixed address for interrupt vectoring
Mode1_Vector_base          = 0H0038
NMI_Vector_base            = 0H0066
	
	.area	CODE (ABS)
	.org	#0H0000	
	jp		main
	
	.org	Mode1_Vector_base
   jp    Mode1_Vector_Handle

   .org  NMI_Vector_base
   jp    NMI_Vector_Handle
   
Mode1_Vector_Handle:
   push  af                                  ; An /INT interrupts regular
   push  bc                                  ; code. We push registers so 
   push  de                                  ; we can perfrom operations
   push  hl                                  ; and then restore state at end.

	in		a,(#Counter1_Adr_interrupt)			; find which counter has int active
   cp    #Counter_int_processing             ; processing flag is used because
	jp		z,Counter1_Interrupt_handle                ; this means the int has been
                                             ; alocated
	in		a,(#Counter2_Adr_interrupt)			
   cp    #Counter_int_processing
	jp		z,Counter2_Interrupt_handle

	in		a,(#Counter3_Adr_interrupt)			
   cp    #Counter_int_processing
	jp		z,Counter3_Interrupt_handle
	
   jp    end_interrupt_service               ; catch all if none respond

NMI_Vector_Handle:
   push  af                                  ; An /NMI interrupts regular
   push  bc                                  ; code. We push registers so 
   push  de                                  ; we can perfrom operations
   push  hl                                  ; and then restore state at end.

	in		a,(#Counter1_Adr_nmi)			      ; find which counter has nmi active
   cp    #Counter_int_processing             ; processing flag is used because
	jp		z,Counter1_Interrupt_handle                ; this means the nmi has been
                                             ; alocated
	in		a,(#Counter2_Adr_nmi)			
   cp    #Counter_int_processing
	jp		z,Counter2_Interrupt_handle

	in		a,(#Counter3_Adr_nmi)			
   cp    #Counter_int_processing
	jp		z,Counter3_Interrupt_handle
	
   jp    end_nmi_service                     ; catch all if none respond
   
Counter1_Interrupt_handle:   
	ld		a, #Counter1_Command_load_value  ; Enter a new counter value
	out	(#Counter1_Adr_Load),a

	in    a,(#Counter1_Adr_command)
	set   Counter_Command_load,a             ; Enable the new value
	out	(#Counter1_Adr_command),a

	in    a,(#Counter1_Adr_command)
	res   Counter_Command_load,a             ; Set the counter off again
	out	(#Counter1_Adr_command),a

	in    a,(#Counter1_Adr_command)
	bit   Counter_Command_Nmi,a           ; Test the nmi bit of command reg

   jp    nz,end_nmi_service
   jp    end_interrupt_service
    
Counter2_Interrupt_handle:   
	ld		a, #Counter2_Command_load_value  ; Enter a new counter value
	out	(#Counter2_Adr_Load),a

	in    a,(#Counter2_Adr_command)
	set   Counter_Command_load,a             ; Enable the new value
	out	(#Counter2_Adr_command),a

	in    a,(#Counter2_Adr_command)
	res   Counter_Command_load,a             ; Set the counter off again
	out	(#Counter2_Adr_command),a

	in    a,(#Counter2_Adr_command)
	bit   Counter_Command_Nmi,a           ; Test the nmi bit of command reg

   jp    nz,end_nmi_service
   jp    end_interrupt_service

 Counter3_Interrupt_handle:   
	ld		a, #Counter3_Command_load_value  ; Enter a new counter value
	out	(#Counter3_Adr_Load),a

	in    a,(#Counter3_Adr_command)
	set   Counter_Command_load,a           ; Enable the new value
	out	(#Counter3_Adr_command),a

	in    a,(#Counter3_Adr_command)
	res   Counter_Command_load,a           ; Set the counter off again
	out	(#Counter3_Adr_command),a

	in    a,(#Counter3_Adr_command)
	bit   Counter_Command_Nmi,a           ; Test the nmi bit of command reg

   jp    nz,end_nmi_service
   jp    end_interrupt_service
   
end_interrupt_service:
   pop  hl                                ; restore registers to how they were
   pop  de
   pop  bc
   pop  af

   ei                                     ; re-enable interrupts.
	reti

end_nmi_service:
   pop  hl                                ; restore registers to how they were
   pop  de
   pop  bc
   pop  af

   ei                                     ; re-enable interrupts, flag end of nmi
	retn  

main:	
;-------------------------------------
;	Set up the counters
;-------------------------------------
	im 	1									; set mode to 1

	ld		a, #Counter1_Command_load_value   ; Enter a new counter value
	out	(#Counter1_Adr_Load),a

	in    a,(#Counter1_Adr_command)
	set   Counter_Command_load,a           ; Enable the new value
	out	(#Counter1_Adr_command),a

	in    a,(#Counter1_Adr_command)
	res   Counter_Command_load,a           ; Set the counter off again
	res   Counter_Command_Nmi,a            ; Set up as Int_n type interrupt
	out	(#Counter1_Adr_command),a

	ld		a, #Counter2_Command_load_value   ; Enter a new counter value
	out	(#Counter2_Adr_Load),a

	in    a,(#Counter2_Adr_command)
	set   Counter_Command_load,a           ; Enable the new value
	out	(#Counter2_Adr_command),a

	in    a,(#Counter2_Adr_command)
	res   Counter_Command_load,a           ; Set the counter off again
	res   Counter_Command_Nmi,a            ; Set up as Int_n type interrupt
	out	(#Counter2_Adr_command),a

	ld		a, #Counter3_Command_load_value   ; Enter a new counter value
	out	(#Counter3_Adr_Load),a

	in    a,(#Counter3_Adr_command)
	set   Counter_Command_load,a           ; Enable the new value
	out	(#Counter3_Adr_command),a

	in    a,(#Counter3_Adr_command)
	res   Counter_Command_load,a           ; Set the counter off again
	set   Counter_Command_Nmi,a            ; Set up as Nmi_n type interrupt
	out	(#Counter3_Adr_command),a

	ld		b,#0H01

; Set up is finished! Off we go!
	ei

loop:
	inc	b									; do nothing! I just want to see the 
	jp		loop								; interrupts working.
	
pass:
	ld	a,#0H55
	ld	(#0H2000),a
	jp		pass
	
fail:
	
	ld	a,#0HAA
	ld	(#0H2000),a	jp		fail

