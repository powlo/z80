--File architecture for the ALU Core
--Date: 26 Apr 2006
--Copyright P. Backhouse 2006

--The ALU core is the asynchronous part of the 
--ALU performing add subtract etc based on the
--command inserted.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

entity Int_Controller is

port (
	CLK					: IN	std_logic;
	RESET_n				: IN	std_logic;
	INT_n					: IN	std_logic;
	NMI_n					: IN	std_logic;
	ALU_COMMAND			: IN  T_ALU_INSTRUCTION;
	IR						: IN	T_instruction;
	NEXT_IR_PRE			: IN	T_instruction;
	NEXT_IR_POST		: OUT	T_instruction;
	IFF2              : OUT	std_logic
);

end entity Int_Controller;