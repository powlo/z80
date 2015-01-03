--File Z80 Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the entity declaration for the Z80 module according to the 
--Zilog Z80 Users manual.
--Nomenclature _n denotes an active low signal
--Note that CLK has note been denoted _n because it has activity on both rising
--and Falling edges.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity Z80 is
port (
	CLK		: IN    std_logic;
	RESET_n	: IN    std_logic;
	ADDRESS	: OUT   std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	DATA		: INOUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	M1_n		: OUT   std_logic;
	MREQ_n	: OUT   std_logic;
	IOREQ_n	: OUT   std_logic;
	RD_n		: OUT   std_logic;
	WR_n		: OUT   std_logic;
	RFSH_n	: OUT   std_logic;
	HALT_n	: OUT   std_logic;
	WAIT_n	: IN    std_logic;
	INT_n		: IN    std_logic;
	NMI_n		: IN    std_logic;
	BUSREQ_n	: IN    std_logic;
	BUSACK_n	: OUT   std_logic
);
end entity Z80;