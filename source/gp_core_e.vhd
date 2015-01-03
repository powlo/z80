--File Intermediate Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the general purpose register core.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity gp_core is
port (

	CLK	   	: IN 	std_logic;
	RESET_n  	: IN 	std_logic;

	DATAIN   	: IN 	std_logic_vector (7 downto 0);
	DATAOUT  	: OUT std_logic_vector (7 downto 0);
	READ	   	: IN  T_REGISTER_SELECT;		
	WRITE	   	: IN  T_REGISTER_SELECT;		
   ESCAPE_CODE	: IN 	T_ESCAPE;
	ALU       	: IN 	T_ALU_INSTRUCTION;
	BC_NZ      	: OUT std_logic;
	BC	   		: OUT std_logic_vector (15 downto 0);
	DE	   		: OUT std_logic_vector (15 downto 0);
	HL	   		: OUT std_logic_vector (15 downto 0)
);

end entity gp_core;