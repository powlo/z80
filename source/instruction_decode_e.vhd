--File architecture for memory interface
--Date: 2 Mar 2006
--Copyright P. Backhouse 2006

--This is the memory interface for the block, currently
--just handles code fetches.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_decode is

port (

	Instruction : IN std_logic_vector (7 downto 0);
	fetch_req	: out std_logic;
	fetch_ack	: in std_logic;
	ALU_comand	: out std_logic_vector (1 downto 0)
	
);


end entity instruction_decode;