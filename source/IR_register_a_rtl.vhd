--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic register for the Z80

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture rtl of IR_register is

signal RegValue : T_instruction;

begin

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= FETCH;
	elsif CLK'event and CLK='1' then
		if READ = '1' then
			RegValue <= DATAIN;
		elsif LOAD = '1' then
			RegValue <= NEXTIR;
		end if;
	end if;
end process;

INSTRUCTION <= RegValue;

end architecture rtl;