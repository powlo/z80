--File architecture for memory interface
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the memory interface for the block, currently
--just handles code fetches.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

architecture rtl of instruction_decode is

Instruction_record is record
Instruction : INstruction_type;
Mask : std_logic_vector (7 downto 0);
Bits_to_follow : std_logic_vector (1 downto 0);
end record;

Instruction_array_type is array 0 to 1 of Instruction_record;

Constant Instruction_array : Instruction_array_type (

("LD",	"11000111", "01");
("ADD",	"11111000", "00")
);

process (INSTRUCTION)
begin
	for i in Instruction_array loop
		if INSTRUCTION and Instruction_array(i)(Mask) ==  Instruction_array(i)(Mask) then
			Selected_Instruction <=  Instruction_array(i)(Instruction);
	end loop;
end process;

--Need to give either the ALU and instruction eg ADD, SUB etc.

--Need also to give Registers an instruction, eg
--Load from bus, drive out onto bus (are these read writes.
--Instead of having the ALU have access to every register, we do a load
--store from the register to the temp register of the ALU



end architecture rtl;