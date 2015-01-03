--File Intermediate Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is an intermediate file to test loading and running 
--of the ALU with registers.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity sp_core is
port (

	CLK		: IN 	std_logic;
	RESET_n	: IN 	std_logic;

	DATAIN				: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	DATAOUT				: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ					: IN  T_REGISTER_SELECT;		
	WRITE					: IN  T_REGISTER_SELECT;		
   ESCAPE_CODE	      : IN 	T_ESCAPE;
	ALU   				: IN T_ALU_INSTRUCTION;
	IPAGE_REG			: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	REFRESH_REG			: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	PC						: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	SP						: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	IX						: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	IY						: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	TT						: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0)
);

end entity sp_core;