--File Z80 Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the memory interface module, used to fetch data from memory.

   use work.Z80_synth_pak.ALL;

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

    entity memory_interface is
      port (
      CLK					: IN		std_logic;
      RESET_n				: IN 		std_logic;
      CORE_TYPE			: IN 		T_ACCESS;
      CORE_RD				: IN 		T_REGISTER_SELECT;	
      CORE_WR				: IN		T_REGISTER_SELECT;	
      CORE_ACK				: OUT 	std_logic;	
      CORE_ADDRESS 		: IN 		std_logic_vector (15 downto 0);
      CORE_DATAIN			: IN  	std_logic_vector (7 downto 0);
      CORE_DATAOUT		: OUT 	std_logic_vector (7 downto 0);
      REFRESH_ADDRESS	: IN 		std_logic_vector (15 downto 0);
      M1_n					: OUT 	std_logic;
      IOREQ_n				: OUT 	std_logic;
      MREQ_n				: OUT 	std_logic;
      RD_n					: OUT 	std_logic;
      WR_n					: OUT 	std_logic;
      Wait_n				: IN   	std_logic;
      BUSREQ_n				: IN 		std_logic;
      BUSACK_n				: OUT 	std_logic;
      RFSH_n				: OUT 	std_logic;
      ADDRESS				: OUT		std_logic_vector (15 downto 0);
      DATA					: INOUT	std_logic_vector (7 downto 0)
      );
   end entity memory_interface;