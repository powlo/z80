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

architecture rtl of register_16bit_shadow_nonswap_inc_dec is

signal Read_high     : std_logic;
signal Read_low      : std_logic;
signal Write_high    : std_logic;
signal Write_low     : std_logic;
signal ShadowValue	: std_logic_vector (7 downto 0);
signal RegValue		: std_logic_vector (15 downto 0);

begin

Read_high	<= READ(1);
Read_low		<= READ(0);
Write_high	<= WRITE(1);
Write_low	<= WRITE(0);

process (CLK, RESET_n)								--The PC is 16 bits and therefore is loaded in two stages.
begin														--To prevent the PC being corrupted during the loading of
	if RESET_n = '0' then							--the first byte, a shadow PC is used, which is not loaded
		ShadowValue <= (others => '0');			--until the next final byte comes along
	elsif CLK'event and CLK='1' then
		if Read_low = '1' then
			ShadowValue <= DATAIN;
		end if;
	end if;
end process;

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if Read_high = '1' then
			RegValue	<= DATAIN & ShadowValue;
		elsif INC = '1' then
			RegValue <= RegValue + 1;
      elsif DEC = '1' then
			RegValue <= RegValue - 1;      
		end if;
	end if;
end process;

process (Write_low, Write_high, RegValue)
begin
		if Write_low = '1' then
			DATAOUT <= RegValue(7 downto 0);			
		elsif Write_high = '1' then
			DATAOUT <= RegValue(15 downto 8);
		else DATAOUT <= (others => '0');
		end if;
end process;

REGISTER_VALUE <= RegValue;

end architecture rtl;