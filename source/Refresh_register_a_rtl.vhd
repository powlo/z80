--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic register for the Z80

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

architecture rtl of Refresh_register is

signal RegValue : std_logic_vector (7 downto 0);

begin

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		--All ones is test value, so there's a clear difference
		--between PC and refresh...
		RegValue <= (others => '1');
	elsif CLK'event and CLK='1' then
		if Read = '1' then
			RegValue <= DATAIN;
		elsif INC = '1' then
			RegValue <= RegValue(7) & (RegValue(6 downto 0) + 1);
		end if;
	end if;
end process;

process (Write,RegValue)
begin
		if Write = '1' then
			DATAOUT <= RegValue;
		else DATAOUT <= (others => '0');
		end if;
end process;

REGISTER_VALUE <= RegValue;

end architecture rtl;