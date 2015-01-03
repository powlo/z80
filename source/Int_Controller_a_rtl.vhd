--File architecture for the Interrupt Controller
--Date: 6 Jul 2006
--Copyright P. Backhouse 2006

    architecture rtl of Int_Controller is
   
      type t_IFF_state	is (	S_DISABLED, S_EI_RECEIVED, S_WAIT, 
										S_ENABLED);
      type t_mode_state is (S_MODE0, S_MODE1, S_MODE2);
   	
      signal IFF1_state    : t_IFF_state;
      signal IFF2_state    : t_IFF_state;
      signal mode_state    : t_mode_state;
      signal NMI_n_Latch   : std_logic;
      
   begin

--State machine for handling the interrupt coming in.
--Its a little more convoluted than would appear at first glance
--because according to the spec an interrupt is not enabled until 
--the next instruction but 1. This enables the sequence
--EI, RETI to be executed with the desired results.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         IFF1_state <= S_DISABLED;
      elsif CLK'event and CLK = '1' then
         case (IFF1_state) is
            when S_DISABLED =>
               if ALU_COMMAND = EI then
                  IFF1_state <= S_EI_RECEIVED;
               elsif IR = RETN then
                  IFF1_state <= IFF2_state;
               end if;
            when S_EI_RECEIVED =>
               if  IR = FETCH then
                  IFF1_state <= S_WAIT;
               elsif ALU_COMMAND = DI then
                  IFF1_state <= S_DISABLED;
               end if;
            when S_WAIT =>     
               if IR /= FETCH then                 
                  IFF1_state <= S_ENABLED;          
               elsif ALU_COMMAND = DI then
                  IFF1_state <= S_DISABLED;
               end if;
            when S_ENABLED =>
               if ALU_COMMAND = DI or IR = I_MODE0 or 
                  IR = I_MODE1 or IR = I_MODE2 or IR = I_NMI then
                     IFF1_state <= S_DISABLED;
               end if;
         end case;
      end if;
   end process;

--Process to generate IFF2.
--IFF2 follows IFF1 except that it does not reset on NMI.
--When the NMI is finished IFF2 is copied back to IFF1
------------------------
--TODO: It make for a more compact mux if this routine worked
--just off the IR input and not ALU_COMMAND as well.
------------------------
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         IFF2_state <= S_DISABLED;
      elsif CLK'event and CLK = '1' then
         case (IFF2_state) is
            when S_DISABLED =>
               if ALU_COMMAND = EI then
                  IFF2_state <= S_EI_RECEIVED;
               end if;
            when S_EI_RECEIVED =>
               if  IR = FETCH then
                  IFF2_state <= S_WAIT;
               elsif ALU_COMMAND = DI then
                  IFF2_state <= S_DISABLED;
               end if;
            when S_WAIT =>     
               if IR /= FETCH then                 
                  IFF2_state <= S_ENABLED;          
               elsif ALU_COMMAND = DI then
                  IFF2_state <= S_DISABLED;
               end if;
            when S_ENABLED =>
               if ALU_COMMAND = DI or IR = I_MODE0 or 
                  IR = I_MODE1 or IR = I_MODE2 then
                     IFF2_state <= S_DISABLED;
               end if;
         end case;
      end if;
   end process;
     
   --Use the ALU command to update the type of interrupt
   --That can be taken, Mode 0,1 or 2.
   process (CLK, RESET_n)
   begin
      if RESET_n = '0' then
         mode_state <= S_MODE0;
      elsif CLK'event and CLK = '1' then
         if ALU_COMMAND = IM0 then
            mode_state <= S_MODE0;
         elsif ALU_COMMAND = IM1 then
            mode_state <= S_MODE1;
         elsif ALU_COMMAND = IM2 then
            mode_state <= S_MODE2;
         end if;
      end if; 
   end process;
   
--NMI_n needs to be latched so that it is inserted correctly into the
--instruction stream. An NMI is not acked as such  and a device can
--legitimately generate a short nmi pulse. If the instruction is a long
--one to execute then the nmi may occur in the middle of execution and
--so not be clocked in.
--note that this is a true latch, which may cause synth issues.
--Could be replaced with a clocked reg if required (but would breach zilog
--design spec)

   process (IR, RESET_n, NMI_n)
   begin
      if RESET_n = '0' or IR = I_NMI then
         NMI_n_latch <= '1';
      elsif NMI_n'event and NMI_n = '0' then
         NMI_n_latch <= '0';
      end if; 
   end process;


--Process to squeeze in the interrupt bytecode instead of the fetch         
--Here is where NMI_n takes priority over INT_n, and IFF1 is checked
--to see if it is enabled.
--------------------------------------
--TODO: Extended bytecodes may be interrupted (in a bad way)
--so check for extended signals, dont take int if active.
--------------------------------------
   process (NEXT_IR_PRE, Mode_State, IFF1_state, NMI_n_latch, INT_n)
   begin

      NEXT_IR_POST <= NEXT_IR_PRE;
  
      if NEXT_IR_PRE = FETCH or NEXT_IR_PRE = HALT then
         if NMI_n_latch = '0' then
            NEXT_IR_POST <= I_NMI;
         elsif INT_n = '0' and IFF1_state = S_ENABLED then
            case (Mode_State) is
               when S_Mode0 => NEXT_IR_POST <= I_MODE0;
               when S_Mode1 => NEXT_IR_POST <= I_MODE1;
               when S_Mode2 => NEXT_IR_POST <= I_MODE2;
               when others  => NEXT_IR_POST <= I_MODE0;
            end case;
         end if;
      end if;
   end process;
   
   IFF2 <= '1' when IFF2_state = S_ENABLED else '0';
         
   end architecture rtl;
