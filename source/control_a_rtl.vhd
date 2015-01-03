--this is the control block containing the Instruction
--IR register and decode module.
library STD;
   use STD.STANDARD;

library IEEE;
   use IEEE.STD_LOGIC_ARITH.ALL;
   use IEEE.STD_LOGIC_UNSIGNED.ALL;
   use work.Instruction_list_pak.ALL;

    architecture rtl of control is
   
      component IR_register is
      
         port (
         
         CLK		: IN std_logic;
         RESET_n	: IN std_logic;
         DATAIN	: IN T_instruction;
         NEXTIR	: IN T_instruction;
         LOAD 		: IN std_logic;
         READ 		: IN std_logic;
         INSTRUCTION : OUT T_instruction
         );
      
      end component IR_register;
   
      component prefix_decode is
         port (
         CLK			: IN  std_logic;
         RESET_n		: IN  std_logic;
         Instruction	: IN  T_INSTRUCTION;
         Escape_Code	: OUT T_ESCAPE
         );
      end component prefix_decode;
   
      component decode is
         port (
         CONDITION			: IN  std_logic;
         INSTRUCTION			: IN  T_INSTRUCTION;
         NEXT_INSTRUCTION	: OUT T_INSTRUCTION;
         READ					: OUT T_REGISTER_SELECT;
         WRITE					: OUT T_REGISTER_SELECT;
         ALU					: OUT T_ALU_INSTRUCTION;
         FLAG  				: OUT T_REGISTER_SELECT;
         MASK  				: OUT std_logic_vector (7 downto 0);
         ADDRESSMUX			: OUT T_ADDRESS;
         ACCESS_TYPE			: OUT T_ACCESS
         );
      end component decode;
   
      component Int_Controller is
      
         port (
         CLK               : IN  std_logic;
         RESET_n           : IN  std_logic;
         INT_n             : IN  std_logic;
         NMI_n             : IN  std_logic;
         ALU_COMMAND       : IN  T_ALU_INSTRUCTION;
         IR                : IN  T_instruction;
         NEXT_IR_PRE       : IN  T_instruction;
         NEXT_IR_POST      : OUT T_instruction;
         IFF2              : OUT std_logic
         );
      
      end component Int_Controller;
   
      signal IFF2_sig           : std_logic;
      signal IR_Load            : std_logic;
      signal IR_Rd              : std_logic;
      signal Control_Flag       : T_REGISTER_SELECT;
      signal Gated_Control_Flag : T_REGISTER_SELECT;
      signal Control_Rd         : T_REGISTER_SELECT;
      signal Gated_Control_Rd   : T_REGISTER_SELECT;
      signal Control_Wr         : T_REGISTER_SELECT;
      signal DataIn_IR          : T_instruction;
      signal Instruction        : T_instruction;
      signal Next_IR_Pre        : T_instruction;
      signal Next_IR_Post       : T_instruction;
      signal AddressMux_int     : T_ADDRESS;
      signal Core_Type_Int      : T_ACCESS;
      signal Escape_Code_int    : T_ESCAPE;
      signal ALU_int            : T_ALU_INSTRUCTION;
   
   begin
   
      --this process is starting to get a little unwieldy...
      --Place in "decode" ? After all thats what it is doing.
      --DataIn_IR is synthesised as a latch! it should be
      --a translation block!
       process (DATAIN, IR_Rd, Escape_Code_int)
      
         variable i : T_Instruction;
         variable found : boolean := false;
      
      begin
         found := false;
         DataIn_IR <= FETCH;
         if IR_Rd = '1' then
         case (Escape_Code_int) is
            when NONE|DD|FD   =>
               for i in K_Instruction_Coding'range loop
                  if DATAIN = K_Instruction_Coding(i) then
                     DataIn_IR <= i;
                     found := true;
                  end if;
               end loop;
            when CB|DDCB|FDCB => 
               for i in K_CB_Instruction_Coding'range loop
                  if DATAIN = K_CB_Instruction_Coding(i) then
                     DataIn_IR <= i;
                     found := true;
                  end if;
               end loop;
            when ED => 
               for i in K_ED_Instruction_Coding'range loop
                  if DATAIN = K_ED_Instruction_Coding(i) then
                     DataIn_IR <= i;
                     found := true;
                  end if;
               end loop;
            when others       =>
               for i in K_Instruction_Coding'range loop
                  if DATAIN = K_Instruction_Coding(i) then
                     DataIn_IR <= i;
                     found := true;
                  end if;
               end loop;
         end case;
         
         --synthesis translate_off
         assert (found) report "Unknown instruction! At time " & TIME'IMAGE(NOW) 
               severity error;
         --synthesis translate_on
         end if;
      end process;
   
      INST_IR_Register : IR_register
         
            port map (
            
            CLK		=> CLK,
            RESET_n	=> RESET_n,
            DATAIN	=> DataIn_IR,
            NEXTIR	=> Next_IR_Post,
            LOAD 		=> IR_Load,
            READ 		=> IR_Rd,
            INSTRUCTION => Instruction
            );
   
   
      INST_prefix_decode : prefix_decode
            port map (
            CLK         => CLK,
            RESET_n     => RESET_n,
            Instruction	=> Instruction,
            Escape_Code	=> Escape_Code_int
            );
   
      INST_decode : decode 
         
            port map (
            CONDITION         => CONDITION,
            INSTRUCTION       => Instruction,
            NEXT_INSTRUCTION	=> Next_IR_Pre,
            READ              => Control_Rd,
            WRITE             => Control_Wr,
            ALU               => ALU_int,
            FLAG  				=> Control_Flag,
            MASK  				=> MASK,
            ADDRESSMUX        => AddressMux_int,
            ACCESS_TYPE       => Core_Type_Int
            );
   
      INST_Int_Controller : Int_Controller 
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            INT_n				=>	INT_n,
            NMI_n				=>	NMI_n,
            ALU_COMMAND		=>	ALU_int,
            IR					=>	Instruction,
            NEXT_IR_PRE		=>	Next_IR_Pre,
            NEXT_IR_POST   =>	Next_IR_Post,
            IFF2           => IFF2_sig
            );
   
      IFF2 <= IFF2_sig;
         
   --No Data is produced from the control unit
   --Which means its a waste of time having this port
   --in the first place!
   --TODO: Remove this port!
      DATAOUT <= (others => '0');
   
   
   --The read line is gated until the memory fetch
   --(if any) is complete.
       process (Control_Rd, Control_Wr, CORE_ACK)
      begin
         if Control_Wr = EXTERN then
            if CORE_ACK = '1' then
               Gated_Control_Rd <= Control_Rd;
            else Gated_Control_Rd <= NONE;
            end if;
         else Gated_Control_Rd <= Control_Rd;
         end if;
      end process;
   
   --Likewise
       process (Control_Flag, Control_Wr, CORE_ACK)
      begin
         if Control_Wr = EXTERN then
            if CORE_ACK = '1' then
               Gated_Control_Flag <= Control_Flag;
            else Gated_Control_Flag <= NONE;
            end if;
         else Gated_Control_Flag <= Control_Flag;
         end if;
      end process;
   
      READ		<= Gated_Control_Rd;
      WRITE 	<= Control_Wr;
      FLAG     <= Gated_Control_Flag;
      
   --wait for xack before reloading when using extern, otherwise
   --reload straight away. This is effectively our stall
      IR_Load	<= CORE_ACK when	(Control_Rd = EXTERN 
         		or Control_Wr = EXTERN) and IR_Rd = '0' else '1';
   
      IR_Rd			<= CORE_ACK when Control_Rd = INST else '0';
   
      ALU 			<= ALU_int;
      ADDRESSMUX	<= AddressMux_int;
      CORE_TYPE   <= Core_Type_Int;
   	
   --       INC_PC 	<= CORE_ACK when ( AddressMux_int = PC 
   --                             and Core_Type_Int /= Int
   --                             and Core_Type_Int /= Nmi ) else '0';
   --    
   --Generate a gated version of the ALU command.
   --This is used to provide 1 cycle ALU instructions.
   --TODO: Does it need to be tied to CORE ACK? or can
   --we just have a 1 cycle counter. Investigate.
       process (ALU_int, Control_Rd,Control_Wr,CORE_ACK)
      begin
         if  Control_Rd = EXTERN or Control_Wr = EXTERN then
            if CORE_ACK = '1' then
               ALU_GATE <= ALU_int;
            else ALU_GATE <= NULLL;
            end if;
         else ALU_GATE <= ALU_int;
         end if;
      end process;
   
   --        process (ALU_int, Control_Rd,Control_Wr,CORE_ACK)
   --       begin
   --          if ALU_int = DECSP then
   --             if  Control_Rd = EXTERN or Control_Wr = EXTERN then
   --                DEC_SP <= CORE_ACK;
   --             else DEC_SP <= '1';
   --             end if;
   --          else DEC_SP <= '0';		
   --          end if;		
   --       end process;
   
      ESCAPE_CODE <= Escape_Code_int;

      HALT_n <= '0' when Instruction = HALT else '1';
      
   end architecture rtl;