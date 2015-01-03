--File Z80 Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the memory interface module, used to fetch data from memory.
--At the moment it only does reads, not writes.

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

    entity fetch is
      port (
      CLK					: IN std_logic;
      RESET_n				: IN std_logic;
      CORE_REQ				: IN std_logic;	--signals from the core to this unit that a fetch is required
      CORE_ACK				: OUT std_logic;	--signals that the fetch has been perfromed and the data is ready
      CORE_ADDRESS 		: IN std_logic_vector (15 downto 0);
      CORE_DATA 			: OUT std_logic_vector (7 downto 0);
      REFRESH_ADDRESS	: IN std_logic_vector (15 downto 0);
      M1_n					: OUT std_logic;
      MREQ_n				: OUT std_logic;
      RD_n					: OUT std_logic;
      RFSH_n				: OUT std_logic;
      ADDRESS				: OUT  std_logic_vector (15 downto 0);
      DATA					: IN  std_logic_vector (7 downto 0)
      );
   end entity fetch;