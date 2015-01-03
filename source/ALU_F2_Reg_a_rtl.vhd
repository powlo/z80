--This F shadow register is used where microcode needs to 
--make decisions, but the end result should be that the true
--F register has not changed. Notation used is ...2 to mark
--a duplicate of an instruction, with the change that the 
--F2 register is to be used instead of F.

architecture rtl of ALU_F2_Reg is

signal Read_F2 			: std_logic;
signal RegValue 			: std_logic_vector (K_DATA_WIDTH-1 downto 0);

begin

Read_F2 <= '1' when	COMMAND = INC2 or 
							COMMAND = DEC2 or 
							COMMAND = DECC2 or 
							COMMAND = INCC2 or 
							COMMAND = TEST2 or
							COMMAND = ADDT2 else '0';
									
INST_F2_Register: process (CLK, RESET_n)
begin
	if RESET_n = '0' then
		RegValue <= (others => '0');
	elsif CLK'event and CLK='1' then
		if Read_F2 = '1' then
			RegValue <= FLAG;
		end if;
	end if;
end process;

F2 <= RegValue;

end architecture rtl;