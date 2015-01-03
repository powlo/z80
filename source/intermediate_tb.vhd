--This is an intermediate testbench to test the loading
--of registers feeding into the ALU, and to aid thinking
--on how the microcode side of things should work.
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;

entity intermediate_tb is
end entity intermediate_tb;

library IEEE;
	use IEEE.STD_LOGIC_ARITH.ALL;
	use IEEE.STD_LOGIC_UNSIGNED.ALL;
	use work.Z80_synth_pak.ALL;

architecture behavioural of intermediate_tb is

type T_instruction_array is array (0 to 9) of std_logic_vector( 7 downto 0);

constant K_INSTRUCTION_BANK : T_Instruction_array := (

X"3E", X"01", X"06", X"05", X"0E", X"07", X"80", X"81", X"00", X"00");

component intermediate is
port (

	CLK		: IN std_logic;
	RESET_n	: IN std_logic;

	DATAIN	: IN std_logic_vector (7 downto 0);
	DATAOUT	: OUT std_logic_vector (7 downto 0);
	DATA_WR	: OUT std_logic;
	DATA_RD	: OUT std_logic;
	ADDRESS	: OUT std_logic_vector (15 downto 0)
);

end component intermediate;

signal Clk		: std_logic;
signal Reset_n	: std_logic;
signal Rd		: std_logic;
signal Wr		: std_logic;
signal DataIn 	: std_logic_vector(7 downto 0);
signal DataOut	: std_logic_vector(7 downto 0);
signal Address : std_logic_vector(15 downto 0);

begin

INST_Intermediate : intermediate
port map (

	CLK		=> Clk,
	RESET_n	=>	Reset_n,
	DATAIN	=>	DataIn,
	DATAOUT	=>	DataOut,
	DATA_RD	=> Rd,
	DATA_WR	=> Wr,
	ADDRESS	=> Address
	);

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

--This process now behaves just like a RAM
process (Wr,Address)
begin
	if Wr = '1' then
		DataIn <= K_INSTRUCTION_BANK(Conv_Integer(unsigned(Address)));
	else DataIn <= (others => '0');
	end if;
end process;

end architecture behavioural;