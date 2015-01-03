--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the ALU of the Z80

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
   use work.Z80_synth_pak.ALL;

    entity ALU is
   
      port (
         
         CLK       : IN  std_logic;
         RESET_n   : IN  std_logic;
         
         IFF2      : IN  std_logic;
         BC_NZ     : IN  std_logic;
         ESCAPE    : IN  T_ESCAPE;
         COMMAND   : IN  T_ALU_INSTRUCTION;
         READ      : IN  T_REGISTER_SELECT;
         WRITE     : IN  T_REGISTER_SELECT;
         FLAG      : IN  T_REGISTER_SELECT;
         MASK      : IN  std_logic_vector (7 downto 0);

         DATAIN    : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
         CONDITION : OUT std_logic;
         DATAOUT   : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
         );
   
   end entity ALU;