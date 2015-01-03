--This is the behavioural architecture for the 64K RAM
--available to the Z80 during test.
library IEEE;
	use IEEE.NUMERIC_STD.ALL;
   use IEEE.STD_LOGIC_arith.ALL;
   use IEEE.STD_LOGIC_unsigned.ALL;
	use IEEE.STD_LOGIC_TEXTIO.ALL;
library STD;
	use STD.TEXTIO.ALL;
	
library WORK;
	use WORK.CONVERSIONS.ALL;
	use WORK.TB_FUNCTIONS.ALL;
	
architecture behavioral of Z80_ram is


begin

process (RESET_n,Rd_n, Wr_n, MReq_n, Address)

variable V_RAM_64K : T_RAM_64K := (others => (others => 'U'));

begin
	if RESET_n = '0' then
		V_RAM_64K := load_memory_intel(file_name, G_DEBUG);
	elsif MReq_n = '0' then
		if Rd_n = '0' then 
			Data <= V_RAM_64K(conv_integer(Address));
		elsif Wr_n = '0' then
			V_RAM_64K(conv_integer(Address)) := Data;
			Data <= (others => 'Z');
		else
			Data <= (others => 'Z');
		end if;
	else Data <= (others => 'Z');
	end if;
end process;

end architecture behavioral;