--File Entity Declaration For Address Control
--Date: 14 Apr 2006
--Copyright P. Backhouse

--This is the mux controlling the
--the address bus.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity AddressControl is
port (

	CONTROL				: IN	T_ADDRESS;
	BC_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	DE_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	HL_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	PC_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	SP_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	IX_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	IY_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	TT_REG				: IN 	std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	IPAGE_REG			: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	REFRESH_REG			: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	ADDRESS				: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
	REFRESH_ADDRESS	: OUT std_logic_vector (K_ADDRESS_WIDTH-1 downto 0)
);

end entity AddressControl;