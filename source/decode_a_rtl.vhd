--just an idea, but when we see a nop, that means we want to fetch, right?
--so nop is in fact our fetch instruction... ?

--and our fetch req is really just a CS to the data buffer...
--but couLD_ be problems when data doesn't arrive.

--The fetch an be stripped right down to a memory now.
--Ie Bytecode is address, Microcode is data out.

--Infact a smart way to code it might be to have the 
--memory file external.

--Another smart way to encode the microcode wouLD_ be to have
--the instruction TARGET decoded seperately. It will cut down on repetative
--coding (eg we have unnecessarily expanded code for LD_ r, n)

--Using this we can use the escape characters as 'switches' or muxes for 
--sources. Target will vary if DD was before. A nop resets escape chars.

use work.Instruction_list_pak.ALL;
use work.Instruction_array_pak.ALL;

architecture rtl of decode is

begin

process (CONDITION,INSTRUCTION) is
begin
	if CONDITION = '1' then
		NEXT_INSTRUCTION	<= K_Instruction_Array(INSTRUCTION).Next_IR_Micro; 
	elsif CONDITION = '0' then 
		NEXT_INSTRUCTION	<= K_Instruction_Array(INSTRUCTION).Fail_IR_Micro; 
   else
		NEXT_INSTRUCTION	<= K_Instruction_Array(INSTRUCTION).Next_IR_Micro;       

	--synthesis translate_off
   --This is debug code to capture 'U' states that might slip through
	assert false report "Warning unknown condition detected!" & TIME'IMAGE(NOW)
      severity error;
		--synthesis translate_on
   end if;
end process;

   READ          <= K_Instruction_Array(INSTRUCTION).RD_Micro;
   WRITE         <= K_Instruction_Array(INSTRUCTION).WR_Micro;
   ALU           <= K_Instruction_Array(INSTRUCTION).ALU_Micro;
   FLAG          <= K_Instruction_Array(INSTRUCTION).Flag_Micro;
   MASK          <= K_Instruction_Array(INSTRUCTION).Mask_Micro;
   ADDRESSMUX    <= K_Instruction_Array(INSTRUCTION).ADR_Mux_Micro;
   ACCESS_TYPE   <= K_Instruction_Array(INSTRUCTION).Access_Micro;

	--some code to aid debugging.
	--synthesis translate_off
	assert (INSTRUCTION = FETCH) report "Executing Microcode for instruction " & K_Instruction_Array(INSTRUCTION).Name
		severity note;
	--synthesis translate_on

end architecture rtl;