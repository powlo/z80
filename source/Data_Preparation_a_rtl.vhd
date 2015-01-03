--File architecture for the Data Preparation
--module of the ALU
--Date: 26 Apr 2006
--Copyright P. Backhouse 2006

architecture rtl of Data_Preparation is

signal DAA_Addition 		: std_logic_vector (K_DATA_WIDTH-1 downto 0);
signal DAA_l_addition	: std_logic_vector (K_HALF_DATA_WIDTH-1 downto 0);
signal DAA_h_addition	: std_logic_vector (K_HALF_DATA_WIDTH-1 downto 0);
signal A_Register_low	: std_logic_vector (K_HALF_DATA_WIDTH-1 downto 0);
signal A_Register_high	: std_logic_vector (K_HALF_DATA_WIDTH-1 downto 0);

begin

A_Register_low <= A(3 downto 0);
A_Register_high<= A(7 downto 4);

Proc_gen_l_daa: process (HC, A_Register_low)
begin
	if A_Register_low = "1010" or
		A_Register_low = "1011" or
		A_Register_low = "1100" or
		A_Register_low = "1101" or
		A_Register_low = "1110" or
		A_Register_low = "1111" or
		HC = '1' then
			DAA_l_addition <= X"6";
	else DAA_l_addition <= (others => '0');
	end if;
end process;

Proc_gen_h_daa: process (C, A_Register_high)
begin
	if A_Register_high = "1010" or
		A_Register_high = "1011" or
		A_Register_high = "1100" or
		A_Register_high = "1101" or
		A_Register_high = "1110" or
		A_Register_high = "1111" or
		C = '1' then
			DAA_h_addition <= X"6";
	else DAA_h_addition <= (others => '0');
	end if;
end process;

DAA_Addition <= DAA_h_addition & DAA_l_addition;

--Increment or decrement commands are special.
--We ignore the databus in and insert our own
--value to perform the increment / decrement.

process (COMMAND, DATAIN,DAA_Addition)
begin
	case COMMAND is
	when RST0|INCC|DECC|TEST2|INCC2 =>
		DATAOUT <= X"00";
	when INC|INC2|DEC|DEC2|NEG =>
		DATAOUT <= X"01";
	when DECC2 =>
		DATAOUT <= X"FF";
	when RST1 =>
		DATAOUT <= X"08";
	when RST2 =>
		DATAOUT <= X"10";
	when RST3 =>
		DATAOUT <= X"18";
	when RST4 =>
		DATAOUT <= X"20";
	when RST5 =>
		DATAOUT <= X"28";
	when RST6 =>
		DATAOUT <= X"30";
	when RST7 =>
		DATAOUT <= X"38";
	when RSTNMI =>
		DATAOUT <= X"66";
	when DAA =>
		DATAOUT <= DAA_Addition;
	when others =>
		DATAOUT <= DATAIN;
	end case;
end process;

end architecture rtl;