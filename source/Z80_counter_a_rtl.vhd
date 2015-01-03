--This is the behavioural architecture for the Z80 counter
--At the moment it is only an approximate to the Z80
--counter described in Z80 perifpherals doc.
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

constant   k_ed_code   : std_logic_vector (7 downto 0) := X"ED";
constant   k_reti_code : std_logic_vector (7 downto 0) := X"4D";
constant   k_retn_code : std_logic_vector (7 downto 0) := X"45";

type t_int_state is (s_none, s_requesting, s_processing, s_ed_found, s_waiting);

signal Value         : std_logic_vector (7 downto 0);
signal Set           : std_logic_vector (7 downto 0);
signal Command       : std_logic_vector (7 downto 0);
signal Int_Response  : std_logic_vector (7 downto 0);
signal Int_Status    : std_logic_vector (7 downto 0);
signal Nmi_Status    : std_logic_vector (7 downto 0);
signal Command_Rst   : std_logic;
signal Command_Nmi   : std_logic;
signal int_state     : t_int_state;
signal nmi_state     : t_int_state;

begin

--Decoding of Command register into indicidual signals
Command_Rst <= Command(0);
Command_Nmi <= Command(1);

--Handle read / write to registers
--And also vector generation on interrupt
--acknowledge from z80
process (RESET_n,Rd_n, Wr_n, IOREQ_n, Address)

begin
   Data <= (others => 'Z');    
	if RESET_n = '0' then
		Set        <= X"40";
		Command      <= X"01";
		Int_Response <= X"00";
	elsif IOREQ_n = '0' then
	   if CE_n = '0' then
		   if Rd_n = '0' then
		      case (Address (3 downto 0) ) is
		         when X"0" =>	Data <= Set;
		         when X"1" =>	Data <= Value;
					when X"2" =>	Data <= Command;
					when X"3" =>	Data <= Int_Response;
					when X"4" =>	Data <= Int_Status;
					when X"5" =>	Data <= Nmi_Status;
		         when others => Data <= (others => '0');
		      end case;
		   elsif Wr_n = '0' then
		      case (Address (3 downto 0) ) is
		         when X"0" =>   Set          <= Data;
		         when X"2" =>	Command      <= Data;
		         when X"3" =>	Int_Response <= Data;
		         when others  => null;
		      end case;
         end if;
      elsif M1_n = '0' and IOREQ_n = '0' and    -- M1_n and IOREQ = '0' is
            int_state = s_requesting then       -- interrupt condition.
            Data <= Int_Response;                  
      end if;
	end if;
end process;

--Perform down-counter
process (CLK, RESET_n)
begin
   if RESET_n = '0' or Command_Rst = '1' then
      Value <= Set;
   elsif CLK'event and CLK='1' then
      if Value > X"00" then
         Value <= Value -1;
      end if;
   end if;
end process;

--Generate the interrupt state
--note the else condition which ensures that a reti 
--immediately follows an "ED".
process (CLK, RESET_n)
begin
   if RESET_n = '0' then
      int_state <= s_none;
   elsif CLK'event and CLK='1' then
      case (int_state) is
      when s_none =>
         if IEI = '1' and Value = X"00" and Command_Nmi = '0' then
            int_state <= s_requesting;
         end if;
      when s_requesting =>
         if  IEI = '1' and M1_n = '0' and IOREQ_n = '0' then
            int_state <= s_processing;
         elsif IEI = '0' then
            int_state <= s_none;
         end if;
      when s_processing =>
         if M1_n = '0' and RD_n = '0' and DATA = k_ed_code then
            int_state <= s_ed_found;
         end if;
      when s_ed_found =>
         if M1_n = '1' and RD_n = '1' then
            int_state <= s_waiting;
         end if;
      when s_waiting =>
         if M1_n = '0' and RD_n = '0' then
            if DATA = k_reti_code then
               int_state <= s_none;
            else int_state <= s_processing;
            end if;
         end if;
      end case;
   end if;
end process;

--Generate the nmi state
--note the else condition which ensures that a retn 
--immediately follows an "ED".
--Todo: The NMI signal is not level sensitive, and does not
--require detection of retn.
process (CLK, RESET_n)
begin
   if RESET_n = '0' then
      nmi_state <= s_none;
   elsif CLK'event and CLK='1' then
      case (nmi_state) is
      when s_none =>
         if Value = X"00" and Command_Nmi = '1' then
            nmi_state <= s_requesting;
         end if;
      when s_requesting =>
         if M1_n = '0' and MREQ_n = '0' and Rd_n = '0' then
            nmi_state <= s_processing;
         end if;
      when s_processing =>
         if M1_n = '0' and RD_n = '0' and DATA = k_ed_code then
            nmi_state <= s_ed_found;
         end if;
      when s_ed_found =>
         if M1_n = '1' and RD_n = '1' then
            nmi_state <= s_waiting;
         end if;
      when s_waiting =>
         if M1_n = '0' and RD_n = '0' then
            if DATA = k_retn_code then
               nmi_state <= s_none;
            else nmi_state <= s_processing;
            end if;
         end if;
      end case;
   end if;
end process;

--generate a cpu readable signal based on the
--current interrupt state
process (int_state) is
begin
   case (int_state) is
      when s_none       => Int_Status <= X"00";
      when s_requesting => Int_Status <= X"01";
      when s_processing => Int_Status <= X"02";
      when s_ed_found   => Int_Status <= X"03";
      when s_waiting    => Int_Status <= X"04";
      when others       => Int_Status <= X"00";
   end case;
end process;

--generate a cpu readable signal based on the
--current nmi state
process (nmi_state) is
begin
   case (nmi_state) is
      when s_none       => Nmi_Status <= X"00";
      when s_requesting => Nmi_Status <= X"01";
      when s_processing => Nmi_Status <= X"02";
      when s_ed_found   => Nmi_Status <= X"03";
      when s_waiting    => Nmi_Status <= X"04";
      when others       => Nmi_Status <= X"00";
   end case;
end process;

--IEO generated from state machine above.
IEO <= IEI when int_state = s_none else '0';

--INT_n is open drain, so other devices can drive it too.
INT_n <= '0' when int_state = s_requesting else 'Z';

--NMI_n is open drain, so other devices can drive it too.
NMI_n <= '0' when nmi_state = s_requesting else 'Z';

end architecture rtl;
