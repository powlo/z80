--This is our testbench RAM for the Z80
--It will take its code contents from the defined file
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
	
entity Z80_ram is
generic (file_name   : string;
         G_DEBUG     : boolean   );
port (

--this all needs to change below...
	RESET_n	: IN 		std_logic;
	Rd_n		: IN 		std_logic;
	WR_n		: IN 		std_logic;
	MReq_n	: IN 		std_logic;
	Address	: IN 		std_logic_vector(15 downto 0);
	Data		: INOUT 	std_logic_vector (7 downto 0)
	);

end entity Z80_ram;



