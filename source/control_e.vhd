--this is a simple fetch block.
--note the other fetch block written handle the low level 
--driving of signals etc. but this should be separated, as 
--here.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;

entity control is
   port (
      CLK         : IN  std_logic;
      RESET_n     : IN  std_logic;
      DATAIN      : IN  std_logic_vector (K_DATA_WIDTH-1 downto 0);
      DATAOUT     : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
      READ        : OUT T_REGISTER_SELECT;
      WRITE       : OUT T_REGISTER_SELECT;
      ESCAPE_CODE : OUT T_ESCAPE;
      CONDITION   : IN  std_logic;
      CORE_TYPE   : OUT T_ACCESS;
      CORE_ACK    : IN  std_logic;
      INT_n       : IN  std_logic;
      NMI_n       : IN  std_logic;
      HALT_n      : OUT std_logic;
      IFF2        : OUT std_logic;
      FLAG        : OUT T_REGISTER_SELECT;
      MASK        : OUT std_logic_vector (7 downto 0);
      ALU         : OUT T_ALU_INSTRUCTION;
      ALU_GATE    : OUT T_ALU_INSTRUCTION;
      ADDRESSMUX  : OUT T_ADDRESS
      );
end entity control;