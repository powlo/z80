--This is the behavioural architecture for the IO port.
library IEEE;
   use IEEE.NUMERIC_STD.ALL;
   use IEEE.STD_LOGIC_arith.ALL;
   use IEEE.STD_LOGIC_unsigned.ALL;
   use IEEE.STD_LOGIC_TEXTIO.ALL;
library STD;
   use STD.TEXTIO.ALL;
	
   use WORK.CONVERSIONS.ALL;
   use WORK.TB_FUNCTIONS.ALL;
	
    architecture behavioral of Z80_IO is
      
   begin
   
       process (RESET_n,IOReq_n, Rd_n, Wr_n, Address)
      
         variable V_RAM_256 : T_RAM_256 := (others => (others => '1'));
      
      begin
         Data <= (others => 'Z');
         if RESET_n = '0' then
            V_RAM_256 := (others => (others => '1'));         
         elsif IOReq_n = '0' then
		      if Rd_n = '0' then 
			      Data <= V_RAM_256(conv_integer(Address));
		      elsif Wr_n = '0' then
			      V_RAM_256(conv_integer(Address)) := Data;
		      end if;
	      end if;
      end process;
   
   --process to generate a wait signal
      process
      begin
         WAIT_n <= '0';
         wait until IOReq_n = '0';
         wait for 8 ns;
         WAIT_n <= '1';
         wait until IOReq_n = '1';
      end process;
      
   end architecture behavioral;