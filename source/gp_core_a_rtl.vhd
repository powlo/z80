--This is an intermediate file to test loading and running 
--of the ALU with registers.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use work.Z80_synth_pak.ALL;

architecture rtl of gp_core is

component register_16bit_swap_inc_dec is

port (

	CLK				   : IN std_logic;
	RESET_n           : IN std_logic;
	DATAIN            : IN std_logic_vector (7 downto 0);
	DATAOUT           : OUT std_logic_vector (7 downto 0);
	READ				   : IN std_logic_vector (1 downto 0);
	WRITE		 		   : IN std_logic_vector (1 downto 0);
	SWAP		 		   : IN std_logic;
	INC		 		   : IN std_logic;
	DEC		 		   : IN std_logic;
	REGISTER_VALUE    : OUT std_logic_vector (15 downto 0)
);

end component register_16bit_swap_inc_dec;

signal	DataBusOut_BC	: std_logic_vector (7 downto 0);
signal	Read_BC        : std_logic_vector (1 downto 0);
signal	Write_BC       : std_logic_vector (1 downto 0);

signal	DataBusOut_DE	: std_logic_vector (7 downto 0);
signal	Read_DE        : std_logic_vector (1 downto 0);
signal	Ex_Read_DE     : std_logic_vector (1 downto 0);
signal	Write_DE       : std_logic_vector (1 downto 0);
signal	Ex_Write_DE    : std_logic_vector (1 downto 0);

signal	DataBusOut_HL	: std_logic_vector (7 downto 0);
signal	Read_HL        : std_logic_vector (1 downto 0);
signal	Ex_Read_HL     : std_logic_vector (1 downto 0);
signal	Write_HL       : std_logic_vector (1 downto 0);
signal	Ex_Write_HL    : std_logic_vector (1 downto 0);

signal	BC_Reg			: std_logic_vector (15 downto 0);
signal	DE_Reg			: std_logic_vector (15 downto 0);
signal	HL_Reg			: std_logic_vector (15 downto 0);

signal Exchange_DE_HL	: std_logic;
signal Swap					: std_logic;

signal Inc_BC				: std_logic;
signal Dec_BC				: std_logic;
signal Inc_DE				: std_logic;
signal Dec_DE				: std_logic;
signal Inc_HL				: std_logic;
signal Dec_HL				: std_logic;

begin

--Produce logic signals from the ennumerated read line.
Read_BC(1)	<= '1' when READ = B else '0';
Read_BC(0)	<= '1' when READ = C else '0';
Read_DE(1)	<= '1' when READ = D else '0';
Read_DE(0)	<= '1' when READ = E else '0';
Read_HL(1)	<= '1' when READ = H and (Escape_Code = NONE or Escape_Code = CB or Escape_Code = ED ) else '0';
Read_HL(0)	<= '1' when READ = L and (Escape_Code = NONE or Escape_Code = CB or Escape_Code = ED ) else '0';

Write_BC(1)	<= '1' when WRITE = B else '0';
Write_BC(0)	<= '1' when WRITE = C else '0';
Write_DE(1)	<= '1' when WRITE = D else '0';
Write_DE(0)	<= '1' when WRITE = E else '0';
Write_HL(1)	<= '1' when WRITE = H and (Escape_Code = NONE or Escape_Code = CB or Escape_Code = ED ) else '0';
Write_HL(0)	<= '1' when WRITE = L and (Escape_Code = NONE or Escape_Code = CB or Escape_Code = ED ) else '0';

Inc_BC   <= '1' when ALU = INCBC else '0';
Dec_BC   <= '1' when ALU = DECBC or ALU = IID or ALU = ID or ALU = DDD or ALU = DD else '0';
Inc_DE   <= '1' when ALU = INCDE or ALU = IID else '0';
Dec_DE   <= '1' when ALU = DECDE or ALU = DDD else '0';
Inc_HL   <= '1' when ALU = INCHL or ALU = IID or ALU = ID else '0';
Dec_HL   <= '1' when ALU = DECHL or ALU = DDD or ALU = DD else '0';

Swap 			<= '1' when ALU = X_ALL else '0';

process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		Exchange_DE_HL <= '0';
	elsif CLK'event and CLK = '1' then
		if ALU = X_DE_HL then
			Exchange_DE_HL <= not Exchange_DE_HL;
		end if;
	end if;
end process;

process (Exchange_DE_HL, Read_DE, Read_HL)
begin
	if Exchange_DE_HL = '0' then
		Ex_Read_DE <= Read_DE;
		Ex_Read_HL <= Read_HL;
	else
		Ex_Read_DE <= Read_HL;
		Ex_Read_HL <= Read_DE;
	end if;
end process;

process (Exchange_DE_HL, Write_DE, Write_HL)
begin
	if Exchange_DE_HL = '0' then
		Ex_Write_DE <= Write_DE;
		Ex_Write_HL <= Write_HL;
	else
		Ex_Write_DE <= Write_HL;
		Ex_Write_HL <= Write_DE;
	end if;
end process;

process (Exchange_DE_HL, DE_Reg, HL_Reg)
begin
	if Exchange_DE_HL = '0' then
		DE <= DE_Reg;
		HL <= HL_Reg;
	else
		DE <= HL_Reg;
		HL <= DE_Reg;
	end if;
end process;

BC <= BC_Reg;

INST_BC_Register : register_16bit_swap_inc_dec

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DATAIN,
	DATAOUT	=>	DataBusOut_BC,
	READ		=>	Read_BC,
	WRITE		=>	WRITE_BC,
	SWAP		=>	Swap,
	INC		=>	Inc_BC,
	DEC		=>	Dec_BC,
	REGISTER_VALUE => BC_Reg
);

INST_DE_Register : register_16bit_swap_inc_dec

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DATAIN,
	DATAOUT	=>	DataBusOut_DE,
	READ		=>	Ex_Read_DE,
	WRITE		=>	Ex_Write_DE,
	SWAP		=>	Swap,
	INC		=>	Inc_DE,
	DEC		=>	Dec_DE,
	REGISTER_VALUE => DE_Reg
);

INST_HL_Register : register_16bit_swap_inc_dec

port map (
	CLK		=>	CLK,
	RESET_n	=>	RESET_n,
	DATAIN	=>	DATAIN,
	DATAOUT	=>	DataBusOut_HL,
	READ		=>	Ex_Read_HL,
	WRITE		=>	Ex_Write_HL,
	SWAP		=>	Swap,
	INC		=>	Inc_HL,
	DEC		=>	Dec_HL,
	REGISTER_VALUE => HL_Reg
);

--We or the data together to avoid having 
--a massive mux. This means data out of registers MUST
--be zero when not selected.
	DATAOUT <=	DataBusOut_BC or 
					DataBusOut_DE or 
					DataBusOut_HL;

--Instructions like CPI need to quickly see if BC is zero.
BC_NZ <= Or_bits(BC_Reg);
					
end architecture rtl;

