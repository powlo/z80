--File synth package for the Z80
--Date: 8 Mar 2006
--Copyright P. Backhouse 2006

--This package contains synthesisable values used in the 
--Z80 design eg, bus sizes, coded values etc.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Z80_synth_pak is
   
   constant K_DATA_WIDTH				: integer := 8;
   constant K_HALF_DATA_WIDTH			: integer := 4;
   constant K_ADDRESS_WIDTH			: integer := 16;
   
   constant K_INSTRUCTION_WIDTH		: integer := 9;
   constant K_NO_OF_REGS				: integer := 23;
   constant K_NO_OF_ALU_REGS			: integer := 3;
   constant K_NO_OF_GP_REGS			: integer := 6;
   constant K_NO_OF_SP_REGS			: integer := 12;
   constant K_ALU_INSTRUCTION_WIDTH	: integer := 5;
   constant K_ADRMUX_WIDTH				: integer := 3;
   constant K_MEM_ACCESS_WIDTH		: integer := 2;
   
   --Enumerated type for Register Read / Write in microcode.
   type	T_REGISTER_SELECT is (
   A,	F,	B,	C,	D,	E,	H,	L,	T, G,
   IX_L,	IX_H,	IY_L,	IY_H,	PC_L,	PC_H,	SP_L,	SP_H,	TT_L,	TT_H,	
   REFRESH, IPAGE, INST, EXTERN,NONE,
   K_H00,K_H01,K_H02,K_H04,K_H08,K_H10,K_H20,K_H40,K_H80,
   K_HFF,K_HFE,K_HFD,K_HFB,K_HF7,K_HEF,K_HDF,K_HBF,K_H7F,
   K_H18,K_H28,K_H30,K_H38,K_H66,K_DAA
   );
   
   --Constants for instructing the ALU. Last letter copied in naming
   --to avoid using reserved words, eg or becomes orr etc.
   
   type T_ALU_INSTRUCTION is (
   NULLL, 
   ADD,	ADDC, SUB, SUBC, INC, INCC, DEC, DECC,
   ANDD, ORR, XORR,	
   RLC, RL, RRC, RR, SLAA, SRAA, SRLL, SLLL,
   INCSP, INCHL, INCDE, INCBC, INCTT, INCPC,
   DECSP, DECHL, DECDE, DECBC, DECTT, DECPC,
   IID, DDD, ID, DD,
   X_AF, X_ALL, X_DE_HL,
   LBLB, HBHB, LBHB, HBLB,
   TST_NZ, TST_Z, TST_NC, TST_C, TST_PO, TST_PE, TST_P, TST_M,TST_EC,
   TST_N,
	EI, DI, IM0,	IM1, IM2, IFF, PV_BC, GOEC, ENDEC );
      
   --constants for address selection
   type T_ADDRESS is (	BC,	DE,	HL,	PC,	
   SP,	IX,	IY,	TT);
   
   --constants for defining the type of memory access performed.
   type T_ACCESS is (NONE,FETCH,MEM_RD,MEM_WR,IO_RD,IO_WR, INT, NMI);
   
	type T_ESCAPE is (NONE,CB,DD,ED,FD,DDCB,FDCB);
	
   --this function returns all bits or'd together, makes code look tidier
   --and should be synthesisable.
   function Or_bits  ( S : in std_logic_vector) return std_logic;
   
   function Xor_bits ( S : in std_logic_vector) return std_logic;

end package Z80_synth_pak;

package body Z80_synth_pak is

   --this function returns all bits or'd together, makes code look tidier
   --and should be synthesisable.
   function Or_bits ( S : in std_logic_vector) return std_logic is

variable ThisSL : std_logic := '0';

begin
   
   for i in S'range loop
      ThisSL := ThisSL or S(i);
	end loop;

   return ThisSL;
   
end function Or_bits;

   --this function returns all bits xor'd together
   function Xor_bits ( S : in std_logic_vector) return std_logic is

variable ThisSL : std_logic := '0';

begin
   
   for i in S'range loop
      ThisSL := ThisSL xor S(i);
	end loop;

   return ThisSL;

end function Xor_bits;
   
end package body Z80_synth_pak;

