--this is a simple fetch block.
--note the other fetch block written handle the low level 
--driving of signals etc. but this should be separated, as 
--here.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.Z80_synth_pak.ALL;
use work.Instruction_list_pak.ALL;

    entity decode is
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
   end entity decode;