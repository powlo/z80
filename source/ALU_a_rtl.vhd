--File architecture for ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the ALU.
    architecture rtl of ALU is
   
      component register_8bit_swap_inc_dec is
      
         port (
         
         CLK				: IN std_logic;
         RESET_n			: IN std_logic;
         DATAIN			: IN std_logic_vector (7 downto 0);
         DATAOUT			: OUT std_logic_vector (7 downto 0);
         READ				: IN std_logic;
         WRITE		 		: IN std_logic;
         SWAP		 		: IN std_logic;
         INC            : IN std_logic;
         DEC            : IN std_logic;
         REGISTER_VALUE : OUT std_logic_vector (7 downto 0)
         );
      
      end component register_8bit_swap_inc_dec;
   
      component register_8bit_nonswap_inc_dec is
      
         port (
         
         CLK		: IN std_logic;
         RESET_n	: IN std_logic;
         DATAIN	: IN std_logic_vector (7 downto 0);
         DATAOUT	: OUT std_logic_vector (7 downto 0);
         READ 		: IN std_logic;
         WRITE 	: IN std_logic;
         INC   	: IN std_logic;
         DEC   	: IN std_logic;
         REGISTER_VALUE : OUT std_logic_vector (7 downto 0)
         );
      
      end component register_8bit_nonswap_inc_dec;
   
      component ALU_Core is
      
         port (
         OP1       : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         OP2       : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         IFF2      : IN  std_logic;
         BC_NZ     : IN  std_logic;
         ESCAPE    : IN  T_ESCAPE;
         COMMAND   : IN  T_ALU_INSTRUCTION;
         FIN       : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         FOUT      : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
         DAA       : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
         CONDITION : OUT std_logic;
         RESULT    : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
         );
      end component ALU_Core;
   
      signal Op1              : std_logic_vector (7 downto 0);
      signal Op2              : std_logic_vector (7 downto 0);
      signal A_Register       : std_logic_vector (7 downto 0);
      signal T_Register       : std_logic_vector (7 downto 0);
      signal F_Register       : std_logic_vector (7 downto 0);
      signal G_Register       : std_logic_vector (7 downto 0);
      signal DataIn_A         : std_logic_vector (7 downto 0);
      signal DataIn_T         : std_logic_vector (7 downto 0);
      signal DataIn_F         : std_logic_vector (7 downto 0);
      signal DataIn_G         : std_logic_vector (7 downto 0);
      signal DataOut_A        : std_logic_vector (7 downto 0);
      signal DataOut_T        : std_logic_vector (7 downto 0);
      signal DataOut_F        : std_logic_vector (7 downto 0);
      signal DataOut_G        : std_logic_vector (7 downto 0);
      signal DataOut_K        : std_logic_vector (7 downto 0);
      signal Result           : std_logic_vector (7 downto 0);
      signal F_In             : std_logic_vector (7 downto 0);
      signal F_Out            : std_logic_vector (7 downto 0);
      signal F_Out_Masked     : std_logic_vector (7 downto 0);
      signal DAA              : std_logic_vector (7 downto 0);
   
      signal Read_A  : std_logic;
      signal Read_T  : std_logic;
      signal Read_F  : std_logic;
      signal Read_G  : std_logic;
      signal Write_A : std_logic;
      signal Write_T : std_logic;
      signal Write_F : std_logic;
      signal Write_G : std_logic;
      signal Swap    : std_logic;
   
      signal ALU_Command : std_logic;
      signal low : std_logic;
   
   begin
   
   --dummy signal to shore up unused inputs.
      low <= '0';
   
   --produce logic from ennumerated type.
      Read_A   <= '1' when READ = A else '0';
      Read_F   <= '1' when READ = F or (FLAG = F and ALU_Command = '1') else '0';
      Read_T   <= '1' when READ = T else '0';
      Read_G   <= '1' when READ = G or (FLAG = G and ALU_Command = '1') else '0';
   
      Write_A  <= '1' when WRITE = A else '0';
      Write_F  <= '1' when WRITE = F else '0';
      Write_T  <= '1' when WRITE = T else '0';
      Write_G  <= '1' when WRITE = G else '0';
   
      Swap     <= '1' when COMMAND = X_AF else '0';
   
      --ALU Command is created to identify those ALU
      --Instructions which really involve the ALU core
      ALU_Command <= '1' when  COMMAND = ADD or
                               COMMAND = ADDC or
                               COMMAND = SUB or
                               COMMAND = SUBC or
                               COMMAND = ANDD or
                               COMMAND = ORR or
                               COMMAND = XORR or
                               COMMAND = RLC or
                               COMMAND = RL or
                               COMMAND = RRC or
                               COMMAND = RR or
                               COMMAND = SLAA or
                               COMMAND = SRAA or
                               COMMAND = SRLL or
                               COMMAND = SLLL or
                               COMMAND = LBLB or
                               COMMAND = HBHB or
                               COMMAND = LBHB or
                               COMMAND = HBLB or
                               COMMAND = IFF or
                               COMMAND = PV_BC else '0';
      
   
   --This is a simple selectable bank of constants 
   --used for various ALU commands
       process (WRITE,DAA)
      begin
         case WRITE is
            when K_H00 => DataOut_K <= X"00";
            when K_H01 => DataOut_K <= X"01";
            when K_H02 => DataOut_K <= X"02";
            when K_H04 => DataOut_K <= X"04";
            when K_H08 => DataOut_K <= X"08";
            when K_H10 => DataOut_K <= X"10";
            when K_H18 => DataOut_K <= X"18";
            when K_H20 => DataOut_K <= X"20";
            when K_H28 => DataOut_K <= X"28";
            when K_H30 => DataOut_K <= X"30";
            when K_H38 => DataOut_K <= X"38";
            when K_H40 => DataOut_K <= X"40";
            when K_H66 => DataOut_K <= X"66";
            when K_H80 => DataOut_K <= X"80";
            when K_H7F => DataOut_K <= X"7F";
            when K_HBF => DataOut_K <= X"BF";
            when K_HDF => DataOut_K <= X"DF";
            when K_HEF => DataOut_K <= X"EF";
            when K_HF7 => DataOut_K <= X"F7";
            when K_HFB => DataOut_K <= X"FB";
            when K_HFD => DataOut_K <= X"FD";
            when K_HFE => DataOut_K <= X"FE";
            when K_HFF => DataOut_K <= X"FF";
            when K_DAA => DataOut_K <= DAA;
            when others => DataOut_K <= X"00";
         end case;
      end process;
   
      INST_A_Reg : register_8bit_swap_inc_dec 
         
            port map (
            CLK      => CLK,
            RESET_n  => RESET_n,
            
            DATAIN   => DataIn_A,
            DATAOUT  => DataOut_A,
            READ     => Read_A,
            WRITE    => Write_A,
            SWAP     => Swap,
            INC      => low,
            DEC      => low,
            REGISTER_VALUE => A_Register
            );
   
      INST_F_Reg : register_8bit_swap_inc_dec 
         
            port map (
            CLK      => CLK,
            RESET_n  => RESET_n,
            
            DATAIN   => DataIn_F,
            DATAOUT  => DataOut_F,
            READ     => Read_F,
            WRITE    => Write_F,
            SWAP     => Swap,
            INC      => low,
            DEC      => low,
            REGISTER_VALUE => F_Register
            );
   
      INST_T_Reg : register_8bit_nonswap_inc_dec
         
            port map (
            
            CLK            => CLK,
            RESET_n        => RESET_n,
            DATAIN         => DataIn_T,
            DATAOUT        => DataOut_T,
            READ           => Read_T,
            WRITE          => Write_T,
            INC            => low,
            DEC            => low,
            REGISTER_VALUE => T_Register
            );
   
      INST_G_Reg : register_8bit_nonswap_inc_dec
         
            port map (
            
            CLK            => CLK,
            RESET_n        => RESET_n,
            DATAIN         => DataIn_G,
            DATAOUT        => DataOut_G,
            READ           => Read_G,
            WRITE          => Write_G,
            INC            => low,
            DEC            => low,
            REGISTER_VALUE => G_Register
            );
   
   --Mux either A Reg or T reg onto Op1
       process (Read_A,A_Register,T_Register)
      begin
         if Read_A = '1' then
            Op1 <= A_Register;
         else Op1 <= T_Register;
         end if;
      end process;

   --Mux either F Reg or G reg onto Flag In
       process (FLAG,F_Register,G_Register)
      begin
         if FLAG = F then
            F_In <= F_Register;
         else F_In <= G_Register;
         end if;
      end process;
   
      Op2 <= DATAIN;
   
      DataIn_A <= DATAIN when ALU_Command = '0' else Result;
      DataIn_T <= DATAIN when ALU_Command = '0' else Result;
      DataIn_F <= DATAIN when ALU_Command = '0' else F_Out_Masked;
      DataIn_G <= DATAIN when ALU_Command = '0' else F_Out_Masked;
   
      INST_ALU_Core : ALU_Core 
         
            port map (
            OP1       => Op1,
            OP2       => Op2,
            IFF2      => IFF2,
            BC_NZ     => BC_NZ,
            ESCAPE    => ESCAPE,
            COMMAND   => COMMAND,
            FIN       => F_In,
            FOUT      => F_Out,
            DAA       => DAA,
            CONDITION => CONDITION,
            RESULT    => Result
            );
      
      F_Out_Masked <= (F_Out and MASK) or (F_In and not MASK);
      
      DATAOUT   <= DataOut_A or DataOut_F or DataOut_T or DataOut_G or DataOut_K;
   
   end architecture rtl;