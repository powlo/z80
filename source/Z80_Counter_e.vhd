--This is the beginnings of the Z80 CTC
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
	
entity Z80_Counter is
port (
	CLK		  : IN   std_logic;
	RESET_n : IN  	std_logic;
	
	CE_n        : IN     std_logic;
	M1_n        : IN 	 	std_logic;
	MREQ_n      : IN 	 	std_logic;
	IOREQ_n     : IN     std_logic;
	Address     : IN     std_logic_vector(15 downto 0);
	Data        : INOUT  std_logic_vector (7 downto 0);
	Rd_n        : IN 	 	std_logic;
	WR_n        : IN     std_logic;
	
	IEI         : IN     std_logic;
	IEO         : OUT    std_logic;
	INT_n       : OUT    std_logic;
	NMI_n       : OUT    std_logic
	);

end entity Z80_Counter;



