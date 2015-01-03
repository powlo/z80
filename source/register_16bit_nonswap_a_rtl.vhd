--File architecture for the ALU
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is a generic register for the Z80

architecture rtl of register_16bit_nonswap is

component register_8bit_nonswap is

port (

	CLK		: IN std_logic;
	RESET_n	: IN std_logic;
	DATAIN	: IN std_logic_vector (K_DATA_WIDTH-1 downto 0);
	DATAOUT	: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ 		: IN std_logic;
	WRITE 	: IN std_logic;
	REGISTER_VALUE : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
);

end component register_8bit_nonswap;

signal DataOut_high	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal DataOut_low	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal RegValue_high : std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal RegValue_Low 	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal Read_high		: std_logic;
signal Read_low		: std_logic;
signal Write_high		: std_logic;
signal Write_low	 	: std_logic;


begin

Read_high	<= READ(1);
Read_low		<= READ(0);
Write_high	<= WRITE(1);
Write_low	<= WRITE(0);

Inst_high: register_8bit_nonswap

port map (

	CLK		=> CLK,
	RESET_n	=> RESET_n,
	DATAIN	=> DATAIN,
	DATAOUT	=> DataOut_high,
	READ 		=> Read_high,
	WRITE 	=> Write_high,
	REGISTER_VALUE => RegValue_high
);

Inst_low: register_8bit_nonswap 

port map (

	CLK		=> CLK,
	RESET_n	=> RESET_n,
	DATAIN	=> DATAIN,
	DATAOUT	=> DataOut_low,
	READ 		=> Read_low,
	WRITE 	=> Write_low,
	REGISTER_VALUE => RegValue_low
);

DATAOUT 			<= DataOut_high or DataOut_low;
REGISTER_VALUE <= RegValue_high & RegValue_Low;

end architecture rtl;