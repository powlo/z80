--This module checks Instruction against the 
--F register, raising the condition flag if 
--the check is met.
--Could be part of the decode?

architecture rtl of condition_check is

signal S 				: std_logic;
signal C					: std_logic;
signal PV 				: std_logic;
signal Z 				: std_logic;

signal S2 				: std_logic;
signal C2				: std_logic;
signal PV2				: std_logic;
signal Z2				: std_logic;
signal Escape_Code_Valid : std_logic;

begin

S	<= F(7);
Z	<= F(6);
PV	<= F(2);
C	<= F(0);

S2	<= F2(7);
Z2	<= F2(6);
PV2<= F2(2);
C2	<= F2(0);

Escape_Code_Valid <= '0' when (Escape_Code = DD) or (Escape_Code = FD) else '1';

--TODO: Use ALU Opcodes to perfrom jumps, NOT Instructions
--themselves
--Note how the DJNZ uses the highest bit of T in part of its
--execution.

-- 	when JP_NZ|JR_NZ|CALL_NZ|RET_NZ	=> RESULT <= not Z;
-- 	when JP_Z|JR_Z|CALL_Z|RET_Z		=> RESULT <= Z;
-- 	when JP_NC|JR_NC|CALL_NC|RET_NC	=> RESULT <= not C;
-- 	when JP_C|JR_C|CALL_C|RET_C 		=> RESULT <= C;
-- 	when JP_PO|CALL_PO|RET_PO			=> RESULT <= not PV;
-- 	when JP_PE|CALL_PE|RET_PE 			=> RESULT <= PV;
-- 	when JP_P|CALL_P|RET_P 				=> RESULT <= not S;
-- 	when JP_M|CALL_M|RET_M 				=> RESULT <= S;
-- 	when DJNZ_INT|
--          LDIR_INT6|LDIR_INT7|LDDR_INT6|LDDR_INT7|
--          CPIR_INT5|CPIR_INT6|CPDR_INT5|CPDR_INT6 => RESULT <= not Z2;
-- 	when JR_INT 							=> RESULT <= S2;
-- 	when INC_bHLb|DEC_bHLb|ADD_bHLb|ADDC_bHLb|SUB_bHLb|SUBC_bHLb|
-- 	     AND_bHLb|XOR_bHLb|OR_bHLb|COMP_bHLb|LD_bHLb_N|
-- 	     LD_A_bHLb|LD_B_bHLb|LD_C_bHLb|LD_D_bHLb|LD_E_bHLb|LD_H_bHLb|LD_L_bHLb|
-- 	     LD_bHLb_A|LD_bHLb_B|LD_bHLb_C|LD_bHLb_D|LD_bHLb_E|LD_bHLb_H|LD_bHLb_L
-- 	        => RESULT <= Escape_Code_Valid;
-- 	when others 							=> RESULT <= '1';


process (INSTRUCTION,Z,C,PV,S,EC)
begin
	case (INSTRUCTION) is
	when TST_NZ	=> RESULT <= not Z;
	when TST_Z  => RESULT <= Z;
	when TST_NC => RESULT <= not C;
	when TST_C  => RESULT <= C;
	when TST_PO	=> RESULT <= not PV;
	when TST_PE => RESULT <= PV;
	when TST_P  => RESULT <= not S;
	when TST_M  => RESULT <= S;
	when TST_EC => RESULT <= EC;
	when others => RESULT <= '1';
	end case;
end process;
end architecture rtl;