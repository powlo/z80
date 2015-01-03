
architecture rtl of ALU_T_Reg is

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

signal DataBusIn_T	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal T_Command 		: std_logic;

begin

T_Command	<= '1' when	COMMAND = ADDT or
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
								COMMAND = RSTNMI or
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
								COMMAND = INC2 or
								COMMAND = DEC2 or
								COMMAND = ADDT2 or
								COMMAND = INCC2 or
								COMMAND = DECC2 else '0';
											
INST_T_Mux : process (T_Command,DATAIN,RESULT)
begin
	if T_Command = '1' then 
		DataBusIn_T <= RESULT;
	else DataBusIn_T <= DATAIN;
	end if;
end process INST_T_Mux;

INST_T_Register : register_8bit_nonswap

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DataBusIn_T,
	DATAOUT	=>	DATAOUT,
	READ		=>	READ,
	WRITE		=>	WRITE,
	REGISTER_VALUE => T
);

end architecture rtl;