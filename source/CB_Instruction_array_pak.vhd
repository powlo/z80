--File Instruction Array package for the Z80
--Date: 8 Mar 2006
--Copyright P. Backhouse 2006

--This package details what operations are performed during
--the clock cycle for that instruction
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

	package CB_Instruction_array_pak is
	
--Registers are accessed according to the following sequence.
--X = EXternal Bus
--I = Instruction
--T = Temp Register
--IXABCDEHLT

--the array has to be indexed by an abstract type because the compiler (Xilinx ISE)
--does not seem to like slv (ie the instruction itself, colN 2) as index.
constant K_CB_Instruction_Array : T_Instruction_Array := (
--		  IR (Bytecode), 	Next IR,		Read/Dest	Write/Src	ALU Inst		Name

--*********************************--
--                                 --
--        ROTATE INSTRUCTIONS      --
--                                 --
--*********************************--
--IR (Bytecode), 	Next IR,	Read/Dest	Write/Src	ALU Inst		Exch	AddrSrc	Mem Acc Type	Name
RLC_B       => ( RLC_B_INT,   FETCH,	T, B,  RLC,     NONE, PC, FETCH,  "RLC B         "),
RLC_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "RLC B(int)    "),
RLC_C       => ( RLC_C_INT,   FETCH,	T, C,  RLC,     NONE, PC, FETCH,  "RLC C         "),
RLC_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "RLC C(int)    "),
RLC_D       => ( RLC_D_INT,   FETCH,	T, D,  RLC,     NONE, PC, FETCH,  "RLC D         "),
RLC_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "RLC D(int)    "),
RLC_E       => ( RLC_E_INT,   FETCH,	T, E,  RLC,     NONE, PC, FETCH,  "RLC E         "),
RLC_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "RLC E(int)    "),
RLC_H       => ( RLC_H_INT,   FETCH,	T, H,  RLC,     NONE, PC, FETCH,  "RLC H         "),
RLC_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "RLC H(int)    "),
RLC_L       => ( RLC_L_INT,   FETCH,	T, L,  RLC,     NONE, PC, FETCH,  "RLC L         "),
RLC_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "RLC L(int)    "),
RLC_bHLb			   => ( RLC_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "RLC (HL)      "),
RLC_bHLb_INT 	=> ( RLC_bHLb_INT2,	FETCH,	T, 		   T, 		   RLC,		 NONE,	HL, NONE, 	 "RLC (HL)(int) "),
RLC_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "RLC (HL)(int) "),

RLC_A       => ( RLC_A_INT,   FETCH,	T, A,  RLC,     NONE, PC, FETCH,  "RLC A         "),
RLC_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "RLC A(int)    "),

RL_B        => ( RL_B_INT,    FETCH,	T, B,  RL,      NONE, PC, FETCH,  "RL B          "),
RL_B_INT    => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "RL B(int)     "),
RL_C        => ( RL_C_INT,    FETCH,	T, C,  RL,      NONE, PC, FETCH,  "RL C          "),
RL_C_INT    => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "RL C(int)     "),
RL_D        => ( RL_D_INT,    FETCH,	T, D,  RL,      NONE, PC, FETCH,  "RL D          "),
RL_D_INT    => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "RL D(int)     "),
RL_E        => ( RL_E_INT,    FETCH,	T, E,  RL,      NONE, PC, FETCH,  "RL E          "),
RL_E_INT    => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "RL E(int)     "),
RL_H        => ( RL_H_INT,    FETCH,	T, H,  RL,      NONE, PC, FETCH,  "RL H          "),
RL_H_INT    => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "RL H(int)     "),
RL_L        => ( RL_L_INT,    FETCH,	T, L,  RL,      NONE, PC, FETCH,  "RL L          "),
RL_L_INT    => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "RL L(int)     "),
RL_bHLb			   => ( RL_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "RL (HL)       "),
RL_bHLb_INT 	=> ( RL_bHLb_INT2,	FETCH,	T, 		   T, 		   RL,		  NONE,	HL, NONE, 	 "RL (HL)(int)  "),
RL_bHLb_INT2	=> ( FETCH,				    FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "RL (HL)(int)  "),
RL_A         => ( RL_A_INT,     FETCH,	T,      A,      RL,    NONE, PC, FETCH,  "RL A          "),
RL_A_INT     => ( FETCH,        FETCH,	A,      T,      NULLL, NONE, PC, FETCH,  "RL A(int)     "),

RRC_B       => ( RRC_B_INT,   FETCH,	T, B,  RRC,     NONE, PC, FETCH,  "RRC B         "),
RRC_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "RRC B(int)    "),
RRC_C       => ( RRC_C_INT,   FETCH,	T, C,  RRC,     NONE, PC, FETCH,  "RRC C         "),
RRC_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "RRC C(int)    "),
RRC_D       => ( RRC_D_INT,   FETCH,	T, D,  RRC,     NONE, PC, FETCH,  "RRC D         "),
RRC_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "RRC D(int)    "),
RRC_E       => ( RRC_E_INT,   FETCH,	T, E,  RRC,     NONE, PC, FETCH,  "RRC E         "),
RRC_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "RRC E(int)    "),
RRC_H       => ( RRC_H_INT,   FETCH,	T, H,  RRC,     NONE, PC, FETCH,  "RRC H         "),
RRC_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "RRC H(int)    "),
RRC_L       => ( RRC_L_INT,   FETCH,	T, L,  RRC,     NONE, PC, FETCH,  "RRC L         "),
RRC_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "RRC L(int)    "),
RRC_bHLb			   => ( RRC_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "RRC (HL)      "),
RRC_bHLb_INT 	=> ( RRC_bHLb_INT2,	FETCH,	T, 		   T, 		   RRC,		 NONE,	HL, NONE, 	 "RRC (HL)(int) "),
RRC_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "RRC (HL)(int) "),
RRC_A       => ( RRC_A_INT,   FETCH,	T, A,  RRC,     NONE, PC, FETCH,  "RRC A         "),
RRC_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "RRC A(int)    "),

RR_B        => ( RR_B_INT,    FETCH,	T, B,  RR,      NONE, PC, FETCH,  "RR B          "),
RR_B_INT    => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "RR B(int)     "),
RR_C        => ( RR_C_INT,    FETCH,	T, C,  RR,      NONE, PC, FETCH,  "RR C          "),
RR_C_INT    => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "RR C(int)     "),
RR_D        => ( RR_D_INT,    FETCH,	T, D,  RR,      NONE, PC, FETCH,  "RR D          "),
RR_D_INT    => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "RR D(int)     "),
RR_E        => ( RR_E_INT,    FETCH,	T, E,  RR,      NONE, PC, FETCH,  "RR E          "),
RR_E_INT    => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "RR E(int)     "),
RR_H        => ( RR_H_INT,    FETCH,	T, H,  RR,      NONE, PC, FETCH,  "RR H          "),
RR_H_INT    => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "RR H(int)     "),
RR_L        => ( RR_L_INT,    FETCH,	T, L,  RR,      NONE, PC, FETCH,  "RR L          "),
RR_L_INT    => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "RR L(int)     "),
RR_bHLb			   => ( RR_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "RR (HL)       "),
RR_bHLb_INT 	=> ( RR_bHLb_INT2,	FETCH,	T, 		   T, 		   RR,		  NONE,	HL, NONE, 	 "RR (HL)(int)  "),
RR_bHLb_INT2	=> ( FETCH,				    FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "RR (HL)(int)  "),
RR_A         => ( RR_A_INT,     FETCH,	T,      A,      RR,    NONE, PC, FETCH,  "RR A          "),
RR_A_INT     => ( FETCH,        FETCH,	A,      T,      NULLL, NONE, PC, FETCH,  "RR A(int)     "),

SLA_B       => ( SLA_B_INT,   FETCH,	T, B,  SLAA,    NONE, PC, FETCH,  "SLA B         "),
SLA_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "SLA B(int)    "),
SLA_C       => ( SLA_C_INT,   FETCH,	T, C,  SLAA,    NONE, PC, FETCH,  "SLA C         "),
SLA_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "SLA C(int)    "),
SLA_D       => ( SLA_D_INT,   FETCH,	T, D,  SLAA,    NONE, PC, FETCH,  "SLA D         "),
SLA_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "SLA D(int)    "),
SLA_E       => ( SLA_E_INT,   FETCH,	T, E,  SLAA,    NONE, PC, FETCH,  "SLA E         "),
SLA_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "SLA E(int)    "),
SLA_H       => ( SLA_H_INT,   FETCH,	T, H,  SLAA,    NONE, PC, FETCH,  "SLA H         "),
SLA_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "SLA H(int)    "),
SLA_L       => ( SLA_L_INT,   FETCH,	T, L,  SLAA,    NONE, PC, FETCH,  "SLA L         "),
SLA_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "SLA L(int)    "),
SLA_bHLb			   => ( SLA_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "SLA (HL)      "),
SLA_bHLb_INT 	=> ( SLA_bHLb_INT2,	FETCH,	T, 		   T, 		   SLAA,		 NONE,	HL, NONE, 	 "SLA (HL)(int) "),
SLA_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "SLA (HL)(int) "),
SLA_A       => ( SLA_A_INT,   FETCH,	T, A,  SLAA,    NONE, PC, FETCH,  "SLA A         "),
SLA_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "SLA A(int)    "),

SRA_B       => ( SRA_B_INT,   FETCH,	T, B,  SRAA,    NONE, PC, FETCH,  "SRA B         "),
SRA_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "SRA B(int)    "),
SRA_C       => ( SRA_C_INT,   FETCH,	T, C,  SRAA,    NONE, PC, FETCH,  "SRA C         "),
SRA_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "SRA C(int)    "),
SRA_D       => ( SRA_D_INT,   FETCH,	T, D,  SRAA,    NONE, PC, FETCH,  "SRA D         "),
SRA_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "SRA D(int)    "),
SRA_E       => ( SRA_E_INT,   FETCH,	T, E,  SRAA,    NONE, PC, FETCH,  "SRA E         "),
SRA_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "SRA E(int)    "),
SRA_H       => ( SRA_H_INT,   FETCH,	T, H,  SRAA,    NONE, PC, FETCH,  "SRA H         "),
SRA_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "SRA H(int)    "),
SRA_L       => ( SRA_L_INT,   FETCH,	T, L,  SRAA,    NONE, PC, FETCH,  "SRA L         "),
SRA_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "SRA L(int)    "),
SRA_bHLb			   => ( SRA_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "SRA (HL)      "),
SRA_bHLb_INT 	=> ( SRA_bHLb_INT2,	FETCH,	T, 		   T, 		   SRAA,		 NONE,	HL, NONE, 	 "SRA (HL)(int) "),
SRA_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "SRA (HL)(int) "),
SRA_A       => ( SRA_A_INT,   FETCH,	T, A,  SRAA,    NONE, PC, FETCH,  "SRA A         "),
SRA_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "SRA A(int)    "),

SLL_B       => ( SLL_B_INT,   FETCH,	T, B,  SLAA,    NONE, PC, FETCH,  "SLL B         "),
SLL_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "SLL B(int)    "),
SLL_C       => ( SLL_C_INT,   FETCH,	T, C,  SLAA,    NONE, PC, FETCH,  "SLL C         "),
SLL_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "SLL C(int)    "),
SLL_D       => ( SLL_D_INT,   FETCH,	T, D,  SLAA,    NONE, PC, FETCH,  "SLL D         "),
SLL_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "SLL D(int)    "),
SLL_E       => ( SLL_E_INT,   FETCH,	T, E,  SLAA,    NONE, PC, FETCH,  "SLL E         "),
SLL_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "SLL E(int)    "),
SLL_H       => ( SLL_H_INT,   FETCH,	T, H,  SLAA,    NONE, PC, FETCH,  "SLL H         "),
SLL_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "SLL H(int)    "),
SLL_L       => ( SLL_L_INT,   FETCH,	T, L,  SLAA,    NONE, PC, FETCH,  "SLL L         "),
SLL_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "SLL L(int)    "),
SLL_bHLb			   => ( SLL_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "SLL (HL)      "),
SLL_bHLb_INT 	=> ( SLL_bHLb_INT2,	FETCH,	T, 		   T, 		   SLAA,		 NONE,	HL, NONE, 	 "SLL (HL)(int) "),
SLL_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "SLL (HL)(int) "),
SLL_A       => ( SLL_A_INT,   FETCH,	T, A,  SLAA,    NONE, PC, FETCH,  "SLL A         "),
SLL_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "SLL A(int)    "),

SRL_B       => ( SRL_B_INT,   FETCH,	T, B,  SRLL,    NONE, PC, FETCH,  "SRL B         "),
SRL_B_INT   => ( FETCH,       FETCH,	B, T,  NULLL,   NONE, PC, FETCH,  "SRL B(int)    "),
SRL_C       => ( SRL_C_INT,   FETCH,	T, C,  SRLL,    NONE, PC, FETCH,  "SRL C         "),
SRL_C_INT   => ( FETCH,       FETCH,	C, T,  NULLL,   NONE, PC, FETCH,  "SRL C(int)    "),
SRL_D       => ( SRL_D_INT,   FETCH,	T, D,  SRLL,    NONE, PC, FETCH,  "SRL D         "),
SRL_D_INT   => ( FETCH,       FETCH,	D, T,  NULLL,   NONE, PC, FETCH,  "SRL D(int)    "),
SRL_E       => ( SRL_E_INT,   FETCH,	T, E,  SRLL,    NONE, PC, FETCH,  "SRL E         "),
SRL_E_INT   => ( FETCH,       FETCH,	E, T,  NULLL,   NONE, PC, FETCH,  "SRL E(int)    "),
SRL_H       => ( SRL_H_INT,   FETCH,	T, H,  SRLL,    NONE, PC, FETCH,  "SRL H         "),
SRL_H_INT   => ( FETCH,       FETCH,	H, T,  NULLL,   NONE, PC, FETCH,  "SRL H(int)    "),
SRL_L       => ( SRL_L_INT,   FETCH,	T, L,  SRLL,    NONE, PC, FETCH,  "SRL L         "),
SRL_L_INT   => ( FETCH,       FETCH,	L, T,  NULLL,   NONE, PC, FETCH,  "SRL L(int)    "),
SRL_bHLb			   => ( SRL_bHLb_INT,	 FETCH,	T, 		   EXTERN,	NULLL,	NONE, HL, MEM_RD, "SRL (HL)      "),
SRL_bHLb_INT 	=> ( SRL_bHLb_INT2,	FETCH,	T, 		   T, 		   SRLL,		 NONE,	HL, NONE, 	 "SRL (HL)(int) "),
SRL_bHLb_INT2	=> ( FETCH,				     FETCH,	EXTERN,	T, 		   NULLL, NONE,	HL, MEM_WR, "SRL (HL)(int) "),
SRL_A       => ( SRL_A_INT,   FETCH,	T, A,  SRLL,    NONE, PC, FETCH,  "SRL A         "),
SRL_A_INT   => ( FETCH,       FETCH,	A, T,  NULLL,   NONE, PC, FETCH,  "SRL A(int)    ")

);

	end package CB_Instruction_array_pak;