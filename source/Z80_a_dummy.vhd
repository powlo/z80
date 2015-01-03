library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture dummy of Z80 is

begin

	Address	<= X"0000";
	Data		<= X"00";
	M1_n		<= '1';
	IOREQ_n	<= '1';
	RD_n		<= '1';
	WR_n		<= '1';
	RFSH_n	<= '1';
	HALT_n	<= '1';
	WAIT_n	<= '1';
	BUSACK_n	<= '1';

end architecture dummy;