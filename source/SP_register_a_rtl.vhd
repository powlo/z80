--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the stack pointer register.
--Note that when we do a Push we decrement
--the pointer, and when we do a Pop we Increment.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

architecture rtl of SP_register is

signal RegValue : std_logic_vector (15 downto 0);

begin

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if READ(1) = '1' then
			RegValue(15 downto 8) <= DATAIN;
		elsif READ(0) = '1' then
			RegValue(7 downto 0) <= DATAIN;
		elsif INC = '1' then
			RegValue <= RegValue + 1;
		elsif DEC = '1' then
			RegValue <= RegValue - 1;
		end if;
	end if;
end process;

process (WRITE,RegValue)
begin
		if WRITE(1) = '1' then
			DATAOUT <= RegValue(15 downto 8);
		elsif WRITE(0) = '1' then
			DATAOUT <= RegValue(7 downto 0);			
		else DATAOUT <= (others => '0');
		end if;
end process;

SP <= RegValue;

end architecture rtl;