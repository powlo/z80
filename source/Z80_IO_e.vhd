--This is a simple interface for IO accesses to the Z80
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
	
entity Z80_IO is

port (

	RESET_n	: IN 		std_logic;
	IOReq_n	: IN 		std_logic;
	Rd_n	   : IN 		std_logic;
	Wr_n	   : IN 		std_logic;
	Wait_n   : OUT		std_logic;
	Address	: IN 		std_logic_vector(7 downto 0);
	Data		: INOUT 	std_logic_vector (7 downto 0)
	);

end entity Z80_IO;



