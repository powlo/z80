--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic 8 bit register for the Z80
--which has a build in shadow that can be switched
--to by driving SWAP high.

architecture rtl of register_8bit_nonswap is

signal RegValue 		: std_logic_vector (7 downto 0);

begin

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if READ = '1' then
			RegValue <= DATAIN;
		end if;
	end if;
end process;

process (WRITE,RegValue)
begin
		if WRITE = '1' then
			DATAOUT <= RegValue;
		else DATAOUT <= (others => '0');
		end if;
end process;

REGISTER_VALUE <= RegValue;

end architecture rtl;