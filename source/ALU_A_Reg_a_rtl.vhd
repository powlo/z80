
architecture rtl of ALU_A_Reg is

component register_8bit is

port (

	CLK		: IN std_logic;
	RESET_n	: IN std_logic;
	DATAIN	: IN std_logic_vector (K_DATA_WIDTH-1 downto 0);
	DATAOUT	: OUT std_logic_vector (K_DATA_WIDTH-1 downto 0);
	READ 		: IN std_logic;
	WRITE 	: IN std_logic;
	SWAP		: IN std_logic;
	REGISTER_VALUE : OUT std_logic_vector (K_DATA_WIDTH-1 downto 0)
);

end component register_8bit;

signal DataBusIn_A	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal A_Command 		: std_logic;

begin

--TODO: Get rid of This A Command thing
--A or T can be selected through "Read" line.
A_Command	<= '0' when COMMAND = ADDT or
								COMMAND = ADDCT or
								COMMAND = SUBT or
								COMMAND = SUBCT or
								COMMAND = INC or
								COMMAND = DEC or
								COMMAND = INCC or
								COMMAND = DECC or
								COMMAND = RLC or
								COMMAND = RL or
								COMMAND = RRC or
								COMMAND = RR or
								COMMAND = SRAA or
								COMMAND = SLAA or
								COMMAND = SRLL or
								COMMAND = RST0 or
								COMMAND = RST1 or
								COMMAND = RST2 or
								COMMAND = RST3 or
								COMMAND = RST4 or
								COMMAND = RST5 or
								COMMAND = RST6 or
								COMMAND = RST7 or
								COMMAND = BIT0 or
								COMMAND = BIT1 or
								COMMAND = BIT2 or
								COMMAND = BIT3 or
								COMMAND = BIT4 or
								COMMAND = BIT5 or
								COMMAND = BIT6 or
								COMMAND = BIT7 or
								COMMAND = RES0 or
								COMMAND = RES1 or
								COMMAND = RES2 or
								COMMAND = RES3 or
								COMMAND = RES4 or
								COMMAND = RES5 or
								COMMAND = RES6 or
								COMMAND = RES7 or
								COMMAND = SET0 or
								COMMAND = SET1 or
								COMMAND = SET2 or
								COMMAND = SET3 or
								COMMAND = SET4 or
								COMMAND = SET5 or
								COMMAND = SET6 or
								COMMAND = SET7 or
								COMMAND = COMP or
								COMMAND = NULLL or
								COMMAND = INCSP or
								COMMAND = DECSP or
								COMMAND = INC2 or
								COMMAND = DEC2 or
								COMMAND = ADDT2 or
								COMMAND = INCC2 or
								COMMAND = DECC2 or 
								COMMAND = INCPC or
								COMMAND = DECPC or 
								COMMAND = IFF else '1';
											
INST_A_Mux : process (A_Command,DATAIN,RESULT)
begin
	if A_Command = '1' then 
		DataBusIn_A <= RESULT;
	else DataBusIn_A <= DATAIN;
	end if;
end process INST_A_Mux;

INST_A_Register : register_8bit

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DataBusIn_A,
	DATAOUT	=>	DATAOUT,
	READ		=>	READ,
	WRITE		=>	WRITE,
	SWAP		=>	SWAP,
	REGISTER_VALUE => A
);

end architecture rtl;