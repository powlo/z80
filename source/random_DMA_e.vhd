--File Z80 Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the beginnings of what will probably
--be the Z80 DMA module. Not sure what IO's to
--offer... so just leave as is for now.

   use work.Z80_synth_pak.ALL;

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

    entity random_DMA is
      port (
      CLK					: IN		std_logic;
      RESET_n				: IN 		std_logic;
      M1_n					: OUT 	std_logic;
      IOREQ_n				: OUT 	std_logic;
      MREQ_n				: OUT 	std_logic;
      RD_n					: OUT 	std_logic;
      WR_n					: OUT 	std_logic;
      BUSREQ_n				: OUT		std_logic;
      BUSACK_n				: IN	 	std_logic;
      RFSH_n				: OUT 	std_logic;
      ADDRESS				: OUT		std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
      DATA					: INOUT	std_logic_vector (K_DATA_WIDTH-1 downto 0)
      );
   end entity random_DMA;