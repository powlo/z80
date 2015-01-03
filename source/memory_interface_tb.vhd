--File Z80 Entity Declaration
--Date: 2 Mar 2006
--Copyright P. Backhouse

--This is the memory interface module, used to fetch data from memory.
--At the moment it only does reads, not writes.

library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

    entity memory_interface_tb is
   end entity memory_interface_tb;

	use work.Z80_synth_pak.ALL;

architecture behavioral of memory_interface_tb is

	component memory_interface is
      port (
      CLK					: IN		std_logic;
      RESET_n				: IN 		std_logic;
		CORE_TYPE			: IN 		T_ACCESS;
      CORE_RD				: IN 		T_REGISTER_SELECT;	
      CORE_WR				: IN		T_REGISTER_SELECT;	
      CORE_ACK				: OUT 	std_logic;	
      CORE_VAL				: OUT 	std_logic;	
      CORE_ADDRESS 		: IN 		std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
      CORE_DATAIN			: IN  	std_logic_vector (K_DATA_WIDTH-1 downto 0);
      CORE_DATAOUT		: OUT 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
      REFRESH_ADDRESS	: IN 		std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
      M1_n					: OUT 	std_logic;
      MREQ_n				: OUT 	std_logic;
      RD_n					: OUT 	std_logic;
      WR_n					: OUT 	std_logic;
      RFSH_n				: OUT 	std_logic;
      ADDRESS				: OUT		std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
      DATA					: INOUT	std_logic_vector (K_DATA_WIDTH-1 downto 0)
      );
   end component memory_interface;

signal Clk		: std_logic;
signal Reset_n	: std_logic;

signal Core_Type			: T_ACCESS;
signal Core_Rd		    	: T_REGISTER_SELECT;
signal Core_Wr 			: T_REGISTER_SELECT;
signal Core_Ack			: std_logic;
signal Core_Val			: std_logic;
signal Core_Address		: std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
signal Core_DataIn		: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal Core_DataOut		: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal Refresh_Address	: std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
signal M1_n					: std_logic;
signal MREQ_n				: std_logic;
signal Rd_n					: std_logic;
signal Rfsh_n				: std_logic;
signal Address				: std_logic_vector (K_ADDRESS_WIDTH-1 downto 0);
signal Data					: std_logic_vector (K_DATA_WIDTH-1 downto 0);

type T_InstructionArray is array (0 to 9) of std_logic_vector(7 downto 0);

constant K_InstructionArray : T_InstructionArray :=
	(X"3E", X"01", X"06", X"05", X"0E", X"07", X"80", X"81", X"00", X"00");

signal count : integer := 0;
	
begin
--Clock generating process.
process
begin
	Clk <= '1';
	Wait for 20 ns;
	Clk <= '0';
	wait for 20 ns;
end process;

--a reset process
process
begin
	--Reset
	Reset_n <= '0';
	wait for 80 ns; --two clock cycles.
	Reset_n <= '1';
	wait;
end process;

INST_memory_interface : memory_interface 
port map (
   CLK					=> Clk,
   RESET_n				=> Reset_n,
   CORE_TYPE			=> Core_Type,
   CORE_RD				=> Core_Rd,
   CORE_WR				=> Core_Wr,
   CORE_ACK				=> Core_Ack,
   CORE_VAL				=> Core_Val,
   CORE_ADDRESS 		=> Core_Address,
	CORE_DATAIN      	=> Core_DataIn,
	CORE_DATAOUT		=> Core_DataOut,
   REFRESH_ADDRESS	=> Refresh_Address,
   M1_n					=> M1_n,
   MREQ_n				=> MREQ_n,
   RD_n					=> Rd_n,
   RFSH_n				=> Rfsh_n,
   ADDRESS				=> Address,
   DATA					=> Data
   );

process
begin

	Core_Type <= NONE;
	Core_Wr <= NONE;
	Core_Rd <= NONE;
	Core_DataIn <= (others => '0');
	Core_Address <= (others => '0');
	Refresh_Address <= (others => '1');

   wait until RESET_n = '1' and CLK'event and CLK='1';

	Core_Type  <= FETCH;
	Core_Wr    <= EXTERN;
	Core_Rd    <= INST;
	Core_Address <= X"0001";
	Refresh_Address <= X"ABCD";

   wait until CLK'event and CLK='1' and Core_Ack = '1';
 	Core_Type <= NONE;
	Core_Wr <= NONE;
	Core_Rd <= NONE;
	Core_Address <= (others => '0');
	Refresh_Address <= (others => '1');

   wait until CLK'event and CLK='1';
	Core_Type  <= MEMORY;
	Core_Wr    <= NONE;
	Core_Rd    <= EXTERN;
	Core_DataIn <= X"4B";
	Core_Address <= X"0201";
	Refresh_Address <= X"DEBC";
 
   --We now change the inputs, simulating the 
   --processor going off and doing something else
   wait until CLK'event and CLK='1' and Core_Ack = '1';
   Core_Type  <= NONE;
	Core_Wr    <= B;
	Core_Rd    <= C;
	Core_DataIn <= X"11";
	Core_Address <= X"0020";
	Refresh_Address <= X"DEFA";

   --but then our next instruction needs data,
   --during the current fetch...
   wait until CLK'event and CLK='1';
   Core_Type  <= MEMORY;
	Core_Wr    <= C;
	Core_Rd    <= EXTERN;
	Core_DataIn <= X"72";
	Core_Address <= X"A309";
	Refresh_Address <= X"E001";

   --Again, change the inputs,
   wait until CLK'event and CLK='1' and Core_Ack = '1';
   Core_Type  <= FETCH;
	Core_Wr    <= EXTERN;
	Core_Rd    <= INST;
	Core_DataIn <= X"44";
	Core_Address <= X"1230";
	Refresh_Address <= X"76D3";

   --but then our next instruction needs data,
   --during the current fetch...
   wait until CLK'event and CLK='1'  and Core_Ack = '1';
   Core_Type  <= MEMORY;
	Core_Wr    <= EXTERN;
	Core_Rd    <= A;
	Core_DataIn <= X"67";
	Core_Address <= X"FE30";
	Refresh_Address <= X"E002";

   wait until CLK'event and CLK='1' and Core_Ack = '1';
   Core_Type  <= NONE;
	Core_Wr    <= B;
	Core_Rd    <= C;
	Core_DataIn <= X"11";
	Core_Address <= X"0020";
	Refresh_Address <= X"DEFA";

   wait;
	
	--not sure how long this should last for etc.
end process;

process (Rd_n)
begin
	if Rd_n = '0' then
		Data <= K_InstructionArray(count);
		count <= count + 1;
	else Data <= (others => 'Z');
	end if;
end process;

end architecture behavioral;