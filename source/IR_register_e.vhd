--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the ALU of the Z80

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

entity IR_register is

port (

	CLK		: IN std_logic;
	RESET_n	: IN std_logic;
	DATAIN	: IN T_instruction;
	NEXTIR	: IN T_instruction;
	LOAD 		: IN std_logic;
	READ 		: IN std_logic;
	INSTRUCTION : OUT T_instruction
);

end entity IR_register;