--This is an intermediate file to test loading and running 
--of the ALU with registers.

library IEEE;
   use IEEE.STD_LOGIC_ARITH.ALL;
   use IEEE.STD_LOGIC_UNSIGNED.ALL;

   use work.Z80_synth_pak.ALL;

    architecture rtl of sp_core is
   
      component register_8bit_nonswap_inc_dec is
      
         port (
         
         CLK		         : IN  std_logic;
         RESET_n	       : IN  std_logic;
         DATAIN	        : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         DATAOUT	       : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
         READ 		        : IN  std_logic;
         WRITE 	        : IN  std_logic;
         INC 	          : IN  std_logic;
         DEC           	: IN  std_logic;
         REGISTER_VALUE : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
         );
      
      end component register_8bit_nonswap_inc_dec;
   
      component register_16bit_nonswap_inc_dec is
      
         port (
         
         CLK				   : IN  std_logic;
         RESET_n			     : IN  std_logic;
         DATAIN			      : IN  std_logic_vector (7 downto 0);
         DATAOUT			     : OUT std_logic_vector (7 downto 0);
         READ				   : IN  std_logic_vector (1 downto 0);
         WRITE		 		   : IN  std_logic_vector (1 downto 0);
         INC            : IN  std_logic;
         DEC            : IN  std_logic;
         REGISTER_VALUE : OUT std_logic_vector (15 downto 0)
         );
      
      end component register_16bit_nonswap_inc_dec;
   
      component register_16bit_shadow_nonswap_inc_dec is
      
         port (
         
         CLK				: IN  std_logic;
         RESET_n			: IN  std_logic;
         DATAIN			: IN  std_logic_vector (7 downto 0);
         DATAOUT			: OUT std_logic_vector (7 downto 0);
         READ				: IN  std_logic_vector (1 downto 0);
         WRITE		 		: IN  std_logic_vector (1 downto 0);
         INC            : IN  std_logic;
         DEC            : IN  std_logic;
         REGISTER_VALUE : OUT std_logic_vector (15 downto 0)
         );
      
      end component register_16bit_shadow_nonswap_inc_dec;
   
      component Refresh_register is
      
         port (
         
         CLK		: IN std_logic;
         RESET_n	: IN std_logic;
         DATAIN	: IN std_logic_vector (7 downto 0);
         DATAOUT	: OUT std_logic_vector (7 downto 0);
         INC 		: IN std_logic;
         READ 		: IN std_logic;
         WRITE 	: IN std_logic;
         REGISTER_VALUE : OUT std_logic_vector (7 downto 0)
         );
      
      end component Refresh_register;
   
      signal	DataBusOut_IX     : std_logic_vector (7 downto 0);
      signal	Read_IX           : std_logic_vector (1 downto 0);
      signal	Write_IX          : std_logic_vector (1 downto 0);
   
      signal	DataBusOut_IY     : std_logic_vector (7 downto 0);
      signal	Read_IY           : std_logic_vector (1 downto 0);
      signal	Write_IY          : std_logic_vector (1 downto 0);
   
      signal	DataBusOut_PC	   : std_logic_vector (7 downto 0);
      signal	Read_PC           : std_logic_vector (1 downto 0);
      signal	Write_PC          : std_logic_vector (1 downto 0);
      signal   Inc_PC            : std_logic;
      signal   Dec_PC            : std_logic;
   
      signal	DataBusOut_SP     : std_logic_vector (7 downto 0);
      signal	Read_SP           : std_logic_vector (1 downto 0);
      signal	Write_SP          : std_logic_vector (1 downto 0);
      signal   Inc_SP            : std_logic;
      signal   Dec_SP            : std_logic;
   
      signal	DataBusOut_TT     : std_logic_vector (7 downto 0);
      signal	Read_TT           : std_logic_vector (1 downto 0);
      signal	Write_TT          : std_logic_vector (1 downto 0);
      signal   Inc_TT            : std_logic;
      signal   Dec_TT            : std_logic;
   
      signal	DataBusOut_Refresh      : std_logic_vector (7 downto 0);
      signal	Read_Refresh            : std_logic;
      signal	Write_Refresh           : std_logic;
      signal   Inc_Refresh             : std_logic;
   
      signal	DataBusOut_IPage     : std_logic_vector (7 downto 0);
      signal	Read_IPage           : std_logic;
      signal	Write_IPage          : std_logic;
      signal   Tie_low              : std_logic;
   
   begin
   
      Tie_low <= '0';
   
   --Decode logic values from the ennumerated read line in.
      Read_IPage     <= '1' when READ = IPAGE else '0';
      Read_Refresh   <= '1' when READ = REFRESH else '0';
      Read_TT(1)     <= '1' when READ = TT_H else '0';
      Read_TT(0)	 	<= '1' when READ = TT_L else '0';
      Read_SP(1)     <= '1' when READ = SP_H else '0';
      Read_SP(0) 		<= '1' when READ = SP_L else '0';
      Read_IX(1)	 	<= '1' when READ = H and (Escape_Code = DD or Escape_Code = DDCB ) else '0';
      Read_IX(0)     <= '1' when READ = L and (Escape_Code = DD or Escape_Code = DDCB ) else '0';
      Read_IY(1) 		<= '1' when READ = H and (Escape_Code = FD or Escape_Code = FDCB ) else '0';
      Read_IY(0)	 	<= '1' when READ = L and (Escape_Code = FD or Escape_Code = FDCB ) else '0';
      Read_PC(1)     <= '1' when READ = PC_H else '0';
      Read_PC(0) 		<= '1' when READ = PC_L else '0';
   
      Write_IPage    <= '1' when WRITE = IPAGE else '0';
      Write_Refresh	<= '1' when WRITE = REFRESH else '0';
      Write_TT(1)    <= '1' when WRITE = TT_H else '0';
      Write_TT(0)	 	<= '1' when WRITE = TT_L else '0';
      Write_SP(1)    <= '1' when WRITE = SP_H else '0';
      Write_SP(0)    <= '1' when WRITE = SP_L else '0';
      Write_IX(1)	 	<= '1' when WRITE = H and (Escape_Code = DD or Escape_Code = DDCB ) else '0';
      Write_IX(0)    <= '1' when WRITE = L and (Escape_Code = DD or Escape_Code = DDCB ) else '0';
      Write_IY(1)    <= '1' when WRITE = H and (Escape_Code = FD or Escape_Code = FDCB ) else '0';
      Write_IY(0)	 	<= '1' when WRITE = L and (Escape_Code = FD or Escape_Code = FDCB ) else '0';
      Write_PC(1)    <= '1' when WRITE = PC_H else '0';
      Write_PC(0)    <= '1' when WRITE = PC_L else '0';
   
      Inc_SP        <= '1' when ALU = INCSP else '0';
      Dec_SP        <= '1' when ALU = DECSP else '0';
   
      Inc_TT        <= '1' when ALU = INCTT else '0';
      Dec_TT        <= '1' when ALU = DECTT else '0';
   
      Inc_Refresh   <= '1' when ALU = INCPC and READ = INST else '0';
      Inc_PC        <= '1' when ALU = INCPC else '0';
      Dec_PC        <= '1' when ALU = DECPC else '0';
   
      INST_IX_Register : register_16bit_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_IX,
            READ				=>	Read_IX,
            WRITE				=>	Write_IX,
            INC				=>	Tie_low,
            DEC				=>	Tie_low,
            REGISTER_VALUE => IX
            );
   
      INST_IY_Register : register_16bit_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_IY,
            READ				=>	Read_IY,
            WRITE				=>	Write_IY,
            INC				=>	Tie_low,
            DEC				=>	Tie_low,
            REGISTER_VALUE => IY
            
            );
   
      INST_TT_Register : register_16bit_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_TT,
            READ				=>	Read_TT,
            WRITE				=>	Write_TT,
            INC				=>	Inc_TT,
            DEC				=>	Dec_TT,
            REGISTER_VALUE => TT
            
            );
   
      INST_PC_Register : register_16bit_shadow_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_PC,
            READ				=>	Read_PC,
            WRITE				=>	Write_PC,
            INC				=> Inc_PC,
            DEC				=> Dec_PC,
            REGISTER_VALUE => PC
            );
   
      INST_SP_Register : register_16bit_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_SP,
            READ				=>	Read_SP,
            WRITE				=>	Write_SP,
            INC				=> Inc_SP,
            DEC				=> Dec_SP,
            REGISTER_VALUE => SP
            );
   
   --Note: Cant compact with I page into 1 16 bit reg because the
   --refresh reg has to be inc'd through 8 bits, not 16
      INST_Refresh_Register : Refresh_register
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_Refresh,
            READ				=>	Read_Refresh,
            WRITE				=>	Write_Refresh,
            INC				=>	Inc_Refresh,
            REGISTER_VALUE => REFRESH_REG
            );
   
      INST_IPage_Register : register_8bit_nonswap_inc_dec
         
            port map (
            CLK				=>	CLK,
            RESET_n			=>	RESET_n,
            DATAIN			=>	DATAIN,
            DATAOUT			=>	DataBusOut_IPage,
            READ				=>	Read_IPage,
            WRITE				=>	Write_IPage,
            INC				=>	Tie_low,
            DEC				=>	Tie_low,
            REGISTER_VALUE => IPAGE_REG
            
            );
   --We or the data together to avoid having 
   --a massive mux. This means data out of registers MUST
   --be zero when not selected.
      DATAOUT <=	DataBusOut_IX or 
         		DataBusOut_IY or 
         		DataBusOut_SP or 
         		DataBusOut_PC or 
         		DataBusOut_TT or
         		DataBusOut_Refresh or 
         		DataBusOut_IPage;
   
   end architecture rtl;

