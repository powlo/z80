--File Intermediate Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--The intermeiate block now contains a core of registers and ALU,
--and a control block.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity intermediate is
port (

	CLK		: IN std_logic;
	RESET_n	: IN std_logic;

	DATAIN	: IN std_logic_vector (7 downto 0);
	DATAOUT	: OUT std_logic_vector (7 downto 0);
	DATA_WR	: OUT std_logic;
	DATA_RD	: OUT std_logic;
	ADDRESS	: OUT std_logic_vector (15 downto 0)
);

end entity intermediate;