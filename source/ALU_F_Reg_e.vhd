--File architecture for A Register 
--and associated logic.
--logic
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity ALU_F_Reg is

port (
	CLK		: IN 	std_logic;
	RESET_n	: IN 	std_logic;

	COMMAND	: IN  T_ALU_INSTRUCTION;
	DATAIN	: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	FLAG		: IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ		: IN  T_REGISTER_SELECT;
	WRITE		: IN  T_REGISTER_SELECT;
	SWAP		: IN  std_logic;
	DATAOUT	: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	F_REG		: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
);

end entity ALU_F_Reg;