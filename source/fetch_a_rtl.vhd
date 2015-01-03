--File architecture for memory interface
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the memory interface for the block, currently
--just handles code fetches.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture rtl of fetch is

--We create a state machine to move through the 
--steps required to fetch code from memory.

--This is the clocking part 
process (CLK, RESET_n)
begin
	if RESEST_n = '0' then
		fetch_state <= S_RESET;
	elsif CLK'EVENT and CLK='1' then
		fetch_state <= next_fetch_state;
	end if;
end process;

--Here the states are changed.
--TODO Need to add the wait condition here.
process (fetch_state)
begin
	case (fetch_state) is
	when S_RESET =>
		next_fetch_state <= S_FETCH_1;
	when S_FETCH_1 =>
		next_fetch_state <= S_FETCH_2;
	when S_FETCH_2 =>
		next_fetch_state <= S_REFRESH_1;
	when S_REFRESH_1 =>
		next_fetch_state <= S_REFRESH_2;
	when S_REFRESH_2 =>
		next_fetch_state <= S_FETCH_1;
	when others =>
		next_fetch_state <= S_RESET;
	end case;
end process;

Mreq_temp1 <= '0' when fetch_state = S_FETCH_1 or fetch_state = S_FETCH_2 else '1';

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		Mreq_temp2 <= '1';
	elsif CLK'event and CLK = '0' then
		if fetch_state = S_FETCH_1 or fetch_state = S_FETCH_2 then
			Mreq_temp2 <= '0';
		else Mreq_temp2 <= '1';
		end if;
	end if;
end process;

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		Mreq_temp3 <= '1';
	elsif CLK'event and CLK = '0' then
		if fetch_state = Refresh1 then
			Mreq_temp3 <= '0';
		else	Mreq_temp3 <= '1';
		end if;
	end if;
end process;

MREQ_n	<= (Mreq_temp1 or Mreq_temp2) and Mreq_temp3;
RD_n		<= Mreq_temp1 or Mreq_temp2;
M1_n		<= '0' when fetch_state = S_FETCH_1 or  fetch_state = S_FETCH_2 else '1';
RFSH_n	<= '0' when fetch_state = S_REFRESH_1 or fetch_state = S_REFRESH_2 else '1';


process (fetch_state)
begin
case (fetch_state)
	when S_FETCH_1 or S_FETCH_2 =>
		ADDRESS <= FETCH_ADDRESS;
	when S_REFRESH_1 or S_REFRESH_2 =>
		ADDRESS <= REFRESH_ADDRESS;
	when others =>
		ADDRESS <= (others => '1');
	end case;
end process;

--We latch in the fetched data at the end of the second fetch cycle.
process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		FETCH_DATA <= (others => '1');
	elsif CLK'event and CLK = '1' then
		if fetch_state = S_FETCH_2 then
			FETCH_DATA <= DATA;
	end if;

end process;

);
end architecture rtl;