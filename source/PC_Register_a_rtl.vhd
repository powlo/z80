--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic register for the Z80

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

architecture rtl of PC_Register is

signal ShadowValue	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal RegValue		: std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);

begin

process (CLK, RESET_n)								--The PC is 16 bits and therefore is loaded in two stages.
begin														--To prevent the PC being corrupted during the loading of
	if RESET_n = '0' then							--the first byte, a shadow PC is used, which is not loaded
		ShadowValue <= (others => '0');				--until the next final byte comes along
	elsif CLK'event and CLK='1' then
		if READ(0) = '1' then
			ShadowValue <= DATAIN;
		end if;
	end if;
end process;

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if READ(1) = '1' then
			RegValue	<= DATAIN & ShadowValue;
		elsif INCREMENT = '1' then
			RegValue <= RegValue + 1;
		end if;
	end if;
end process;

process (WRITE, RegValue)
begin
		if WRITE(1) = '1' then
			DATAOUT <= RegValue(15 downto 8);
		elsif WRITE(0) = '1' then
			DATAOUT <= RegValue(7 downto 0);			
		else DATAOUT <= (others => '0');
		end if;
end process;

PC <= RegValue;

end architecture rtl;