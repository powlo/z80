--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a 16 bit register for the Z80
--without the swap features, but includes inc
-- and dec capability as well as read and write
--cannot be broken into further atomic parts due to
--increment requirement.

library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

architecture rtl of register_16bit_nonswap_inc_dec is

signal Read_high		: std_logic;
signal Read_low		: std_logic;
signal Write_high		: std_logic;
signal Write_low	 	: std_logic;
signal RegValue 		: std_logic_vector (15 downto 0);

begin

Read_high	<= READ(1);
Read_low		<= READ(0);
Write_high	<= WRITE(1);
Write_low	<= WRITE(0);

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if Read_high = '1' then
			RegValue(15 downto 8) <= DATAIN;
      elsif Read_low = '1' then
			RegValue(7 downto 0) <= DATAIN;      
		elsif INC = '1' then
			RegValue <= RegValue + 1;      
		elsif DEC = '1' then
			RegValue <= RegValue - 1;      
		end if;
	end if;
end process;

process (Write_high,Write_low,RegValue)
begin
		if Write_high = '1' then
			DATAOUT <= RegValue(15 downto 8);
		elsif Write_low = '1' then
			DATAOUT <= RegValue(7 downto 0);
		else DATAOUT <= (others => '0');
		end if;
end process;

REGISTER_VALUE <= RegValue;

end architecture rtl;