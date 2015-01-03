--File architecture for ALU
--data preparation entity

--Date: 26 Apr 2006
--Copyright P. Backhouse 2006

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity Data_Preparation is

port (
	A			: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	C			: IN 	std_logic;
	HC			: IN 	std_logic;
	DATAIN	: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	COMMAND	: IN  T_ALU_INSTRUCTION;
	DATAOUT	: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
);

end entity Data_Preparation;