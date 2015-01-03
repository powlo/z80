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
	
architecture rtl of Z80_counter is

signal Counter_Value   : std_logic_vector (7 downto 0);
signal Counter_Reset   : std_logic_vector (7 downto 0);
signal Counter_Command : std_logic_vector (7 downto 0);
signal Int_sig : std_logic;

begin

Counter_On <= '1' when Counter_Command = X"01" else '0';

--Handle read / write to registers
process (RESET_n,Rd_n, Wr_n, MReq_n, Address)

begin
   Data <= (others => 'Z');    
	if RESET_n = '0' then
		Counter_Reset   <= (others => '0');
		Counter_Value   <= (others => '0');
		Counter_Command <= (others => '0');
	elsif MReq_n = '0' then
		if Rd_n = '0' then
		   case (Address) is
		       when X"00" =>	Data <= Counter_Reset;
		       when X"01" =>	Data <= Counter_Value;
		       when X"02" =>	Data <= Counter_Command;
		       when others => Data <= (others => '0');
		   end case;
		elsif Wr_n = '0' then
		   case (Address) is
		       when X"00" =>	Counter_Reset <= Data;
		       when X"01" =>	Counter_Value <= Data;
		       when X"02" =>	Counter_Command <= Data;
		       when others => null;
		   end case;
		end if;
	end if;
end process;

--Perform down-counter
process (CLK, RESET_n)
begin
   if RESET_n = '0' then
      Counter_Value <= Counter_Reset;
   elsif CLK'event and CLK='1' then
      if Counter_Value > X"00" and Counter_On = '1' then
         Counter_Value <= Counter_Value -1;
      end if;
   end if;
end process;

--Generate Interrupt
process (CLK, RESET_n)
begin
   if RESET_n = '0' then
       Int_sig <= '1';
   elsif CLK'event and CLK='1' then
       if INI = '0' and Counter_Value = X"00" then
          Int_sig <= '0';
       else Int_sig <= '1';
       end if;
   end if;
end process;
end architecture rtl;

--Interrupt is open drain, so other devices
--can drive it too.
INT_n <= 'Z' when Int_sig = '1' else '0';