--this is a simple fetch block.
--note the other fetch block written handle the low level 
--driving of signals etc. but this should be separated, as 
--here.

    entity fetch is
      port (
      CLK		: IN std_logic;
      RESET_n	: IN std_logic;
      fetch_req: OUT std_logic;	--signals from the core to this unit that a fetch is required
      fetch_ack: IN std_logic;	--signals that the fetch has been perfromed and the data is ready
      INSTRUCTION_REGISTER : IN std_logic_vector (7 downto 0);
		INTERNAL_CONTROL : OUT std_logic_vector (16 downto 0)
     );
   end entity fetch;