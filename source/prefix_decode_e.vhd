--this is a simple fetch block.
--note the other fetch block written handle the low level 
--driving of signals etc. but this should be separated, as 
--here.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

entity prefix_decode is
   port (
      CLK			: IN  std_logic;
      RESET_n		: IN  std_logic;
      Instruction	: IN  T_INSTRUCTION;
		Escape_Code	: OUT T_ESCAPE
      );
end entity prefix_decode;