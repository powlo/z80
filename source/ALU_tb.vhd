--File testbench for the ALU
--Date: 8 Mar 2006
--Copyright P. Backhouse 2006

--This is a simple stand alone testbench for the ALU, just to 
--verify that each command produces the expected value.
library IEEE;
   use IEEE.STD_LOGIC_1164.ALL;
	use work.Z80_synth_pak.ALL;

entity ALU_tb is

end entity ALU_tb;

architecture testbench of ALU_tb is

signal DataIn		: std_logic_vector (K_DATA_WIDTH-1 downto 0) := (others => '0');
signal DataOut 	: std_logic_vector (K_DATA_WIDTH-1 downto 0) := (others => '0');
signal F				: std_logic_vector (K_DATA_WIDTH-1 downto 0) := (others => '0');
signal Read			: std_logic_vector (1 downto 0) := (others => '0');
signal Write		: std_logic_vector (1 downto 0) := (others => '0');
signal Command 	: std_logic_vector (K_ALU_INSTRUCTION_WIDTH-1 downto 0) := K_ALUNULL;
signal Read_A		: std_logic := '0';
signal Write_A		: std_logic := '0';
signal Read_F		: std_logic := '0';
signal Write_F		: std_logic := '0';

signal Clk 		: std_logic := '1';
signal Reset_n	: std_logic := '0';

constant K_TEST_PERIOD : time := 20 ns;

component ALU is

port (
	CLK		: IN 	std_logic;
	RESET_n	: IN 	std_logic;

	DATAIN				: IN 	std_logic_vector (K_DATA_WIDTH-1 downto 0);
	DATAOUT				: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	F						: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ					: IN  std_logic_vector (1 downto 0);
	WRITE					: IN  std_logic_vector (1 downto 0);
	COMMAND		 		: IN std_logic_vector (K_ALU_INSTRUCTION_WIDTH-1 downto 0)
);


end component ALU;

begin

UUT_ALU: ALU port map (

	CLK		=> Clk,
	RESET_n	=> Reset_n,

	DATAIN	=> DataIn,
	DATAOUT	=> DataOut,
	F			=> F,
	READ		=> Read,
	WRITE		=> Write,
	COMMAND	=> Command
);

process
begin
	Clk <= '1';
	wait for K_TEST_PERIOD/2;
	Clk <= '0';
	wait for K_TEST_PERIOD/2;
end process;

process
begin
	Reset_n <= '0';
	wait for K_TEST_PERIOD;
	Reset_n <= '1';
	wait;
end process;

Read <= (Read_F, Read_A);
Write <= (Write_F, Write_A);

process
begin
		Read_A		<= '0';
		Write_A		<= '0';
		DataIn 		<= X"00";
		Command		<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"4F";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A		<= '0';
		Write_A		<= '0';
		DataIn		<= X"CA";
		Command	<= K_ALUOR;
		wait for K_TEST_PERIOD;

		Read_A		<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"CF" 
		report "Unexpected result during OR test."
		severity warning;
		assert F = X"84" 
		report "Unexpected Flag during OR test."
		severity warning;
		
		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"9E";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A			<= '0';
		DataIn		<= X"72";
		Command	<= K_ALUAND;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"12" 
		report "Unexpected result during AND test."
		severity warning;
		assert F = X"04" 
		report "Unexpected Flag during AND test."
		severity warning;

		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"5F";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A			<= '0';
		DataIn		<= X"CA";
		Command	<= K_ALUXOR;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"95" 
		report "Unexpected result during XOR test."
		severity warning;
		assert F = X"84" 
		report "Unexpected Flag during XOR test."
		severity warning;
		
		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"06";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A			<= '0';
		DataIn		<= X"06";
		Command	<= K_ALUADD;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"0C" 
		report "Unexpected result during ADD test."
		severity warning;
		assert F = X"00" 
		report "Unexpected Flag during ADD test."
		severity warning;

		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"01";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A			<= '0';
		DataIn		<= X"FF";
		Command	<= K_ALUADD;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"00" 
		report "Unexpected result during ADD test."
		severity warning;
		assert F = X"51" 
		report "Unexpected Flag during ADD test."
		severity warning;

		Read_A 			<= '1';
		Write_A 		<= '0';
		DataIn 		<= X"3A";
		Command	<= K_ALUNULL;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A			<= '0';
		DataIn		<= X"04";
		Command	<= K_ALUSUB;
		wait for K_TEST_PERIOD;

		Read_A 			<= '0';
		Write_A 		<= '1';
		Command		<= K_ALUNULL;
		DataIn			<= X"00";
		wait for K_TEST_PERIOD;

		assert DataOut = X"36" 
		report "Unexpected result during SUB test."
		severity warning;
		assert F = X"06" 
		report "Unexpected Flag during SUB test."
		severity warning;
		
		--end of test!
		wait;
end process;

end architecture testbench;