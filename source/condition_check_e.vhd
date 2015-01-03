--This module checks Instruction against the 
--F register, raising the condition flag if 
--the check is met.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

entity condition_check is

port (

	INSTRUCTION	: IN  T_instruction;
	F				: IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
	F2				: IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
	ESCAPE_CODE : IN  T_ESCAPE;
	RESULT		: out std_logic	
);

end entity condition_check;