--File architecture for the ALU Core
--Date: 26 Apr 2006
--Copyright P. Backhouse 2006

--The ALU core is the asynchronous part of the 
--ALU performing add subtract etc based on the
--command inserted.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity ALU_Core is

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

end entity ALU_Core;