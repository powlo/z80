--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic 8 bit register for the Z80
--which has a build in shadow that can be switched
--to by driving SWAP high.

architecture rtl of register_8bit is
   
   signal RegValue 		: std_logic_vector (7 downto 0);
   signal TickValue 		: std_logic_vector (7 downto 0);
   signal DataOut_Reg 	: std_logic_vector (7 downto 0);
   signal DataOut_Tick 	: std_logic_vector (7 downto 0);
   signal RegSelect 		: std_logic;
   signal Read_Reg  		: std_logic;
   signal Read_Tick 		: std_logic;
   signal Write_Reg 		: std_logic;
   signal Write_Tick		: std_logic;
   
begin
   
   --The swap signal is used to contol the selection
   --of either the (normal) register or the tick register.
   --Note that SWAP must only be active for one cycle.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         RegSelect <= '0';
      elsif CLK'event and CLK='1' then
         if SWAP = '1' then
            RegSelect <= not RegSelect;
         end if;
      end if;
   end process;
   
   --Then using the select we activate either 
   --the Reg or its shadow, 'tick'.
   Read_Reg  <= READ and not RegSelect;
   Read_Tick <= READ and RegSelect;
   Write_Reg  <= WRITE and not RegSelect;
   Write_Tick <= WRITE and RegSelect;
   
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         RegValue <= (others => '0');
      elsif CLK'event and CLK='1' then
         if Read_Reg = '1' then
            RegValue <= DATAIN;
         end if;
      end if;
   end process;
   
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         TickValue <= (others => '0');
      elsif CLK'event and CLK='1' then
         if Read_Tick = '1' then
            TickValue <= DATAIN;
         end if;
      end if;
   end process;
   
   process (Write_Reg,RegValue)
   begin
      if Write_Reg = '1' then
         DataOut_Reg <= RegValue;
      else DataOut_Reg <= (others => '0');
      end if;
   end process;
   
   process (Write_Tick,TickValue)
   begin
      if Write_Tick = '1' then
         DataOut_Tick <= TickValue;
      else DataOut_Tick <= (others => '0');
      end if;
   end process;
   
   DATAOUT 			<= DataOut_Reg or DataOut_Tick;
   
   process (RegValue,TickValue,RegSelect)
   begin
      case (RegSelect) is
         when '0'    => REGISTER_VALUE <= RegValue;
         when others => REGISTER_VALUE <= TickValue;
      end case;
   end process;
   
end architecture rtl;