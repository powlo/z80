--File architecture for the ALU
--Date: 21 Mar 2006
--Copyright P. Backhouse 2006

--This is a 16 bit register, used in the Z80
--PC, SP, IX, IY

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.Z80_synth_pak.ALL;

entity PC_Register is

port (

	CLK			: IN 	std_logic;
	RESET_n		: IN 	std_logic;
	DATAIN		: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	DATAOUT		: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ			: IN 	std_logic_vector (1 downto 0);
	WRITE			: IN 	std_logic_vector (1 downto 0);
	INCREMENT	: IN 	std_logic;
	PC				: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0)
);

end entity PC_Register;