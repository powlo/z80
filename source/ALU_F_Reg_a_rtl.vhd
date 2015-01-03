
use work.Z80_synth_pak.ALL;

architecture rtl of ALU_F_Reg is

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

signal DataBusIn_F	: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal F_Command 		: std_logic;
signal Read_F			: std_logic;
signal Write_F			: std_logic;

begin

--TODO The F Flag needs to be split into its individual flags so that
--each flag can be enabled under its own conditions.
--The F Register is always loaded when an ALU instruction is given
--Note the ...2 commands were specifically designed to eliminate F loading.

Read_F <= '1' when (READ = F) or (F_Command = '1') else '0';
Write_F <= '1' when WRITE = F else '0';

F_Command	<= '0' when	( COMMAND = NULLL or
								COMMAND = INC2 or 
								COMMAND = DEC2 or
								COMMAND = DECC2 or 
								COMMAND = INCC2 or 
								COMMAND = TEST2 or 
								COMMAND = RES0  or 
								COMMAND = RES1  or 
								COMMAND = RES2  or 
								COMMAND = RES3  or 
								COMMAND = RES4  or 
								COMMAND = RES5  or 
								COMMAND = RES6  or 
								COMMAND = RES7  or 
								COMMAND = RST0  or 
								COMMAND = RST1  or 
								COMMAND = RST2  or 
								COMMAND = RST3  or 
								COMMAND = RST4  or 
								COMMAND = RST5  or 
								COMMAND = RST6  or 
								COMMAND = RST7  or 
								COMMAND = RSTNMI or 
								COMMAND = INCBC or 
								COMMAND = DECBC or 
								COMMAND = INCDE or 
								COMMAND = DECDE or 
								COMMAND = INCHL or 
								COMMAND = DECHL or 
								COMMAND = INCSP or
								COMMAND = DECSP or
								COMMAND = INCPC or 
								COMMAND = DECPC or 
								COMMAND = EI or
								COMMAND = DI ) else '1';
								
INST_T_Mux : process (F_Command,DATAIN,FLAG)
begin
	if F_Command = '1' then 
		DataBusIn_F <= FLAG;
	else DataBusIn_F <= DATAIN;
	end if;
end process INST_T_Mux;

INST_F_Register : register_8bit

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DataBusIn_F,
	DATAOUT	=>	DATAOUT,
	READ		=>	Read_F,
	WRITE		=>	Write_F,
	SWAP		=>	SWAP,
	REGISTER_VALUE => F_REG
);

end architecture rtl;